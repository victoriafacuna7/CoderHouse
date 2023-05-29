-- PROYECTO FINAL
-- 1 - CREACION DE BASE DE DATOS ------------------------------------------------

-- Eliminacion de la base de datos para evitar errores
DROP DATABASE IF EXISTS Supermercado;

-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS Supermercado;

-- Utilizar la base de datos
USE Supermercado;

-- 2 - CREACION DE TABLAS -------------------------------------------------------

-- Table: Costumers
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    id_customer int NOT NULL,
	first_name char(30) NOT NULL,
    last_name char(30) NOT NULL,
    PRIMARY KEY (id_customer)

)ENGINE=InnoDB;

-- Table: Categories
CREATE TABLE IF NOT EXISTS CATEGORIES (
    id_category int NOT NULL,
	category char(20) NOT NULL,
    PRIMARY KEY (id_category)
    
);

-- Table: Subcategories
CREATE TABLE IF NOT EXISTS SUBCATEGORIES (
    id_subcategory int NOT NULL,
    subcategory char(20) NOT NULL,
	category char(20) NOT NULL,
    PRIMARY KEY (id_subcategory)
    
);

-- Table: Shipping
CREATE TABLE IF NOT EXISTS SHIPPING (
    id_ship int NOT NULL,
	ship_mode char(15) NOT NULL,
    PRIMARY KEY (id_ship)
    
);

-- Table: State
CREATE TABLE IF NOT EXISTS STATE (
    id_state int NOT NULL,
	state char(30) NOT NULL,
    region char(15) NOT NULL,
    PRIMARY KEY (id_state)
    
);

-- Table: Products
CREATE TABLE IF NOT EXISTS PRODUCTS (
    id_product int NOT NULL,
	id_category int NOT NULL,
    id_subcategory int NOT NULL,
    product_name varchar(150) NOT NULL,
    price decimal(10,4) NOT NULL,
    PRIMARY KEY (id_product),
    
	CONSTRAINT FK_ProductsCategories
		FOREIGN KEY (id_category) 
        REFERENCES CATEGORIES(id_category),
        
    CONSTRAINT FK_ProductsSubcategories
		FOREIGN KEY (id_subcategory) 
        REFERENCES SUBCATEGORIES(id_subcategory)
    
);

-- Table: Orders
CREATE TABLE IF NOT EXISTS ORDERS (
    id_order int NOT NULL,
	id_ship int NOT NULL,
    id_customer int NOT NULL,
    last_name char(30) NOT NULL,
    id_state int NOT NULL,
    id_product int NOT NULL,
    sales decimal(10,4) NOT NULL,
    quantity int NOT NULL,
    discount decimal(3,2) NOT NULL,
    profit decimal(10,4) NOT NULL,
    price decimal(10,4) NOT NULL,
    order_date date NOT NULL,
    PRIMARY KEY (id_order, id_ship, id_customer, id_product),
    
    CONSTRAINT FK_OrdersCustomers
		FOREIGN KEY (id_customer) 
        REFERENCES CUSTOMERS(id_customer),
        
	CONSTRAINT FK_OrdersProducts
		FOREIGN KEY (id_product) 
        REFERENCES PRODUCTS(id_product),
        
    CONSTRAINT FK_OrdersShipping
		FOREIGN KEY (id_ship) 
        REFERENCES SHIPPING(id_ship),

    CONSTRAINT FK_OrdersState
		FOREIGN KEY (id_state) 
        REFERENCES STATE(id_state)
);
