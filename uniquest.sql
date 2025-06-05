CREATE DATABASE CustomerOrderHistory;

-- Customers Table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone_number TEXT,
    city TEXT,
    country TEXT
);

-- Categories Table
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT UNIQUE NOT NULL
);

-- Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER,
    price REAL CHECK (price >= 0),
    stock INTEGER DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    status TEXT CHECK (status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name TEXT NOT NULL,
    department_id INTEGER,
    hire_date DATE,
    salary REAL CHECK (salary >= 0),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Departments Table
CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT UNIQUE NOT NULL
);

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    contact_email TEXT,
    phone_number TEXT
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    payment_date DATE,
    amount REAL CHECK (amount >= 0),
    payment_method TEXT CHECK (payment_method IN ('Credit Card', 'PayPal', 'Bank Transfer')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    customer_id INTEGER,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
