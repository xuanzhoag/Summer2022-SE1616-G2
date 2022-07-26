USE [master]
GO
/****** Object:  Database [Sum22_SWP391_BakeryShop]    Script Date: 7/20/2022 7:34:23 PM ******/
CREATE DATABASE [Sum22_SWP391_BakeryShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sum22_SWP391_BakeryShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sum22_SWP391_BakeryShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sum22_SWP391_BakeryShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Sum22_SWP391_BakeryShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sum22_SWP391_BakeryShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET  MULTI_USER 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sum22_SWP391_BakeryShop', N'ON'
GO
USE [Sum22_SWP391_BakeryShop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Detail]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Detail](
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CartID] [int] NOT NULL,
 CONSTRAINT [PK_Cart_Detail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Changes_History]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Changes_History](
	[Id] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NULL,
	[UpdateBy] [nvarchar](50) NOT NULL,
	[UpdateDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] NOT NULL,
	[url] [text] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature_Role]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature_Role](
	[RoleID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL,
 CONSTRAINT [PK_Feature_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDetailID] [int] NULL,
	[RatedStar] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[FeedbackStatus] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Tittle] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback_Images]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback_Images](
	[FeedbackId] [int] NOT NULL,
	[FeedbackImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Feedback_Images] PRIMARY KEY CLUSTERED 
(
	[FeedbackImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalMoney] [float] NULL,
	[SaleId] [int] NULL,
	[OrderStatus] [int] NULL,
	[OrderDate] [datetime] NOT NULL,
	[SaleNote] [text] NULL,
	[LastUpdated] [datetime] NULL,
	[ShipInfoID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[OrderStatusID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Discount] [float] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PostCategoryID] [int] NULL,
	[Thumbnail] [nvarchar](max) NULL,
	[PostTitle] [nvarchar](max) NULL,
	[BriefInformation] [nvarchar](max) NULL,
	[PostDescription] [nvarchar](max) NULL,
	[Featured] [nvarchar](max) NULL,
	[PostDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[PostStatus] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post_Category]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post_Category](
	[PostCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Post_Category] PRIMARY KEY CLUSTERED 
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [ntext] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Thumbnail] [nvarchar](max) NOT NULL,
	[Weight] [int] NOT NULL,
	[Degree] [int] NOT NULL,
	[Time] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Image]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[ProductImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product_Image] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Status]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Status](
	[ProductStatusID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product_Status] PRIMARY KEY CLUSTERED 
(
	[ProductStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[SettingTypeID] [int] NULL,
	[SettingValue] [int] NULL,
	[SettingOrder] [nvarchar](50) NULL,
	[SettingStatusID] [int] NULL,
	[SettingDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettingStatus]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettingStatus](
	[statusID] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SettingStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettingType]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettingType](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SettingType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ship_Information]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship_Information](
	[ShipInfoID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[ReciverName] [nvarchar](max) NULL,
	[Gender] [bit] NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Notes] [text] NULL,
 CONSTRAINT [PK_Ship_Information] PRIMARY KEY CLUSTERED 
(
	[ShipInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[SliderId] [int] NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Backlink] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[token] [nvarchar](50) NULL,
	[expiration] [datetime] NULL,
	[address] [nvarchar](max) NULL,
	[StatusID] [int] NULL,
	[ShipInfoID] [int] NULL,
	[dateCreated] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Status]    Script Date: 7/20/2022 7:34:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Status](
	[UserStatusID] [int] NOT NULL,
	[UserStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_User_Status] PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (3, 3)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (4, 5)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (5, 2)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (6, 1)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (7, 2006)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (8, 2022)
INSERT [dbo].[Cart] ([CartId], [UserId]) VALUES (9, 2023)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[Cart_Detail] ([ProductID], [Quantity], [CartID]) VALUES (6, 1, 5)
INSERT [dbo].[Cart_Detail] ([ProductID], [Quantity], [CartID]) VALUES (10, 1, 9)
INSERT [dbo].[Cart_Detail] ([ProductID], [Quantity], [CartID]) VALUES (11, 1, 9)
INSERT [dbo].[Cart_Detail] ([ProductID], [Quantity], [CartID]) VALUES (13, 2, 7)
INSERT [dbo].[Cart_Detail] ([ProductID], [Quantity], [CartID]) VALUES (13, 2, 8)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (5, N'Bready', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (6, N'Pinpool', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (7, N'Deliciuex', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (8, N'Cake', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (9, N'Cupke', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer_Changes_History] ([Id], [Email], [Name], [Gender], [Mobile], [address], [UpdateBy], [UpdateDate]) VALUES (4, N'thai211@gmail.com', N'huythai', 1, N'123456789', N'', N'nam', CAST(N'2022-07-20T03:23:19.640' AS DateTime))
GO
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (1, N'/marketing/productlist', N'MKT productlist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (2, N'/marketing/productdetails', N'MKT productdetails')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (3, N'/marketing/insertproduct', N'MKT insertproduct')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (4, N'/marketing/editproduct', N'MKT editproduct')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (5, N'/marketing/changeproductstatus', N'MKT change productstatus')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (6, N'/sale/orderlist', N'Sale orderlist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (7, N'/marketing/postlist', N'MKT postlist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (8, N'/marketing/viewpost', N'MKT viewpost')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (9, N'/marketing/changestatuspost', N'MKT changestatuspost')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (10, N'/marketing/insertpost', N'MKT insertpost')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (11, N'/marketing/editpost', N'MKT editpost')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (12, N'/marketing/feedbacklist', N'MKT feedbacklist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (13, N'/marketing/feedbackdetail', N'MKT feedbackdetail')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (14, N'/admin/settingchangestatus', N'Admin settingchangestatus')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (15, N'/admin/viewsetting', N'Admin viewsetting')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (16, N'/admin/settinglist', N'Admin settinglist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (17, N'/admin/editsetting', N'Admin editsetting')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (18, N'/admin/addsetting', N'Admin addsetting')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (19, N'/user/details', N'Admin details')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (20, N'/user/userlist', N'Admin userlist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (21, N'/user/edit', N'Admin edit')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (22, N'/user/addnew', N'Adminaddnew')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (23, N'/marketing/editslider', N'MKT editslider')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (24, N'/marketing/sliderchangestatus', N'MKT sliderchangestatus')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (25, N'/marketing/sliderlist', N'MKT sliderlist')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (26, N'/marketing/viewslider', N'MKT viewslider')
INSERT [dbo].[Feature] ([FeatureID], [url], [description]) VALUES (27, N'/admin/featurelist', N'Admin  featurelist')
GO
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 14)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 15)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 16)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 17)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 18)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 19)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 20)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 21)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 22)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (1, 27)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (2, 6)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 1)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 2)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 3)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 4)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 5)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 7)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 8)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 9)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 10)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 11)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 12)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 13)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 23)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 24)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 25)
INSERT [dbo].[Feature_Role] ([RoleID], [FeatureID]) VALUES (3, 26)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (1, 2, 1, 1, 1, 0, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'	Flatbread', N'good')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (2, 2, 2, 2, 2, 1, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Afghanistan', N'A circular flatbread made with sweet potatoes.')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (3, 2, 3, 4, 4, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'	Italy', N'A thin crepe now made with milk, eggs (sometimes omitted), flour and salt. Originally a food eaten by the poor and made with flour and water.')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (4, 2, 4, 5, 3, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'Sourdough', N'A  dark brown sourdough rye bread, traditionally sweetened with molasses and flavored with coriander and caraway seeds.')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (5, 3, 30, 4, 6, 1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), N'From the French for "ball".', N'Short, oblong or round, served usually before or with meals, often with butter.')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (6, 3, 31, 5, 4, 1, CAST(N'2023-05-10T00:00:00.000' AS DateTime), N'Enjoy', N'delicious')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (9, 1, 32, 3, 3, 1, CAST(N'2022-02-10T00:00:00.000' AS DateTime), N'Nice', N'It''s good product')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (20, 1, 33, 5, 7, 1, CAST(N'2022-07-15T09:26:58.213' AS DateTime), NULL, N'Good, very good, i really like it, next time i will buy it')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (21, 1, 34, 1, 10, 1, CAST(N'2022-07-15T09:29:42.527' AS DateTime), NULL, N'hmmm it so bad, i don wanna but it any more')
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [OrderDetailID], [RatedStar], [ProductId], [FeedbackStatus], [UpdateDate], [Tittle], [Note]) VALUES (22, 1, 35, 1, 11, 1, CAST(N'2022-07-16T11:15:30.837' AS DateTime), NULL, N'awwww i don''t like it, it''s bad product, very very baddddd, 1 star
pls give me money')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback_Images] ON 

INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (1, 1, N'fb1.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (1, 2, N'fb2.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (1, 4, N'fb3.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (2, 5, N'fb4.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (2, 6, N'fb5.jpg', 0)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (3, 8, N'fb6.jpg', 0)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (20, 9, N'fb2.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (21, 10, N'fb10.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (21, 11, N'fb11.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (22, 12, N'fb12.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (22, 13, N'fb13.jpg', 1)
INSERT [dbo].[Feedback_Images] ([FeedbackId], [FeedbackImageId], [ImageName], [Status]) VALUES (22, 14, N'fb14.jpg', 1)
SET IDENTITY_INSERT [dbo].[Feedback_Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (2, 2, 24, 2009, 4, CAST(N'2022-07-16T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (3, 2, 34, 2008, 2, CAST(N'2022-07-19T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (4, 2, 35, 2009, 3, CAST(N'2022-07-19T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (8, 4, 13, 2, 4, CAST(N'2022-07-17T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (9, 4, 22, 2008, 1, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (11, 2, 15, 2009, 2, CAST(N'2022-07-11T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (12, 2, 31, 2, 3, CAST(N'2022-07-17T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (14, 2, 27, 2008, 4, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (15, 2, 16, 2009, 1, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (16, 2, 25, 2, 1, CAST(N'2022-07-17T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (17, 3, 15, 2008, 2, CAST(N'2022-07-15T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (18, 1, 34, 2009, 3, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (20, 2, 10, 2, 2, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (21, 2, 119.1999969482422, 2008, 2, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (22, 2, 29.6, 2009, 2, CAST(N'2022-07-14T23:16:32.190' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (23, 2, 100, 2, 2, CAST(N'2022-07-18T23:16:32.190' AS DateTime), NULL, NULL, 4)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (24, 2, 9.6, 2008, 2, CAST(N'2022-07-18T23:16:32.190' AS DateTime), NULL, NULL, 5)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (25, 2, 0, 2, 3, CAST(N'2022-07-19T23:16:32.190' AS DateTime), NULL, NULL, 6)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (26, 2, 100, 2008, 2, CAST(N'2022-07-19T23:16:32.190' AS DateTime), NULL, NULL, 7)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (27, 2023, 40.8, 2008, 1, CAST(N'2022-07-20T02:26:19.600' AS DateTime), NULL, NULL, 8)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (28, 2023, 14, 2, 3, CAST(N'2022-07-20T02:30:36.330' AS DateTime), NULL, NULL, 9)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (29, 2006, 28.8, 2009, 3, CAST(N'2022-07-20T07:33:46.297' AS DateTime), NULL, NULL, 10)
INSERT [dbo].[Order] ([OrderId], [UserId], [TotalMoney], [SaleId], [OrderStatus], [OrderDate], [SaleNote], [LastUpdated], [ShipInfoID]) VALUES (30, 1, 212.5, 2, 3, CAST(N'2022-07-20T07:43:21.960' AS DateTime), NULL, NULL, 11)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Order_Status] ([OrderStatusID], [Status]) VALUES (1, N'Cancel')
INSERT [dbo].[Order_Status] ([OrderStatusID], [Status]) VALUES (2, N'Pending')
INSERT [dbo].[Order_Status] ([OrderStatusID], [Status]) VALUES (3, N'Processing')
INSERT [dbo].[Order_Status] ([OrderStatusID], [Status]) VALUES (4, N'Shipped')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (1, 2, 1, 1, 5.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (2, 2, 2, 0, 7.0000, 3)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (3, 2, 3, 0, 10.0000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (4, 2, 7, 0.6, 2.0000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (5, 3, 1, 0, 5.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (6, 3, 2, 0.2, 3.6000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (7, 3, 4, 0.2, 4.0000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (8, 3, 5, 0, 2.4000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (9, 3, 6, 1, 100.0000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (10, 4, 1, 0, 7.5000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (11, 4, 4, 0.2, 2.0000, 7)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (12, 8, 2, 0.5, 5.6000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (13, 8, 3, 0, 4.4000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (14, 9, 10, 0.4, 7.4000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (15, 11, 1, 0, 5.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (17, 11, 13, 0.4, 4.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (18, 12, 1, 0, 5.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (19, 12, 4, 0.1, 5.6000, 3)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (20, 12, 5, 0.2, 7.4000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (21, 12, 6, 0, 6.0000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (22, 12, 8, 0.6, 7.4000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (23, 14, 1, 0, 5.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (27, 15, 1, 0, 5.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (24, 15, 5, 0.2, 7.4000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (25, 15, 6, 0, 6.0000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (26, 15, 8, 0.6, 7.4000, 5)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (28, 16, 3, 0.3, 7.0000, 3)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (29, 16, 4, 0.4, 6.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (31, 17, 6, 0.5, 8.7000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (32, 18, 3, 0.1, 8.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (33, 18, 7, 0, 8.3000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (34, 18, 10, 0.3, 7.4000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (35, 18, 11, 0.5, 5.3000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (16, 20, 2, 0, 7.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (36, 21, 6, 0, 100.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (37, 21, 11, 0.40000000596046448, 16.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (38, 22, 5, 0, 20.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (39, 22, 11, 0.40000000596046448, 16.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (40, 23, 6, 0, 100.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (41, 24, 11, 0.40000000596046448, 16.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (30, 25, 4, 0.2, 9.0000, 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (42, 26, 6, 0, 100.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (43, 27, 11, 0.40000000596046448, 16.0000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (44, 27, 13, 0, 12.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (45, 28, 10, 0, 14.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (46, 29, 11, 0.40000000596046448, 16.0000, 4)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (47, 30, 2, 0.30000001192092896, 7.0000, 21)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (48, 30, 6, 0, 100.0000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Discount], [Price], [Quantity]) VALUES (49, 30, 11, 0.40000000596046448, 16.0000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (2, 1, 1, N'/src/assests/img/Post/1.jpg', N'Mauris elementum accumsanleo vel temporsa', N'Class aptent taciti sociosqu ad litora torquent per. Conubia vitae viverra urna nulla sed turpis .Mauris elementum accumsan leo vel tempor', N'<h1>Sed id interdum urna. Nam ac elit a ante commodo tristique.</h1>

<p>Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus. Sed vel nulla non neque dictum imperdiet.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere.Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet.Vestibulum imperdiet nibh vel magna lacinia ultrices. Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
', NULL, CAST(N'2022-07-19' AS Date), CAST(N'2022-06-15' AS Date), 0)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (4, 2, 2, N'/src/assests/img/Post/2.jpg', N'Perfect summery bruschetta – with a garlicky Greek twist', N'Maple syrup-grilled aubergines and a thick layer of skordalia – garlicky Greek paste from heaven – makes this freewheeling vegetarian bruschetta recipe, says Joe Yonan', N'	<h1> Sed id interdum urna. Nam ac elit a ante commodo tristique. </h1>
<p>Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus. Sed vel nulla non neque dictum imperdiet.Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere.Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet.Vestibulum imperdiet nibh vel magna lacinia ultrices. Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>', N'Sed vel nulla non neque dictum imperdiet.', CAST(N'2022-07-18' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (9, 3, 1, N'/src/assests/img/Post/3.jpg', N'Bakery chain expanding range of products made from food waste', N'The bakery has promised at least 25 new products over the coming year as part of its drive to become a zero-waste business', N'Artisan bakery chain Gail’s is expanding its product range made from food waste in a bid to recycle surplus ingredients from its supply chain. Gail’s has promised at least 25 new products over the coming year as part of its eco-conscious baking line as it hopes to become a zero-waste business. A hot cross bun bacon buttie is among the new additions. The bakery, which currently trades from 53 locations across London, Oxford, Brighton, Farnham and Wokingham, launched the UK’s first loaf made from leftover bread in 2018, in a bid to cut down on food waste. Named “Waste Bread”, the sourdough is made by turning day-old unsold loaves into breadcrumbs, before making them into a porridge-type mix. This is then added to a fresh white sourdough dough, resulting in a fresh loaf with the recycled bread making up a third of its ingredients. The 750g loaves cost £4.20 each. Since launching the recycled loaf at select London bakeries, the company has expanded its waste-reducing range to feature other products, including baguettes turned into croutons and savoury crackers made with leftover cheese rinds. This move comes at a time when other food companies are launching eco initiatives in a drive to be more sustainable. Last week, Marks & Spencer announced it will be extending its “bring your own container” scheme which allows shoppers to refill their own food containers to avoid plastic waste. The trial took place in a Southampton store and was met positively by shoppers. The retailer said that 25 of its 44 “fill your own” products were outselling the packaged alternatives. In the UK, we throw away 10.2m tonnes of food waste each year, creating more than 20m tonnes of greenhouse gas emissions. The circular economy model, which Gail’s waste-reducing range practices, is increasingly being used in the food industry, as well as in fashion.It hopes to keep resources – whether that be clothing material or food ingredients – in the supply chain for as long as possible in order to avoid waste.', N'nSuspendisse faucibus sed dolor eget posuere.Sed id interdum urna.', CAST(N'2022-07-18' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (10, 1, 2, N'/src/assests/img/Post/4.jpg', N'Bakery launches UK''s first insect bread made from hundreds of crickets', N'Nutritionist says insects are ''valuable source of essential fats''', N'A British bakery has become the first in the UK to launch a loaf of bread made from hundreds of crickets. The limited-edition batch of “Crunchy Cricket” loaves have been created by Roberts Bakery in Norwich and are made using cricket flour, which is supplied by Eat Grub – the UK’s leading insect food brand. According to Roberts Bakery, each loaf of bread contains around 336 crickets, which are dried, ground, mixed with wheat flour and grains and then baked to become what it claims is a “a tremendously tasty loaf with a crunchy finish”. “Crickets are a really new and exciting food ingredient,” said Stuart Spencer-Calnan, managing director of the bakery. “They’re incredibly good for you and actually really tasty, despite what people might think.” Spencer-Calnan added that he thinks people will be “pleasantly surprised” if they try the new loaves and that, so far, the feedback the bakery has received has been “really positive”. As well as being good for gut health, food experts claim that crickets are packed with nutrients and that the bread made from them contains more protein than a standard loaf. “As well as having very strong sustainability and environmental credentials, insects are also seriously tasty and shouldn’t be overlooked as a great recipe ingredient,” said Alison Ordonez, head of innovation at Roberts Bakery. “Our Cricket Loaf provides consumers with a good source of protein and an easy way to familiarise themselves with insect-based food.” Clinical nutritionist Adele Wolstenhulme agrees, adding that insects have long-been considered a daily staple “through the lens of human evolution”. “We are simply returning to our ancestral dietary roots,” Wolstenhulme said. “Given climate change and sustainability issues around meat, we are becoming more aware of the need to seek out alternative protein sources and we shouldn’t dismiss the valuable sources of essential fats that these critters also offer in abundance. “And, when considering the amount of pressure on land and resources, we should be fully embracing insects as ‘superfoods’.”
Insect-eating, or entomophagy, is becoming increasingly common in large parts of the world.
Last year, the United Nations estimated that at least two billion people eat insects – with many having eaten them traditionally for generations – and more than 1,900 species are used for food.
The UN added that insects are also a popular choice amongst those who want to protect the environment because farming insects uses less land, water and feed than conventional livestock farming.
Celebrities who have supported the consumption of insects in the past include Nicole Kidman, Angelina Jolie, Justin Timberlake and Katy Perry.', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-18' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (11, 3, 1, N'/src/assests/img/Post/5.jpg', N'Toast bread straight from freezer, anti-waste campaign urges', N'Save your bread from the bin', N'People are being urged to toast bread straight from the freezer in order to reduce unnecessary waste. It’s always frustrating when you go to make yourself some toast, only to find that your bread has gone stale or worse, mouldy. Approximately 24 million slices of bread are thrown away in the UK every day as a result of people not using their bread in time. However, there is a really simple fix to rectify this issue. Love Food Hate Waste has launched the “Make Toast Not Waste” campaign, which aims to educate the nation about how they can keep their bread fresh for longer. A recent consumer poll commissioned by Love Food Hate Waste of 1,000 adults in the UK discovered that 69 per cent of 18 to 34-year-olds throw bread away every single week, with one in four people confessing that they don’t know how to freeze bread. According to previous research conducted by charity organisation Wrap, the amount of bread wasted by the nation could be drastically reduced if every person in the UK wasted three fewer slices of bread a week. By toasting bread the moment it’s taken out of the freezer, you can ensure that you don’t run the risk of having to throw it out. “Love Food Hate Waste’s latest campaign, ‘Make Toast Not Waste’ is looking to help people waste less bread as a whopping 24 million slices of bread are thrown away every day in the UK!” said Sarah Clayton, head of products and services at Wrap. “Half of this waste is a result of people not getting around to using it in time. “We can all do our bit to bin less bread by popping it in the freezer to keep it for much longer, and you can even use bread straight from the freezer to make toast, without needing to defrost it first.” Love Food Hate Waste has shared a number of tasty recipes on its website in the hope that they will inspire more people to be less wasteful. The amount of garbage that is routinely thrown away in rubbish bins on a daily basis could have been recycled, a recent report revealed. According to Zero Waste Scotland, 670,000 tonnes of everyday household waste that accumulated over a year could have been processed using standard recycling services. Sending rubbish to landfill can cost local authorities an estimate of £54m a year.
 
 

', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-18' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (14, 2, 2, N'/src/assests/img/Post/6.jpg', N'8 best bread knives to make light work of more than just loaves', N'To help slice your sourdough perfectly, brands such as Victorinox and Robert Welch have the serrated blades you need ', N'If you spent lockdown perfecting sourdough, you’ll know that you need a good bread knife to do your creation justice. With its tough crust and squishy interior, bread can be a tricky object to cut without squashing the whole thing flat. In order to slice through your loaf with ease, you need a dedicated bread knife that’s up to the job. The typical bread knife has a long, serrated blade, enabling you to glide through stacks of sandwiches in one stroke. It should also make it easier to get pleasingly uniform slices. It’s versatile too, doubling up us a carving knife (you’ll wonder how you ever cut through crackling without one) and they also work particularly well with pineapples. When putting our knives to the test we tried them out on a variety of bakes. From those with tough crusts to the super squidgy, we also sliced our way through bagels and rolls, each time checking how much pressure we needed to apply and how uniform the slices were. We’ve rounded up a selection of super-smooth slicers whatever your budget. You can trust our independent reviews. We may earn commission from some of the retailers, but we never allow this to influence selections, which are formed from real-world testing and expert advice. This revenue helps to fund journalism across The Independent.
Tomita Japanese bread knife:
With a choice of two blade lengths (22cm or 30cm), this Japanese bread knife from Tomita is similar to Opinel’s version (below) but we think it’s that bit better. The long, serrated-steel blade is generous and sharp, cutting through our bread with ease, and we found the dark wooden handle both good-looking and easy to grip. It comes with a good quality plastic sheath, which we store the knife in when not being used, to keep it super sharp. A beautiful buy, we think this would also make a lovely housewarming gift. 

Opinel wooden handle bread knife:
This family-run French company is known for its excellent value, smart, functional knives. The beautiful beech handle is a little lighter in colour than the Japanese version above and the stainless-steel blade a little shorter at 20cm – which some will prefer, particularly if you tend to go for little loaves or bagels. Strong and efficient, this is simply a great bread knife weighing in at 250g.
Zwilling pro bread knife:
The brand of choice for many professional chefs, the Zwilling range doesn’t come cheap but having tried their bread knife, we’re confident it will last for years. The 20cm blade has been made with ice-hardened steel to make it extra tough without being brittle (stopping it from chipping) and features a bevelled edge, which helped us cut neat slices every time. The handle is good quality plastic, with an exposed tang (the portion of the blade that goes into the handle). Overall the knife felt balanced and well weighted (222g).
Lakeland select grip Japanese steel bread knife:
If you want an affordable option that will get the job done, this own brand knife from Lakeland is ideal. Crafted from Japanese stainless steel, the 20cm blade is powerful and has undergone an ice-hardening process (but at a fraction of the cost of Zwilling). The grippy rubberised handle makes it safe to use even if you have wet hands. Excellent value and it comes with a three-year guarantee. 
Robert Welch signature bread knife:
To make sure they were really hitting the nail on the head, Robert Welch called in a bunch of professional chefs to ask for feedback, It decided on a sharp German stainless steel for the 22cm blade, with a full tang for optimum balance. The ergonomic black plastic handle is comfortable to use and makes it dishwasher safe (although we’d always recommend washing by hand). Like all knives in the range, it comes in a gift box. 
Global g series bread knife:
A blow-the-budget option for the serious chef, this brand is used in many top kitchens around the world. Fully stainless steel, right down to the dimpled handle, this is a classic bread knife shape with a 22cm blade. The serration has been set up for right-handers and the design makes sure you’ll get a straighter slice. Beautifully weighted (136g) and super sharp, this is a dream to use. 
Victorinox Swiss classic bread knife:
Better known for making swiss army knives, the brand also produces good quality kitchen knives. Sure, the handle is a little plasticky, but it’s ergonomic and the 21cm blade is efficient. Overall, it’s pretty light at 107g. It also comes in a wide range of colours, including orange, yellow, green and pink – making it nice and easy to see in the drawer. 
Pallares bread knife:
Beautifully simple, this 22cm blade has a wide scalloped stainless-steel blade, which handled most bread well, without too much pressure. The stripped-back pale boxwood handle is crafted in Catalonia, specifically at the cuchillería Pallares workshop, which was set up by a couple of brothers and is still a small family-run operation. 
', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-17' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (15, 2, 1, N'/src/assests/img/Post/1.jpg', N'', N'1', N'<p>a</p>
', NULL, CAST(N'2022-07-17' AS Date), NULL, 0)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (16, 2, 1, N'/src/assests/img/Post/2.jpg', N'', N'1', N'<p>a</p>
', NULL, CAST(N'2022-07-17' AS Date), NULL, 0)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (17, 2, 2, N'/src/assests/img/Post/4.jpg', N'a', N'v', N'<p>z</p>
', NULL, CAST(N'2022-07-19' AS Date), CAST(N'2022-06-15' AS Date), 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (38, 2, 1, N'/src/assests/img/Post/5.jpg', N'Introduce about shop', N'Introduces', N'Baked goods have been around for thousands of years. The art of baking was developed early during the Roman Empire. It was a highly famous art as Roman citizens loved baked goods and demanded them frequently for important occasions such as feasts and weddings. Because of the fame of the art of baking, around 300 BC, baking was introduced as an occupation and respectable profession for Romans. Bakers began to prepare bread at home in an oven, using mills to grind grain into flour for their breads. The demand for baked goods persisted, and the first bakers'' guild was established in 168 BC in Rome. The desire for baked goods promoted baking throughout Europe and expanded into eastern parts of Asia. Bakers started baking bread and other goods at home and selling them on the streets.', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-19' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (39, 2, 1, N'/src/assests/img/Post/6.jpg', N'Perfect summery bruschetta – with a garlicky Greek twist', N'The bakery has promised at least 25 new products over the coming year as part of its drive to become a zero-waste business', N'Artisan bakery chain Gail’s is expanding its product range made from food waste in a bid to recycle surplus ingredients from its supply chain. Gail’s has promised at least 25 new products over the coming year as part of its eco-conscious baking line as it hopes to become a zero-waste business. A hot cross bun bacon buttie is among the new additions. The bakery, which currently trades from 53 locations across London, Oxford, Brighton, Farnham and Wokingham, launched the UK’s first loaf made from leftover bread in 2018, in a bid to cut down on food waste. Named “Waste Bread”, the sourdough is made by turning day-old unsold loaves into breadcrumbs, before making them into a porridge-type mix. This is then added to a fresh white sourdough dough, resulting in a fresh loaf with the recycled bread making up a third of its ingredients. The 750g loaves cost £4.20 each. Since launching the recycled loaf at select London bakeries, the company has expanded its waste-reducing range to feature other products, including baguettes turned into croutons and savoury crackers made with leftover cheese rinds. This move comes at a time when other food companies are launching eco initiatives in a drive to be more sustainable. Last week, Marks & Spencer announced it will be extending its “bring your own container” scheme which allows shoppers to refill their own food containers to avoid plastic waste. The trial took place in a Southampton store and was met positively by shoppers. The retailer said that 25 of its 44 “fill your own” products were outselling the packaged alternatives. In the UK, we throw away 10.2m tonnes of food waste each year, creating more than 20m tonnes of greenhouse gas emissions. The circular economy model, which Gail’s waste-reducing range practices, is increasingly being used in the food industry, as well as in fashion.It hopes to keep resources – whether that be clothing material or food ingredients – in the supply chain for as long as possible in order to avoid waste.', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-19' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (40, 2, 1, N'/src/assests/img/Post/1.jpg', N'Perfect summery bruschetta – with a garlicky Greek twist', N'Maple syrup-grilled aubergines and a thick layer of skordalia – garlicky Greek paste from heaven – makes this freewheeling vegetarian bruschetta recipe, says Joe Yonan', N'People are being urged to toast bread straight from the freezer in order to reduce unnecessary waste. It’s always frustrating when you go to make yourself some toast, only to find that your bread has gone stale or worse, mouldy. Approximately 24 million slices of bread are thrown away in the UK every day as a result of people not using their bread in time. However, there is a really simple fix to rectify this issue. Love Food Hate Waste has launched the “Make Toast Not Waste” campaign, which aims to educate the nation about how they can keep their bread fresh for longer. A recent consumer poll commissioned by Love Food Hate Waste of 1,000 adults in the UK discovered that 69 per cent of 18 to 34-year-olds throw bread away every single week, with one in four people confessing that they don’t know how to freeze bread. According to previous research conducted by charity organisation Wrap, the amount of bread wasted by the nation could be drastically reduced if every person in the UK wasted three fewer slices of bread a week. By toasting bread the moment it’s taken out of the freezer, you can ensure that you don’t run the risk of having to throw it out. “Love Food Hate Waste’s latest campaign, ‘Make Toast Not Waste’ is looking to help people waste less bread as a whopping 24 million slices of bread are thrown away every day in the UK!” said Sarah Clayton, head of products and services at Wrap. “Half of this waste is a result of people not getting around to using it in time. “We can all do our bit to bin less bread by popping it in the freezer to keep it for much longer, and you can even use bread straight from the freezer to make toast, without needing to defrost it first.” Love Food Hate Waste has shared a number of tasty recipes on its website in the hope that they will inspire more people to be less wasteful. The amount of garbage that is routinely thrown away in rubbish bins on a daily basis could have been recycled, a recent report revealed. According to Zero Waste Scotland, 670,000 tonnes of everyday household waste that accumulated over a year could have been processed using standard recycling services. Sending rubbish to landfill can cost local authorities an estimate of £54m a year.
 
 

', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-17' AS Date), NULL, 1)
INSERT [dbo].[Post] ([PostId], [UserID], [PostCategoryID], [Thumbnail], [PostTitle], [BriefInformation], [PostDescription], [Featured], [PostDate], [UpdateDate], [PostStatus]) VALUES (41, 2, 1, N'/src/assests/img/Post/2.jpg', N'Toast bread straight from freezer, anti-waste campaign urges', N'Save your bread from the bin', N'A British bakery has become the first in the UK to launch a loaf of bread made from hundreds of crickets. The limited-edition batch of “Crunchy Cricket” loaves have been created by Roberts Bakery in Norwich and are made using cricket flour, which is supplied by Eat Grub – the UK’s leading insect food brand. According to Roberts Bakery, each loaf of bread contains around 336 crickets, which are dried, ground, mixed with wheat flour and grains and then baked to become what it claims is a “a tremendously tasty loaf with a crunchy finish”. “Crickets are a really new and exciting food ingredient,” said Stuart Spencer-Calnan, managing director of the bakery. “They’re incredibly good for you and actually really tasty, despite what people might think.” Spencer-Calnan added that he thinks people will be “pleasantly surprised” if they try the new loaves and that, so far, the feedback the bakery has received has been “really positive”. As well as being good for gut health, food experts claim that crickets are packed with nutrients and that the bread made from them contains more protein than a standard loaf. “As well as having very strong sustainability and environmental credentials, insects are also seriously tasty and shouldn’t be overlooked as a great recipe ingredient,” said Alison Ordonez, head of innovation at Roberts Bakery. “Our Cricket Loaf provides consumers with a good source of protein and an easy way to familiarise themselves with insect-based food.” Clinical nutritionist Adele Wolstenhulme agrees, adding that insects have long-been considered a daily staple “through the lens of human evolution”. “We are simply returning to our ancestral dietary roots,” Wolstenhulme said. “Given climate change and sustainability issues around meat, we are becoming more aware of the need to seek out alternative protein sources and we shouldn’t dismiss the valuable sources of essential fats that these critters also offer in abundance. “And, when considering the amount of pressure on land and resources, we should be fully embracing insects as ‘superfoods’.”
Insect-eating, or entomophagy, is becoming increasingly common in large parts of the world.
Last year, the United Nations estimated that at least two billion people eat insects – with many having eaten them traditionally for generations – and more than 1,900 species are used for food.
The UN added that insects are also a popular choice amongst those who want to protect the environment because farming insects uses less land, water and feed than conventional livestock farming.
Celebrities who have supported the consumption of insects in the past include Nicole Kidman, Angelina Jolie, Justin Timberlake and Katy Perry.', N'Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed turpis feugiat, mollis felis vel, viverra metus.', CAST(N'2022-07-19' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Post_Category] ON 

INSERT [dbo].[Post_Category] ([PostCategoryID], [PostCategoryName], [Status]) VALUES (1, N'LIVING INTERIOR', 1)
INSERT [dbo].[Post_Category] ([PostCategoryID], [PostCategoryName], [Status]) VALUES (2, N'ARCHITECTURE', 1)
INSERT [dbo].[Post_Category] ([PostCategoryID], [PostCategoryName], [Status]) VALUES (4, N'LIFE STYLE', 1)
INSERT [dbo].[Post_Category] ([PostCategoryID], [PostCategoryName], [Status]) VALUES (5, N'MAGAZINE FURNITURE', 1)
INSERT [dbo].[Post_Category] ([PostCategoryID], [PostCategoryName], [Status]) VALUES (6, N'BEDROOM STYLE', 1)
SET IDENTITY_INSERT [dbo].[Post_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (1, N'Anadama breadd', N'Yeast bread', N'Dish made of ground corn dough or cooked corn flour, similar to Mesoamerican tortilla and Salvadoran pupusa.', 0, 6, 5.0000, 50, N'https://drive.google.com/uc?export=view&id=1GOED3J9A4WO_r28tLxED9tT8Cuvu_RDE', 100, 100, 30, CAST(N'2022-07-15' AS Date), 0.6)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (2, N'Anpan', N'Sweet bun', N'Sweet, braided bread popular among the Jewish diaspora.', 1, 7, 7.0000, 29, N'https://drive.google.com/uc?export=view&id=1ZVaEYmCvQ_9usvnjE_mOdhoN1xq5ggBH', 100, 90, 25, CAST(N'2022-07-16' AS Date), 0.3)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (3, N'Arboud', N'Cornbread', N'Thick, sweet or spicy flatbread made of Dough, ghee, milk, sugar. Mostly consumed as snacks and also in iftar.', 1, 7, 10.0000, 100, N'https://drive.google.com/uc?export=view&id=1ci3HPKHhWyYtfiO6KyxRAw9BVmNwzDqu', 200, 100, 30, CAST(N'2022-07-16' AS Date), 0.2)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (4, N'Bagel', N'Yeast bread', N'A bread of cassava, baked on a griddle.', 1, 5, 2.0000, 50, N'https://drive.google.com/uc?export=view&id=1UbDXVuuA1KIAelyMCj5ZewqWuIxqyeqa', 50, 100, 40, CAST(N'2022-07-16' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (5, N'Balep korkun', N'Flatbread', N'Dense, made with mashed bananas, often a moist, sweet, cake-like quick bread, but some recipes are traditional yeast breads.', 1, 5, 20.0000, 30, N'https://drive.google.com/uc?export=view&id=1FqGD13yplBhBYdiUpAqcrfhgEugU8QVl', 450, 90, 30, CAST(N'2022-07-16' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (6, N'Banana bread', N'Quick bread', N'Sometimes termed "speckled bread", raisins, currants and candied peel are added to dough.', 1, 5, 100.0000, 19, N'https://drive.google.com/uc?export=view&id=1EWTIRSk59JnoW2Ds6vuluNXKi1q0l_yn', 200, 89, 20, CAST(N'2022-07-16' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (7, N'Barbari bread', N'Flatbread', N'Invented by the Barbar tribes of Iran and Northern Afghanistan.', 0, 8, 10.5000, 30, N'https://drive.google.com/uc?export=view&id=1gK2EFANnC2ae7IUVFnCkbfM6Cc76uZrX', 200, 75, 20, CAST(N'2022-07-17' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (8, N'Cottage loaf', N'Biscuit', N'Sweeter than sandwich bread, but less rich than cake, contains sultanas and raisins to add texture.', 1, 5, 12.0000, 39, N'https://drive.google.com/uc?export=view&id=1wsRoL6M1Kyrpw_f3y3p3UUHrPkWiHw3G', 250, 100, 23, CAST(N'2022-07-18' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (9, N'Crisp bread', N'Pancake', N'Prepared with barley, water and salt.', 1, 5, 15.0000, 40, N'https://drive.google.com/uc?export=view&id=18IXLkuaB2qode6ltOn7iUkVNboSLDoUe', 123, 90, 23, CAST(N'2022-07-18' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (10, N'Dosa', N'Biscuit', N'Flat and circular, average thickness of 2 cm, usually eaten fresh.', 1, 5, 14.0000, 39, N'https://drive.google.com/uc?export=view&id=1DdU97QLvudwbUqkgEnTDbhNUoE5rdb3J', 200, 80, 30, CAST(N'2022-07-18' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (11, N'English muffin', N'Flatbread', N'Similar to a bagel, but instead of a hole it has only a dimple on top, which is filled with a bit of butter and diced onion or garlic. Known as a cebularz in Poland.', 1, 8, 16.0000, 33, N'https://drive.google.com/uc?export=view&id=1wsRoL6M1Kyrpw_f3y3p3UUHrPkWiHw3G', 150, 89, 20, CAST(N'2022-07-19' AS Date), 0.4)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (13, N'Focaccia', N'Pancake', N'Doughy, white bread bun (roll) specialty; particularly associated with Waterford, Ireland. Currently made in Waterford and County Kilkenny, and was historically made in Wexford.', 1, 8, 12.0000, 19, N'https://drive.google.com/uc?export=view&id=1HefjYy7XS8nsQabOaRSSoG3gGzwZw43n', 300, 70, 20, CAST(N'2022-07-19' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (14, N'update', N'd', N'<p>avc</p>
', 0, 5, 14.0000, 10, N'https://drive.google.com/uc?export=view&id=1HefjYy7XS8nsQabOaRSSoG3gGzwZw43n', 10, 10, 10, CAST(N'2022-07-19' AS Date), 0.30000001192092896)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Title], [Description], [StatusID], [CategoryID], [Price], [Quantity], [Thumbnail], [Weight], [Degree], [Time], [CreateDate], [Discount]) VALUES (15, N'nake', N'cakse', N'<p>123asdf</p>
', 0, 5, 1234.0000, 24, N'https://drive.google.com/uc?export=view&id=1UbDXVuuA1KIAelyMCj5ZewqWuIxqyeqa', 10, 5, 2, CAST(N'2022-07-12' AS Date), 0.10000000149011612)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Image] ON 

INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (1, 1, N'https://drive.google.com/uc?export=view&id=1yWmmxcXKKwy9YVcYwNqmxbsl6tCwHYwF', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (2, 1, N'https://drive.google.com/uc?export=view&id=1ZVaEYmCvQ_9usvnjE_mOdhoN1xq5ggBH', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (3, 1, N'https://drive.google.com/uc?export=view&id=1zHa9zDb3Ea_r3LGlPJByOB-wqjN3k0tn', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (4, 4, N'https://drive.google.com/uc?export=view&id=1UbDXVuuA1KIAelyMCj5ZewqWuIxqyeqa', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (6, 4, N'https://drive.google.com/uc?export=view&id=1OWh03DpOiuV9mEXzYJuInpQGqbJAd6mo', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (7, 4, N'https://drive.google.com/uc?export=view&id=1PdA3xg8xJ7TWLWIGtXn4yJVg1vJr8uB5', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (8, 2, N'https://drive.google.com/uc?export=view&id=1y18Ms8VIUzRoJVS2gBwLTKItj0Epu6oF', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (9, 2, N'https://drive.google.com/uc?export=view&id=1wsRoL6M1Kyrpw_f3y3p3UUHrPkWiHw3G', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (10, 2, N'https://drive.google.com/uc?export=view&id=18IXLkuaB2qode6ltOn7iUkVNboSLDoUe', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (11, 3, N'https://drive.google.com/uc?export=view&id=1Z2ieLkgCHKhNZTgv6Gh4Sh7mE6sooU32', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (13, 3, N'https://drive.google.com/uc?export=view&id=1DdU97QLvudwbUqkgEnTDbhNUoE5rdb3J', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (14, 3, N'https://drive.google.com/uc?export=view&id=1DdU97QLvudwbUqkgEnTDbhNUoE5rdb3J', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (15, 5, N'https://drive.google.com/uc?export=view&id=1yWmmxcXKKwy9YVcYwNqmxbsl6tCwHYwF', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (16, 5, N'https://drive.google.com/uc?export=view&id=1JCQUvdZhrO2l5pnu6HRFJmAZv5O_zguK', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (17, 5, N'https://drive.google.com/uc?export=view&id=1GOED3J9A4WO_r28tLxED9tT8Cuvu_RDE', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (20, 6, N'https://drive.google.com/uc?export=view&id=1JCQUvdZhrO2l5pnu6HRFJmAZv5O_zguK', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (21, 6, N'https://drive.google.com/uc?export=view&id=1GOED3J9A4WO_r28tLxED9tT8Cuvu_RDE', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (22, 6, N'https://drive.google.com/uc?export=view&id=1PdA3xg8xJ7TWLWIGtXn4yJVg1vJr8uB5', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (23, 7, N'https://drive.google.com/uc?export=view&id=1HefjYy7XS8nsQabOaRSSoG3gGzwZw43n', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (24, 7, N'https://drive.google.com/uc?export=view&id=1h56nXWKpVW6uF05vx1l1le2F_4_FtSni', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (25, 7, N'https://drive.google.com/uc?export=view&id=1edFV66Eaeium87zgtb1KymuPDmeOx13a', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (26, 8, N'https://drive.google.com/uc?export=view&id=1FqGD13yplBhBYdiUpAqcrfhgEugU8QVl', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (27, 8, N'https://drive.google.com/uc?export=view&id=1ZQM3WCWgZmFUcL1sfmVvi16frzV1uQ4q', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (28, 8, N'https://drive.google.com/uc?export=view&id=1h56nXWKpVW6uF05vx1l1le2F_4_FtSni', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (29, 9, N'https://drive.google.com/uc?export=view&id=1mSg06Pfj1SGpd95A8GOfoq6stYIEEEgo', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (30, 9, N'https://drive.google.com/uc?export=view&id=1hutN1dfLXYLrIA_6nXCIaSCSbV3JBFmR', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (31, 9, N'https://drive.google.com/uc?export=view&id=1ZVaEYmCvQ_9usvnjE_mOdhoN1xq5ggBH', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (32, 10, N'https://drive.google.com/uc?export=view&id=1D2NMNW6pZX_fGvu2utzKQcI2n2TSYo7x', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (33, 10, N'https://drive.google.com/uc?export=view&id=138Y0niljyPdNqGTnmIkpyckenOVHfgKH', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (34, 10, N'https://drive.google.com/uc?export=view&id=1J0Qk0_8YMchemxvZgoDKOUIdLDZHXoIp', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (35, 11, N'https://drive.google.com/uc?export=view&id=1OWh03DpOiuV9mEXzYJuInpQGqbJAd6mo', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (36, 11, N'https://drive.google.com/uc?export=view&id=1UbDXVuuA1KIAelyMCj5ZewqWuIxqyeqa', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (39, 13, N'https://drive.google.com/uc?export=view&id=1ci3HPKHhWyYtfiO6KyxRAw9BVmNwzDqu', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (41, 13, N'https://drive.google.com/uc?export=view&id=1ci3HPKHhWyYtfiO6KyxRAw9BVmNwzDqu', 1)
INSERT [dbo].[Product_Image] ([ProductImageID], [ProductID], [Image], [Status]) VALUES (42, 13, N'https://drive.google.com/uc?export=view&id=1gK2EFANnC2ae7IUVFnCkbfM6Cc76uZrX', 1)
SET IDENTITY_INSERT [dbo].[Product_Image] OFF
GO
INSERT [dbo].[Product_Status] ([ProductStatusID], [Status]) VALUES (0, N'Out Of Stock')
INSERT [dbo].[Product_Status] ([ProductStatusID], [Status]) VALUES (1, N'On Shopping')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Sale')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Marketing')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Customer')
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (1, 1, 5, N'Productsite', 1, N'Page size of productlist')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (2, 1, 3, N'Product category site', 1, N'Page size of category product')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (3, 1, 3, N'Cart site', 1, N'Page size of cart product')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (4, 1, 1, N'Cart category site', 2, N'Page size of catagory in cart')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (5, 1, 3, N'Lastest product', 1, N'Size of lastest product')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (6, 1, 2, N'Bloglist site', 1, N'Page size of bloglist')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (7, 1, 5, N'Bloglist category site', 1, N'Page size of category bloglist')
INSERT [dbo].[Settings] ([SettingID], [SettingTypeID], [SettingValue], [SettingOrder], [SettingStatusID], [SettingDescription]) VALUES (8, 2, 1, N'4', 1, N'ok')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
INSERT [dbo].[SettingStatus] ([statusID], [status]) VALUES (1, N'Activate')
INSERT [dbo].[SettingStatus] ([statusID], [status]) VALUES (2, N'Deactivate')
GO
INSERT [dbo].[SettingType] ([TypeID], [TypeName]) VALUES (1, N'Page')
INSERT [dbo].[SettingType] ([TypeID], [TypeName]) VALUES (2, N'Mail')
GO
SET IDENTITY_INSERT [dbo].[Ship_Information] ON 

INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (1, N'a', N'a', 1, N'a', N'a', N'a')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (2, N'aaaa', N'Vinh', 1, N'4324324', N'vinhnthe151215@fpt.edu.vn', N'ship can than')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (3, N'a bc d ', N'Hoang', 0, N'4324324', N'xuanzhoagfu145@gmail.com', N'a')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (4, N'aaaa', N'Vinh', 0, N'4324324', N'xuanzhoagfu145@gmail.com', N'a')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (5, N'aaaa', N'Vinh', 0, N'4324324', N'xuanzhoagfu145@gmail.com', N'')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (6, N'aaaa', N'Vinh', 0, N'4324324', N'xuanzhoagfu145@gmail.com', N'')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (7, N'aaaa', N'Vinh', 0, N'4324324', N'xuanzhoagfu145@gmail.com', N'')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (8, N'hai phong', N'mam', 1, N'0963949000', N'hellboynam2001@gmail.com', N'nam kute sieu cap vip pro')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (9, N'hai phong', N'mam', 1, N'0963949000', N'hellboynam2001@gmail.com', N'thai hoi non')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (10, N'Ha Noi', N'namg', 0, N'0833515589', N'namvdhe151370@fpt.edu.vn', N'abcd')
INSERT [dbo].[Ship_Information] ([ShipInfoID], [Address], [ReciverName], [Gender], [Mobile], [Email], [Notes]) VALUES (11, N'Ha Noi', N'vinh', 1, N'0234875334', N'vinhnthe151215@fpt.edu.vn', N'')
SET IDENTITY_INSERT [dbo].[Ship_Information] OFF
GO
INSERT [dbo].[Slider] ([SliderId], [ProductID], [UserID], [PostID], [Title], [Backlink], [Status], [Image], [Notes]) VALUES (1, 1, 2, NULL, N'Chickery Chocolate', N'http://localhost:8080/src/customer/productlist', 2, N'https://drive.google.com/uc?export=view&id=15w4-GBfo1GvQWIQwjdGRa313sfkesuqD', N'Black flower')
INSERT [dbo].[Slider] ([SliderId], [ProductID], [UserID], [PostID], [Title], [Backlink], [Status], [Image], [Notes]) VALUES (2, 2, 2, NULL, N'Black flowerZ', N'http://localhost:8080/src/customer/productlist', 1, N'https://drive.google.com/uc?export=view&id=1GOED3J9A4WO_r28tLxED9tT8Cuvu_RDE', N'welcome to our bakery')
INSERT [dbo].[Slider] ([SliderId], [ProductID], [UserID], [PostID], [Title], [Backlink], [Status], [Image], [Notes]) VALUES (3, 3, 2, NULL, N'Black flower', N'http://localhost:8080/src/customer/productlist', 1, N'https://drive.google.com/uc?export=view&id=1ci3HPKHhWyYtfiO6KyxRAw9BVmNwzDqu', N'awesowm')
INSERT [dbo].[Slider] ([SliderId], [ProductID], [UserID], [PostID], [Title], [Backlink], [Status], [Image], [Notes]) VALUES (4, 4, 2, NULL, N'Red flower', N'http://localhost:8080/src/customer/productlist', 2, N'https://drive.google.com/uc?export=view&id=1la3oN1kGueh8o5ydH_1OOLXIkAj2sbtO', N'Wish you enjoyed')
INSERT [dbo].[Slider] ([SliderId], [ProductID], [UserID], [PostID], [Title], [Backlink], [Status], [Image], [Notes]) VALUES (5, NULL, 1004, 2, N'Hotpost', N'http://localhost:8080/src/customer/productlist', 1, N'https://drive.google.com/uc?export=view&id=1EWTIRSk59JnoW2Ds6vuluNXKi1q0l_yn', N'greatpost')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (1, N'vinhnthe151215@fpt.edu.vn', N'YWJjZDEyMzQ=', 3, N'vinh', N'0234875334', 1, N'1.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2, N'xuanzhoagfu145@gmail.com', N'YWJjZDEyMzQ=', 2, N'Vinh', N'4324324', 0, N'2.PNG', NULL, NULL, N'Ha Noi', 0, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (3, N'hoanglp@gmail.com', N'YWJjZDEyMzQ=', 3, N'hoang', N'0324567823', 1, N'1.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (4, N'thai211@gmail.com', N'YWJjZDEyMzQ=', 4, N'huythai', N'123456789', 1, N'2.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (5, N'thaihh@fpt.edu.vn', N'YWJjZDEyMzQ=', 3, N'thai', N'0421356789', 1, N'3.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-19' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (1004, N'hoangdx@yahoo.com', N'YWJjZDEyMzQ=', 1, N'Hoang2', N'0123546987', 1, N'3.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-19' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2006, N'namvdhe151370@fpt.edu.vn', N'YWJjZDEyMzQ=', 1, N'namg', N'0833515589', 0, N'4.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-17' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2007, N'hoangdxhe151343@fpt.edu.vn', N'YWJjZDEyMzQ=', 1, N'Hoàng', N'0833515589', 1, N'5.PNG', NULL, NULL, N'Ha Noi', 0, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2008, N'xuanzhoangfu145@gmail.com', N'YWJjZDEyMzQ=', 2, N'hoang', N'0835515587', 1, N'5.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2009, N'hahuythai2001@gmail.com', N'YWJjZDEyMzQ=', 2, N'Thái', N'0833515583', 1, N'6.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-19' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2013, N'abc@fpt.edu.vn', N'YWJjZDEyMzQ=', 4, N'Nguyen Van A', N'1111111', 1, N'3.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-17' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2018, N'xyz@fpt.edu.vn', N'YWJjZDEyMzQ=', 4, N'Co Thieu Hoang', N'222222', 0, N'7.PNG', NULL, NULL, N'Ha Noi', 1, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2019, N'sylar@gmail.com', N'YWJjZDEyMzQ=', 4, N'Gabriez Sylar', N'333333', 0, N'7.PNG', NULL, NULL, N'Ha Noi', 0, NULL, CAST(N'2022-07-18' AS Date))
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2022, N'namhthe151389@fpt.edu.vn', N'MTIzNDU=', 4, N'LÃª Tráº§n HoÃ ng áº¾ch', N'0963949000', 1, N'8.PNG', NULL, NULL, N'Ha Noi', 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2023, N'hellboynam2001hehehehe@gmail.com', N'MTIzNDU2Nzg=', 4, N'mam', N'0963949000', 1, N'9.PNG', NULL, NULL, N'hai phong', 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2024, N'nam123@gmail.com', N'123456', 4, N'nam', N'1231245342', 1, N'10.PNG', NULL, NULL, N'hai duong', 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [Password], [RoleID], [Name], [Mobile], [Gender], [Image], [token], [expiration], [address], [StatusID], [ShipInfoID], [dateCreated]) VALUES (2025, N'nam123@gmail.com', N'123456', 4, N'Nam Vu Duc', N'1231245342', 1, N'11.PNG', NULL, NULL, N'hai phong', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[User_Status] ([UserStatusID], [UserStatus]) VALUES (0, N'DeActive')
INSERT [dbo].[User_Status] ([UserStatusID], [UserStatus]) VALUES (1, N'Active')
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [OrderDate_Order]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Cart]
GO
ALTER TABLE [dbo].[Cart_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Detail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Cart_Detail] CHECK CONSTRAINT [FK_Cart_Detail_Product]
GO
ALTER TABLE [dbo].[Feature_Role]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Role_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[Feature_Role] CHECK CONSTRAINT [FK_Feature_Role_Feature]
GO
ALTER TABLE [dbo].[Feature_Role]  WITH CHECK ADD  CONSTRAINT [FK_Feature_Role_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Feature_Role] CHECK CONSTRAINT [FK_Feature_Role_Role]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback_Images]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Images_Feedback] FOREIGN KEY([FeedbackId])
REFERENCES [dbo].[Feedback] ([FeedbackId])
GO
ALTER TABLE [dbo].[Feedback_Images] CHECK CONSTRAINT [FK_Feedback_Images_Feedback]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order_Status] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[Order_Status] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Ship_Information] FOREIGN KEY([ShipInfoID])
REFERENCES [dbo].[Ship_Information] ([ShipInfoID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Ship_Information]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User1] FOREIGN KEY([SaleId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Post_Category] FOREIGN KEY([PostCategoryID])
REFERENCES [dbo].[Post_Category] ([PostCategoryID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Post_Category]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Product_Status] ([ProductStatusID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_Status]
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Image] CHECK CONSTRAINT [FK_Product_Image_Product]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_SettingStatus] FOREIGN KEY([SettingStatusID])
REFERENCES [dbo].[SettingStatus] ([statusID])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_SettingStatus]
GO
ALTER TABLE [dbo].[Settings]  WITH CHECK ADD  CONSTRAINT [FK_Settings_SettingType] FOREIGN KEY([SettingTypeID])
REFERENCES [dbo].[SettingType] ([TypeID])
GO
ALTER TABLE [dbo].[Settings] CHECK CONSTRAINT [FK_Settings_SettingType]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Ship_Information] FOREIGN KEY([ShipInfoID])
REFERENCES [dbo].[Ship_Information] ([ShipInfoID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Ship_Information]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[User_Status] ([UserStatusID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User_Status]
GO
USE [master]
GO
ALTER DATABASE [Sum22_SWP391_BakeryShop] SET  READ_WRITE 
GO
