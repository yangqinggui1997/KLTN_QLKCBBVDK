-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 07, 2020 lúc 02:51 PM
-- Phiên bản máy phục vụ: 10.4.6-MariaDB
-- Phiên bản PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlkcb`
--
DROP DATABASE IF EXISTS `qlkcb`;
CREATE DATABASE IF NOT EXISTS `qlkcb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `qlkcb`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anh_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `anh_cls`;
CREATE TABLE IF NOT EXISTS `anh_cls` (
  `IdACLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã ảnh kết quả cận lâm sàng',
  `IdKQCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết quả cận lâm sàng',
  `Anh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ảnh cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdACLS`),
  KEY `fk_anh_cls_IdKQCLS` (`IdKQCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `anh_cls`:
--   `IdKQCLS`
--       `ket_qua_cls` -> `IdKQCLS`
--

--
-- Đang đổ dữ liệu cho bảng `anh_cls`
--

INSERT INTO `anh_cls` (`IdACLS`, `IdKQCLS`, `Anh`, `created_at`, `updated_at`) VALUES
('0019644261', '0820880501', 'Tq0P_bedridden.png', '2019-04-16 05:42:52', '2019-04-16 05:42:52'),
('0032803461', '0607321001', 'x0Rx_diagram.png', '2019-04-16 05:52:43', '2019-04-16 05:52:43'),
('0232646721', '0430263611', 'SZxV_drugs.png', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0240494111', '0896880671', 'Or9Q_computer (1).png', '2019-04-08 06:31:55', '2019-04-08 06:31:55'),
('0242006011', '0820880501', '00Vi_computer (1).png', '2019-04-16 05:42:52', '2019-04-16 05:42:52'),
('0286969781', '0430263611', 'bZ0P_doctor (2).png', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0368491781', '0737416671', '2sOp_computer (4).png', '2019-04-16 05:50:26', '2019-04-16 05:50:26'),
('0427303511', '0607321001', 'm1yH_defibrillator.png', '2019-04-16 05:52:43', '2019-04-16 05:52:43'),
('0452994871', '0896880671', 'NZzm_bedridden.png', '2019-04-08 06:31:55', '2019-04-08 06:31:55'),
('0867506831', '0737416671', 'rgY6_computer.png', '2019-04-16 05:50:26', '2019-04-16 05:50:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ba_nv`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `ba_nv`;
CREATE TABLE IF NOT EXISTS `ba_nv` (
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBANoiT`,`IdNV`),
  KEY `fk_ba_nv_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ba_nv`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `ba_nv`
--

INSERT INTO `ba_nv` (`IdBANoiT`, `IdNV`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0440784491', '0419628061', NULL, '2019-04-16 07:22:45', '2019-04-16 07:22:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `benh_an_ngoai_tru` (
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hồ sơ bệnh án',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `SoNgayDT` smallint(5) UNSIGNED NOT NULL COMMENT 'Số ngày điều trị',
  `TrangThaiBA` tinyint(1) UNSIGNED NOT NULL COMMENT 'Trạng thái bệnh án cho biết bệnh nhân đang điều trị hoặc đã kết thúc điều trị',
  `TinhTrangTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng thanh toán viện phí của bệnh nhân (cập nhật bởi kế toán)',
  `TTBN` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tình trạng bệnh nhân lúc tiếp nhận',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBANgoaiT`),
  KEY `fk_benh_an_ngoai_tru_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_an_ngoai_tru`:
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `benh_an_ngoai_tru`
--

INSERT INTO `benh_an_ngoai_tru` (`IdBANgoaiT`, `IdNV`, `SoNgayDT`, `TrangThaiBA`, `TinhTrangTT`, `TTBN`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0035973371', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-03-26 17:00:00', '2019-04-04 04:59:49'),
('0048763021', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-04-01 02:46:19', '2019-04-02 02:46:19'),
('0158705861', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-04-02 06:59:49', '2019-04-10 04:25:37'),
('0189158951', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-03-27 08:06:51', '2019-04-04 04:59:48'),
('0623337401', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-04-21 03:02:51', '2019-05-02 02:36:23'),
('0664160011', '0419628061', 7, 0, 0, 'tinh_tao', NULL, '2019-04-08 02:54:54', '2019-04-16 04:18:26'),
('0889924831', '0353870871', 7, 0, 0, 'tinh_tao', NULL, '2019-04-21 04:51:17', '2019-05-04 01:45:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_an_ngoai_tru_vs_can_lam_sang`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `benh_an_ngoai_tru_vs_can_lam_sang`;
CREATE TABLE IF NOT EXISTS `benh_an_ngoai_tru_vs_can_lam_sang` (
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `IdCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCLS`,`IdBANgoaiT`),
  KEY `fk_benh_an_ngoai_tru_vs_can_lam_sang_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_an_ngoai_tru_vs_can_lam_sang`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdCLS`
--       `can_lam_sang` -> `IdCLS`
--

--
-- Đang đổ dữ liệu cho bảng `benh_an_ngoai_tru_vs_can_lam_sang`
--

INSERT INTO `benh_an_ngoai_tru_vs_can_lam_sang` (`IdBANgoaiT`, `IdCLS`, `created_at`, `updated_at`) VALUES
('0035973371', '0052570371', '2019-04-07 11:03:29', '2019-04-07 11:03:29'),
('0189158951', '0057202581', '2019-03-31 08:03:57', '2019-03-31 08:03:57'),
('0035973371', '0074911791', '2019-03-31 08:04:45', '2019-03-31 08:04:45'),
('0048763021', '0115660961', '2019-04-02 04:59:27', '2019-04-02 04:59:27'),
('0189158951', '0170701221', '2019-03-31 04:21:17', '2019-03-31 04:21:17'),
('0664160011', '0554967391', '2019-04-12 04:57:22', '2019-04-12 04:57:22'),
('0158705861', '0878253991', '2019-04-08 06:30:36', '2019-04-08 06:30:36'),
('0048763021', '0939067541', '2019-04-07 11:03:54', '2019-04-07 11:03:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_an_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `benh_an_noi_tru`;
CREATE TABLE IF NOT EXISTS `benh_an_noi_tru` (
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hồ sơ bệnh án',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `IdGiuong` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giường bệnh',
  `CapCuu` tinyint(1) UNSIGNED NOT NULL COMMENT 'Xác định bệnh án có phải cấp cứu',
  `TTLucVao` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tình trạng bệnh nhân lúc nhập viện',
  `LyDoNV` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Lý do nhập viện',
  `TrangThaiBA` tinyint(1) UNSIGNED NOT NULL COMMENT 'Trạng thái bệnh án cho biết bệnh nhân đang điều trị nội trú hoặc đã kết thúc điều trị',
  `TinhTrangTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng thanh toán viện phí của bệnh nhân (cập nhật bởi kế toán)',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBANoiT`),
  KEY `fk_benh_an_noi_tru_IdNV` (`IdNV`),
  KEY `fk_benh_an_noi_tru_IdGiuong` (`IdGiuong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_an_noi_tru`:
--   `IdGiuong`
--       `thiet_bi_yt` -> `IdTB`
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `benh_an_noi_tru`
--

INSERT INTO `benh_an_noi_tru` (`IdBANoiT`, `IdNV`, `IdGiuong`, `CapCuu`, `TTLucVao`, `LyDoNV`, `TrangThaiBA`, `TinhTrangTT`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0069826801', '0419628061', '01', 0, 'tinh_tao', 'fggdg', 0, 0, NULL, '2019-04-04 14:21:22', '2019-04-11 10:30:35'),
('0218106341', '0353870871', '05', 0, 'tinh_tao', 'sdfsdf', 0, 0, 'sfsf', '2019-04-16 14:06:40', '2019-04-25 04:29:02'),
('0277643301', '0419628061', '04', 0, 'tinh_tao', 'Điều trị bệnh mắt', 0, 0, NULL, '2019-03-26 15:45:27', '2019-04-11 10:29:52'),
('0334696751', '0419628061', '04', 0, 'tinh_tao', 'Điều trị nội trú bệnh mắt', 1, 0, NULL, '2019-04-02 07:32:16', '2019-04-16 15:05:42'),
('0440784491', '0118316881', '09', 1, 'tinh_tao', 'drxdfxd', 1, 0, NULL, '2019-04-14 15:42:25', '2019-04-16 07:19:10'),
('0447729301', '0353870871', '06', 0, 'tinh_tao', 'sdfsdf', 1, 0, NULL, '2019-04-16 14:05:58', '2019-04-16 15:04:30'),
('0532084181', '0419628061', '01', 1, 'tinh_tao', 'serfsdfsf', 1, 0, NULL, '2019-04-14 15:43:03', '2019-04-16 17:07:04'),
('0726171501', '0419628061', '02', 0, 'tinh_tao', 'điều trị bệnh', 0, 0, NULL, '2019-04-08 08:45:38', '2019-04-24 15:03:38'),
('0764391241', '0419628061', '01', 0, 'tinh_tao', 'Điều trị bệnh mắt', 0, 0, NULL, '2019-03-28 12:52:35', '2019-04-24 11:01:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_an_noi_tru_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `benh_an_noi_tru_ct`;
CREATE TABLE IF NOT EXISTS `benh_an_noi_tru_ct` (
  `IdBACT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hồ sơ bệnh án chi tiết',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hồ sơ bệnh án',
  `PPDieuTri` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phương pháp điều trị',
  `NgayBD` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày bắt đầu điều trị',
  `NgayKT` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày kết thúc điều trị',
  `TinhTrangBN` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tình trang bệnh nhân sau mỗi đợt điều trị',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBACT`),
  KEY `fk_benh_an_noi_tru_ct_IdBANoiT` (`IdBANoiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_an_noi_tru_ct`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--

--
-- Đang đổ dữ liệu cho bảng `benh_an_noi_tru_ct`
--

INSERT INTO `benh_an_noi_tru_ct` (`IdBACT`, `IdBANoiT`, `PPDieuTri`, `NgayBD`, `NgayKT`, `TinhTrangBN`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0141538311', '0218106341', 'dung_thuoc', '2019-04-15 17:00:00', '2019-04-19 17:00:00', 'dang_theo_doi', NULL, '2019-04-16 14:29:11', '2019-04-16 14:29:11'),
('0188181541', '0764391241', 'dung_thuoc', '2019-03-18 17:00:00', '2019-03-27 17:00:00', 'khoi_benh_hoan_toan', NULL, '2019-03-28 12:55:45', '2019-04-01 14:46:41'),
('0260396741', '0447729301', 'thuc_hien_cls_vs_dung_thuoc', '2019-04-15 17:00:00', '2019-04-23 17:00:00', 'dang_theo_doi', NULL, '2019-04-16 14:59:42', '2019-04-16 14:59:42'),
('0377523581', '0440784491', 'dung_thuoc', '2019-04-21 17:00:00', '2019-04-23 17:00:00', 'khoi_benh_hoan_toan', NULL, '2019-04-22 03:47:23', '2019-04-22 03:47:23'),
('0401196051', '0334696751', 'dung_thuoc', '2019-05-03 17:00:00', '2019-05-09 17:00:00', 'dang_theo_doi', NULL, '2019-05-04 05:59:09', '2019-05-04 05:59:09'),
('0454642881', '0277643301', 'phau_thuat', '2019-03-25 17:00:00', '2019-03-29 17:00:00', 'dang_theo_doi', 'dwq', '2019-03-31 08:07:58', '2019-03-31 08:07:58'),
('0558868261', '0764391241', 'phau_thuat', '2019-03-27 17:00:00', '2019-03-29 17:00:00', 'dang_theo_doi', 'sfsf', '2019-03-31 08:08:39', '2019-04-01 14:46:19'),
('0568023541', '0334696751', 'dung_thuoc', '2019-04-01 17:00:00', '2019-04-03 17:00:00', 'do_mot_phan', NULL, '2019-04-02 08:10:58', '2019-04-02 09:39:18'),
('0583207831', '0532084181', 'phau_thuat', '2019-04-20 17:00:00', '2019-04-20 17:00:00', 'dang_theo_doi', NULL, '2019-04-21 11:46:27', '2019-04-21 11:46:27'),
('0650112451', '0440784491', 'thuc_hien_cls_vs_dung_thuoc', '2019-04-13 17:00:00', '2019-04-16 17:00:00', 'dang_theo_doi', NULL, '2019-04-14 16:44:30', '2019-04-14 16:44:30'),
('0727732781', '0726171501', 'dung_thuoc', '2019-04-10 17:00:00', '2019-04-16 17:00:00', 'khoi_benh_hoan_toan', NULL, '2019-04-11 03:50:37', '2019-04-11 03:50:37'),
('0728080421', '0334696751', 'phau_thuat', '2019-04-01 17:00:00', '2019-04-01 17:00:00', 'dang_theo_doi', NULL, '2019-04-02 09:44:37', '2019-04-02 09:44:37'),
('0758556141', '0277643301', 'dung_thuoc', '2019-03-25 17:00:00', '2019-03-29 17:00:00', 'dang_theo_doi', NULL, '2019-03-26 15:45:44', '2019-03-26 17:21:38'),
('0758603151', '0532084181', 'dung_thuoc', '2019-04-15 17:00:00', '2019-04-19 17:00:00', 'dang_theo_doi', NULL, '2019-04-16 04:25:32', '2019-04-16 04:25:32'),
('0791593471', '0277643301', 'dung_thuoc', '2019-03-25 17:00:00', '2019-04-01 17:00:00', 'khoi_benh_hoan_toan', NULL, '2019-03-30 05:05:52', '2019-03-30 05:05:52'),
('0889479481', '0069826801', 'dung_thuoc', '2019-04-03 17:00:00', '2019-04-09 17:00:00', 'khoi_benh_hoan_toan', NULL, '2019-04-04 14:30:19', '2019-04-04 14:30:19'),
('0921184991', '0440784491', 'phau_thuat', '2019-04-20 17:00:00', '2019-04-20 17:00:00', 'dang_theo_doi', NULL, '2019-04-21 12:05:02', '2019-04-21 12:05:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_an_noi_tru_ct_vs_can_lam_sang`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `benh_an_noi_tru_ct_vs_can_lam_sang`;
CREATE TABLE IF NOT EXISTS `benh_an_noi_tru_ct_vs_can_lam_sang` (
  `IdBACT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú chi tiết',
  `IdCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBACT`,`IdCLS`),
  KEY `fk_benh_an_noi_tru_ct_vs_can_lam_sang_IdCLS` (`IdCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_an_noi_tru_ct_vs_can_lam_sang`:
--   `IdBACT`
--       `benh_an_noi_tru_ct` -> `IdBACT`
--   `IdCLS`
--       `can_lam_sang` -> `IdCLS`
--

--
-- Đang đổ dữ liệu cho bảng `benh_an_noi_tru_ct_vs_can_lam_sang`
--

INSERT INTO `benh_an_noi_tru_ct_vs_can_lam_sang` (`IdBACT`, `IdCLS`, `created_at`, `updated_at`) VALUES
('0188181541', '0289761081', '2019-03-31 08:05:48', '2019-03-31 08:05:48'),
('0188181541', '0677737901', '2019-03-31 04:22:06', '2019-03-31 04:22:06'),
('0401196051', '0856406991', '2019-05-04 06:01:12', '2019-05-04 06:01:12'),
('0454642881', '0016467601', '2019-04-10 14:05:59', '2019-04-10 14:05:59'),
('0568023541', '0858732371', '2019-04-02 08:11:41', '2019-04-02 08:11:41'),
('0650112451', '0040707121', '2019-04-16 05:11:32', '2019-04-16 05:11:32'),
('0650112451', '0054739921', '2019-04-16 05:09:13', '2019-04-16 05:09:13'),
('0727732781', '0264908951', '2019-04-12 05:02:36', '2019-04-12 05:02:36'),
('0758556141', '0702718621', '2019-04-10 14:06:56', '2019-04-10 14:06:56'),
('0758603151', '0154649541', '2019-04-16 05:00:14', '2019-04-16 05:00:14'),
('0758603151', '0655039201', '2019-04-16 05:02:15', '2019-04-16 05:02:15'),
('0791593471', '0651209981', '2019-04-10 14:06:25', '2019-04-10 14:06:25'),
('0889479481', '0717302621', '2019-04-07 19:44:21', '2019-04-07 19:44:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `benh_nhan`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `benh_nhan`;
CREATE TABLE IF NOT EXISTS `benh_nhan` (
  `IdBN` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh nhân',
  `IdXa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã xã phường',
  `HoTen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Họ tên bệnh nhân',
  `NgaySinh` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sinh',
  `GioiTinh` tinyint(1) UNSIGNED NOT NULL COMMENT 'Giới tính',
  `SoCMND` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số chứng minh nhân dân',
  `SDT` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Số điện thoại',
  `DiaChi` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `DanToc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Dân tộc',
  `Anh` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ảnh bệnh nhân',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBN`),
  KEY `fk_benh_nhan_IdXa` (`IdXa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `benh_nhan`:
--   `IdXa`
--       `phuong_xa` -> `IdXa`
--

--
-- Đang đổ dữ liệu cho bảng `benh_nhan`
--

INSERT INTO `benh_nhan` (`IdBN`, `IdXa`, `HoTen`, `NgaySinh`, `GioiTinh`, `SoCMND`, `SDT`, `DiaChi`, `DanToc`, `Anh`, `created_at`, `updated_at`) VALUES
('0000939921', '36', 'Trần Văn Kiên', '1989-01-02 13:35:46', 1, '012345678', '0123456789', NULL, 'cong', NULL, '2019-04-01 13:36:49', '2019-04-01 13:36:49'),
('0107172471', '20', 'Trần Thị Mẫn', '1989-05-11 02:21:07', 0, '012345678', '0123456789', NULL, 'hoa', NULL, '2019-04-08 02:26:14', '2019-04-08 02:26:14'),
('0142648171', '1', 'Trần Văn An', '1985-02-22 22:01:25', 1, NULL, NULL, NULL, 'kinh', NULL, '2019-02-22 22:01:31', '2019-02-22 22:01:31'),
('0222978841', '1', 'Trần Văn Tâm', '1999-02-22 19:13:38', 0, '232323231', '3232323211', NULL, 'bana', 'C9v4_image9.jpg', '2019-02-22 19:14:21', '2019-03-20 02:29:01'),
('0257739351', '31', 'Trần Thị Minh', '1988-09-29 02:21:07', 0, '012345678', '0123456789', NULL, 'kho_me', NULL, '2019-04-08 02:22:39', '2019-04-08 02:22:39'),
('0276309981', '2', 'Trần Văn Minh', '2000-02-04 19:13:38', 1, '232323231', '3232323211', NULL, 'kho_me', NULL, '2019-02-22 19:14:45', '2019-02-22 19:14:45'),
('0297071041', '2', 'Trần Văn Duyên', '1990-02-22 22:01:25', 0, '232232232', '2323223232', 'sds', 'chut', '1rhi_nature_pattern_clouds_summer_heart_67345_1366x768.jpg', '2019-02-22 22:39:26', '2019-03-20 02:30:40'),
('0384699441', '4', 'Trần Văn Quân', '2000-04-19 13:35:46', 1, '012345678', '0123456789', NULL, 'hoa', NULL, '2019-04-01 13:38:50', '2019-04-01 13:38:50'),
('0714550591', '2', 'Trần Văn Trân', '1999-02-03 07:59:43', 1, '789456123', '9874561230', NULL, 'kinh', NULL, '2019-04-08 08:00:47', '2019-04-08 08:00:47'),
('0798450951', '27', 'Trần Văn Quang', '1990-05-25 13:35:46', 0, '012345678', '0123456789', NULL, 'bru_van_kieu', NULL, '2019-04-01 13:38:18', '2019-04-01 13:38:18'),
('0895491611', '11', 'Trần Văn Quyết', '1981-04-17 13:35:46', 1, '012345678', '0123456789', NULL, 'cong', NULL, '2019-04-01 13:37:49', '2019-04-01 13:37:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `can_lam_sang`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `can_lam_sang`;
CREATE TABLE IF NOT EXISTS `can_lam_sang` (
  `IdCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định cận lâm sàng',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục cận lâm sàng',
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng thực hiện phiếu chỉ định',
  `TinhTrangTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng thanh toán phí dịch vụ cận lâm sàng',
  `TamUng` tinyint(1) DEFAULT 0 COMMENT 'Tình trạng đóng tạm ứng',
  `LoaiCD` tinyint(1) UNSIGNED NOT NULL COMMENT 'Loại chỉ định (thường hoặc khẩn)',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCLS`),
  KEY `fk_can_lam_sang_IdPB` (`IdPB`),
  KEY `fk_can_lam_sang_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `can_lam_sang`:
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdPB`
--       `phong_ban` -> `IdPB`
--

--
-- Đang đổ dữ liệu cho bảng `can_lam_sang`
--

INSERT INTO `can_lam_sang` (`IdCLS`, `IdDMCLS`, `IdPB`, `TinhTrangTT`, `TamUng`, `LoaiCD`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0016467601', '20', '06', 0, 1, 0, NULL, '2019-05-04 14:05:59', '2019-05-04 04:39:56'),
('0040707121', '9', '06', 0, 1, 0, NULL, '2019-04-16 05:11:32', '2019-04-16 05:17:15'),
('0052570371', '1', '06', 0, 1, 0, NULL, '2019-05-04 11:03:29', '2019-05-04 05:25:33'),
('0054739921', '8', '06', 0, 1, 0, NULL, '2019-04-16 05:09:13', '2019-04-16 05:19:05'),
('0057202581', '2', '05', 0, 0, 0, NULL, '2019-03-31 08:03:57', '2019-03-31 08:03:57'),
('0074911791', '2', '05', 0, 0, 0, NULL, '2019-03-31 08:04:45', '2019-03-31 08:04:45'),
('0115660961', '2', '05', 0, 0, 0, NULL, '2019-04-02 04:59:27', '2019-04-02 04:59:27'),
('0154649541', '1', '06', 0, 1, 0, NULL, '2019-04-16 05:00:14', '2019-04-16 05:20:33'),
('0170701221', '1', '06', 0, 0, 0, NULL, '2019-03-31 04:21:15', '2019-03-31 04:21:15'),
('0264908951', '1', '06', 0, 1, 0, NULL, '2019-04-12 05:02:36', '2019-04-12 05:07:04'),
('0289761081', '2', '05', 0, 0, 0, NULL, '2019-03-31 08:05:48', '2019-03-31 08:05:48'),
('0554967391', '1', '06', 0, 1, 0, NULL, '2019-04-12 04:57:22', '2019-04-12 05:04:15'),
('0651209981', '20', '06', 0, 0, 0, NULL, '2019-04-10 14:06:25', '2019-04-10 14:06:25'),
('0655039201', '7', '06', 0, 1, 0, NULL, '2019-04-16 05:02:15', '2019-04-16 05:19:54'),
('0677737901', '1', '06', 0, 0, 0, NULL, '2019-03-31 04:22:06', '2019-03-31 04:22:06'),
('0702718621', '21', '06', 0, 0, 0, NULL, '2019-04-10 14:06:56', '2019-04-10 14:06:56'),
('0717302621', '1', '06', 0, 0, 0, NULL, '2019-04-07 19:44:21', '2019-04-07 19:44:21'),
('0856406991', '10', '05', 0, 0, 0, NULL, '2019-05-04 06:01:12', '2019-05-04 06:01:12'),
('0858732371', '1', '06', 0, 0, 0, NULL, '2019-04-07 08:11:41', '2019-04-02 08:11:41'),
('0878253991', '1', '06', 0, 1, 1, NULL, '2019-04-08 06:30:36', '2019-04-08 06:30:36'),
('0939067541', '1', '06', 0, 1, 0, NULL, '2019-04-07 11:03:54', '2019-04-07 11:03:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cap_them_quyen_user`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `cap_them_quyen_user`;
CREATE TABLE IF NOT EXISTS `cap_them_quyen_user` (
  `IdCQ` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã cấp quyền',
  `IdUser` int(10) UNSIGNED NOT NULL COMMENT 'Mã người dùng',
  `Quyen` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Quyền mới cấp cho user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCQ`),
  KEY `fk_cap_them_quyen_user_IdUser` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `cap_them_quyen_user`:
--   `IdUser`
--       `users` -> `id`
--

--
-- Đang đổ dữ liệu cho bảng `cap_them_quyen_user`
--

INSERT INTO `cap_them_quyen_user` (`IdCQ`, `IdUser`, `Quyen`, `created_at`, `updated_at`) VALUES
('0021242471', 31, 'qlck', '2019-04-25 09:17:31', '2019-04-25 09:17:31'),
('0034618231', 30, 'qlck', '2019-04-25 09:03:26', '2019-04-25 09:03:26'),
('0596938281', 28, 'khth', '2019-04-24 11:57:03', '2019-04-24 11:57:03'),
('1234567890', 5, 'qlbv', '2019-04-24 01:34:12', '2019-04-24 01:34:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cap_them_quyen_user_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `cap_them_quyen_user_ct`;
CREATE TABLE IF NOT EXISTS `cap_them_quyen_user_ct` (
  `IdCQCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã cấp quyền chi tiết',
  `IdCQ` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã người dùng',
  `QuyenCT` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Quyền chi tiết cho từng danh mục quyền mới cấp cho user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCQCT`),
  KEY `fk_cap_them_quyen_user_ct_IdCQ` (`IdCQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `cap_them_quyen_user_ct`:
--   `IdCQ`
--       `cap_them_quyen_user` -> `IdCQ`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cham_cong_nv`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `cham_cong_nv`;
CREATE TABLE IF NOT EXISTS `cham_cong_nv` (
  `IdCC` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã chấm công',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `TrangThai` tinyint(1) UNSIGNED NOT NULL COMMENT 'Trạng thái tính lương',
  `SoNgayCong` tinyint(3) UNSIGNED NOT NULL COMMENT 'Số ngày công',
  `Thuong` int(10) UNSIGNED NOT NULL COMMENT 'Tiền thưởng',
  `TienPhat` int(10) UNSIGNED NOT NULL COMMENT 'Tiền phạt',
  `TTCN` tinyint(1) UNSIGNED NOT NULL COMMENT 'Trạng thái cập nhật',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCC`,`IdNV`),
  KEY `fk_cham_cong_nv_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `cham_cong_nv`:
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `cham_cong_nv`
--

INSERT INTO `cham_cong_nv` (`IdCC`, `IdNV`, `TrangThai`, `SoNgayCong`, `Thuong`, `TienPhat`, `TTCN`, `created_at`, `updated_at`) VALUES
('0080041701', '9999999999', 0, 2, 100000, 20000, 0, '2019-04-29 04:30:01', '2019-05-01 16:10:17'),
('0205675821', '0213049111', 1, 26, 0, 0, 0, '2019-04-28 16:21:44', '2019-04-29 03:57:06'),
('0210528481', '0140674231', 1, 24, 100000, 200000, 0, '2019-04-28 16:25:35', '2019-04-29 04:12:53'),
('0325892131', '9999999999', 1, 25, 1000000, 200000, 0, '2019-04-27 15:37:03', '2019-04-29 04:30:01'),
('0329430791', '0804895611', 0, 1, 0, 0, 0, '2019-04-27 15:34:18', '2019-04-29 10:12:15'),
('0374422231', '0419628061', 0, 1, 0, 0, 0, '2019-04-27 15:35:05', '2019-04-29 10:12:15'),
('0374451381', '0353870871', 0, 1, 0, 0, 0, '2019-04-27 15:34:45', '2019-04-29 10:12:15'),
('0398946861', '0789446601', 0, 1, 0, 0, 0, '2019-04-27 15:06:57', '2019-04-29 10:12:15'),
('0424266001', '0795254241', 0, 1, 0, 0, 0, '2019-04-29 04:45:28', '2019-04-29 04:45:28'),
('0470154231', '9090909099', 0, 1, 0, 0, 0, '2019-04-27 15:35:58', '2019-04-27 15:35:58'),
('0488134831', '0167027221', 0, 1, 0, 0, 0, '2019-04-27 15:34:31', '2019-04-27 15:34:31'),
('0526871491', '0094497701', 0, 1, 0, 0, 0, '2019-04-27 15:31:51', '2019-04-27 15:31:51'),
('0549127981', '0647502631', 0, 1, 0, 0, 0, '2019-04-28 16:11:02', '2019-04-28 16:11:02'),
('0573360691', '0935182761', 0, 1, 0, 0, 0, '2019-04-27 15:30:19', '2019-04-27 15:30:19'),
('0579931101', '0442117871', 0, 1, 0, 0, 0, '2019-04-27 15:22:58', '2019-04-27 15:22:58'),
('0620465881', '0543248151', 1, 6, 10000, 50000, 1, '2019-04-27 15:30:53', '2019-05-01 16:12:57'),
('0631842381', '0397501161', 0, 1, 0, 0, 0, '2019-04-28 16:07:18', '2019-04-28 16:07:18'),
('0704092201', '0118316881', 0, 2, 0, 0, 0, '2019-04-27 15:30:33', '2019-05-01 16:10:17'),
('0724729011', '0795254241', 1, 26, 200000, 50000, 0, '2019-04-27 15:33:57', '2019-04-29 04:45:28'),
('0745531181', '0213049111', 0, 1, 0, 0, 0, '2019-04-29 03:57:06', '2019-04-29 03:57:06'),
('0799735511', '0140674231', 0, 1, 0, 0, 0, '2019-04-29 04:12:53', '2019-04-29 04:12:53'),
('0876254001', '0543248151', 0, 1, 0, 0, 0, '2019-05-01 16:12:57', '2019-05-04 03:05:23'),
('0969718271', '0497723751', 0, 1, 0, 0, 0, '2019-04-27 15:33:23', '2019-04-27 15:33:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_dinh_pt`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chi_dinh_pt`;
CREATE TABLE IF NOT EXISTS `chi_dinh_pt` (
  `IdPT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định phẩu thuật',
  `IdBACT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú chi tiết',
  `IdNVTH` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên thực hiện',
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng thực hiện',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phẩu thuật',
  `PhuongPhapTH` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phương pháp thự hiện',
  `TinhTrangTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng thanh toán phí dịch vụ',
  `TamUng` tinyint(1) DEFAULT 0 COMMENT 'Tình trạng đóng tạm ứng',
  `LoaiCD` tinyint(1) UNSIGNED NOT NULL COMMENT 'Loại chỉ định (thường hoặc khẩn)',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPT`),
  KEY `fk_chi_dinh_pt_IdBACT` (`IdBACT`),
  KEY `fk_chi_dinh_pt_IdNVTH` (`IdNVTH`),
  KEY `fk_chi_dinh_pt_IdPB` (`IdPB`),
  KEY `fk_chi_dinh_pt_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chi_dinh_pt`:
--   `IdBACT`
--       `benh_an_noi_tru_ct` -> `IdBACT`
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdNVTH`
--       `nhan_vien` -> `IdNV`
--   `IdPB`
--       `phong_ban` -> `IdPB`
--

--
-- Đang đổ dữ liệu cho bảng `chi_dinh_pt`
--

INSERT INTO `chi_dinh_pt` (`IdPT`, `IdBACT`, `IdNVTH`, `IdPB`, `IdDMCLS`, `PhuongPhapTH`, `TinhTrangTT`, `TamUng`, `LoaiCD`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0156061161', '0758603151', '0118316881', '21', '47', 'hkgkh', 0, 1, 0, NULL, '2019-04-16 05:03:54', '2019-04-16 05:40:32'),
('0291405881', '0558868261', '0419628061', '20', '5', 'sfsf', 0, 0, 0, NULL, '2019-03-31 08:28:22', '2019-03-31 08:28:22'),
('0474829181', '0454642881', '0419628061', '20', '5', 'fsfsfs', 0, 0, 0, NULL, '2019-03-31 08:29:11', '2019-03-31 08:29:11'),
('0492865731', '0650112451', '0118316881', '34', '47', 'dsfsf', 0, 1, 0, NULL, '2019-04-16 05:12:51', '2019-04-16 05:38:34'),
('0522842231', '0188181541', '0213049111', '21', '6', 'ryryryr', 0, 0, 0, NULL, '2019-03-31 08:28:45', '2019-03-31 08:28:45'),
('0557537381', '0583207831', '0419628061', '20', '68', 'jhgjgj', 0, 0, 0, NULL, '2019-04-21 11:51:23', '2019-04-21 11:51:23'),
('0565289331', '0758556141', '0419628061', '20', '5', 'ttyryry6666', 0, 0, 0, NULL, '2019-03-31 08:29:50', '2019-03-31 08:29:50'),
('0612477991', '0401196051', '0419628061', '21', '63', 'Bong võng mạc kinh điển', 0, 0, 0, NULL, '2019-05-04 06:02:50', '2019-05-04 06:02:50'),
('0738107791', '0791593471', '0213049111', '21', '6', 'rttet', 0, 0, 0, NULL, '2019-03-31 08:29:28', '2019-03-31 08:29:28'),
('0810017941', '0921184991', '0118316881', '20', '54', 'fdgdg', 0, 0, 0, NULL, '2019-04-21 12:05:56', '2019-04-21 12:05:56'),
('0857745181', '0568023541', '0213049111', '20', '5', 'fdgdgdgdg', 0, 1, 0, NULL, '2019-04-12 08:12:13', '2019-04-12 14:48:50'),
('0874307141', '0889479481', '0213049111', '21', '68', 'sdsvs', 0, 1, 0, NULL, '2019-04-11 19:45:12', '2019-04-12 14:49:12'),
('0941956171', '0728080421', '0419628061', '20', '5', 'fdgdgdgdg', 0, 1, 0, NULL, '2019-04-12 09:44:49', '2019-04-12 14:48:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_dinh_tt`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chi_dinh_tt`;
CREATE TABLE IF NOT EXISTS `chi_dinh_tt` (
  `IdThuThuat` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định thủ thuật',
  `IdNVTH` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên thực hiện',
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng thực hiện',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thủ thuật',
  `TinhTrangTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng thanh toán phí dịch vụ',
  `TamUng` tinyint(1) DEFAULT 0 COMMENT 'Tình trạng đóng tạm ứng',
  `LoaiCD` tinyint(1) UNSIGNED NOT NULL COMMENT 'Loại chỉ định (thường hoặc khẩn)',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdThuThuat`),
  KEY `fk_chi_dinh_tt_IdNVTH` (`IdNVTH`),
  KEY `fk_chi_dinh_tt_IdPB` (`IdPB`),
  KEY `fk_chi_dinh_tt_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chi_dinh_tt`:
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdNVTH`
--       `nhan_vien` -> `IdNV`
--   `IdPB`
--       `phong_ban` -> `IdPB`
--

--
-- Đang đổ dữ liệu cho bảng `chi_dinh_tt`
--

INSERT INTO `chi_dinh_tt` (`IdThuThuat`, `IdNVTH`, `IdPB`, `IdDMCLS`, `TinhTrangTT`, `TamUng`, `LoaiCD`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0064385131', '0419628061', '07', '3', 0, 1, 0, NULL, '2019-04-16 08:04:59', '2019-04-16 07:01:07'),
('0091649841', '0419628061', '07', '3', 0, 1, 0, NULL, '2019-04-12 15:09:10', '2019-04-12 14:44:50'),
('0168287981', '0118316881', '07', '28', 0, 1, 0, NULL, '2019-04-16 05:03:22', '2019-04-16 05:34:19'),
('0203413201', '0213049111', '07', '3', 0, 0, 0, NULL, '2019-04-16 08:04:11', '2019-03-31 08:04:11'),
('0282730121', '0419628061', '07', '3', 0, 0, 0, NULL, '2019-04-07 15:07:46', '2019-04-07 15:07:46'),
('0376635871', '0419628061', '07', '26', 0, 0, 0, NULL, '2019-04-08 03:47:12', '2019-04-08 03:47:12'),
('0473037341', '0442117871', '08', '26', 0, 0, 0, NULL, '2019-05-04 06:01:48', '2019-05-04 06:01:48'),
('0474327381', '0118316881', '08', '27', 0, 1, 0, NULL, '2019-04-16 05:03:15', '2019-04-16 05:38:14'),
('0520753931', '0118316881', '30', '31', 0, 1, 0, NULL, '2019-04-16 05:11:58', '2019-04-16 05:24:03'),
('0561969631', '0118316881', '28', '33', 0, 1, 0, NULL, '2019-04-16 05:12:17', '2019-04-16 05:23:42'),
('0597482091', '0213049111', '07', '3', 0, 0, 0, NULL, '2019-03-31 08:06:19', '2019-03-31 08:06:19'),
('0614238331', '0419628061', '07', '3', 0, 0, 0, NULL, '2019-04-02 03:30:17', '2019-04-02 03:30:17'),
('0653720011', '0419628061', '07', '3', 0, 0, 0, NULL, '2019-04-10 15:08:58', '2019-04-10 15:08:58'),
('0670682081', '0213049111', '08', '4', 0, 0, 0, NULL, '2019-03-31 08:05:09', '2019-03-31 08:05:09'),
('0692239091', '0419628061', '07', '3', 0, 0, 0, NULL, '2019-04-07 19:44:47', '2019-04-07 19:44:47'),
('0699910101', '0419628061', '07', '4', 0, 1, 0, NULL, '2019-04-12 15:09:46', '2019-04-12 14:44:02'),
('0707660001', '0419628061', '07', '3', 0, 0, 0, NULL, '2019-04-10 15:08:46', '2019-04-10 15:08:46'),
('0709084401', '0213049111', '08', '4', 0, 0, 0, NULL, '2019-03-31 08:04:19', '2019-03-31 08:04:19'),
('0769301191', '0213049111', '07', '3', 0, 0, 0, NULL, '2019-04-07 08:11:53', '2019-04-06 13:35:25'),
('0858990631', '0213049111', '07', '4', 0, 0, 0, NULL, '2019-04-07 04:59:14', '2019-04-02 04:59:14'),
('0866428721', '0419628061', '08', '4', 0, 0, 0, NULL, '2019-03-31 08:06:09', '2019-03-31 08:06:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_dinh_tt_vs_benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chi_dinh_tt_vs_benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `chi_dinh_tt_vs_benh_an_ngoai_tru` (
  `IdThuThuat` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định thủ thuật',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdThuThuat`,`IdBANgoaiT`),
  KEY `fk_chi_dinh_tt_vs_benh_an_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chi_dinh_tt_vs_benh_an_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdThuThuat`
--       `chi_dinh_tt` -> `IdThuThuat`
--

--
-- Đang đổ dữ liệu cho bảng `chi_dinh_tt_vs_benh_an_ngoai_tru`
--

INSERT INTO `chi_dinh_tt_vs_benh_an_ngoai_tru` (`IdThuThuat`, `IdBANgoaiT`, `created_at`, `updated_at`) VALUES
('0064385131', '0035973371', '2019-03-31 08:04:59', '2019-03-31 08:04:59'),
('0203413201', '0189158951', '2019-03-31 08:04:11', '2019-03-31 08:04:11'),
('0282730121', '0158705861', '2019-04-07 15:07:46', '2019-04-07 15:07:46'),
('0376635871', '0664160011', '2019-04-08 03:47:12', '2019-04-08 03:47:12'),
('0614238331', '0048763021', '2019-04-02 03:30:18', '2019-04-02 03:30:18'),
('0670682081', '0035973371', '2019-03-31 08:05:09', '2019-03-31 08:05:09'),
('0709084401', '0189158951', '2019-03-31 08:04:19', '2019-03-31 08:04:19'),
('0858990631', '0048763021', '2019-04-02 04:59:14', '2019-04-02 04:59:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chi_dinh_tt_vs_benh_an_noi_tru_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chi_dinh_tt_vs_benh_an_noi_tru_ct`;
CREATE TABLE IF NOT EXISTS `chi_dinh_tt_vs_benh_an_noi_tru_ct` (
  `IdThuThuat` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định thủ thuật',
  `IdBACT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú chi tiết',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdThuThuat`,`IdBACT`),
  KEY `fk_chi_dinh_tt_vs_benh_an_noi_tru_ct_IdBACT` (`IdBACT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chi_dinh_tt_vs_benh_an_noi_tru_ct`:
--   `IdBACT`
--       `benh_an_noi_tru_ct` -> `IdBACT`
--   `IdThuThuat`
--       `chi_dinh_tt` -> `IdThuThuat`
--

--
-- Đang đổ dữ liệu cho bảng `chi_dinh_tt_vs_benh_an_noi_tru_ct`
--

INSERT INTO `chi_dinh_tt_vs_benh_an_noi_tru_ct` (`IdThuThuat`, `IdBACT`, `created_at`, `updated_at`) VALUES
('0091649841', '0791593471', '2019-04-10 15:09:10', '2019-04-10 15:09:10'),
('0168287981', '0758603151', '2019-04-16 05:03:22', '2019-04-16 05:03:22'),
('0473037341', '0401196051', '2019-05-04 06:01:48', '2019-05-04 06:01:48'),
('0474327381', '0758603151', '2019-04-16 05:03:16', '2019-04-16 05:03:16'),
('0520753931', '0650112451', '2019-04-16 05:11:58', '2019-04-16 05:11:58'),
('0561969631', '0650112451', '2019-04-16 05:12:17', '2019-04-16 05:12:17'),
('0597482091', '0188181541', '2019-03-31 08:06:19', '2019-03-31 08:06:19'),
('0653720011', '0454642881', '2019-04-10 15:08:58', '2019-04-10 15:08:58'),
('0692239091', '0889479481', '2019-04-07 19:44:47', '2019-04-07 19:44:47'),
('0699910101', '0791593471', '2019-04-10 15:09:46', '2019-04-10 15:09:46'),
('0707660001', '0758556141', '2019-04-10 15:08:46', '2019-04-10 15:08:46'),
('0769301191', '0568023541', '2019-04-02 08:11:53', '2019-04-02 08:11:53'),
('0866428721', '0188181541', '2019-03-31 08:06:09', '2019-03-31 08:06:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuan_doan_vs_benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chuan_doan_vs_benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `chuan_doan_vs_benh_an_ngoai_tru` (
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBANgoaiT`,`IdBenh`),
  KEY `fk_chuan_doan_vs_benh_an_ngoai_tru_IdBenh` (`IdBenh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chuan_doan_vs_benh_an_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdBenh`
--       `danh_muc_benh` -> `IdBenh`
--

--
-- Đang đổ dữ liệu cho bảng `chuan_doan_vs_benh_an_ngoai_tru`
--

INSERT INTO `chuan_doan_vs_benh_an_ngoai_tru` (`IdBANgoaiT`, `IdBenh`, `created_at`, `updated_at`) VALUES
('0035973371', 'H10', '2019-03-27 05:50:32', '2019-03-27 05:50:32'),
('0035973371', 'H11.9', '2019-03-27 05:50:32', '2019-03-27 05:50:32'),
('0048763021', 'H10', '2019-04-02 02:46:20', '2019-04-02 02:46:20'),
('0158705861', 'H11.9', '2019-04-02 06:59:49', '2019-04-02 06:59:49'),
('0189158951', 'H10', '2019-03-27 08:06:51', '2019-03-27 08:06:51'),
('0189158951', 'H11.9', '2019-03-27 08:06:51', '2019-03-27 08:06:51'),
('0623337401', 'H10', '2019-04-21 13:48:28', '2019-04-21 13:48:28'),
('0623337401', 'H11.1', '2019-04-21 13:48:28', '2019-04-21 13:48:28'),
('0623337401', 'H11.9', '2019-04-21 13:48:28', '2019-04-21 13:48:28'),
('0664160011', 'H11.1', '2019-04-08 02:54:55', '2019-04-08 02:54:55'),
('0664160011', 'H44', '2019-04-08 02:54:54', '2019-04-08 02:54:54'),
('0889924831', 'H73', '2019-04-21 04:51:18', '2019-04-21 04:51:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuan_doan_vs_benh_an_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chuan_doan_vs_benh_an_noi_tru`;
CREATE TABLE IF NOT EXISTS `chuan_doan_vs_benh_an_noi_tru` (
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBANoiT`,`IdBenh`),
  KEY `fk_chuan_doan_vs_benh_an_noi_tru_IdBenh` (`IdBenh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chuan_doan_vs_benh_an_noi_tru`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--   `IdBenh`
--       `danh_muc_benh` -> `IdBenh`
--

--
-- Đang đổ dữ liệu cho bảng `chuan_doan_vs_benh_an_noi_tru`
--

INSERT INTO `chuan_doan_vs_benh_an_noi_tru` (`IdBANoiT`, `IdBenh`, `created_at`, `updated_at`) VALUES
('0069826801', 'H53', '2019-04-04 14:21:22', '2019-04-04 14:21:22'),
('0218106341', 'H73', '2019-04-16 17:02:38', '2019-04-16 17:02:38'),
('0277643301', 'H10', '2019-03-27 16:33:00', '2019-03-27 16:33:00'),
('0277643301', 'H11.9', '2019-03-27 16:33:01', '2019-03-27 16:33:01'),
('0334696751', 'H10', '2019-04-16 15:05:42', '2019-04-16 15:05:42'),
('0334696751', 'H11.9', '2019-04-16 15:05:42', '2019-04-16 15:05:42'),
('0440784491', 'H11.9', '2019-04-14 15:42:26', '2019-04-14 15:42:26'),
('0440784491', 'H44', '2019-04-14 15:42:26', '2019-04-14 15:42:26'),
('0447729301', 'J32', '2019-04-16 15:04:30', '2019-04-16 15:04:30'),
('0532084181', 'H16', '2019-04-16 17:07:04', '2019-04-16 17:07:04'),
('0726171501', 'H10', '2019-04-08 08:45:38', '2019-04-08 08:45:38'),
('0726171501', 'H11.1', '2019-04-08 08:45:38', '2019-04-08 08:45:38'),
('0764391241', 'H11.9', '2019-03-28 12:53:06', '2019-03-28 12:53:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuan_doan_vs_ket_qua_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chuan_doan_vs_ket_qua_cls`;
CREATE TABLE IF NOT EXISTS `chuan_doan_vs_ket_qua_cls` (
  `IdKQCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết quả cận lâm sàng',
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKQCLS`,`IdBenh`),
  KEY `fk_chuan_doan_vs_ket_qua_cls_IdBenh` (`IdBenh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chuan_doan_vs_ket_qua_cls`:
--   `IdBenh`
--       `danh_muc_benh` -> `IdBenh`
--   `IdKQCLS`
--       `ket_qua_cls` -> `IdKQCLS`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vu`
--
-- Tạo: Th9 23, 2019 lúc 07:47 AM
--

DROP TABLE IF EXISTS `chuc_vu`;
CREATE TABLE IF NOT EXISTS `chuc_vu` (
  `IdCV` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã chức vụ',
  `TenCV` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên chức vụ (vd: Giám đốc, Trưởng khoa, ...)',
  `HSPCCV` double(6,4) UNSIGNED NOT NULL COMMENT 'Hệ số phụ cấp chức vụ',
  `CB` tinyint(2) UNSIGNED NOT NULL COMMENT 'Cấp bậc chức vụ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chuc_vu`:
--

--
-- Đang đổ dữ liệu cho bảng `chuc_vu`
--

INSERT INTO `chuc_vu` (`IdCV`, `TenCV`, `HSPCCV`, `CB`, `created_at`, `updated_at`) VALUES
('chuyen_vien', 'Chuyên viên', 0.2000, 7, '2019-03-16 16:07:07', NULL),
('giam_doc', 'Giám đốc', 1.0000, 1, '2019-03-16 16:04:29', NULL),
('pho_giam_doc', 'Phó giám đốc', 0.8000, 2, '2019-04-23 05:43:50', NULL),
('pho_truong_khoa', 'Phó trưởng khoa', 0.5000, 6, '2019-03-16 16:05:17', NULL),
('pho_truong_phong', 'Phó trưởng phòng', 0.5000, 5, '2019-03-16 16:06:24', NULL),
('truong_khoa', 'Trưởng khoa', 0.6000, 4, '2019-03-16 16:04:29', NULL),
('truong_phong', 'Trưởng phòng', 0.6000, 3, '2019-03-16 16:05:17', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuc_vu_vs_nv`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `chuc_vu_vs_nv`;
CREATE TABLE IF NOT EXISTS `chuc_vu_vs_nv` (
  `IdCV` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã chức vụ',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCV`,`IdNV`),
  KEY `fk_chuc_vu_vs_nv_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `chuc_vu_vs_nv`:
--   `IdCV`
--       `chuc_vu` -> `IdCV`
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `chuc_vu_vs_nv`
--

INSERT INTO `chuc_vu_vs_nv` (`IdCV`, `IdNV`, `created_at`, `updated_at`) VALUES
('chuyen_vien', '0647502631', '2019-04-27 15:23:31', '2019-04-27 15:23:31'),
('chuyen_vien', '9999999999', '2019-04-27 15:37:03', '2019-04-27 15:37:03'),
('giam_doc', '9090909099', '2019-04-27 15:35:57', '2019-04-27 15:35:57'),
('pho_truong_khoa', '0419628061', '2019-04-27 15:35:04', '2019-04-27 15:35:04'),
('truong_khoa', '0442117871', '2019-04-27 15:22:58', '2019-04-27 15:22:58'),
('truong_khoa', '0789446601', '2019-04-27 15:22:07', '2019-04-27 15:22:07'),
('truong_phong', '0397501161', '2019-04-27 15:24:08', '2019-04-27 15:24:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `co_so_kham_bhyt`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `co_so_kham_bhyt`;
CREATE TABLE IF NOT EXISTS `co_so_kham_bhyt` (
  `IdCSKBHYT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã cơ sở khám BHYT',
  `TenCS` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên cơ sở khám BHYT',
  `Tuyen` tinyint(3) UNSIGNED NOT NULL COMMENT 'Cơ sở thuộc tuyến nào?',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdCSKBHYT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `co_so_kham_bhyt`:
--

--
-- Đang đổ dữ liệu cho bảng `co_so_kham_bhyt`
--

INSERT INTO `co_so_kham_bhyt` (`IdCSKBHYT`, `TenCS`, `Tuyen`, `created_at`, `updated_at`) VALUES
('1', 'Bệnh Viện Đa Khoa TT An Giang', 2, '2019-02-09 15:50:26', '2019-02-09 15:50:27'),
('10', 'Bệnh Viện Quân Y 135', 2, '2019-04-01 07:58:55', '2019-04-01 07:58:55'),
('2', 'Bệnh Viện Đa Khoa Thoại Sơn', 3, '2019-02-09 15:50:39', '2019-02-09 15:50:39'),
('3', 'Trạm Y Tế Xã Mỹ Phú Đông', 4, '2019-02-12 16:09:09', '2019-02-12 20:00:00'),
('4', 'Bệnh Viện Đa khoa TP. Cao Lãnh', 2, '2019-04-01 07:54:41', '2019-04-01 07:55:47'),
('5', 'Bệnh viện Đại học Y Dược TP.HCM', 2, '2019-04-01 07:55:24', '2019-04-01 07:55:47'),
('6', 'Biện Viện Bạch Mai', 1, '2019-04-01 07:55:46', '2019-04-01 07:55:47'),
('7', 'Bệnh Viện Chợ Rẫy', 2, '2019-04-01 07:58:55', '2019-04-01 07:58:55'),
('8', 'Bệnh Viện Nhi Đồng I', 2, '2019-04-01 07:58:55', '2019-04-01 07:58:55'),
('9', 'Bệnh Viện Từ Nhũ', 2, '2019-04-01 07:58:55', '2019-04-01 07:58:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_benh`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `danh_muc_benh`;
CREATE TABLE IF NOT EXISTS `danh_muc_benh` (
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `TenBenh` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên danh mục bệnh',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên bệnh không dấu',
  `NgayPH` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày phát hiện bệnh',
  `ChungVSGayBenh` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên gọi chủng vi sinh gây bệnh',
  `TrieuChungLS` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Triệu chứng lâm sàng',
  `ChungKhang` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chủng vi sinh kháng bệnh',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBenh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_benh`:
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_benh`
--

INSERT INTO `danh_muc_benh` (`IdBenh`, `TenBenh`, `TenKDau`, `NgayPH`, `ChungVSGayBenh`, `TrieuChungLS`, `ChungKhang`, `created_at`, `updated_at`) VALUES
('H10', 'Viêm kết mạc', 'viem_ket_mac', '2019-04-04 03:19:14', 'fdf', 'fdf', 'dfd', '2019-03-03 00:23:59', '2019-04-04 03:19:10'),
('H11.1', 'Thoái hóa kết mạc', 'thoai_hoa_ket_mac', '2019-04-04 03:07:55', 'dgdg', 'sfsf', 'fsfsf', '2019-04-04 03:12:42', '2019-04-04 03:17:54'),
('H11.9', 'Bệnh của kết mạc, không đặc hiệu', 'viem_bo_mi', '2019-04-04 03:19:14', 'asdad', 'adad', 'dad', '2019-03-03 00:23:59', '2019-04-04 03:19:10'),
('H16', 'Viêm giác mạc', 'viem_giac_mac', '2019-04-04 03:17:43', 'sfsf', 'fsfs', 'sfsfs', '2019-04-04 03:17:55', '2019-04-04 03:17:55'),
('H25', 'Đục thủy tinh thể người già', 'duc_thuy_tinh_the_nguoi_gia', '2019-04-04 03:09:02', 'fdfdf', 'dfdf', 'dsfsf', '2019-04-04 03:12:42', '2019-04-04 03:17:54'),
('H27.1', 'Lệch thủy tinh thể', 'lech_thuy_tinh_the', '2019-04-04 03:10:04', 'dggdg', 'svdsv', 'svsvs', '2019-04-04 03:12:41', '2019-04-04 03:17:55'),
('H43.1', 'Xuất huyết dịch kính', 'xuat_huyet_dich_kinh', '2019-04-04 03:13:49', 'fsfsf', 'fsfsf', 'sfsf', '2019-04-04 03:12:39', '2019-04-04 03:17:55'),
('H44', 'Bệnh của nhãn cầu', 'benh_cua_nhan_cau', '2019-04-04 03:12:25', 'sfsfsf', 'fsfsf', 'sfsf', '2019-04-04 03:12:40', '2019-04-04 03:17:55'),
('H53', 'Rối loạn thị giác', 'roi_loan_thi_giac', '2019-04-04 03:11:15', 'dgd', 'gddg', 'gdgd', '2019-04-04 03:12:41', '2019-04-04 03:17:55'),
('H57.1', 'Nhức mắt', 'nhuc_mat', '2019-04-04 03:14:35', 'dgdgd', 'dgdgd', 'dgdg', '2019-04-04 03:17:55', '2019-04-04 03:17:55'),
('H59.8', 'Bệnh khác của mắt và phần phụ sau phẫu thuật', 'benh_khac_cua_mat_va_phan_phu_sau_phau_thuat', '2019-04-04 03:16:28', 'fsfs', 'sfsf', 'sfsf', '2019-04-04 03:17:55', '2019-04-04 03:17:55'),
('H60', 'Viêm tai ngoài', 'viem_tai_ngoai', '2019-04-04 03:25:04', 'fdf', 'fdfdf', 'fdfd', '2019-04-04 03:29:21', '2019-04-04 03:29:21'),
('H61.9', 'Bệnh tai ngoài, không đặc hiệu', 'benh_tai_ngoai_khong_dac_hieu', '2019-04-04 03:26:03', 'sfsfs', 'sfsf', 'sfsf', '2019-04-04 03:29:21', '2019-04-04 03:29:21'),
('H73', 'Viêm màng nhĩ cấp', 'viem_mang_nhi_cap', '2019-04-04 03:19:14', 'sad', 'adad', 'dad', '2019-03-03 00:24:32', '2019-04-04 03:19:12'),
('H74.4', 'Polip tai giữa', 'polip_tai_giua', '2019-04-04 03:27:13', 'dadad', 'adad', 'adad', '2019-04-04 03:29:21', '2019-04-04 03:29:21'),
('H92.0', 'Đau tai', 'dau_tai', '2019-04-04 03:28:12', 'scac', 'acaca', 'caca', '2019-04-04 03:29:21', '2019-04-04 03:29:21'),
('H93.1', 'Ù tai', 'u_tai', '2019-04-04 03:28:59', 'fsdfs', 'fsfsf', 'fsfsf', '2019-04-04 03:29:21', '2019-04-04 03:29:21'),
('J06.0', 'Viêm họng - thanh quản cấp', 'viem_hong_thanh_quan_cap', '2019-04-04 03:33:30', 'fsfdsf', 'fsfsf', 'fsfsf', '2019-04-04 03:35:23', '2019-04-04 03:35:23'),
('J32', 'Viêm xoang mạn tính', 'Viêm xoang mạn tính', '2019-04-04 03:19:14', 'sds', 'sd', 'sd', '2019-03-03 00:24:32', '2019-04-04 03:19:11'),
('J33.1', 'Thoái hoá xoang dạng políp', 'thoai_hoa_xoang_dang_polip', '2019-04-04 03:31:54', 'fsfsf', 'sfsf', 'sfsf', '2019-04-04 03:35:22', '2019-04-04 03:35:22'),
('J34.2', 'Lệch vách mũi', 'lech_vach_mui', '2019-04-04 03:35:05', 'fsdfsf', 'sfsf', 'sfsf', '2019-04-04 03:35:23', '2019-04-04 03:35:23'),
('K57', 'Bệnh túi thừa của ruột', 'benh_tui_thua_cua_ruot', '2019-04-04 03:41:45', 'fdsfs', 'sfsf', 'sfsf', '2019-04-04 03:50:35', '2019-04-04 03:50:35'),
('K62.1', 'Polip trực tràng', 'polip_truc_trang', '2019-04-04 03:43:05', 'dada', 'dada', 'adad', '2019-04-04 03:50:35', '2019-04-04 03:50:35'),
('K64.0', 'Trĩ độ I', 'tri_do_i', '2019-04-04 03:44:22', 'gghg', 'hhkh', 'jkhk', '2019-04-04 03:50:35', '2019-04-04 03:50:35'),
('K80', 'Sỏi mật', 'soi_mat', '2019-04-04 03:45:42', 'rrete', 'ada', 'sa', '2019-04-04 03:50:35', '2019-04-04 03:50:35'),
('K91', 'Rối loạn tiêu hóa', 'roi_loan_tieu_hoa', '2019-04-04 03:50:20', 'dg', 'sfsf', 'sfsf', '2019-04-04 03:50:35', '2019-04-04 03:50:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_benh_vs_khoa`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `danh_muc_benh_vs_khoa`;
CREATE TABLE IF NOT EXISTS `danh_muc_benh_vs_khoa` (
  `IdKhoa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã chuyên khoa',
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKhoa`,`IdBenh`),
  KEY `fk_danh_muc_benh_vs_khoa_IdBenh` (`IdBenh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_benh_vs_khoa`:
--   `IdBenh`
--       `danh_muc_benh` -> `IdBenh`
--   `IdKhoa`
--       `khoa` -> `IdKhoa`
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_benh_vs_khoa`
--

INSERT INTO `danh_muc_benh_vs_khoa` (`IdKhoa`, `IdBenh`, `created_at`, `updated_at`) VALUES
('01', 'H10', '2019-03-03 00:29:12', '2019-04-04 04:01:48'),
('01', 'H11.1', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H11.9', '2019-03-03 00:29:12', '2019-04-04 04:01:47'),
('01', 'H16', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H25', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H27.1', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H43.1', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H44', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H53', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H57.1', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('01', 'H59.8', '2019-04-04 04:01:40', '2019-04-04 04:01:40'),
('02', 'H60', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'H61.9', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'H73', '2019-03-03 00:29:22', '2019-04-04 04:01:44'),
('02', 'H74.4', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'H92.0', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'H93.1', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'J06.0', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'J32', '2019-03-03 00:29:22', '2019-04-04 04:01:45'),
('02', 'J33.1', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('02', 'J34.2', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('03', 'H10', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H11.1', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H11.9', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H16', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H25', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H27.1', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H43.1', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H44', '2019-04-16 04:38:48', '2019-04-16 04:38:48'),
('03', 'H53', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H57.1', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H59.8', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H60', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H61.9', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H73', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H74.4', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H92.0', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'H93.1', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'J06.0', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'J32', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'J33.1', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'J34.2', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'K57', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'K62.1', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'K64.0', '2019-04-16 04:38:49', '2019-04-16 04:38:49'),
('03', 'K80', '2019-04-16 04:39:17', '2019-04-16 04:39:17'),
('03', 'K91', '2019-04-16 04:39:17', '2019-04-16 04:39:17'),
('13', 'K57', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('13', 'K62.1', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('13', 'K64.0', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('13', 'K80', '2019-04-04 04:01:41', '2019-04-04 04:01:41'),
('13', 'K91', '2019-04-04 04:01:41', '2019-04-04 04:01:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_benh_vs_thuoc`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `danh_muc_benh_vs_thuoc`;
CREATE TABLE IF NOT EXISTS `danh_muc_benh_vs_thuoc` (
  `IdBenh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục bệnh',
  `IdThuoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục thuốc',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdBenh`,`IdThuoc`),
  KEY `fk_danh_muc_benh_vs_thuoc_IdThuoc` (`IdThuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_benh_vs_thuoc`:
--   `IdBenh`
--       `danh_muc_benh` -> `IdBenh`
--   `IdThuoc`
--       `danh_muc_thuoc` -> `IdThuoc`
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_benh_vs_thuoc`
--

INSERT INTO `danh_muc_benh_vs_thuoc` (`IdBenh`, `IdThuoc`, `created_at`, `updated_at`) VALUES
('H10', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H10', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H10', '11', '2019-04-19 11:07:45', '2019-04-19 11:07:45'),
('H10', '12', '2019-04-19 13:26:33', '2019-04-19 13:26:33'),
('H10', '13', '2019-04-19 13:29:23', '2019-04-19 13:29:23'),
('H10', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H10', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H10', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H10', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H10', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H10', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H10', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H10', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H10', '30', '2019-04-19 13:36:24', '2019-04-19 13:36:24'),
('H10', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H10', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H10', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H10', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H10', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H10', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H10', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H10', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H11.1', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H11.1', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H11.1', '11', '2019-04-19 11:07:45', '2019-04-19 11:07:45'),
('H11.1', '12', '2019-04-19 13:26:33', '2019-04-19 13:26:33'),
('H11.1', '13', '2019-04-19 13:29:23', '2019-04-19 13:29:23'),
('H11.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H11.1', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H11.1', '16', '2019-04-19 13:36:53', '2019-04-19 13:36:53'),
('H11.1', '17', '2019-04-19 13:34:27', '2019-04-19 13:34:27'),
('H11.1', '18', '2019-04-19 13:35:11', '2019-04-19 13:35:11'),
('H11.1', '19', '2019-04-19 13:37:17', '2019-04-19 13:37:17'),
('H11.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H11.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H11.1', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H11.1', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H11.1', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H11.1', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H11.1', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H11.1', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H11.1', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H11.1', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H11.1', '29', '2019-04-19 13:33:17', '2019-04-19 13:33:17'),
('H11.1', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H11.1', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H11.1', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H11.1', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H11.1', '33', '2019-04-19 13:34:51', '2019-04-19 13:34:51'),
('H11.1', '34', '2019-04-19 13:37:37', '2019-04-19 13:37:37'),
('H11.1', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H11.1', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H11.1', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H11.1', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H11.1', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H11.1', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H11.9', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H11.9', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H11.9', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H11.9', '12', '2019-04-19 13:26:33', '2019-04-19 13:26:33'),
('H11.9', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H11.9', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H11.9', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H11.9', '16', '2019-04-19 13:36:53', '2019-04-19 13:36:53'),
('H11.9', '17', '2019-04-19 13:34:27', '2019-04-19 13:34:27'),
('H11.9', '18', '2019-04-19 13:35:11', '2019-04-19 13:35:11'),
('H11.9', '19', '2019-04-19 13:37:17', '2019-04-19 13:37:17'),
('H11.9', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H11.9', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H11.9', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H11.9', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H11.9', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H11.9', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H11.9', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H11.9', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H11.9', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H11.9', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H11.9', '29', '2019-04-19 13:33:17', '2019-04-19 13:33:17'),
('H11.9', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H11.9', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H11.9', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H11.9', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H11.9', '33', '2019-04-19 13:34:51', '2019-04-19 13:34:51'),
('H11.9', '34', '2019-04-19 13:37:37', '2019-04-19 13:37:37'),
('H11.9', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H11.9', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H11.9', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H11.9', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H11.9', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H11.9', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H16', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H16', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H16', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H16', '12', '2019-04-19 13:26:33', '2019-04-19 13:26:33'),
('H16', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H16', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H16', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H16', '17', '2019-04-19 13:34:27', '2019-04-19 13:34:27'),
('H16', '18', '2019-04-19 13:35:11', '2019-04-19 13:35:11'),
('H16', '19', '2019-04-19 13:37:17', '2019-04-19 13:37:17'),
('H16', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H16', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H16', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H16', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H16', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H16', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H16', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H16', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H16', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H16', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H16', '29', '2019-04-19 13:33:17', '2019-04-19 13:33:17'),
('H16', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H16', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H16', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H16', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H16', '33', '2019-04-19 13:34:51', '2019-04-19 13:34:51'),
('H16', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H16', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H16', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H16', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H16', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H25', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H25', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H25', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H25', '12', '2019-04-19 13:26:33', '2019-04-19 13:26:33'),
('H25', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H25', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H25', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H25', '17', '2019-04-19 13:34:27', '2019-04-19 13:34:27'),
('H25', '18', '2019-04-19 13:35:11', '2019-04-19 13:35:11'),
('H25', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H25', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H25', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H25', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H25', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H25', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H25', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H25', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H25', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H25', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H25', '29', '2019-04-19 13:33:17', '2019-04-19 13:33:17'),
('H25', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H25', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H25', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H25', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H25', '33', '2019-04-19 13:34:51', '2019-04-19 13:34:51'),
('H25', '34', '2019-04-19 13:37:37', '2019-04-19 13:37:37'),
('H25', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H25', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H25', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H25', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H27.1', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H27.1', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H27.1', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H27.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H27.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H27.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H27.1', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H27.1', '17', '2019-04-19 13:34:27', '2019-04-19 13:34:27'),
('H27.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H27.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H27.1', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H27.1', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H27.1', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H27.1', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H27.1', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H27.1', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H27.1', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H27.1', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H27.1', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H27.1', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H27.1', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H27.1', '33', '2019-04-19 13:34:51', '2019-04-19 13:34:51'),
('H27.1', '34', '2019-04-19 13:37:37', '2019-04-19 13:37:37'),
('H27.1', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H27.1', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H27.1', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H27.1', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H27.1', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H27.1', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H43.1', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H43.1', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H43.1', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H43.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H43.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H43.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H43.1', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H43.1', '17', '2019-04-19 13:34:26', '2019-04-19 13:34:26'),
('H43.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H43.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H43.1', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H43.1', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H43.1', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H43.1', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H43.1', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H43.1', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H43.1', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H43.1', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H43.1', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H43.1', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H43.1', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H43.1', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H43.1', '34', '2019-04-19 13:37:37', '2019-04-19 13:37:37'),
('H43.1', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H43.1', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H43.1', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H43.1', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H43.1', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H44', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H44', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H44', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H44', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H44', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H44', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H44', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H44', '17', '2019-04-19 13:34:26', '2019-04-19 13:34:26'),
('H44', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H44', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H44', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H44', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H44', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H44', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H44', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H44', '3', '2019-04-19 13:36:04', '2019-04-19 13:36:04'),
('H44', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H44', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H44', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H44', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H44', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H44', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H44', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H44', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H44', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H53', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H53', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H53', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H53', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H53', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H53', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H53', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H53', '17', '2019-04-19 13:34:26', '2019-04-19 13:34:26'),
('H53', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H53', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H53', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H53', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H53', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H53', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H53', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H53', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H53', '3', '2019-04-19 13:36:03', '2019-04-19 13:36:03'),
('H53', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H53', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H53', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H53', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H53', '34', '2019-04-19 13:37:36', '2019-04-19 13:37:36'),
('H53', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H53', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H53', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H53', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H53', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H53', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H57.1', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H57.1', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H57.1', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H57.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H57.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H57.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H57.1', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H57.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H57.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H57.1', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H57.1', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H57.1', '23', '2019-04-19 13:35:47', '2019-04-19 13:35:47'),
('H57.1', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H57.1', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H57.1', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H57.1', '27', '2019-04-19 13:28:25', '2019-04-19 13:28:25'),
('H57.1', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H57.1', '3', '2019-04-19 13:36:03', '2019-04-19 13:36:03'),
('H57.1', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H57.1', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H57.1', '32', '2019-04-19 11:07:17', '2019-04-19 11:07:17'),
('H57.1', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H57.1', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H57.1', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H57.1', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H57.1', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H57.1', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H57.1', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H59.8', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H59.8', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H59.8', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H59.8', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H59.8', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H59.8', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H59.8', '17', '2019-04-19 13:34:26', '2019-04-19 13:34:26'),
('H59.8', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H59.8', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H59.8', '23', '2019-04-19 13:35:46', '2019-04-19 13:35:46'),
('H59.8', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H59.8', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H59.8', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H59.8', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H59.8', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H59.8', '3', '2019-04-19 13:36:03', '2019-04-19 13:36:03'),
('H59.8', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H59.8', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H59.8', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H59.8', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H59.8', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H59.8', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H59.8', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H60', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H60', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H60', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H60', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H60', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H60', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H60', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H60', '17', '2019-04-19 13:34:26', '2019-04-19 13:34:26'),
('H60', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H60', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H60', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H60', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H60', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H60', '25', '2019-04-19 13:31:18', '2019-04-19 13:31:18'),
('H60', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H60', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H60', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H60', '3', '2019-04-19 13:36:03', '2019-04-19 13:36:03'),
('H60', '30', '2019-04-19 13:36:23', '2019-04-19 13:36:23'),
('H60', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H60', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H60', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H60', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H60', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H60', '6', '2019-04-19 13:35:29', '2019-04-19 13:35:29'),
('H60', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H60', '8', '2019-04-19 13:32:04', '2019-04-19 13:32:04'),
('H61.9', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H61.9', '10', '2019-04-19 13:30:14', '2019-04-19 13:30:14'),
('H61.9', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H61.9', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H61.9', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H61.9', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H61.9', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H61.9', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H61.9', '21', '2019-04-19 13:33:37', '2019-04-19 13:33:37'),
('H61.9', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H61.9', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H61.9', '25', '2019-04-19 13:31:17', '2019-04-19 13:31:17'),
('H61.9', '26', '2019-04-19 11:06:49', '2019-04-19 11:06:49'),
('H61.9', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H61.9', '28', '2019-04-19 11:08:52', '2019-04-19 11:08:52'),
('H61.9', '3', '2019-04-19 13:36:03', '2019-04-19 13:36:03'),
('H61.9', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H61.9', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H61.9', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H61.9', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H61.9', '5', '2019-04-19 13:23:37', '2019-04-19 13:23:37'),
('H61.9', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H73', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H73', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('H73', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H73', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H73', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H73', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H73', '15', '2019-04-19 13:34:01', '2019-04-19 13:34:01'),
('H73', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H73', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H73', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H73', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H73', '25', '2019-04-19 13:31:17', '2019-04-19 13:31:17'),
('H73', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('H73', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H73', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('H73', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H73', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H73', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H73', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H73', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('H73', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H73', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('H73', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H74.4', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H74.4', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('H74.4', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H74.4', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H74.4', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H74.4', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H74.4', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H74.4', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H74.4', '22', '2019-04-19 13:32:47', '2019-04-19 13:32:47'),
('H74.4', '24', '2019-04-19 13:32:25', '2019-04-19 13:32:25'),
('H74.4', '25', '2019-04-19 13:31:17', '2019-04-19 13:31:17'),
('H74.4', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('H74.4', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H74.4', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('H74.4', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H74.4', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H74.4', '33', '2019-04-19 13:34:50', '2019-04-19 13:34:50'),
('H74.4', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H74.4', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('H74.4', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H74.4', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('H92.0', '1', '2019-04-19 13:24:39', '2019-04-19 13:24:39'),
('H92.0', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('H92.0', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H92.0', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H92.0', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H92.0', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H92.0', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H92.0', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H92.0', '22', '2019-04-19 13:32:46', '2019-04-19 13:32:46'),
('H92.0', '24', '2019-04-19 13:32:24', '2019-04-19 13:32:24'),
('H92.0', '25', '2019-04-19 13:31:17', '2019-04-19 13:31:17'),
('H92.0', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('H92.0', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H92.0', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('H92.0', '31', '2019-04-19 13:22:17', '2019-04-19 13:22:17'),
('H92.0', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H92.0', '4', '2019-04-19 13:31:39', '2019-04-19 13:31:39'),
('H92.0', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('H92.0', '7', '2019-04-19 13:22:39', '2019-04-19 13:22:39'),
('H92.0', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('H92.0', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('H93.1', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('H93.1', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('H93.1', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('H93.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('H93.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('H93.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('H93.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('H93.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('H93.1', '24', '2019-04-19 13:32:24', '2019-04-19 13:32:24'),
('H93.1', '25', '2019-04-19 13:31:17', '2019-04-19 13:31:17'),
('H93.1', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('H93.1', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('H93.1', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('H93.1', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('H93.1', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('H93.1', '4', '2019-04-19 13:31:38', '2019-04-19 13:31:38'),
('H93.1', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('H93.1', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('H93.1', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('H93.1', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('J06.0', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('J06.0', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('J06.0', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('J06.0', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('J06.0', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('J06.0', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('J06.0', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('J06.0', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('J06.0', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('J06.0', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('J06.0', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('J06.0', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('J06.0', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('J06.0', '4', '2019-04-19 13:31:38', '2019-04-19 13:31:38'),
('J06.0', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('J06.0', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('J06.0', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('J06.0', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('J32', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('J32', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('J32', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('J32', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('J32', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('J32', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('J32', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('J32', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('J32', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('J32', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('J32', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('J32', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('J32', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('J32', '4', '2019-04-19 13:31:38', '2019-04-19 13:31:38'),
('J32', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('J32', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('J32', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('J33.1', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('J33.1', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('J33.1', '11', '2019-04-19 11:07:44', '2019-04-19 11:07:44'),
('J33.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('J33.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('J33.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('J33.1', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('J33.1', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('J33.1', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('J33.1', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('J33.1', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('J33.1', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('J33.1', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('J33.1', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('J33.1', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('J33.1', '8', '2019-04-19 13:32:03', '2019-04-19 13:32:03'),
('J33.1', '9', '2019-04-19 13:30:50', '2019-04-19 13:30:50'),
('J34.2', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('J34.2', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('J34.2', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('J34.2', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('J34.2', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('J34.2', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('J34.2', '2', '2019-04-19 13:23:59', '2019-04-19 13:23:59'),
('J34.2', '20', '2019-04-19 13:26:09', '2019-04-19 13:26:09'),
('J34.2', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('J34.2', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('J34.2', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('J34.2', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('J34.2', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('J34.2', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('J34.2', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('K57', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('K57', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('K57', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('K57', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('K57', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('K57', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('K57', '2', '2019-04-19 13:23:58', '2019-04-19 13:23:58'),
('K57', '20', '2019-04-19 13:26:08', '2019-04-19 13:26:08'),
('K57', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('K57', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('K57', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('K57', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('K57', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('K57', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('K57', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('K62.1', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('K62.1', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('K62.1', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('K62.1', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('K62.1', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('K62.1', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('K62.1', '2', '2019-04-19 13:23:58', '2019-04-19 13:23:58'),
('K62.1', '20', '2019-04-19 13:26:08', '2019-04-19 13:26:08'),
('K62.1', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('K62.1', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('K62.1', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('K62.1', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('K62.1', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('K62.1', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('K62.1', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('K64.0', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('K64.0', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('K64.0', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('K64.0', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('K64.0', '13', '2019-04-19 13:29:22', '2019-04-19 13:29:22'),
('K64.0', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('K64.0', '2', '2019-04-19 13:23:58', '2019-04-19 13:23:58'),
('K64.0', '20', '2019-04-19 13:26:08', '2019-04-19 13:26:08'),
('K64.0', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('K64.0', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('K64.0', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('K64.0', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('K64.0', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('K64.0', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('K64.0', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('K80', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('K80', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('K80', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('K80', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('K80', '13', '2019-04-19 13:29:21', '2019-04-19 13:29:21'),
('K80', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('K80', '2', '2019-04-19 13:23:58', '2019-04-19 13:23:58'),
('K80', '20', '2019-04-19 13:26:08', '2019-04-19 13:26:08'),
('K80', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('K80', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('K80', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('K80', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('K80', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('K80', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('K80', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38'),
('K91', '1', '2019-04-19 13:24:38', '2019-04-19 13:24:38'),
('K91', '10', '2019-04-19 13:30:13', '2019-04-19 13:30:13'),
('K91', '11', '2019-04-19 11:07:43', '2019-04-19 11:07:43'),
('K91', '12', '2019-04-19 13:26:32', '2019-04-19 13:26:32'),
('K91', '13', '2019-04-19 13:29:21', '2019-04-19 13:29:21'),
('K91', '14', '2019-04-19 13:27:55', '2019-04-19 13:27:55'),
('K91', '2', '2019-04-19 13:23:58', '2019-04-19 13:23:58'),
('K91', '20', '2019-04-19 13:26:08', '2019-04-19 13:26:08'),
('K91', '26', '2019-04-19 11:06:48', '2019-04-19 11:06:48'),
('K91', '27', '2019-04-19 13:28:24', '2019-04-19 13:28:24'),
('K91', '28', '2019-04-19 11:08:51', '2019-04-19 11:08:51'),
('K91', '31', '2019-04-19 13:22:16', '2019-04-19 13:22:16'),
('K91', '32', '2019-04-19 11:07:16', '2019-04-19 11:07:16'),
('K91', '5', '2019-04-19 13:23:36', '2019-04-19 13:23:36'),
('K91', '7', '2019-04-19 13:22:38', '2019-04-19 13:22:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `danh_muc_cls`;
CREATE TABLE IF NOT EXISTS `danh_muc_cls` (
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục cận lâm sàng',
  `TenCLS` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên danh mục cận lâm sàng',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên gọi không dấu của danh mục cls',
  `PhanLoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phân loại cls (thủ thuật, phẫu thuật, siêu âm, ...)',
  `DonGia` int(10) UNSIGNED NOT NULL COMMENT 'Đơn giá',
  `DanhMucBHYT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Có thuộc danh mục BHYT hay ko?',
  `BHYTTT` tinyint(3) UNSIGNED NOT NULL COMMENT 'Phần trăm BHYT thanh toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_cls`:
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_cls`
--

INSERT INTO `danh_muc_cls` (`IdDMCLS`, `TenCLS`, `TenKDau`, `PhanLoai`, `DonGia`, `DanhMucBHYT`, `BHYTTT`, `created_at`, `updated_at`) VALUES
('1', 'Siêu âm', 'chuan_doan_hinh_anh', 'can_lam_sang', 42100, 1, 100, '2019-03-02 21:23:51', NULL),
('10', 'Chụp X-quang phim ≤ 24x30 cm (2 tư thế)', 'chuan_doan_hinh_anh', 'can_lam_sang', 55200, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('11', 'Chụp X-quang ổ răng hoặc cận chóp', 'chuan_doan_hinh_anh', 'can_lam_sang', 12800, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('12', 'Chụp Angiography mắt', 'chuan_doan_hinh_anh', 'can_lam_sang', 213000, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('13', 'Chụp dạ dày-tá tràng có uống thuốc cản quang ', 'chuan_doan_hinh_anh', 'can_lam_sang', 115000, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('14', 'Chụp mật qua Kehr', 'chuan_doan_hinh_anh', 'can_lam_sang', 236000, 1, 100, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('15', 'Mammography (1 bên)', 'chuan_doan_hinh_anh', 'can_lam_sang', 93200, 0, 0, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('16', 'Chụp X-quang số hóa 1 phim', 'chuan_doan_hinh_anh', 'can_lam_sang', 64200, 1, 100, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('17', 'Chụp CT Scanner đến 32 dãy không có thuốc cản quang', 'chuan_doan_hinh_anh', 'can_lam_sang', 519000, 1, 100, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('18', 'ANA 17 profile test (sàng lọc và định danh đồng thời 17 loại kháng thể kháng nhân bằng thanh sắc ký miễn dịch)', 'chuan_doan_hinh_anh', 'can_lam_sang', 1004000, 0, 0, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('19', 'Bilan đông cầm máu - huyết khối', 'chuan_doan_hinh_anh', 'can_lam_sang', 1560000, 1, 80, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('2', 'Chụp X-quang phim ≤ 24x30 cm (1 tư thế)', 'chuan_doan_hinh_anh', 'can_lam_sang', 49200, 1, 100, '2019-03-02 21:23:51', NULL),
('20', 'Định danh kháng thể kháng HLA bằng kỹ thuật ELISA', 'xet_nghiem', 'can_lam_sang', 4368000, 1, 80, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('21', 'Định nhóm máu hệ ABO bằng giấy định nhóm máu để truyền: chế phẩm tiểu cầu hoặc huyết tương', 'xet_nghiem', 'can_lam_sang', 20500, 1, 100, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('22', 'Định nhóm máu hệ Diego (xác định kháng nguyên Diego)', 'xet_nghiem', 'can_lam_sang', 182000, 1, 50, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('23', 'Lọc bạch cầu trong khối hồng cầu', 'xet_nghiem', 'can_lam_sang', 567000, 1, 80, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('24', 'Lympho cross match bằng kỹ thuật Flow-cytometry', 'xet_nghiem', 'can_lam_sang', 2184000, 1, 100, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('25', 'Nghiệm pháp sinh Thromboplastin (T.G.T: Thromboplastin Generation Test)', 'xet_nghiem', 'can_lam_sang', 295000, 0, 0, '2019-04-05 04:05:45', '2019-04-05 04:05:45'),
('26', 'Cắt chỉ', 'sfsdf', 'thu_thuat', 32000, 1, 100, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('27', 'Đặt sonde dạ dày', 'fsf', 'thu_thuat', 88700, 1, 80, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('28', 'Đặt stent thực quản qua nội soi', 'sfsf', 'thu_thuat', 1133000, 1, 80, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('29', 'Hút đờm', 'sfsf', 'thu_thuat', 10800, 1, 100, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('3', 'Cắt mây mắt', 'thu_thuat', 'thu_thuat', 150000, 1, 100, '2019-03-02 21:27:26', NULL),
('30', 'Mở khí quản', 'sfs', 'thu_thuat', 71500, 1, 100, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('31', 'Nội soi màng phổi, sinh thiết màng phổi', 'fsf', 'thu_thuat', 5780000, 0, 100, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('32', 'Nội soi thực quản, dạ dày, tá tràng ống mềm có sinh thiết', 'fsf', 'thu_thuat', 426000, 1, 80, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('33', 'Nội soi dạ dày can thiệp', 'fsf', 'thu_thuat', 719000, 0, 0, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('34', 'Nội soi ổ bụng', 'fdsf', 'thu_thuat', 815000, 1, 50, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('35', 'Soi màng phổi', 'fsf', 'thu_thuat', 429000, 0, 0, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('36', 'Thay băng vết thương hoặc mổ chiều dài ≤ 15cm', 'sfsf', 'thu_thuat', 56800, 1, 100, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('37', 'Khâu vết thương phần mềm tổn thương nông chiều dài < 10 cm', 'fsf', 'thu_thuat', 176000, 0, 0, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('38', 'Chọc tháo dịch màng bụng hoặc màng phổi dưới hướng dẫn của siêu âm', 'fsfs', 'thu_thuat', 174000, 0, 0, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('39', 'Chọc hút hạch hoặc u', 'sfsf', 'thu_thuat', 108000, 1, 80, '2019-04-05 06:26:17', '2019-04-05 06:26:17'),
('4', 'Đánh bờ mi', 'thu_thuat', 'thu_thuat', 80000, 1, 100, '2019-03-02 21:27:26', NULL),
('40', 'Chọc hút hạch hoặc u hoặc áp xe hoặc các tổn thương khác dưới hướng dẫn của cắt lớp vi tính', 'fsfs', 'thu_thuat', 728000, 0, 0, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('41', 'Chọc hút tế bào tuyến giáp', 'sfsf', 'thu_thuat', 108000, 0, 0, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('42', 'Lọc máu liên tục (01 lần)', 'fsfs', 'thu_thuat', 2200000, 1, 100, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('43', 'Rửa dạ dày', 'fsfs', 'thu_thuat', 115000, 1, 100, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('44', 'Sinh thiết hạch hoặc u', 'fsfs', 'thu_thuat', 258000, 0, 0, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('45', 'Soi ruột non, tiêm (hoặc kẹp cầm máu) hoặc cắt polyp', 'sfsf', 'thu_thuat', 737000, 1, 100, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('46', 'Truyền tĩnh mạch', 'fsfs', 'thu_thuat', 21000, 0, 0, '2019-04-05 06:26:18', '2019-04-05 06:26:18'),
('47', 'Phẫu thuật cắt thực quản qua nội soi ngực và bụng', 'rgdg', 'phau_thuat', 5754000, 1, 100, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('48', 'Phẫu thuật nội soi điều trị trào ngược thực quản, dạ dày', 'dgdg', 'phau_thuat', 5874000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('49', 'Phẫu thuật cắt bán phần dạ dày', 'gdgd', 'phau_thuat', 4845000, 1, 80, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('5', 'Phẫu thuật Thay giác mạc', 'thay_giac_mac', 'phau_thuat', 1500000, 1, 100, '2019-03-27 01:03:03', '2019-03-27 01:04:17'),
('50', 'Phẫu thuật nội soi khâu thủng dạ dày', 'gdgd', 'phau_thuat', 2867000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('51', 'Phẫu thuật nội soi cắt dây thần kinh X trong điều trị loét dạ dày', 'dgdg', 'phau_thuat', 3191000, 1, 100, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('52', 'Phẫu thuật bệnh phình đại tràng bẩm sinh 1 thì', 'gdgd', 'phau_thuat', 2898000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('53', 'Phẫu thuật cắt ruột thừa', 'gdgdg', 'phau_thuat', 2531000, 1, 50, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('54', 'Phẫu thuật Cắt Amiđan (gây mê)', 'dgdg', 'phau_thuat', 1070000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('55', 'Phẫu thuật Cắt dây thần kinh Vidien qua nội soi', 'dgdgd', 'phau_thuat', 7683000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('56', 'Phẫu thuật Cắt polyp ống tai gây mê', 'dgdg', 'phau_thuat', 1975000, 1, 80, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('57', 'Phẫu thuật Đặt stent điều trị sẹo hẹp thanh khí quản', 'gdgdg', 'phau_thuat', 7078000, 1, 50, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('58', 'Phẫu thuật Mổ cắt bỏ u bã đậu vùng đầu mặt cổ gây mê', 'dgdg', 'phau_thuat', 1328000, 1, 100, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('59', 'Phẫu thuật Nâng xương chính mũi sau chấn thương gây mê', 'dgdgd', 'phau_thuat', 3657000, 1, 100, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('6', 'Phẫu thuật Nối nhãn cầu', 'noi_nhan_cau', 'phau_thuat', 2500000, 1, 100, '2019-03-27 01:04:15', '2019-03-27 01:04:17'),
('60', 'Phẫu thuật Nội soi nạo VA gây mê sử dụng Hummer', 'dgdg', 'phau_thuat', 1564000, 1, 100, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('61', 'Phẫu thuật chỉnh hình sẹo hẹp thanh khí quản bằng đặt ống nong', 'dgdg', 'phau_thuat', 4577000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('62', 'Phẫu thuật lấy đường rò luân nhĩ 1 bên, 2 bên', 'sdfsf', 'phau_thuat', 3020000, 1, 80, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('63', 'Phẫu thuật bong võng mạc kinh điển', 'ghgfhfh', 'phau_thuat', 2220000, 0, 0, '2019-04-05 07:28:23', '2019-04-05 07:28:23'),
('64', 'Phẫu thuật cắt bè', 'sfsf', 'phau_thuat', 1092000, 0, 0, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('65', 'Phẫu thuật cắt dịch kính và điều trị bong võng mạc (01 mắt)', 'hfh', 'phau_thuat', 2912000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('66', 'Phẫu thuật cắt mộng ghép màng ối, kết mạc - gây mê', 'fhfh', 'phau_thuat', 1459000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('67', 'Phẫu thuật cắt mống mắt chu biên', 'fhfh', 'phau_thuat', 514000, 0, 0, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('68', 'Phẫu thuật cắt thủy tinh thể', 'fhfh', 'phau_thuat', 1197000, 0, 0, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('69', 'Phẫu thuật đục thuỷ tinh thể bằng phương pháp Phaco (01 mắt)', 'hfhf', 'phau_thuat', 2642000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('7', 'Siêu âm + đo trục nhãn cầu', 'fdsf', 'can_lam_sang', 74500, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('70', 'Phẫu thuật mộng đơn một mắt - gây mê', 'hfhfh', 'phau_thuat', 1420000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('71', 'Phẫu thuật tái tạo lệ quản kết hợp khâu mi', 'lklk', 'phau_thuat', 1497000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('72', 'Phẫu thuật tạo mí (2 mắt)', 'khkh', 'phau_thuat', 1079000, 0, 0, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('73', 'Phẫu thuật u kết mạc nông', 'klkl', 'phau_thuat', 679000, 0, 0, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('74', 'Phẫu thuật vá da điều trị lật mi', 'tyiiy', 'phau_thuat', 1047000, 1, 100, '2019-04-05 07:28:24', '2019-04-05 07:28:24'),
('8', 'Siêu âm Doppler màu tim 4 D (3D REAL TIME)', 'gdfgfdg', 'can_lam_sang', 454000, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44'),
('9', 'Siêu âm trong lòng mạch hoặc Đo dự trữ lưu lượng động mạch vành FFR', 'gdgd', 'can_lam_sang', 1989000, 1, 100, '2019-04-05 04:05:44', '2019-04-05 04:05:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_cls_vs_khoa`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `danh_muc_cls_vs_khoa`;
CREATE TABLE IF NOT EXISTS `danh_muc_cls_vs_khoa` (
  `IdKhoa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã chuyên khoa',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKhoa`,`IdDMCLS`),
  KEY `fk_danh_muc_cls_vs_khoa_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_cls_vs_khoa`:
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdKhoa`
--       `khoa` -> `IdKhoa`
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_cls_vs_khoa`
--

INSERT INTO `danh_muc_cls_vs_khoa` (`IdKhoa`, `IdDMCLS`, `created_at`, `updated_at`) VALUES
('01', '26', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '3', '2019-03-02 21:33:22', '2019-04-05 04:07:49'),
('01', '36', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '37', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '39', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '4', '2019-03-02 21:33:22', '2019-04-05 04:07:50'),
('01', '40', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '42', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '44', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '46', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('01', '5', '2019-03-27 01:07:59', '2019-03-27 01:07:59'),
('01', '6', '2019-03-27 01:07:59', '2019-03-27 01:07:59'),
('01', '63', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '64', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '65', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '66', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '67', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '68', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '69', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '70', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '71', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('01', '72', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('02', '28', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('02', '29', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('02', '30', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('02', '31', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('02', '32', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('02', '35', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '36', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '37', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '38', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '39', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '41', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '44', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '46', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('02', '54', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('02', '55', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('02', '56', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('02', '57', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('02', '58', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('02', '59', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('02', '60', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('02', '61', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('02', '62', '2019-04-05 07:36:43', '2019-04-05 07:36:43'),
('03', '1', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '10', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '11', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '12', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '13', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '14', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '15', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '16', '2019-04-20 02:47:24', '2019-04-20 02:47:24'),
('03', '17', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '18', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '19', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '2', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '20', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '21', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '22', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '23', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '24', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '25', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '26', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '27', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '28', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '29', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '3', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '30', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '31', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '32', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '33', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '34', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '35', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '36', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '37', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '38', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '39', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '4', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '40', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '41', '2019-04-16 04:51:08', '2019-04-16 04:55:35'),
('03', '42', '2019-04-16 04:55:35', '2019-04-16 04:55:35'),
('03', '43', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '44', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '45', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '46', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '47', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '48', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '49', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '5', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '50', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '51', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '52', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '53', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '54', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '55', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '56', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '57', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '58', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '59', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '6', '2019-04-16 04:55:33', '2019-04-16 04:55:33'),
('03', '60', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '61', '2019-04-16 04:55:36', '2019-04-16 04:55:36'),
('03', '62', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '63', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '64', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '65', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '66', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '67', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '68', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '69', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '7', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '70', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '71', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '72', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '73', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '74', '2019-04-16 04:55:37', '2019-04-16 04:55:37'),
('03', '8', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('03', '9', '2019-04-16 04:55:34', '2019-04-16 04:55:34'),
('05', '1', '2019-03-02 21:29:23', '2019-04-05 04:07:50'),
('05', '10', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '11', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '12', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '13', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '14', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '15', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '16', '2019-04-20 02:47:24', '2019-04-20 02:47:24'),
('05', '17', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '18', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '19', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '2', '2019-03-02 21:29:23', '2019-04-05 04:07:51'),
('05', '20', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '21', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '22', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '23', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '24', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '25', '2019-04-05 04:10:21', '2019-04-05 04:10:21'),
('05', '7', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '8', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('05', '9', '2019-04-05 04:10:20', '2019-04-05 04:10:20'),
('13', '26', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('13', '27', '2019-04-05 06:51:00', '2019-04-05 06:51:00'),
('13', '33', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('13', '34', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('13', '43', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('13', '45', '2019-04-05 06:51:01', '2019-04-05 06:51:01'),
('13', '47', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '48', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '49', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '50', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '51', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '52', '2019-04-05 07:36:42', '2019-04-05 07:36:42'),
('13', '53', '2019-04-05 07:36:42', '2019-04-05 07:36:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc_thuoc`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `danh_muc_thuoc`;
CREATE TABLE IF NOT EXISTS `danh_muc_thuoc` (
  `IdThuoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục thuốc',
  `TenThuoc` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên danh mục thuốc',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên gọ không dấu của danh mục thuốc',
  `NSX` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nhà sản xuất',
  `NCU` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nhà cung ứng',
  `NgaySX` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sản xuất',
  `NgayHH` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày hết hạn sử dụng',
  `SL` bigint(20) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `DonViTinh` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Đơn vị tính',
  `DonGiaNhap` int(10) UNSIGNED NOT NULL COMMENT 'Đơn giá nhập',
  `DonGiaBan` int(10) UNSIGNED NOT NULL COMMENT 'Đơn giá bán',
  `ChongChiDinh` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chống chỉ đinh',
  `ThanhPhan` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Thành phần thuốc',
  `PhanLoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phân loại thuốc (thuốc dùng để uống, tiêm, truyền dịch, ...)',
  `DanhMucBHYT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Có thuộc danh mục BHYT hay ko?',
  `BHYTTT` tinyint(3) UNSIGNED NOT NULL COMMENT 'Phần trăm BHYT thanh toán',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdThuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `danh_muc_thuoc`:
--

--
-- Đang đổ dữ liệu cho bảng `danh_muc_thuoc`
--

INSERT INTO `danh_muc_thuoc` (`IdThuoc`, `TenThuoc`, `TenKDau`, `NSX`, `NCU`, `NgaySX`, `NgayHH`, `SL`, `DonViTinh`, `DonGiaNhap`, `DonGiaBan`, `ChongChiDinh`, `ThanhPhan`, `PhanLoai`, `DanhMucBHYT`, `BHYTTT`, `created_at`, `updated_at`) VALUES
('1', 'Paracetamol 500mg', 'paracetamol_500mg', 'dsfsf', 'sfsf', '2019-03-02 17:00:00', '2019-03-02 17:00:00', 121, 'Viên', 500, 600, 'scs', 'Paracetamol 500mg', 'uong', 1, 100, '2019-03-02 21:54:24', '2019-04-19 13:24:38'),
('10', 'ZESTRIL', 'zestril', 'sfsf', 'add', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 4534, 4600, 'dgdgd', 'Lisinopril 5mg', 'uong', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:30:13'),
('11', 'DAIVONEX', 'daivonex', 'sfsf', 'dadad', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Tuýp', 273000, 273000, 'dgdg', 'Calcipotriol 50mcg/g', 'boi', 1, 50, '2019-04-05 02:18:44', '2019-04-19 11:07:43'),
('12', 'PULMICORT RESPULES', 'pulmicort_respules', 'sfs', 'dada', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Ống', 13834, 14000, 'dgdgd', 'Budesonid 500mcg/2ml', 'thoi_khi_truyen_hoi', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:26:32'),
('13', 'VENTOLIN Inhaler', 'ventolin_inhaler', 'sfsf', 'adad', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Bình xịt', 76379, 77000, 'gdgd', 'Salbutamol 100mcg/ liều', 'xit', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:29:21'),
('14', 'TRILEPTAL', 'trileptal', 'fsf', 'dasda', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 7331, 8000, 'dgdg', 'Oxcarbazepin 300mg', 'uong', 1, 80, '2019-04-05 02:18:44', '2019-04-19 13:27:54'),
('15', 'DEPAKINE CHRONO', 'depakine_chrono', 'adad', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 6972, 7000, 'sdsd', 'Natri valproate, Acid valproic 333mg;145mg', 'uong', 1, 100, '2019-04-05 03:27:09', '2019-04-19 13:33:59'),
('16', 'XATRAL XL 10MG', 'xatral_xl_10mg', 'sfsf', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 15291, 16000, 'sdsd', 'Alfuzosin hydroclorid 10mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:36:51'),
('17', 'EXFORGE', 'exforge', 'fs', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 9987, 10000, 'sdsd', 'Amlodipine 5mg Amlodipine, 80mg Valsartan', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:34:24'),
('18', 'HERBESSER R100', 'herbesser_r100', 'fs', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 3168, 3200, 'dsds', 'Diltiazem Hydrochloride 100mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:35:09'),
('19', 'VASTAREL MR', 'vastarel_mr', 'sfsf', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 2705, 2800, 'dsds', 'Trimetazidine dihydrochloride 35mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:37:15'),
('2', 'Oflovid', 'oflovid', 'fdsf', 'df', '2019-03-02 17:00:00', '2019-03-02 17:00:00', 221, 'Lọ', 50000, 52000, 'fgfg', 'Ofloxacin 0.3%-5ml', 'nho_giot', 1, 100, '2019-03-02 21:54:24', '2019-04-19 13:23:58'),
('20', 'PROCORALAN', 'procoralan', 'sfsf', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 11101, 12000, 'dsds', 'Ivabradine HCl 7.5mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:26:08'),
('21', 'CONCOR COR', 'concor_cor', 'sfsf', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 2878, 2900, 'sdsd', 'Bisoprolol fumarate 2,5mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:33:35'),
('22', 'CARDURAN', 'carduran', 'fsf', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 8435, 8500, 'sdsd', 'Doxazosin mesylate 2mg', 'uong', 0, 0, '2019-04-05 03:27:10', '2019-04-19 13:32:45'),
('23', 'LACIPIL 4MG', 'lacipil_4mg', 'fsfs', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1200, 'Viên', 6826, 6900, 'dsds', 'Lacidipine 4mg', 'uong', 1, 80, '2019-04-05 03:27:10', '2019-04-19 13:35:45'),
('24', 'BETALOC ZOK 50MG', 'betaloc_zok_50mg', 'sfsf', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 5779, 5800, 'sdsd', 'Metoprolol succinat 47,5mg', 'uong', 1, 80, '2019-04-05 03:27:10', '2019-04-19 13:32:23'),
('25', 'ADALAT LA 30MG', 'adalat_la_30mg', 'sfsf', 'dfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 9454, 9500, 'sdsd', 'Nifedipine 30mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:31:16'),
('26', 'COVERSYL 10MG', 'coversyl_10mg', 'sfsf', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 7960, 8000, 'sdsd', 'Perindopril Arginine 10mg', 'uong', 0, 0, '2019-04-05 03:27:10', '2019-04-19 11:06:48'),
('27', 'TWYNSTA', 'twynsta', 'sfsf', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 13122, 13200, 'sds', 'Telmisartan, Amlodipine 80mg + 5mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:28:24'),
('28', 'DIOVAN 80MG', 'diovan_80mg', 'fsfs', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 9966, 10000, 'dsdsd', 'Valsartan 80mg', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 11:08:51'),
('29', 'CO-DIOVAN 80/12.5', 'co_diovan_80_12_5', 'fsfs', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 9987, 10000, 'sdsd', 'Valsartan (80mg), Hydrochlothiazide (12,5mg)', 'uong', 1, 100, '2019-04-05 03:27:10', '2019-04-19 13:33:15'),
('3', 'Madolora', 'madolora', 'fdgvd', 'dfgfdg', '2019-03-02 17:00:00', '2019-03-02 17:00:00', 122, 'Viên', 2000, 2100, 'gfg', 'Desloratadin 5mg', 'uong', 1, 100, '2019-03-02 21:56:42', '2019-04-19 13:36:00'),
('30', 'PLAVIX 75MG', 'plavix_75mg', 'fsfs', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 20828, 21000, 'sdsd', 'Clopidogrel base 75mg', 'uong', 0, 0, '2019-04-05 03:27:10', '2019-04-19 13:36:21'),
('31', 'LIPITOR', 'lipitor', 'fsfs', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 15941, 16000, 'sds', 'Atorvastatin (dưới dạng Atorvastatin hemicalci. 1,5H2O) 10mg', 'uong', 0, 0, '2019-04-05 03:27:10', '2019-04-19 13:22:16'),
('32', 'CRESTOR 5MG', 'crestor_5mg', 'fsfs', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 12000, 'Viên', 9975, 10000, 'sds', 'Rosuvastatin (dưới dạng Rosuvastatin calci 5,2 mg)', 'uong', 1, 50, '2019-04-05 03:27:11', '2019-04-19 11:07:16'),
('33', 'GALVUS', 'galvus', 'fsfs', 'fsfs', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 8225, 8300, 'dsds', 'Vildagliptin 50mg', 'uong', 0, 0, '2019-04-05 03:27:11', '2019-04-19 13:34:48'),
('34', 'SERETIDE EVOHALER DC', 'seretide_evohaler_dc', 'sfsf', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1300, 'Bình xịt', 278090, 278100, 'sdsd', 'Salmeterol + fluticasone  (25mcg+250mcg)', 'uong', 1, 100, '2019-04-05 03:27:11', '2019-04-19 13:37:35'),
('4', 'Agirenyl', 'agirenyl', 'fdgd', 'dgd', '2019-03-02 17:00:00', '2019-03-02 17:00:00', 100, 'Viên', 1500, 1700, 'dfd', 'Vitamin A 5.000 UI', 'uong', 0, 0, '2019-03-02 21:56:42', '2019-04-19 13:31:37'),
('5', 'NEURONTIN', 'neurontin', 'fdgdg', 'dgdgd', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 11316, 12000, 'gdgdg', 'Gabapentin 300mg', 'uong', 1, 100, '2019-04-05 02:18:43', '2019-04-19 13:23:36'),
('6', 'KEPPRA', 'keppra', 'sfsf', 'fsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 15470, 16000, 'dgdgd', 'Levetiracetam 500mg', 'uong', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:35:27'),
('7', 'LYRICA', 'lyrica', 'sfs', 'fdsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 17685, 18000, 'dgdg', 'Pregabalin 75mg', 'uong', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:22:38'),
('8', 'AVODART', 'avodart', 'fdsf', 'sdfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 15291, 16000, 'dgdg', 'Dutasteride 0.5mg', 'uong', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:32:02'),
('9', 'APROVEL', 'aprovel', 'fdgdg', 'sfsf', '2019-04-04 17:00:00', '2019-04-04 17:00:00', 1000, 'Viên', 9561, 9600, 'dgdgd', 'Irbesartan 150mg', 'uong', 1, 100, '2019-04-05 02:18:44', '2019-04-19 13:30:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `duyet_tk`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `duyet_tk`;
CREATE TABLE IF NOT EXISTS `duyet_tk` (
  `IdTK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thống kê',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên duyệt',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTK`,`IdNV`),
  KEY `fk_duyet_tk_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `duyet_tk`:
--   `IdTK`
--       `thong_ke` -> `IdTK`
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `duyet_tk`
--

INSERT INTO `duyet_tk` (`IdTK`, `IdNV`, `created_at`, `updated_at`) VALUES
('0828569161', '0397501161', '2019-04-29 11:53:34', '2019-04-29 11:53:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `file_tk`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `file_tk`;
CREATE TABLE IF NOT EXISTS `file_tk` (
  `IdFile` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã file',
  `IdTK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thống kê',
  `TenFile` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên file',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdFile`),
  KEY `fk_file_tk_IdTK` (`IdTK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `file_tk`:
--   `IdTK`
--       `thong_ke` -> `IdTK`
--

--
-- Đang đổ dữ liệu cho bảng `file_tk`
--

INSERT INTO `file_tk` (`IdFile`, `IdTK`, `TenFile`, `created_at`, `updated_at`) VALUES
('0018674611', '0490030521', 'TK_THUOC_NGAY_27_04_2019_12_35_14_AM_TRANG_2.pdf', '2019-04-27 05:53:50', '2019-04-27 05:53:50'),
('0248148791', '0828569161', 'KE_KHAI_LUONG_NGAY__29_04_2019_6_52_38_PM.pdf', '2019-04-29 11:53:03', '2019-04-29 11:53:03'),
('0415209041', '0490030521', 'TK_THUOC_NGAY_27_04_2019_12_35_14_AM_TRANG_1.pdf', '2019-04-27 05:53:50', '2019-04-27 05:53:50'),
('0495814931', '0311741721', 'TK_THUOC_NGAY_27_04_2019_12_59_54_AM_TRANG_2.pdf', '2019-04-27 06:02:08', '2019-04-27 06:02:08'),
('0509002031', '0665929521', 'TK_THUOC_NGAY_27_04_2019_1_05_49_PM.pdf', '2019-04-27 06:06:25', '2019-04-27 06:06:25'),
('0793832041', '0311741721', 'TK_THUOC_NGAY_27_04_2019_12_59_54_AM_TRANG_1.pdf', '2019-04-27 06:02:07', '2019-04-27 06:02:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giay_chuyen_vien_vs_benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `giay_chuyen_vien_vs_benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `giay_chuyen_vien_vs_benh_an_ngoai_tru` (
  `IdGCVNgoai` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giấy chuyển viện',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `NoiChuyen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nơi chuyển đến',
  `DHLS` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dấu hiệu lâm sàng',
  `HDT` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hướng điều trị',
  `TTLucChuyen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tình trạng lúc chuyển',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdGCVNgoai`),
  KEY `fk_giay_chuyen_vien_vs_benh_an_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `giay_chuyen_vien_vs_benh_an_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--

--
-- Đang đổ dữ liệu cho bảng `giay_chuyen_vien_vs_benh_an_ngoai_tru`
--

INSERT INTO `giay_chuyen_vien_vs_benh_an_ngoai_tru` (`IdGCVNgoai`, `IdBANgoaiT`, `NoiChuyen`, `DHLS`, `HDT`, `TTLucChuyen`, `created_at`, `updated_at`) VALUES
('0806838401', '0158705861', 'Bệnh Viện Đa khoa TP. Cao Lãnh', 'fsf', 'sfsf', 'sfsf', '2019-04-02 07:00:14', '2019-04-02 07:00:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giay_chuyen_vien_vs_benh_an_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `giay_chuyen_vien_vs_benh_an_noi_tru`;
CREATE TABLE IF NOT EXISTS `giay_chuyen_vien_vs_benh_an_noi_tru` (
  `IdGCVNoi` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giấy chuyển viện',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `NoiChuyen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nơi chuyển đến',
  `DHLS` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dấu hiệu lâm sàng',
  `HDT` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hướng điều trị',
  `TTLucChuyen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tình trạng lúc chuyển',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdGCVNoi`),
  KEY `fk_giay_chuyen_vien_vs_benh_an_noi_tru_IdBANoiT` (`IdBANoiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `giay_chuyen_vien_vs_benh_an_noi_tru`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--

--
-- Đang đổ dữ liệu cho bảng `giay_chuyen_vien_vs_benh_an_noi_tru`
--

INSERT INTO `giay_chuyen_vien_vs_benh_an_noi_tru` (`IdGCVNoi`, `IdBANoiT`, `NoiChuyen`, `DHLS`, `HDT`, `TTLucChuyen`, `created_at`, `updated_at`) VALUES
('0956008391', '0334696751', 'Bệnh Viện Chợ Rẫy', 'Đau mắt', 'Phẫu thuật', 'Tỉnh táo', '2019-05-04 01:13:39', '2019-05-04 01:13:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giay_ra_vien`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `giay_ra_vien`;
CREATE TABLE IF NOT EXISTS `giay_ra_vien` (
  `IdGRV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giấy ra viện',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdGRV`),
  KEY `fk_giay_ra_vien_IdBANoiT` (`IdBANoiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `giay_ra_vien`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--

--
-- Đang đổ dữ liệu cho bảng `giay_ra_vien`
--

INSERT INTO `giay_ra_vien` (`IdGRV`, `IdBANoiT`, `GhiChu`, `created_at`, `updated_at`) VALUES
('0033589961', '0334696751', 'fdfgdfgdfgdg', '2019-04-02 10:10:20', '2019-04-02 10:10:20'),
('0278931621', '0277643301', NULL, '2019-03-30 11:12:50', '2019-03-30 11:12:50'),
('0351150641', '0069826801', NULL, '2019-04-08 08:54:13', '2019-04-08 08:54:13'),
('0358307681', '0726171501', NULL, '2019-04-24 15:03:38', '2019-04-24 15:03:38'),
('0657807341', '0764391241', NULL, '2019-04-24 11:01:46', '2019-04-24 11:01:46'),
('0792617891', '0218106341', NULL, '2019-04-25 04:29:02', '2019-04-25 04:29:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don_dv_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `hoa_don_dv_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `hoa_don_dv_ngoai_tru` (
  `IdHDDVNgoai` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hóa đơn dịch vụ ngoại trú',
  `IdNVLap` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `HinhThucTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Hình thức thanh toán hóa đơn',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdHDDVNgoai`),
  KEY `fk_hoa_don_dv_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`),
  KEY `fk_hoa_don_dv_ngoai_tru_IdNVLap` (`IdNVLap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `hoa_don_dv_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdNVLap`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `hoa_don_dv_ngoai_tru`
--

INSERT INTO `hoa_don_dv_ngoai_tru` (`IdHDDVNgoai`, `IdNVLap`, `IdBANgoaiT`, `HinhThucTT`, `created_at`, `updated_at`) VALUES
('0194320221', '0094497701', '0664160011', 0, '2019-04-13 16:40:33', '2019-04-13 16:40:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoa_don_dv_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `hoa_don_dv_noi_tru`;
CREATE TABLE IF NOT EXISTS `hoa_don_dv_noi_tru` (
  `IdHDDVNoi` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hóa đơn dịch vụ nội trú',
  `IdNVLap` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `HinhThucTT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Hình thức thanh toán hóa đơn',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdHDDVNoi`),
  KEY `fk_hoa_don_dv_noi_tru_IdBANoiT` (`IdBANoiT`),
  KEY `fk_hoa_don_dv_noi_tru_IdNVLap` (`IdNVLap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `hoa_don_dv_noi_tru`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--   `IdNVLap`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `hoa_don_dv_noi_tru`
--

INSERT INTO `hoa_don_dv_noi_tru` (`IdHDDVNoi`, `IdNVLap`, `IdBANoiT`, `HinhThucTT`, `created_at`, `updated_at`) VALUES
('0897216171', '0094497701', '0726171501', 0, '2019-04-13 16:56:46', '2019-04-13 16:56:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_luan_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `ket_luan_cls`;
CREATE TABLE IF NOT EXISTS `ket_luan_cls` (
  `IdKLCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết luận cận lâm sàng',
  `IdKQCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết quả cận lâm sàng',
  `KetLuan` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kết luận',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKLCLS`),
  KEY `fk_ket_luan_cls_IdKQCLS` (`IdKQCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ket_luan_cls`:
--   `IdKQCLS`
--       `ket_qua_cls` -> `IdKQCLS`
--

--
-- Đang đổ dữ liệu cho bảng `ket_luan_cls`
--

INSERT INTO `ket_luan_cls` (`IdKLCLS`, `IdKQCLS`, `KetLuan`, `created_at`, `updated_at`) VALUES
('0029602431', '0430263611', 'sfsfsfsfsf', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0096495651', '0896880671', 'bình thường', '2019-04-08 06:31:55', '2019-04-08 06:31:55'),
('0127108571', '0430263611', 'sfsf', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0643633031', '0607321001', 'fhfh', '2019-04-16 05:52:43', '2019-04-16 05:52:43'),
('0684781781', '0820880501', 'dgdg', '2019-04-16 05:42:51', '2019-04-16 05:42:51'),
('0719729521', '0737416671', 'adad', '2019-04-16 05:50:26', '2019-04-16 05:50:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_qua_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:49 AM
--

DROP TABLE IF EXISTS `ket_qua_cls`;
CREATE TABLE IF NOT EXISTS `ket_qua_cls` (
  `IdKQCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kết quả cận lâm sàng',
  `IdCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định cận lâm sàng',
  `IdNVTH` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên thực hiện chỉ định cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKQCLS`),
  KEY `fk_ket_qua_cls_IdCLS` (`IdCLS`),
  KEY `fk_ket_qua_cls_IdNVTH` (`IdNVTH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ket_qua_cls`:
--   `IdCLS`
--       `can_lam_sang` -> `IdCLS`
--   `IdNVTH`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `ket_qua_cls`
--

INSERT INTO `ket_qua_cls` (`IdKQCLS`, `IdCLS`, `IdNVTH`, `created_at`, `updated_at`) VALUES
('0430263611', '0054739921', '0167027221', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0607321001', '0040707121', '0167027221', '2019-04-16 05:52:43', '2019-04-16 05:52:43'),
('0737416671', '0154649541', '0167027221', '2019-04-16 05:50:26', '2019-04-16 05:50:26'),
('0820880501', '0655039201', '0167027221', '2019-04-16 05:42:51', '2019-04-16 05:42:51'),
('0896880671', '0878253991', '0167027221', '2019-04-08 06:31:54', '2019-04-08 06:31:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ket_qua_cls_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `ket_qua_cls_ct`;
CREATE TABLE IF NOT EXISTS `ket_qua_cls_ct` (
  `IdKQCLSCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết quả cận lâm sàng chi tiết',
  `IdKQCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã kết quả cận lâm sàng',
  `KetQua` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kết quả thực hiện cận lâm sàng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKQCLSCT`),
  KEY `fk_ket_qua_cls_ct_IdKQCLS` (`IdKQCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ket_qua_cls_ct`:
--   `IdKQCLS`
--       `ket_qua_cls` -> `IdKQCLS`
--

--
-- Đang đổ dữ liệu cho bảng `ket_qua_cls_ct`
--

INSERT INTO `ket_qua_cls_ct` (`IdKQCLSCT`, `IdKQCLS`, `KetQua`, `created_at`, `updated_at`) VALUES
('0118241051', '0820880501', 'vcbdfgdggdgdg', '2019-04-16 05:42:51', '2019-04-16 05:42:51'),
('0246338851', '0607321001', 'fghf', '2019-04-16 05:52:43', '2019-04-16 05:52:43'),
('0382710981', '0820880501', 'vcbdfgdg', '2019-04-16 05:42:51', '2019-04-16 05:42:51'),
('0567254521', '0896880671', 'mắt phải bt', '2019-04-08 06:31:54', '2019-04-08 06:31:54'),
('0654835111', '0430263611', 'sdsfsfsf', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0784031941', '0430263611', 'sdsf', '2019-04-16 05:53:08', '2019-04-16 05:53:08'),
('0840388501', '0737416671', 'asdad', '2019-04-16 05:50:26', '2019-04-16 05:50:26'),
('0946592641', '0896880671', 'mắt trái bt', '2019-04-08 06:31:55', '2019-04-08 06:31:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `khoa`;
CREATE TABLE IF NOT EXISTS `khoa` (
  `IdKhoa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã khoa',
  `TenKhoa` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên khoa',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên khoa không dấu',
  `NgayTL` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày thành lập',
  `ChucNang` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chức năng của khoa',
  `KhoaKham` tinyint(1) UNSIGNED NOT NULL COMMENT 'Xác định có phải khoa khám bệnh hay không?',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `khoa`:
--

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`IdKhoa`, `TenKhoa`, `TenKDau`, `NgayTL`, `ChucNang`, `KhoaKham`, `created_at`, `updated_at`) VALUES
('01', 'Mắt', 'khoa_kham', '2019-02-12 16:12:28', 'Khám và điểu trị các bệnh về mắt', 1, '2019-02-12 16:12:28', '2019-02-11 20:00:00'),
('02', 'Tai-Mũi-Họng', 'khoa_kham', '2019-02-12 16:12:28', 'Khám và điểu trị các bệnh về tai-mũi-họng', 1, '2019-02-12 16:12:28', '2019-02-11 20:00:00'),
('03', 'Hồi sức - Cấp cứu', 'hoi_suc_cap_cuu', '2019-02-20 14:19:34', 'Tiếp nhận, chuẩn đoán và điều trị cấp cứu', 1, '2019-02-20 14:20:04', '2019-02-20 14:20:05'),
('05', 'Cận lâm sàng', 'can_lam_sang', '2019-03-02 21:06:16', 'Chuẩn đoán cận lâm sàng', 0, '2019-03-02 21:06:16', NULL),
('06', 'Phẫu thuật', 'phau_thuat', '2019-03-02 21:06:16', 'Thực hiện phẫu thuật', 0, '2019-03-02 21:06:16', NULL),
('0607910061', 'Bảo vệ - Lao công', 'bao_ve_lao_cong', '1998-12-27 16:31:59', 'Bảo vệ - Lao công', 0, '2019-05-01 16:33:12', '2019-05-01 16:45:09'),
('07', 'Hành chính - Tổng hợp', 'hanh_chinh_tong_hop', '2019-03-15 02:12:38', 'Hành chính tổng hợp', 0, '2019-03-15 02:12:51', '2019-05-01 16:54:54'),
('08', 'Quản trị', 'quan_tri', '2019-03-15 21:09:08', 'Quản trị hệ thống', 0, '2019-03-15 21:09:08', NULL),
('09', 'Phát thuốc', 'phat_thuoc', '2019-03-17 10:05:12', 'Phát thuốc', 0, '2019-03-17 10:05:33', '2019-03-17 10:05:33'),
('10', 'Kế toán', 'ke_toan', '2019-03-17 10:06:04', 'Kế toán', 0, '2019-03-17 10:06:17', '2019-03-17 10:06:17'),
('11', 'Tiếp đón cấp cứu', 'tiep_don_cap_cuu', '2019-03-17 10:14:34', 'Tiếp đón cấp cứu', 0, '2019-03-17 10:15:29', '2019-03-24 07:04:38'),
('12', 'Tiếp đón khám bệnh', 'tiep_don_kham_benh', '2019-03-17 10:14:35', 'Tiếp đón khám bệnh', 0, '2019-03-17 10:15:29', '2019-03-17 10:15:29'),
('13', 'Nội tiêu hóa', 'khoa_kham', '2019-04-04 03:40:03', 'Điều trị các bệnh về tiêu hóa', 1, '2019-04-04 03:40:28', '2019-05-01 16:42:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `migrations`:
--

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_01_04_132347_benh_an_ngoai_tru_vs_can_lam_sang', 1),
(4, '2019_01_04_132347_benh_an_noi_tru', 1),
(5, '2019_01_04_132347_benh_an_noi_tru_ct_vs_can_lam_sang', 1),
(6, '2019_01_04_132737_benh_an_noi_tru_ct', 1),
(7, '2019_01_04_133222_benh_nhan', 1),
(8, '2019_01_04_133255_can_lam_sang', 1),
(9, '2019_01_04_133333_chuan_doan_vs_benh_an_ngoai_tru', 1),
(10, '2019_01_04_133333_chuan_doan_vs_benh_an_noi_tru', 1),
(11, '2019_01_04_133333_chuan_doan_vs_ket_qua_cls', 1),
(12, '2019_01_04_133417_danh_muc_cls', 1),
(13, '2019_01_04_133452_danh_muc_benh', 1),
(14, '2019_01_04_133521_danh_muc_thuoc', 1),
(15, '2019_01_04_133557_giay_ra_vien', 1),
(16, '2019_01_04_133558_giay_chuyen_vien_vs_benh_an_ngoai_tru', 1),
(17, '2019_01_04_133558_giay_chuyen_vien_vs_benh_an_noi_tru', 1),
(18, '2019_01_04_133635_hoa_don_dv_ngoai_tru', 1),
(19, '2019_01_04_133635_hoa_don_dv_noi_tru', 1),
(20, '2019_01_04_133730_ket_qua_cls', 1),
(21, '2019_01_04_133754_khoa', 1),
(23, '2019_01_04_133906_nhan_vien', 1),
(24, '2019_01_04_133934_phieu_dk_kham', 1),
(25, '2019_01_04_133934_phieu_dk_kham_vs_benh_an_ngoai_tru', 1),
(26, '2019_01_04_133934_phieu_dk_kham_vs_benh_an_noi_tru', 1),
(27, '2019_01_04_134009_phieu_ke_khai_vp_ngoai_tru', 1),
(28, '2019_01_04_134009_phieu_ke_khai_vp_noi_tru', 1),
(29, '2019_01_04_134028_phieu_ke_khai_vpct_ngoai_tru', 1),
(30, '2019_01_04_134028_phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls', 1),
(31, '2019_01_04_134028_phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc', 1),
(32, '2019_01_04_134028_phieu_ke_khai_vpct_noi_tru', 1),
(33, '2019_01_04_134028_phieu_ke_khai_vpct_noi_vs_danh_muc_cls', 1),
(34, '2019_01_04_134028_phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc', 1),
(35, '2019_01_04_134117_phong_ban', 1),
(36, '2019_01_04_134142_phuong_xa', 1),
(37, '2019_01_04_134208_quan_huyen', 1),
(38, '2019_01_04_134236_the_bhyt', 1),
(39, '2019_01_04_134310_thiet_bi_yt', 1),
(40, '2019_01_04_134347_tinh_tp', 1),
(41, '2019_01_04_134445_toa_thuoc_ct', 1),
(42, '2019_01_04_134520_toa_thuoc', 1),
(43, '2019_01_04_134520_toa_thuoc_vs_benh_an_ngoai_tru', 1),
(44, '2019_01_04_134520_toa_thuoc_vs_benh_an_noi_tru', 1),
(45, '2019_01_05_035833_co_so_kham_bhyt', 1),
(46, '2019_01_06_042139_ket_qua_cls_ct', 1),
(47, '2019_01_06_042316_anh_cls', 1),
(48, '2019_01_15_034901_cap_them_quyen_user', 1),
(49, '2019_01_15_035154_cap_them_quyen_user_ct', 1),
(50, '2019_01_17_145744_ket_luan_cls', 1),
(51, '2019_01_18_144100_ql_truy_cap', 1),
(52, '2019_01_18_144510_ql_truy_cap_ct', 1),
(53, '2019_01_18_144820_ql_thao_tac', 1),
(54, '2019_01_18_145403_ql_phan_hoi', 1),
(55, '2019_01_19_104506_benh_an_ngoai_tru', 1),
(56, '2019_01_25_054644_danh_muc_benh_vs_khoa', 1),
(57, '2019_01_25_054644_danh_muc_cls_vs_khoa', 1),
(58, '2019_01_25_054644_danh_muc_thuoc_vs_khoa', 1),
(59, '2019_01_25_054950_chi_dinh_pt', 1),
(60, '2019_01_25_055043_chi_dinh_tt', 1),
(61, '2019_01_25_055043_chi_dinh_tt_vs_benh_an_ngoai_tru', 1),
(62, '2019_01_25_055043_chi_dinh_tt_vs_benh_an_noi_tru', 1),
(64, '2019_01_27_045029_chuc_vu', 1),
(66, '2019_01_29_020509_tam_ung_cls', 1),
(67, '2019_01_29_020509_tam_ung_pt', 1),
(68, '2019_01_29_020509_tam_ung_tt', 1),
(70, '2019_01_27_030124_cham_cong_nv', 1),
(71, '2019_01_27_030124_cham_cong_nv_ct', 1),
(72, '2019_01_27_045029_chuc_vu_vs_nv', 1),
(73, '2019_01_04_133452_danh_muc_benh_vs_thuoc', 1),
(74, '2019_01_04_133934_ba_nv', 1),
(76, '2019_01_27_050613_thong_ke', 1),
(77, '2019_01_27_050613_file_tk', 1),
(79, '2019_01_27_050613_duyet_tk', 1),
(80, '2019_01_30_043000_add_foreign_key', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `nhan_vien`;
CREATE TABLE IF NOT EXISTS `nhan_vien` (
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng ban',
  `IdXa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã xã phường',
  `TenNV` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên nhân viên',
  `NgaySinh` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sinh',
  `GioiTinh` tinyint(1) UNSIGNED NOT NULL COMMENT 'Giới tính',
  `DanToc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dân tộc',
  `SoCMND` varchar(9) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số chứng minh nhân dân hoặc passport',
  `SDT` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số điện thoại',
  `STK` varchar(13) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số tài khoản ngân hàng',
  `CV` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Công việc',
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Email',
  `DiaChi` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ (số nhà hoặc tên đường)',
  `ChuyenMon` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chuyên môn nghiệp vụ',
  `TrinhDo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Trình độ',
  `HopDongTuNgay` timestamp NULL DEFAULT current_timestamp() COMMENT 'Hợp đồng từ ngày',
  `HopDongDenNgay` timestamp NULL DEFAULT current_timestamp() COMMENT 'Hợp đồng đến ngày',
  `BL` tinyint(2) UNSIGNED NOT NULL COMMENT 'Bậc lương',
  `LoaiNV` tinyint(1) UNSIGNED NOT NULL COMMENT 'Nhân viên biên chế hay hợp đồng?',
  `Anh` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ảnh nhân viên',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdNV`),
  KEY `fk_nhan_vien_IdXa` (`IdXa`),
  KEY `fk_nhan_vien_IdPB` (`IdPB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `nhan_vien`:
--   `IdPB`
--       `phong_ban` -> `IdPB`
--   `IdXa`
--       `phuong_xa` -> `IdXa`
--

--
-- Đang đổ dữ liệu cho bảng `nhan_vien`
--

INSERT INTO `nhan_vien` (`IdNV`, `IdPB`, `IdXa`, `TenNV`, `NgaySinh`, `GioiTinh`, `DanToc`, `SoCMND`, `SDT`, `STK`, `CV`, `Email`, `DiaChi`, `ChuyenMon`, `TrinhDo`, `HopDongTuNgay`, `HopDongDenNgay`, `BL`, `LoaiNV`, `Anh`, `created_at`, `updated_at`) VALUES
('0094497701', '15', '1', 'Bùi Văn Hạnh', '2019-03-16 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567897854', 'ke_toan', '456@123.com', NULL, 'Kế toán', 'cao_dang', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 7, 0, NULL, '2019-03-17 11:48:54', '2019-04-27 15:31:51'),
('0118316881', '03', '1', 'Bùi Văn Liêm', '2019-03-16 17:00:00', 1, 'kinh', '123456789', '1234569781', '1234567894521', 'bac_si_cap_cuu', '777@123.com', NULL, 'CKI. Cấp cứu', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 4, 0, NULL, '2019-03-17 12:20:33', '2019-04-27 15:30:33'),
('0140674231', '11', '1', 'Bùi Văn Chung', '2019-03-16 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567897854', 'phat_thuoc', '222@123.com', NULL, 'Y dược', 'cao_dang', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 5, 0, NULL, '2019-03-17 11:46:10', '2019-04-27 15:32:10'),
('0167027221', '06', '1', 'Bùi Văn Bảnh', '1990-02-14 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567894521', 'bac_si_ky_thuat_cls', '333@123.com', NULL, 'Siêu âm', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 2, 0, NULL, '2019-03-17 11:24:20', '2019-04-27 15:34:31'),
('0213049111', '07', '1', 'Bùi Văn Quân', '2019-03-16 17:00:00', 1, 'kinh', '123456789', '1234567890', '1234567895214', 'ky_thuat_y_te', '323@123.com', NULL, 'Kỹ thuật y tế', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 1, 0, NULL, '2019-03-17 12:04:27', '2019-04-27 15:31:29'),
('0353870871', '02', '1', 'Bùi Văn Trí', '1990-02-14 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567894521', 'bac_si_chuyen_khoa_kham_va_dieu_tri', '321@123.com', NULL, 'CKI. Tai-Mũi-Họng', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 4, 0, NULL, '2019-03-17 11:23:29', '2019-04-27 15:34:45'),
('0397501161', '38', '33', 'Bùi Văn Trung', '1993-04-05 17:00:00', 1, 'kinh', '424242424', '4424211010', '1234567895452', 'hanh_chinh_tong_hop', '999@123.com', NULL, 'CKI. Ngoại thần kinh', 'cu_nhan', '2019-04-23 17:00:00', '2019-04-23 17:00:00', 6, 1, NULL, '2019-04-24 11:43:07', '2019-04-27 15:24:08'),
('0419628061', '01', '2', 'Bùi Văn Minh', '1989-03-28 17:00:00', 0, 'kho_me', '123456789', '4567891245', '1234567895124', 'bac_si_chuyen_khoa_kham_va_dieu_tri', '456@456.com', '16', 'CKI. Mắt', 'tien_si', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 3, 1, NULL, '2019-03-17 11:17:42', '2019-04-27 15:35:04'),
('0442117871', '01', '15', 'Bùi Thị Ánh', '1987-09-07 17:00:00', 0, 'kinh', '324413121', '6541021545', '2121313546562', 'bac_si_chuyen_khoa_kham_va_dieu_tri', '999@999.com', NULL, 'CKI. Mắt', 'tien_si', '2019-04-24 17:00:00', '2019-04-24 17:00:00', 4, 1, NULL, '2019-04-25 08:58:06', '2019-04-27 15:22:58'),
('0497723751', '13', '1', 'Bùi Văn Em', '2019-03-16 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567897854', 'tiep_don_cc', '235@123.com', NULL, 'Y dược', 'cao_dang', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 6, 0, NULL, '2019-03-17 11:45:36', '2019-04-27 15:33:23'),
('0543248151', '09', '1', 'Bùi Văn Liên', '2019-03-16 17:00:00', 1, 'kinh', '123456789', '1234567890', '1234567895214', 'ke_toan', '555@123.com', NULL, 'Kế toán', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 2, 0, NULL, '2019-03-17 12:10:23', '2019-04-27 15:30:53'),
('0647502631', '38', '27', 'Bùi Văn Ân', '1990-03-05 17:00:00', 1, 'kinh', '456464564', '4646464646', '5445464613212', 'hanh_chinh_tong_hop', '666@123.com', NULL, 'Tài chính ngân hàng', 'thac_si', '2019-04-23 17:00:00', '2022-04-20 17:00:00', 2, 0, 'doctor (4).png', '2019-04-24 12:03:43', '2019-04-30 18:45:13'),
('0789446601', '02', '2', 'Bùi Văn Tuấn', '1979-05-16 17:00:00', 1, 'kho_me', '654431351', '6442424242', '4564313134874', 'bac_si_chuyen_khoa_kham_va_dieu_tri', '777@999.com', NULL, 'CKII. Tai-Mũi-Họng', 'tien_si', '2019-04-24 17:00:00', '2019-04-24 17:00:00', 3, 1, NULL, '2019-04-25 09:01:10', '2019-04-27 15:22:07'),
('0795254241', '14', '1', 'Bùi Văn Toàn', '2019-03-16 17:00:00', 0, 'kinh', '123456789', '1354541212', '1245678945625', 'tiep_don_kham_benh', '111@123.com', NULL, 'Y dược', 'cao_dang', '2019-03-16 17:00:00', '2022-04-06 17:00:00', 1, 0, NULL, '2019-03-17 11:43:08', '2019-04-27 15:33:57'),
('0804895611', '05', '1', 'Bùi Văn An', '1990-02-14 17:00:00', 0, 'kinh', '123456789', '1234567890', '1234567894521', 'bac_si_ky_thuat_cls', '444@123.com', NULL, 'Kỹ thuật hình ảnh', 'cu_nhan', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 5, 0, NULL, '2019-03-17 11:25:48', '2019-04-27 15:34:18'),
('0935182761', '26', '26', 'Bùi Văn Lân', '1979-04-17 17:00:00', 1, 'kinh', '012345678', '0345611455', '0152465656666', 'bac_si_chuyen_khoa_kham_va_dieu_tri', '888@123.com', NULL, 'CKII. Tiêu hóa', 'thac_si', '2019-04-13 17:00:00', '2019-04-13 17:00:00', 3, 1, NULL, '2019-04-14 02:59:25', '2019-04-27 15:30:18'),
('9090909099', '0166267501', '1', 'Bùi Văn Mẫn', '1979-01-09 17:00:00', 1, 'hoa', '123456789', '1234567890', '1234567891234', 'hanh_chinh_tong_hop', '123@456.com', NULL, 'CKI. Tim mạch', 'pho_giao_su_ts', '2019-03-16 17:00:00', '2019-03-16 17:00:00', 6, 1, NULL, '2019-03-17 10:25:27', '2019-04-27 15:35:58'),
('9999999999', '12', '2', 'Bùi Văn Kiên', '2019-03-15 17:00:00', 1, 'kinh', '352397505', '0964521535', '1204511119945', 'quan_tri_he_thong', '123@123.com', NULL, 'Công nghệ thông tin', 'cu_nhan', '2019-03-15 17:00:00', '2024-04-17 17:00:00', 4, 1, 'nurse.png', '2019-03-15 21:11:58', '2019-05-01 03:46:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `IdUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã người dùng',
  `OPassword` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mật khẩu cũ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `password_resets`:
--   `IdUser`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_dk_kham`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_dk_kham`;
CREATE TABLE IF NOT EXISTS `phieu_dk_kham` (
  `IdPhieuDKKB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu đăng ký khám bệnh',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập phiếu',
  `IdBN` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh nhân',
  `IdPK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng khám',
  `KhamBHYT` tinyint(1) UNSIGNED NOT NULL COMMENT 'Đối tượng đến khám (có BHYT hay không?',
  `TuyenKham` tinyint(3) UNSIGNED NOT NULL COMMENT 'Khám đúng tuyến hoặc vượt tuyến',
  `GiayChuyen` tinyint(1) UNSIGNED NOT NULL COMMENT 'Nếu bệnh nhân vượt tuyến thì xác định có giấy chuyển hay không?',
  `DTTN` tinyint(1) UNSIGNED NOT NULL COMMENT 'Đối tượng tiếp nhận (thường hay cấp cứu?)',
  `STT` smallint(5) UNSIGNED NOT NULL COMMENT 'Số thứ tự khám',
  `TrangThai` tinyint(1) UNSIGNED NOT NULL COMMENT 'Trạng thái tiếp nhận khám từ bác sĩ của phòng khám',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPhieuDKKB`),
  KEY `fk_phieu_dk_kham_IdNV` (`IdNV`),
  KEY `fk_phieu_dk_kham_IdBN` (`IdBN`),
  KEY `fk_phieu_dk_kham_IdPK` (`IdPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_dk_kham`:
--   `IdBN`
--       `benh_nhan` -> `IdBN`
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--   `IdPK`
--       `phong_ban` -> `IdPB`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_dk_kham`
--

INSERT INTO `phieu_dk_kham` (`IdPhieuDKKB`, `IdNV`, `IdBN`, `IdPK`, `KhamBHYT`, `TuyenKham`, `GiayChuyen`, `DTTN`, `STT`, `TrangThai`, `created_at`, `updated_at`) VALUES
('0075446171', '0795254241', '0107172471', '02', 1, 0, 0, 0, 1, 0, '2019-04-08 02:45:47', '2019-04-08 02:45:47'),
('0130028861', '0497723751', '0222978841', '03', 1, 0, 0, 1, 1, 0, '2019-04-15 12:55:07', '2019-04-14 12:55:07'),
('0234938941', '0795254241', '0142648171', '01', 1, 0, 0, 0, 1, 0, '2019-03-28 15:37:18', '2019-03-23 15:37:18'),
('0333316751', '0795254241', '0257739351', '02', 0, 0, 0, 0, 1, 0, '2019-04-21 16:28:59', '2019-04-20 16:28:59'),
('0336046991', '0795254241', '0384699441', '01', 0, 0, 0, 0, 2, 0, '2019-04-02 13:48:15', '2019-04-01 13:48:15'),
('0350834591', '0795254241', '0798450951', '01', 0, 0, 0, 0, 3, 0, '2019-04-02 03:46:14', '2019-04-02 03:46:14'),
('0358568071', '0795254241', '0257739351', '01', 0, 0, 0, 0, 1, 0, '2019-04-08 02:54:21', '2019-04-08 02:54:21'),
('0388802921', '0795254241', '0142648171', '02', 1, 0, 0, 0, 1, 0, '2019-03-30 10:44:19', '2019-03-29 10:44:19'),
('0409820101', '0795254241', '0257739351', '26', 0, 0, 0, 0, 1, 0, '2019-04-08 02:45:36', '2019-04-08 02:45:36'),
('0422510841', '0795254241', '0297071041', '02', 1, 0, 0, 0, 1, 0, '2019-03-24 14:28:36', '2019-03-24 14:28:36'),
('0435028641', '0795254241', '0895491611', '02', 0, 0, 0, 0, 1, 0, '2019-04-04 04:15:44', '2019-04-04 04:15:44'),
('0484086971', '0795254241', '0297071041', '01', 1, 0, 0, 0, 1, 0, '2019-04-04 04:25:11', '2019-04-04 04:25:11'),
('0578340051', '0795254241', '0276309981', '02', 0, 0, 0, 0, 1, 0, '2019-03-25 04:11:18', '2019-03-25 04:11:35'),
('0638511651', '0795254241', '0142648171', '01', 1, 0, 0, 0, 1, 0, '2019-03-26 14:17:39', '2019-03-26 14:17:39'),
('0682294421', '0497723751', '0714550591', '03', 0, 0, 0, 1, 2, 0, '2019-04-15 14:43:06', '2019-04-14 14:43:06'),
('0703821441', '0795254241', '0297071041', '01', 1, 0, 0, 0, 1, 0, '2019-03-25 04:02:36', '2019-03-25 04:02:58'),
('0710073031', '0795254241', '0107172471', '01', 1, 0, 0, 0, 2, 0, '2019-04-08 08:31:02', '2019-04-08 08:31:02'),
('0751108291', '0795254241', '0000939921', '02', 1, 0, 0, 0, 2, 0, '2019-04-04 04:25:34', '2019-04-04 04:25:34'),
('0788808981', '0795254241', '0222978841', '01', 1, 0, 0, 0, 1, 0, '2019-03-27 05:50:06', '2019-03-27 05:50:06'),
('0792673861', '0795254241', '0257739351', '26', 0, 0, 0, 0, 1, 0, '2019-04-21 16:27:28', '2019-04-20 16:27:28'),
('0930411421', '0795254241', '0714550591', '01', 0, 0, 0, 0, 3, 0, '2019-04-08 08:32:30', '2019-04-08 08:32:30'),
('0970810571', '0795254241', '0276309981', '02', 0, 0, 0, 0, 1, 0, '2019-03-27 08:36:46', '2019-03-27 08:36:46'),
('0975057681', '0795254241', '0798450951', '01', 0, 0, 0, 0, 1, 0, '2019-04-01 13:47:50', '2019-04-01 13:47:50'),
('0997327601', '0795254241', '0276309981', '01', 0, 0, 0, 0, 2, 0, '2019-03-27 08:06:09', '2019-03-27 08:06:09'),
('0999518731', '0795254241', '0257739351', '01', 0, 0, 0, 0, 1, 0, '2019-04-21 16:26:38', '2019-04-20 16:26:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_dk_kham_vs_benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_dk_kham_vs_benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `phieu_dk_kham_vs_benh_an_ngoai_tru` (
  `IdPhieuDKKB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu đăng ký khám bệnh',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPhieuDKKB`,`IdBANgoaiT`),
  KEY `fk_phieu_dk_kham_vs_benh_an_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_dk_kham_vs_benh_an_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdPhieuDKKB`
--       `phieu_dk_kham` -> `IdPhieuDKKB`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_dk_kham_vs_benh_an_ngoai_tru`
--

INSERT INTO `phieu_dk_kham_vs_benh_an_ngoai_tru` (`IdPhieuDKKB`, `IdBANgoaiT`, `created_at`, `updated_at`) VALUES
('0333316751', '0889924831', '2019-04-21 04:51:17', '2019-04-21 04:51:17'),
('0350834591', '0158705861', '2019-04-02 06:59:49', '2019-04-02 06:59:49'),
('0358568071', '0664160011', '2019-04-08 02:54:54', '2019-04-08 02:54:54'),
('0788808981', '0035973371', '2019-03-27 05:50:32', '2019-03-27 05:50:32'),
('0975057681', '0048763021', '2019-04-02 02:46:19', '2019-04-02 02:46:19'),
('0997327601', '0189158951', '2019-03-27 08:06:51', '2019-03-27 08:06:51'),
('0999518731', '0623337401', '2019-04-21 03:02:51', '2019-04-21 03:02:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_dk_kham_vs_benh_an_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_dk_kham_vs_benh_an_noi_tru`;
CREATE TABLE IF NOT EXISTS `phieu_dk_kham_vs_benh_an_noi_tru` (
  `IdPhieuDKKB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu đăng ký khám bệnh',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPhieuDKKB`,`IdBANoiT`),
  KEY `fk_phieu_dk_kham_vs_benh_an_noi_tru_IdBANoiT` (`IdBANoiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_dk_kham_vs_benh_an_noi_tru`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--   `IdPhieuDKKB`
--       `phieu_dk_kham` -> `IdPhieuDKKB`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_dk_kham_vs_benh_an_noi_tru`
--

INSERT INTO `phieu_dk_kham_vs_benh_an_noi_tru` (`IdPhieuDKKB`, `IdBANoiT`, `created_at`, `updated_at`) VALUES
('0130028861', '0532084181', '2019-04-14 15:43:03', '2019-04-14 15:43:03'),
('0234938941', '0764391241', '2019-03-28 12:52:35', '2019-03-28 12:52:35'),
('0336046991', '0334696751', '2019-04-02 07:32:17', '2019-04-02 07:32:17'),
('0388802921', '0447729301', '2019-04-16 14:05:58', '2019-04-16 14:05:58'),
('0435028641', '0218106341', '2019-04-16 14:06:40', '2019-04-16 14:06:40'),
('0484086971', '0069826801', '2019-04-04 14:21:22', '2019-04-04 14:21:22'),
('0638511651', '0277643301', '2019-03-26 15:45:27', '2019-03-26 15:45:27'),
('0682294421', '0440784491', '2019-04-14 15:42:26', '2019-04-14 15:42:26'),
('0710073031', '0726171501', '2019-04-08 08:45:38', '2019-04-08 08:45:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_ngoai_tru` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí chi tiết',
  `IdPKK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí ngoại trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`),
  KEY `fk_phieu_ke_khai_vpct_ngoai_tru_IdPKK` (`IdPKK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_ngoai_tru`:
--   `IdPKK`
--       `phieu_ke_khai_vp_ngoai_tru` -> `IdPKK`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vpct_ngoai_tru`
--

INSERT INTO `phieu_ke_khai_vpct_ngoai_tru` (`IdPKKCT`, `IdPKK`, `created_at`, `updated_at`) VALUES
('0068137211', '0416371241', '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0195664661', '0989346681', '2019-05-04 04:38:50', '2019-05-04 04:38:50'),
('0352205071', '0416371241', '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0384461961', '0694449021', '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0651546671', '0694449021', '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0733323531', '0361710781', '2019-04-21 15:18:06', '2019-04-21 15:18:06'),
('0791977341', '0694449021', '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0819834481', '0416371241', '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0897058131', '0694449021', '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0950907161', '0416371241', '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0954070431', '0989346681', '2019-05-04 04:38:50', '2019-05-04 04:38:50'),
('0993364971', '0361710781', '2019-04-21 15:18:05', '2019-04-21 15:18:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí ngoại trú chi tiết',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục cận lâm sàng',
  `SL` tinyint(3) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`,`IdDMCLS`),
  KEY `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`:
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdPKKCT`
--       `phieu_ke_khai_vpct_ngoai_tru` -> `IdPKKCT`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`
--

INSERT INTO `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls` (`IdPKKCT`, `IdDMCLS`, `SL`, `created_at`, `updated_at`) VALUES
('0068137211', '4', 1, '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0195664661', '1', 1, '2019-05-04 04:38:50', '2019-05-04 04:38:50'),
('0352205071', '1', 1, '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0384461961', '3', 1, '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0651546671', '1', 1, '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0733323531', '3', 1, '2019-04-21 15:18:06', '2019-04-21 15:18:06'),
('0791977341', '4', 1, '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0819834481', '3', 1, '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0897058131', '2', 1, '2019-04-10 04:27:03', '2019-04-10 04:27:03'),
('0950907161', '2', 1, '2019-04-12 07:52:58', '2019-04-12 07:52:58'),
('0954070431', '26', 1, '2019-05-04 04:38:50', '2019-05-04 04:38:50'),
('0993364971', '1', 1, '2019-04-21 15:18:06', '2019-04-21 15:18:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí ngoại trú chi tiết',
  `IdThuoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục thuốc',
  `SL` tinyint(3) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`,`IdThuoc`),
  KEY `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc_IdThuoc` (`IdThuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc`:
--   `IdPKKCT`
--       `phieu_ke_khai_vpct_ngoai_tru` -> `IdPKKCT`
--   `IdThuoc`
--       `danh_muc_thuoc` -> `IdThuoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_noi_tru`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_noi_tru` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí chi tiết',
  `IdPKK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí nội trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`),
  KEY `fk_phieu_ke_khai_vpct_noi_tru_IdPKK` (`IdPKK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_noi_tru`:
--   `IdPKK`
--       `phieu_ke_khai_vp_noi_tru` -> `IdPKK`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vpct_noi_tru`
--

INSERT INTO `phieu_ke_khai_vpct_noi_tru` (`IdPKKCT`, `IdPKK`, `created_at`, `updated_at`) VALUES
('0020898901', '0050760671', '2019-04-08 08:54:31', '2019-04-08 08:54:31'),
('0072031131', '0050760671', '2019-04-08 08:54:35', '2019-04-08 08:54:35'),
('0161815281', '0781300811', '2019-04-12 06:21:48', '2019-04-12 06:21:48'),
('0191277501', '0632031311', '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0218454301', '0632031311', '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0259814701', '0781300811', '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0323690451', '0050760671', '2019-04-08 08:54:31', '2019-04-08 08:54:31'),
('0347815711', '0502585661', '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0356051861', '0781300811', '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0395291111', '0632031311', '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0413812751', '0502585661', '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0497658831', '0099446701', '2019-05-04 04:11:56', '2019-05-04 04:11:56'),
('0558365691', '0781300811', '2019-04-12 06:21:48', '2019-04-12 06:21:48'),
('0576807341', '0502585661', '2019-03-31 14:13:45', '2019-03-31 14:13:45'),
('0615181061', '0632031311', '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0637322901', '0632031311', '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0651281301', '0632031311', '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0655989271', '0050760671', '2019-04-08 08:54:37', '2019-04-08 08:54:37'),
('0735732281', '0502585661', '2019-03-31 14:13:45', '2019-03-31 14:13:45'),
('0783617131', '0502585661', '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0827792501', '0781300811', '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0841865051', '0632031311', '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0894120251', '0781300811', '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0901091181', '0050760671', '2019-04-08 08:54:39', '2019-04-08 08:54:39'),
('0937979581', '0632031311', '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0980100141', '0050760671', '2019-04-08 08:54:33', '2019-04-08 08:54:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_noi_vs_danh_muc_cls` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí nội trú chi tiết',
  `IdDMCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục cận lâm sàng',
  `SL` tinyint(3) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`,`IdDMCLS`),
  KEY `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_cls_IdDMCLS` (`IdDMCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`:
--   `IdDMCLS`
--       `danh_muc_cls` -> `IdDMCLS`
--   `IdPKKCT`
--       `phieu_ke_khai_vpct_noi_tru` -> `IdPKKCT`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`
--

INSERT INTO `phieu_ke_khai_vpct_noi_vs_danh_muc_cls` (`IdPKKCT`, `IdDMCLS`, `SL`, `created_at`, `updated_at`) VALUES
('0072031131', '1', 1, '2019-04-08 08:54:35', '2019-04-08 08:54:35'),
('0161815281', '6', 1, '2019-04-12 06:21:48', '2019-04-12 06:21:48'),
('0191277501', '1', 1, '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0218454301', '5', 2, '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0259814701', '3', 1, '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0347815711', '6', 1, '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0356051861', '4', 1, '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0395291111', '3', 1, '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0413812751', '5', 1, '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0497658831', '1', 1, '2019-05-04 04:11:56', '2019-05-04 04:11:56'),
('0558365691', '5', 1, '2019-04-12 06:21:48', '2019-04-12 06:21:48'),
('0576807341', '5', 1, '2019-03-31 14:13:45', '2019-03-31 14:13:45'),
('0637322901', '26', 1, '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0655989271', '3', 1, '2019-04-08 08:54:38', '2019-04-08 08:54:38'),
('0827792501', '1', 1, '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0841865051', '10', 1, '2019-05-04 06:10:39', '2019-05-04 06:10:39'),
('0894120251', '2', 1, '2019-04-12 06:21:47', '2019-04-12 06:21:47'),
('0901091181', '68', 1, '2019-04-08 08:54:39', '2019-04-08 08:54:39'),
('0937979581', '63', 1, '2019-05-04 06:10:39', '2019-05-04 06:10:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc` (
  `IdPKKCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí nội trú chi tiết',
  `IdThuoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục thuốc',
  `SL` tinyint(3) UNSIGNED NOT NULL COMMENT 'Số lượng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKKCT`,`IdThuoc`),
  KEY `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc_IdThuoc` (`IdThuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`:
--   `IdPKKCT`
--       `phieu_ke_khai_vpct_noi_tru` -> `IdPKKCT`
--   `IdThuoc`
--       `danh_muc_thuoc` -> `IdThuoc`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`
--

INSERT INTO `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc` (`IdPKKCT`, `IdThuoc`, `SL`, `created_at`, `updated_at`) VALUES
('0020898901', '10', 24, '2019-04-08 08:54:31', '2019-04-08 08:54:31'),
('0323690451', '11', 1, '2019-04-08 08:54:32', '2019-04-08 08:54:32'),
('0615181061', '1', 21, '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0651281301', '11', 1, '2019-05-04 06:10:38', '2019-05-04 06:10:38'),
('0735732281', '2', 1, '2019-03-31 14:13:45', '2019-03-31 14:13:45'),
('0783617131', '3', 5, '2019-03-31 14:13:44', '2019-03-31 14:13:44'),
('0980100141', '2', 1, '2019-04-08 08:54:34', '2019-04-08 08:54:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vp_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vp_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vp_ngoai_tru` (
  `IdPKK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí ngoại trú',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKK`),
  KEY `fk_phieu_ke_khai_vp_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vp_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vp_ngoai_tru`
--

INSERT INTO `phieu_ke_khai_vp_ngoai_tru` (`IdPKK`, `IdBANgoaiT`, `created_at`, `updated_at`) VALUES
('0361710781', '0158705861', '2019-04-07 15:06:29', '2019-04-07 15:06:29'),
('0416371241', '0035973371', '2019-03-31 13:19:35', '2019-03-31 13:19:35'),
('0660821861', '0623337401', '2019-04-21 16:23:38', '2019-04-21 16:23:38'),
('0694449021', '0189158951', '2019-03-31 13:13:35', '2019-03-31 13:13:35'),
('0989346681', '0664160011', '2019-04-08 03:22:44', '2019-04-08 03:22:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_ke_khai_vp_noi_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phieu_ke_khai_vp_noi_tru`;
CREATE TABLE IF NOT EXISTS `phieu_ke_khai_vp_noi_tru` (
  `IdPKK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu kê khai viện phí nội trú',
  `IdBANoiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPKK`),
  KEY `fk_phieu_ke_khai_vp_noi_tru_IdBANoiT` (`IdBANoiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phieu_ke_khai_vp_noi_tru`:
--   `IdBANoiT`
--       `benh_an_noi_tru` -> `IdBANoiT`
--

--
-- Đang đổ dữ liệu cho bảng `phieu_ke_khai_vp_noi_tru`
--

INSERT INTO `phieu_ke_khai_vp_noi_tru` (`IdPKK`, `IdBANoiT`, `created_at`, `updated_at`) VALUES
('0050760671', '0069826801', '2019-04-07 15:06:02', '2019-04-07 15:06:02'),
('0099446701', '0726171501', '2019-04-12 06:02:45', '2019-04-12 06:02:45'),
('0502585661', '0277643301', '2019-03-31 13:18:47', '2019-03-31 13:18:47'),
('0632031311', '0334696751', '2019-05-04 06:03:11', '2019-05-04 06:03:11'),
('0781300811', '0764391241', '2019-03-31 13:18:08', '2019-03-31 13:18:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong_ban`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phong_ban`;
CREATE TABLE IF NOT EXISTS `phong_ban` (
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng ban',
  `TenPhong` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên phòng',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên phòng không dấu',
  `IdKhoa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã khoa trực thuộc',
  `PhanLoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phân loại để biét chức năng của phòng',
  `SoPhong` varchar(5) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số phòng',
  `ChucNang` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chức năng của phòng ban',
  `Tang` tinyint(3) UNSIGNED NOT NULL COMMENT 'Tầng lầu của phòng ban',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdPB`),
  KEY `fk_phong_ban_IdKhoa` (`IdKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phong_ban`:
--   `IdKhoa`
--       `khoa` -> `IdKhoa`
--

--
-- Đang đổ dữ liệu cho bảng `phong_ban`
--

INSERT INTO `phong_ban` (`IdPB`, `TenPhong`, `TenKDau`, `IdKhoa`, `PhanLoai`, `SoPhong`, `ChucNang`, `Tang`, `created_at`, `updated_at`) VALUES
('01', 'Khám mắt', 'kham_mat', '01', 'phong_kham', '10', 'Khám mắt', 0, '2019-02-12 16:18:49', '2019-04-17 05:01:57'),
('0166267501', 'Phòng giám đốc', 'phong_giam_doc', '07', 'hanh_chinh', '22', 'Phòng giám đốc', 3, '2019-04-26 01:24:17', '2019-04-26 01:24:17'),
('02', 'Khám Tai-Mũi-Họng', 'kham_tai_mui_hong', '02', 'phong_kham', '12', 'Khám Tai-Mũi-Họng', 1, '2019-02-12 16:18:49', '2019-04-17 05:02:14'),
('03', 'Chuẩn đoán cấp cứu 2', 'chuan_doan_cap_cuu_2', '03', 'phong_kham', '15', 'Chuẩn đoán cấp cứu 2', 0, '2019-02-20 14:36:29', '2019-04-17 05:01:16'),
('04', 'Chuẩn đoán cấp cứu 1', 'chuan_doan_cap_cuu_1', '03', 'phong_kham', '16', 'Chuẩn đoán cấp cứu 1', 0, '2019-02-20 14:37:36', '2019-04-17 05:01:02'),
('05', 'Chụp X-quang tồng quát 1', 'chup_x_quang_tong_quat_1', '05', 'can_lam_sang', '19', 'Chụp X-quang tồng quát 1', 0, '2019-03-02 21:11:13', '2019-04-17 05:00:18'),
('0510748481', 'Phòng bảo vệ', 'phong_bao_ve', '0607910061', 'khac', '11', 'Bảo vệ', 0, '2019-05-01 16:48:49', '2019-05-01 16:48:49'),
('06', 'Siêu âm tổng quát 1', 'sieu_am_tong_quat_1', '05', 'can_lam_sang', '13', 'Siêu âm tổng quát 1', 0, '2019-03-02 21:11:13', '2019-04-17 05:00:40'),
('07', 'Thủ thuật mắt 1', 'thu_thuat_mat_1', '01', 'thu_thuat', '14', 'Thủ thuật mắt 1', 1, '2019-03-02 21:13:05', '2019-04-17 04:59:48'),
('0788745801', 'Phòng lao công', 'phong_lao_cong', '0607910061', 'khac', '12', 'Lao công', 0, '2019-05-01 16:49:25', '2019-05-01 16:49:25'),
('08', 'Thủ thuật mắt 2', 'thu_thuat_mat_2', '01', 'thu_thuat', '18', 'Thủ thuật mắt 2', 1, '2019-03-02 21:13:05', '2019-04-17 05:00:01'),
('09', 'Thu ngân 1', 'thu_ngan_1', '10', 'thu_ngan', '11', 'Thu ngân 1', 0, '2019-03-15 02:15:36', '2019-04-17 04:59:30'),
('10', 'Quản lý nhân sự', 'quan_ly_nhan_su', '07', 'hanh_chinh', '50', 'Quản lý nhân sự', 2, '2019-03-15 21:41:20', '2019-04-17 04:58:24'),
('11', 'Phát thuốc BHYT', 'phat_thuoc_bhyt', '09', 'phat_thuoc', '45', 'Phát thuốc BHYT', 0, '2019-03-17 10:09:38', '2019-04-17 04:58:10'),
('12', 'Quản trị hệ thống', 'quan_tri_he_thong', '08', 'quan_tri_he_thong', '20', 'Quản trị hệ thống', 1, '2019-03-15 21:10:21', '2019-04-17 04:58:49'),
('13', 'Tiếp đón cấp cứu', 'tiep_don_cap_cuu', '11', 'tiep_don_cap_cuu', '16', 'Tiếp đón cấp cứu', 0, '2019-03-17 10:11:35', '2019-04-17 04:57:58'),
('14', 'Tiếp đón khám bệnh', 'tiep_don_kham_benh', '12', 'tiep_don_kham_benh', '17', 'Tiếp đón khám bệnh', 1, '2019-03-17 10:13:02', '2019-04-17 04:57:42'),
('15', 'Thu ngân 2', 'thu_ngan_2', '10', 'thu_ngan', '35', 'Thu ngân 2', 1, '2019-03-17 12:07:54', '2019-04-17 04:57:28'),
('16', 'Phòng điều trị nội trú khoa mắt', 'phong_dieu_tri_noi_tru_khoa_mat', '01', 'phong_luu_benh', '26', 'Điều trị nội trú khoa mắt', 1, '2019-03-19 12:19:57', '2019-04-17 04:57:07'),
('17', 'Phòng điều trị nội trú khoa mắt', 'phong_dieu_tri_noi_tru_khoa_mat', '01', 'phong_luu_benh', '27', 'Điều trị nội trú khoa mắt', 1, '2019-03-19 12:21:36', '2019-04-17 04:56:44'),
('18', 'Phòng điều trị nội trú khoa tai-mũi-họng', 'phong_dieu_tri_noi_tru_khoa_tai_mui_hong', '02', 'phong_luu_benh', '28', 'Điều trị nội trú khoa tai-mũi-họng', 2, '2019-03-19 12:23:24', '2019-04-17 04:56:25'),
('19', 'Phòng điều trị nội trú khoa tai-mũi họng', 'phong_dieu_tri_noi_tru_khoa_tai_mui_hong', '02', 'phong_luu_benh', '29', 'Điều trị nội trú khoa tai-mũi họng', 2, '2019-03-19 12:24:43', '2019-04-17 04:55:54'),
('20', 'Phẫu thuật mắt 1', 'phau_thuat_mat_1', '06', 'phau_thuat', '11', 'Phẫu thuật mắt 1', 1, '2019-03-27 00:59:31', '2019-04-17 04:55:13'),
('21', 'Phẫu thuật mắt 2', 'phau_thuat_mat_2', '06', 'phau_thuat', '22', 'Phẫu thuật mắt 2', 1, '2019-03-27 01:00:19', '2019-04-17 04:54:53'),
('22', 'Chụp CT -Scaner', 'chup_ct_scaner', '05', 'can_lam_sang', '20', 'Chụp CT -Scaner', 0, '2019-04-05 04:20:47', '2019-04-17 04:53:49'),
('23', 'Xét nghiệm huyết học', 'xet_nghiem_huyet_hoc', '05', 'can_lam_sang', '21', 'Xét nghiệm huyết học', 0, '2019-04-05 04:20:47', '2019-04-17 04:54:01'),
('24', 'Siêu âm tổng quát 2', 'sieu_am_tong_quat_2', '05', 'can_lam_sang', '22', 'Siêu âm tổng quát 2', 1, '2019-04-05 04:20:47', '2019-04-17 04:54:10'),
('25', 'Chụp X-quang tổng quát 2', 'chup_x_quang_tong_quat_2', '05', 'can_lam_sang', '23', 'Chụp X-quang tổng quát 2', 1, '2019-04-05 04:20:47', '2019-04-17 04:54:24'),
('26', 'Khám Nội tiêu hóa', 'kham_noi_tieu_hoa', '13', 'phong_kham', '17', 'Khám Nội tiêu hóa', 2, '2019-04-05 06:28:22', '2019-04-17 04:53:32'),
('27', 'Thủ thuật Nội tiêu hóa 1', 'thu_thuat_noi_tieu_hoa_1', '13', 'thu_thuat', '55', 'Thủ thuật Nội tiêu hóa 1', 0, '2019-04-05 06:32:59', '2019-04-17 04:52:11'),
('28', 'Thủ thuật Nội tiêu hóa 2', 'thu_thuat_noi_tieu_hoa_2', '13', 'thu_thuat', '56', 'Thủ thuật Nội tiêu hóa 2', 0, '2019-04-05 06:32:59', '2019-04-17 04:52:32'),
('29', 'Thủ thuật Tai-Mũi-Họng 1', 'thu_thuat_tai_mui_hong_1', '02', 'thu_thuat', '57', 'Thủ thuật Tai-Mũi-Họng 1', 1, '2019-04-05 06:32:59', '2019-04-17 04:52:43'),
('30', 'Thủ thuật Tai-Mũi-Họng 2', 'thu_thuat_tai_mui_hong_2', '02', 'thu_thuat', '58', 'Thủ thuật Tai-Mũi-Họng 2', 1, '2019-04-05 06:32:59', '2019-04-17 04:52:53'),
('31', 'Phát thuốc thu phí', 'phat_thuoc_thu_phi', '09', 'phat_thuoc', '12', 'Phát thuốc thu phí', 0, '2019-04-05 06:37:24', '2019-04-17 04:52:00'),
('32', 'Phẫu thuật Tai-Mũi-Họng 1', 'phau_thuat_tai_mui_hong_1', '02', 'phau_thuat', '33', 'Phẫu thuật Tai-Mũi-Họng 1', 1, '2019-04-05 06:40:37', '2019-04-17 04:50:04'),
('33', 'Phẫu thuật Tai-Mũi-Họng 2', 'phau_thuat_tai_mui_hong_2', '02', 'phau_thuat', '34', 'Phẫu thuật Tai-Mũi-Họng 2', 1, '2019-04-05 06:40:37', '2019-04-17 04:50:15'),
('34', 'Phẫu thuật Nội tiêu hóa 1', 'phau_thuat_noi_tieu_hoa_1', '13', 'phau_thuat', '35', 'Phẫu thuật Nội tiêu hóa 1', 1, '2019-04-05 06:40:37', '2019-04-17 04:51:24'),
('35', 'Phẫu thuật Nội tiêu hóa 2', 'phau_thuat_noi_tieu_hoa_2', '13', 'phau_thuat', '36', 'Phẫu thuật Nội tiêu hóa 2', 1, '2019-04-05 06:40:37', '2019-04-17 04:51:44'),
('36', 'Phòng điều trị nội trú khoa Hồi sức - Cấp cứu', 'phong_dieu_tri_noi_tru_khoa_hoi_suc_cap_cuu', '03', 'phong_luu_benh', '20', 'Điều trị nội trú khoa Hồi sức - Cấp cứu', 11, '2019-04-14 13:19:46', '2019-04-17 04:44:28'),
('37', 'Phòng điều trị nội trú khoa Hồi sức - Cấp cứu', 'phong_dieu_tri_noi_tru_khoa_hoi_suc_cap_cuu', '03', 'phong_luu_benh', '19', 'Điều trị nội trú khoa Hồi sức - Cấp cứu', 1, '2019-04-14 13:19:46', '2019-04-17 04:49:47'),
('38', 'Kế hoạch tổng hợp', 'ke_hoach_tong_hop', '07', 'hanh_chinh', '25', 'Kế hoạch tổng hợp', 2, '2019-04-24 11:47:25', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phuong_xa`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `phuong_xa`;
CREATE TABLE IF NOT EXISTS `phuong_xa` (
  `IdXa` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã xã phường',
  `IdHuyen` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã huyện trực thuộc',
  `TenXa` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên xã',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên không dấu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdXa`),
  KEY `fk_phuong_xa_IdHuyen` (`IdHuyen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `phuong_xa`:
--   `IdHuyen`
--       `quan_huyen` -> `IdHuyen`
--

--
-- Đang đổ dữ liệu cho bảng `phuong_xa`
--

INSERT INTO `phuong_xa` (`IdXa`, `IdHuyen`, `TenXa`, `TenKDau`, `created_at`, `updated_at`) VALUES
('1', '1', 'Mỹ Phú Đông', 'my_phu_dong', '2019-02-09 13:59:59', NULL),
('10', '4', 'Tân Châu 1', 'tan_chau_1', '2019-03-28 06:44:34', '2019-03-28 06:44:34'),
('11', '4', 'Tân Châu 2', 'tan_chau_2', '2019-03-28 06:44:34', '2019-03-28 06:44:34'),
('12', '4', 'Tân Châu 3', 'tan_chau_3', '2019-03-28 06:44:34', '2019-03-28 06:44:34'),
('13', '5', 'Châu Phú 1', 'chau_phu_1', '2019-03-28 06:44:34', '2019-03-28 06:44:34'),
('14', '5', 'Châu Phú 3', 'chau_phu_3', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('15', '6', 'Tịnh Biên 1', 'tinh_bien_1', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('16', '6', 'Tịnh Biên 2', 'tinh_bien_2', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('17', '6', 'Tịnh Biên 3', 'tinh_bien_3', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('18', '7', 'Giòng Riềng 3', 'giong_rieng_3', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('19', '7', 'Giòng Riềng 2', 'giong_rieng_2', '2019-03-28 06:46:25', '2019-03-28 06:46:25'),
('2', '2', 'Hà Tiên 1', 'ha_tien_1', '2019-02-09 13:59:59', NULL),
('20', '7', 'Giòng Riềng 1', 'giong_rieng_1', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('21', '8', 'Kiên Lương 3', 'kien_luong_3', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('22', '8', 'Kiên Lương 2', 'kien_luong_2', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('23', '8', 'Kiên Lương 1', 'kien_luong_1', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('24', '9', 'Lấp Vò 3', 'lap_vo_3', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('25', '9', 'Lấp Vò 2', 'lap_vo_2', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('26', '9', 'Lấp Vò 1', 'lap_vo_1', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('27', '10', 'Lai Vung 3', 'lai_vung_3', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('28', '10', 'Lai Vung 2', 'lai_vung_2', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('29', '10', 'Lai Vung 1', 'lai_vung_1', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('3', '1', 'Tây Phú', 'tay_phu', '2019-03-28 06:44:33', '2019-03-28 06:44:33'),
('30', '11', 'Tam Nông 3', 'tam_nong_3', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('31', '11', 'Tam Nông 2', 'tam_nong_2', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('32', '11', 'Tam Nông 1', 'tam_nong_1', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('33', '12', 'Châu Thành 3', 'chau_thanh_3', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('34', '12', 'Châu Thành 2', 'chau_thanh_2', '2019-03-28 06:46:26', '2019-03-28 06:46:26'),
('35', '5', 'Châu Phú 2', 'chau_phu_2', '2019-03-28 06:45:10', '2019-03-28 06:45:10'),
('36', '12', 'Châu Thành 1', 'chau_thanh_1', '2019-03-28 06:46:32', '2019-03-28 06:46:32'),
('4', '1', 'Vĩnh Phú', 'vinh_phu', '2019-03-28 06:44:33', '2019-03-28 06:44:33'),
('5', '2', 'Hà Tiên 2', 'ha_tien_2', '2019-03-28 06:44:33', '2019-03-28 06:44:33'),
('6', '2', 'Hà Tiên 3', 'ha_tien_3', '2019-03-28 06:44:33', '2019-03-28 06:44:33'),
('7', '3', 'Châu Thành 1', 'chau_thanh_1', '2019-03-28 06:44:33', '2019-03-28 06:44:33'),
('8', '3', 'Châu Thành 2', 'chau_thanh_2', '2019-03-28 06:44:34', '2019-03-28 06:44:34'),
('9', '3', 'Châu Thành 3', 'chau_thanh_3', '2019-03-28 06:44:34', '2019-03-28 06:44:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_phan_hoi`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `ql_phan_hoi`;
CREATE TABLE IF NOT EXISTS `ql_phan_hoi` (
  `IdPH` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phản hồi',
  `IdUser` int(10) UNSIGNED NOT NULL COMMENT 'Mã người dùng',
  `NoiDung` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung phản hồi',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  KEY `fk_ql_phan_hoi_IdUser` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ql_phan_hoi`:
--   `IdUser`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_thao_tac`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `ql_thao_tac`;
CREATE TABLE IF NOT EXISTS `ql_thao_tac` (
  `IdQLThaoTac` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã quản lý thao tác',
  `IdQLTTCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã truy cập chi tiết',
  `TT` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Thao tác',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdQLThaoTac`),
  KEY `fk_ql_thao_tac_IdQLTTCT` (`IdQLTTCT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ql_thao_tac`:
--   `IdQLTTCT`
--       `ql_truy_cap_ct` -> `IdQLTTCT`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_truy_cap`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `ql_truy_cap`;
CREATE TABLE IF NOT EXISTS `ql_truy_cap` (
  `IdQLTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã truy cập',
  `IdUser` int(10) UNSIGNED NOT NULL COMMENT 'Mã người dùng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdQLTT`),
  KEY `fk_ql_truy_cap_IdUser` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ql_truy_cap`:
--   `IdUser`
--       `users` -> `id`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ql_truy_cap_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `ql_truy_cap_ct`;
CREATE TABLE IF NOT EXISTS `ql_truy_cap_ct` (
  `IdQLTTCT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã truy cập chi tiết',
  `IdQLTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã truy cập',
  `DMTT` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Danh mục truy cập',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdQLTTCT`),
  KEY `fk_ql_truy_cap_ct_IdQLTT` (`IdQLTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `ql_truy_cap_ct`:
--   `IdQLTT`
--       `ql_truy_cap` -> `IdQLTT`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quan_huyen`
--
-- Tạo: Th9 23, 2019 lúc 07:50 AM
--

DROP TABLE IF EXISTS `quan_huyen`;
CREATE TABLE IF NOT EXISTS `quan_huyen` (
  `IdHuyen` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã quận huyện',
  `IdTinh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã tỉnh trực thuộc',
  `TenHuyen` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên huyện',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên không dấu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdHuyen`),
  KEY `fk_quan_huyen_IdTinh` (`IdTinh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `quan_huyen`:
--   `IdTinh`
--       `tinh_tp` -> `IdTinh`
--

--
-- Đang đổ dữ liệu cho bảng `quan_huyen`
--

INSERT INTO `quan_huyen` (`IdHuyen`, `IdTinh`, `TenHuyen`, `TenKDau`, `created_at`, `updated_at`) VALUES
('1', '89', 'Thoại Sơn', 'thoai_son', '2019-02-09 13:59:28', NULL),
('10', '90', 'Lai Vung', 'lai_vung', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('11', '90', 'Tam Nông', 'tam_nong', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('12', '88', 'Châu Thành', 'chau_thanh', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('2', '88', 'Hà Tiên', 'ha_tien', '2019-02-09 13:59:28', NULL),
('3', '89', 'Châu Thành', 'chau_thanh', '2019-03-28 06:24:57', '2019-03-28 06:24:57'),
('4', '89', 'Tân Châu', 'tan_chau', '2019-03-28 06:24:57', '2019-03-28 06:24:57'),
('5', '89', 'Châu Phú', 'chau_phu', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('6', '89', 'Tịnh Biên', 'tinh_bien', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('7', '88', 'Giòng Riềng', 'giong_rieng', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('8', '88', 'Kiên Lương', 'kien_luong', '2019-03-28 06:24:58', '2019-03-28 06:24:58'),
('9', '90', 'Lấp Vò', 'lap_vo', '2019-03-28 06:24:58', '2019-03-28 06:24:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tam_ung_cls`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `tam_ung_cls`;
CREATE TABLE IF NOT EXISTS `tam_ung_cls` (
  `IdTA` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã tạm ứng',
  `IdNVLap` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập',
  `IdCLS` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định cận lâm sàng',
  `TamUng` int(10) UNSIGNED NOT NULL COMMENT 'Số tiền tạm ứng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTA`),
  KEY `fk_tam_ung_IdCLS` (`IdCLS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `tam_ung_cls`:
--   `IdCLS`
--       `can_lam_sang` -> `IdCLS`
--

--
-- Đang đổ dữ liệu cho bảng `tam_ung_cls`
--

INSERT INTO `tam_ung_cls` (`IdTA`, `IdNVLap`, `IdCLS`, `TamUng`, `created_at`, `updated_at`) VALUES
('0483842211', '0094497701', '0264908951', 21050, '2019-04-12 05:07:04', '2019-04-12 05:07:04'),
('0719836451', '0094497701', '0040707121', 198900, '2019-04-16 05:17:15', '2019-04-16 05:17:15'),
('0781375781', '0094497701', '0016467601', 2184000, '2019-05-04 04:39:56', '2019-05-04 04:39:56'),
('0815438141', '0094497701', '0554967391', 21050, '2019-04-12 05:04:15', '2019-04-12 05:04:15'),
('0883215921', '0094497701', '0154649541', 21050, '2019-04-16 05:20:34', '2019-04-16 05:20:34'),
('0928455741', '0094497701', '0052570371', 21050, '2019-05-04 05:25:33', '2019-05-04 05:25:33'),
('0970882271', '0094497701', '0154649541', 21050, '2019-04-16 05:22:42', '2019-04-16 05:22:42'),
('0976015501', '0094497701', '0054739921', 45400, '2019-04-16 05:19:05', '2019-04-16 05:19:05'),
('0978052471', '0094497701', '0655039201', 37250, '2019-04-16 05:19:54', '2019-04-16 05:19:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tam_ung_pt`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `tam_ung_pt`;
CREATE TABLE IF NOT EXISTS `tam_ung_pt` (
  `IdTA` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã tạm ứng',
  `IdNVLap` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập',
  `IdPT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định phẩu thuật',
  `TamUng` int(10) UNSIGNED NOT NULL COMMENT 'Số tiền tạm ứng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTA`),
  KEY `fk_tam_ung_IdPT` (`IdPT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `tam_ung_pt`:
--   `IdPT`
--       `chi_dinh_pt` -> `IdPT`
--

--
-- Đang đổ dữ liệu cho bảng `tam_ung_pt`
--

INSERT INTO `tam_ung_pt` (`IdTA`, `IdNVLap`, `IdPT`, `TamUng`, `created_at`, `updated_at`) VALUES
('0118884511', '0094497701', '0492865731', 575400, '2019-04-16 05:38:34', '2019-04-16 05:38:34'),
('0262359481', '0094497701', '0941956171', 750000, '2019-04-12 14:48:09', '2019-04-12 14:48:09'),
('0471706051', '0094497701', '0156061161', 2877000, '2019-04-16 05:40:32', '2019-04-16 05:40:32'),
('0481827591', '0094497701', '0874307141', 598500, '2019-04-12 14:49:12', '2019-04-12 14:49:12'),
('0731024671', '0094497701', '0857745181', 750000, '2019-04-12 14:48:51', '2019-04-12 14:48:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tam_ung_tt`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `tam_ung_tt`;
CREATE TABLE IF NOT EXISTS `tam_ung_tt` (
  `IdTA` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã tạm ứng',
  `IdNVLap` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên lập',
  `IdThuThuat` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phiếu chỉ định thủ thuật',
  `TamUng` int(10) UNSIGNED NOT NULL COMMENT 'Số tiền tạm ứng',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTA`),
  KEY `fk_tam_ung_IdThuThuat` (`IdThuThuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `tam_ung_tt`:
--   `IdThuThuat`
--       `chi_dinh_tt` -> `IdThuThuat`
--

--
-- Đang đổ dữ liệu cho bảng `tam_ung_tt`
--

INSERT INTO `tam_ung_tt` (`IdTA`, `IdNVLap`, `IdThuThuat`, `TamUng`, `created_at`, `updated_at`) VALUES
('0039031141', '0094497701', '0091649841', 75000, '2019-04-12 14:44:51', '2019-04-12 14:44:51'),
('0294368101', '0094497701', '0561969631', 431400, '2019-04-16 05:23:42', '2019-04-16 05:23:42'),
('0392774941', '0094497701', '0474327381', 44350, '2019-04-16 05:38:14', '2019-04-16 05:38:14'),
('0450409161', '0094497701', '0064385131', 75000, '2019-04-16 07:01:08', '2019-04-16 07:01:08'),
('0760609871', '0094497701', '0168287981', 566500, '2019-04-16 05:34:19', '2019-04-16 05:34:19'),
('0884589741', '0094497701', '0520753931', 578000, '2019-04-16 05:24:03', '2019-04-16 05:24:03'),
('0898453571', '0094497701', '0699910101', 40000, '2019-04-12 14:44:02', '2019-04-12 14:44:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `the_bhyt`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `the_bhyt`;
CREATE TABLE IF NOT EXISTS `the_bhyt` (
  `IdTheBHYT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thẻ bảo hiểm y tế',
  `IdCSKBHYT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã cơ sở khám BHYT',
  `IdBN` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh nhân',
  `NgayDK` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày đăng ký',
  `NgayHHDT` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày đến hạn đóng tiền',
  `NgayHH` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày hết hạn',
  `DoiTuongBHYT` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Đối tượng tham gia BHYT',
  `BHYTHoTro` tinyint(3) UNSIGNED NOT NULL COMMENT 'Phần trăm BHYT hỗ trợ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTheBHYT`),
  KEY `fk_the_bhyt_IdCSKBHYT` (`IdCSKBHYT`),
  KEY `fk_the_bhyt_IdBN` (`IdBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `the_bhyt`:
--   `IdBN`
--       `benh_nhan` -> `IdBN`
--   `IdCSKBHYT`
--       `co_so_kham_bhyt` -> `IdCSKBHYT`
--

--
-- Đang đổ dữ liệu cho bảng `the_bhyt`
--

INSERT INTO `the_bhyt` (`IdTheBHYT`, `IdCSKBHYT`, `IdBN`, `NgayDK`, `NgayHHDT`, `NgayHH`, `DoiTuongBHYT`, `BHYTHoTro`, `created_at`, `updated_at`) VALUES
('CK4890123456789', '4', '0384699441', '2018-03-07 13:39:06', '2019-04-17 09:52:11', '2024-03-07 13:39:06', 'CK', 100, '2019-04-01 13:41:43', '2019-04-11 04:25:31'),
('CY4890123456789', '4', '0895491611', '2018-03-07 13:39:06', '2019-04-17 09:52:11', '2024-03-07 13:39:06', 'CY', 100, '2019-04-01 13:42:26', '2019-04-11 04:24:58'),
('DN1891223232333', '1', '0276309981', '2018-03-07 07:31:46', '2019-04-17 09:52:11', '2024-03-07 07:31:46', 'DN', 80, '2019-03-07 07:32:47', '2019-04-11 04:27:02'),
('PV1890154879445', '7', '0714550591', '2018-09-12 17:00:00', '2019-09-12 17:00:00', '2024-09-12 17:00:00', 'PV', 80, '2019-04-08 08:02:22', '2019-04-17 11:42:06'),
('SV4890123456789', '5', '0798450951', '2018-03-06 17:00:00', '2019-11-13 17:00:00', '2024-03-06 17:00:00', 'SV', 80, '2019-04-01 13:40:48', '2019-04-22 03:26:38'),
('SV4900123456887', '4', '0257739351', '2018-12-12 17:00:00', '2019-10-15 17:00:00', '2024-12-12 17:00:00', 'SV', 80, '2019-04-08 02:24:12', '2019-04-20 16:28:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thiet_bi_yt`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `thiet_bi_yt`;
CREATE TABLE IF NOT EXISTS `thiet_bi_yt` (
  `IdTB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thiết bị y tế',
  `IdPB` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã phòng ban',
  `TenTB` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên thiết bị',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên thiết bị không dấu',
  `NSX` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nhà sản xuất',
  `NCU` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nhà cung ứng',
  `NgayNhap` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày nhập',
  `DonGiaNhap` int(10) UNSIGNED NOT NULL COMMENT 'Đơn giá nhập',
  `ChucNang` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chức năng',
  `PhanLoai` varchar(10000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phân loại để biết chức năng của thiết bị',
  `SoTB` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số thiết bị',
  `TinhTrangSD` tinyint(1) UNSIGNED NOT NULL COMMENT 'TinhTrangSD',
  `TTTB` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tình trạng sử dụng của thiết bị',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTB`),
  KEY `fk_thiet_bi_yt_IdPB` (`IdPB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `thiet_bi_yt`:
--   `IdPB`
--       `phong_ban` -> `IdPB`
--

--
-- Đang đổ dữ liệu cho bảng `thiet_bi_yt`
--

INSERT INTO `thiet_bi_yt` (`IdTB`, `IdPB`, `TenTB`, `TenKDau`, `NSX`, `NCU`, `NgayNhap`, `DonGiaNhap`, `ChucNang`, `PhanLoai`, `SoTB`, `TinhTrangSD`, `TTTB`, `created_at`, `updated_at`) VALUES
('01', '16', 'Giường bệnh', 'giuong_benh', 'sad', 'sds', '2019-03-18 17:00:00', 1000000, 'dfsf', 'giuong_benh', '01', 1, 'hoat_dong_tot', '2019-03-19 12:30:12', '2019-04-20 03:40:41'),
('02', '16', 'Giường bệnh', 'giuong_benh', 'dfsf', 'dfdf', '2019-03-18 17:00:00', 2000000, 'dgdgd', 'giuong_benh', '02', 1, 'hoat_dong_tot', '2019-03-19 12:30:12', '2019-04-20 03:40:53'),
('03', '17', 'Giường bệnh', 'giuong_benh', 'dfdfd', 'fdfd', '2019-03-19 12:28:38', 1000000, 'dfdf', 'giuong_benh', '01', 0, 'hoat_dong_tot', '2019-03-19 12:30:12', '2019-04-16 17:12:45'),
('04', '17', 'Giường bệnh', 'giuong_benh', 'sfsf', 'sfsdf', '2019-03-19 12:29:24', 1000000, 'gfgd', 'giuong_benh', '02', 1, 'hoat_dong_tot', '2019-03-19 12:30:12', '2019-03-27 16:33:01'),
('05', '18', 'Giường bệnh', 'giuong_benh', 'dgfdg', 'dgdg', '2019-03-19 12:34:31', 1000000, 'fsdf', 'giuong_benh', '01', 1, 'hoat_dong_tot', '2019-03-19 12:35:36', '2019-04-16 17:12:45'),
('06', '18', 'Giường bệnh', 'giuong_benh', 'gdgd', 'dgd', '2019-03-19 12:34:32', 1000000, 'sfsf', 'giuong_benh', '02', 1, 'hoat_dong_tot', '2019-03-19 12:35:36', '2019-04-16 14:05:58'),
('07', '19', 'Giường bệnh', 'giuong_benh', 'gdgd', 'dgdg', '2019-03-19 12:34:32', 1000000, 'dsfsdf', 'giuong_benh', '01', 0, 'hoat_dong_tot', '2019-03-19 12:35:37', '2019-04-16 17:08:33'),
('08', '19', 'Giường bệnh', 'giuong_benh', 'dgdg', 'gddgd', '2019-03-19 12:34:33', 1000000, 'fsfsf', 'giuong_benh', '02', 0, 'hoat_dong_tot', '2019-03-19 12:35:37', '2019-04-16 16:45:17'),
('09', '36', 'Giường bệnh', 'giuong_benh', 'fdgd', 'gdgdg', '2019-04-14 13:23:56', 1000000, 'dada', 'giuong_benh', '02', 1, 'hoat_dong_tot', '2019-04-14 13:26:27', '2019-04-14 15:42:25'),
('10', '36', 'Giường bệnh', 'giuong_benh', 'dgdg', 'gdgd', '2019-04-14 13:23:57', 1000000, 'adad', 'giuong_benh', '01', 0, 'hoat_dong_tot', '2019-04-14 13:26:07', '2019-04-14 13:26:27'),
('11', '37', 'Giường bệnh', 'giuong_benh', 'dgdg', 'dgdg', '2019-04-14 13:23:58', 1000000, 'dada', 'giuong_benh', '02', 1, 'hoat_dong_tot', '2019-04-14 13:26:27', '2019-04-14 15:43:03'),
('12', '37', 'Giường bệnh', 'giuong_benh', 'gddg', 'dggd', '2019-04-14 13:23:59', 1000000, 'adad', 'giuong_benh', '01', 0, 'hoat_dong_tot', '2019-04-14 13:26:27', '2019-04-14 13:26:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_ke`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `thong_ke`;
CREATE TABLE IF NOT EXISTS `thong_ke` (
  `IdTK` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã thống kê',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên thống kê',
  `PhanLoai` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Phân loại thống kê',
  `CD` mediumtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Chủ đề file)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTK`),
  KEY `fk_thong_ke_IdNV` (`IdNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `thong_ke`:
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `thong_ke`
--

INSERT INTO `thong_ke` (`IdTK`, `IdNV`, `PhanLoai`, `CD`, `created_at`, `updated_at`) VALUES
('0311741721', '0397501161', 'thong_ke', 'vccbcvbcb', '2019-04-27 06:02:07', '2019-04-27 06:02:07'),
('0490030521', '0647502631', 'thong_ke', 'jngjhgj', '2019-04-27 05:53:49', '2019-04-27 05:53:49'),
('0665929521', '0647502631', 'thong_ke', 'fhfh', '2019-04-27 06:06:24', '2019-04-27 06:06:24'),
('0828569161', '0647502631', 'thong_ke', 'fghfhfh', '2019-04-29 11:53:03', '2019-04-29 11:53:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tinh_tp`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `tinh_tp`;
CREATE TABLE IF NOT EXISTS `tinh_tp` (
  `IdTinh` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã tỉnh thành phố',
  `TenTinh` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tỉnh',
  `TenKDau` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên không dấu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTinh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `tinh_tp`:
--

--
-- Đang đổ dữ liệu cho bảng `tinh_tp`
--

INSERT INTO `tinh_tp` (`IdTinh`, `TenTinh`, `TenKDau`, `created_at`, `updated_at`) VALUES
('88', 'Kiên Giang', 'kien_giang', '2019-02-09 13:58:45', NULL),
('89', 'An Giang', 'an_giang', '2019-02-09 13:58:45', NULL),
('90', 'Đồng Tháp', 'dong_thap', '2019-03-28 04:24:04', '2019-03-28 04:24:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `toa_thuoc`
--
-- Tạo: Th9 23, 2019 lúc 07:48 AM
--

DROP TABLE IF EXISTS `toa_thuoc`;
CREATE TABLE IF NOT EXISTS `toa_thuoc` (
  `IdTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã toa thuốc ngoại trú hoặc nội trú',
  `TTLanhThuoc` tinyint(1) UNSIGNED NOT NULL COMMENT 'Tình trạng lãnh thuốc',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `toa_thuoc`:
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `toa_thuoc_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `toa_thuoc_ct`;
CREATE TABLE IF NOT EXISTS `toa_thuoc_ct` (
  `IdTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã đối tượng tham chiếu (toa thuốc ngoại trú hoặc nội trú chi tiết)',
  `IdThuoc` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã danh mục thuốc',
  `SoNgayDung` smallint(5) UNSIGNED NOT NULL COMMENT 'Số ngày dùng thuốc',
  `TST` smallint(5) UNSIGNED NOT NULL COMMENT 'Tổng số thuốc',
  `LieuDung` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Liều dùng trong ngày',
  `GhiChu` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTT`,`IdThuoc`),
  KEY `fk_toa_thuoc_ct_IdThuoc` (`IdThuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `toa_thuoc_ct`:
--   `IdTT`
--       `toa_thuoc` -> `IdTT`
--   `IdThuoc`
--       `danh_muc_thuoc` -> `IdThuoc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `toa_thuoc_vs_benh_an_ngoai_tru`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `toa_thuoc_vs_benh_an_ngoai_tru`;
CREATE TABLE IF NOT EXISTS `toa_thuoc_vs_benh_an_ngoai_tru` (
  `IdTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã toa thuốc ngoại trú',
  `IdBANgoaiT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án ngoại trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTT`,`IdBANgoaiT`),
  KEY `fk_toa_thuoc_vs_benh_an_ngoai_tru_IdBANgoaiT` (`IdBANgoaiT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `toa_thuoc_vs_benh_an_ngoai_tru`:
--   `IdBANgoaiT`
--       `benh_an_ngoai_tru` -> `IdBANgoaiT`
--   `IdTT`
--       `toa_thuoc` -> `IdTT`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `toa_thuoc_vs_benh_an_noi_tru_ct`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `toa_thuoc_vs_benh_an_noi_tru_ct`;
CREATE TABLE IF NOT EXISTS `toa_thuoc_vs_benh_an_noi_tru_ct` (
  `IdTT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã toa thuốc nội trú',
  `IdBACT` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã bệnh án nội trú',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`IdTT`,`IdBACT`),
  KEY `fk_toa_thuoc_vs_benh_an_noi_tru_ct_IdBACT` (`IdBACT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `toa_thuoc_vs_benh_an_noi_tru_ct`:
--   `IdBACT`
--       `benh_an_noi_tru_ct` -> `IdBACT`
--   `IdTT`
--       `toa_thuoc` -> `IdTT`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--
-- Tạo: Th9 23, 2019 lúc 07:51 AM
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã người dùng',
  `IdNV` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Quyen` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Quyền người dùng',
  `TrangThai` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Trang thái người dùng',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Ngày cập nhật',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `fk_user_IdNV` (`IdNV`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- RELATIONSHIPS FOR TABLE `users`:
--   `IdNV`
--       `nhan_vien` -> `IdNV`
--

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `IdNV`, `name`, `email`, `email_verified_at`, `password`, `Quyen`, `TrangThai`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, '9999999999', 'bui_van_kien', 'duongthanhqui1997@gmail.com', '2019-03-17 10:32:09', '$2y$10$H.kjp20hIMwrw8JzOCUOOOCOI5wJuBTDZ7enWbzEZ6sgxCyGwUDt6', 'admin', 'dang_nhap', 'jvLrGeL2UzorgcmX5DbinQwYhllRhzVeLznn8jnTPulmEDpXHoNnyB4FYcEV', '2019-03-15 21:13:28', '2020-03-07 07:39:00'),
(5, '9090909099', 'bui_van_man', '123@456.com', '2019-03-17 10:32:05', '$2y$10$4FjXqYxjA2q/Vh594P612O.kzlpqFHEx.TyJcTQVmtEYzHfXFEpb.', 'hc', 'dang_nhap', 'nDLexiFaPGxS9JEvSn6tFbQXbSQ8YFNNaSFyORIWnfFRNIzYDJZeKAYXSQii', '2019-03-17 10:32:05', '2019-04-28 05:55:34'),
(6, '0419628061', 'bui_van_minh', '456@456.com', '2019-03-17 12:33:01', '$2y$10$MeHog4fcmmluLlPHuT25.OBX.YTfAlxb7ILWbWPFxNwWyTRJS7xum', 'bsk', 'dang_xuat', 'rEAPFIrcXZAZekE88HXyW7wlUaj2mXUtwh1fAfFY0UOeWzi2QFRbm2jL2r9c', '2019-03-17 12:33:01', '2020-03-07 05:53:41'),
(7, '0795254241', 'bui_van_toan', '111@123.com', '2019-03-17 12:38:46', '$2y$10$CC930Yxh980uOvOToDxTLOgf08Et.d6l/phEW6lCUu1qKn30kHWhy', 'tdkb', 'dang_nhap', 'J8XFQ1w7nhrfSz93kMBX27Rp34WVsfklMZBKWQvVDf6EzCYiiiFxfRflJx2V', '2019-03-17 12:38:46', '2019-09-28 09:13:11'),
(14, '0167027221', 'bui_van_banh', '333@123.com', '2019-03-17 11:24:20', '$2y$10$S5o/.f5nbQB5zoNWcfSVHu3EvpRiwNa.lintooU4V/1mIEG/R/ikC', 'bskt', 'dang_xuat', 'eXlN1WPBn3NWeH8ag963oa4jTi3zJJ3I7a55R7dGbX3Vg5x70YxYko4pdI2N', '2019-03-25 02:57:20', '2019-05-02 02:50:09'),
(16, '0497723751', 'bui_van_em', '235@123.com', '2019-03-17 11:45:36', '$2y$10$0ya/CM1ovnLkIIAVQgXK1eyifXsj3qpwpy502.RDhDQzGsv57AbAi', 'tdcc', 'dang_xuat', 'UPk0vwZJwWbAk9JUvnbFR6N7gLD0lYYvDjtZhe56DFBkilWwXfIwiqgcW9MK', '2019-03-25 05:07:03', '2019-05-04 02:02:33'),
(17, '0353870871', 'bui_van_tri', '321@123.com', '2019-03-17 11:23:29', '$2y$10$Jajo0QDyNLgwgP.y4YsNS.xdojM7oy2aKyYQ.aqyi6qZUc3TNhv1a', 'bsk', 'dang_xuat', '2cooLNKKGwRWuRdR4RRdavw2qaMQqqD1aqLynUL85QWmh5NG9hZsGogA7Fkw', '2019-03-27 09:33:01', '2019-05-04 01:45:30'),
(18, '0140674231', 'bui_van_chung', '222@123.com', '2019-03-17 11:46:10', '$2y$10$eEC8ALDsd3eBe4xLdERVxu28erhHWl3e/ul13ePjmntXyRM2lKCkK', 'pt', 'dang_nhap', 'uordX1UYMYD4CLop8f4GXPRI4Eatj1vFk3GDcm4ltrUMhFnavPT9pE1FO2qq', '2019-04-04 11:02:43', '2019-04-04 15:14:15'),
(19, '0094497701', 'bui_van_hanh', '456@123.com', '2019-03-17 11:48:54', '$2y$10$U6a/b9odt3Phsu0Tsno8U.Yt872L21x71zIp5KzYIcNCse7UQJgpi', 'kt', 'dang_xuat', '8M1KngnWxjCTwLPfFL3y3nl6meaSpK9vhaandWekLu9Haw2KTa9nqnmeUcCZ', '2019-04-06 04:49:07', '2019-05-04 05:56:40'),
(20, '0118316881', 'bui_van_liem', '777@123.com', '2019-03-17 12:20:33', '$2y$10$U6a/b9odt3Phsu0Tsno8U.Yt872L21x71zIp5KzYIcNCse7UQJgpi', 'bscc', 'dang_xuat', 'iutivb5qW11wwfnhYX6WPx9m5KFW0Ddn0ano9ZBOPQkS4ivE0pRQlxLuYsC4', '2019-04-08 08:05:14', '2019-05-04 01:57:10'),
(21, '0935182761', 'bui_van_lan', '888@123.com', '2019-04-14 02:59:25', '$2y$10$Sc.dy89kc.lo9H4xwOEdfO2pY7UnhdXq2CcIHfTT7XPnbFGQ0LmBa', 'bsk', 'dang_xuat', '0LKPlrzJDzVZ6Nx5VTcpZpfQE0tZvSNDszheggWf50L1dNXkxThoJnecSwNX', '2019-04-14 03:00:47', '2019-05-04 01:44:53'),
(27, '0543248151', 'bui_van_lien', '555@123.com', '2019-03-17 12:10:23', '$2y$10$XkW4yJFs2z3y7qhTj4WM1eHMWriV1r5i8aFaQpKm/xf6Vk.GWYbzy', 'kt', 'dang_xuat', NULL, '2019-04-22 16:10:54', '2019-04-22 16:10:54'),
(28, '0397501161', 'bui_van_trung', '999@123.com', '2019-04-24 11:43:07', '$2y$10$y7TaNOt3YVfzp5.n1IBaXeTnChw60J5skVWXpI9xraAEqtye9NVZS', 'hc', 'dang_xuat', '5k6vtlR03iKlohQWggM0UwNuxZoWQ73QsMy31BprPnVfelqSU9wROubIIOYl', '2019-04-24 11:57:03', '2019-05-04 01:38:49'),
(29, '0647502631', 'bui_van_an', '666@123.com', '2019-04-24 12:03:43', '$2y$10$9UGPzlc5e0haGRvva0jyUe47n8oECrdFBEV6yBJknZVWlUV4q0wAG', 'hc', 'dang_xuat', 'cCCWP3o4pRJQLZ7AM8NQFnOGt07xTDX2lILmO7hoRpEtIv7JsnBBmAXbJqMm', '2019-04-24 12:04:27', '2019-05-04 06:12:36'),
(30, '0789446601', 'bui_van_tuan', '777@999.com', '2019-04-25 09:01:10', '$2y$10$B7UexoEeV9JMDjvIo3MxjeONT.cX1WxPD7y2PEB.RyyJT.qKOMrv6', 'bsk', 'dang_xuat', 'v9oaxKG8Mq9ufuXYIa7QzzgjCFVqKnVjFLzMmuyWSV9jjCqzAYh2CRgkYHlg', '2019-04-25 09:03:26', '2019-05-04 01:44:37'),
(31, '0442117871', 'bui_thi_anh', '999@999.com', '2019-04-25 08:58:06', '$2y$10$QIPBWA4IcnR6JEo2CRZA..0EyWGPkNt.oaUcTBL0h5KJ7psxWgXrK', 'bsk', 'dang_nhap', 's2zMtYs3zmA7R7tthohI6cW0iOMLdcqfAKkfGMVfPDjQlY3rJ8HOQQzTP1CB', '2019-04-25 09:17:31', '2019-04-26 11:50:22'),
(33, '0804895611', 'bui_van_an', '444@123.com', '2019-03-17 11:25:48', '$2y$10$PdfDB/baC7qX0Dxc3x5eeeNT8Lon6sbqEts/WJpwuD99tTp1rcW3K', 'bskt', 'dang_xuat', NULL, '2019-04-26 11:06:58', '2019-04-26 11:06:58');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `anh_cls`
--
ALTER TABLE `anh_cls`
  ADD CONSTRAINT `fk_anh_cls_IdKQCLS` FOREIGN KEY (`IdKQCLS`) REFERENCES `ket_qua_cls` (`IdKQCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ba_nv`
--
ALTER TABLE `ba_nv`
  ADD CONSTRAINT `fk_ba_nv_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ba_nv_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_an_ngoai_tru`
--
ALTER TABLE `benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_benh_an_ngoai_tru_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_an_ngoai_tru_vs_can_lam_sang`
--
ALTER TABLE `benh_an_ngoai_tru_vs_can_lam_sang`
  ADD CONSTRAINT `fk_benh_an_ngoai_tru_vs_can_lam_sang_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_benh_an_ngoai_tru_vs_can_lam_sang_IdCLS` FOREIGN KEY (`IdCLS`) REFERENCES `can_lam_sang` (`IdCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_an_noi_tru`
--
ALTER TABLE `benh_an_noi_tru`
  ADD CONSTRAINT `fk_benh_an_noi_tru_IdGiuong` FOREIGN KEY (`IdGiuong`) REFERENCES `thiet_bi_yt` (`IdTB`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_benh_an_noi_tru_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_an_noi_tru_ct`
--
ALTER TABLE `benh_an_noi_tru_ct`
  ADD CONSTRAINT `fk_benh_an_noi_tru_ct_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_an_noi_tru_ct_vs_can_lam_sang`
--
ALTER TABLE `benh_an_noi_tru_ct_vs_can_lam_sang`
  ADD CONSTRAINT `fk_benh_an_noi_tru_ct_vs_can_lam_sang_IdBACT` FOREIGN KEY (`IdBACT`) REFERENCES `benh_an_noi_tru_ct` (`IdBACT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_benh_an_noi_tru_ct_vs_can_lam_sang_IdCLS` FOREIGN KEY (`IdCLS`) REFERENCES `can_lam_sang` (`IdCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `benh_nhan`
--
ALTER TABLE `benh_nhan`
  ADD CONSTRAINT `fk_benh_nhan_IdXa` FOREIGN KEY (`IdXa`) REFERENCES `phuong_xa` (`IdXa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `can_lam_sang`
--
ALTER TABLE `can_lam_sang`
  ADD CONSTRAINT `fk_can_lam_sang_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_can_lam_sang_IdPB` FOREIGN KEY (`IdPB`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cap_them_quyen_user`
--
ALTER TABLE `cap_them_quyen_user`
  ADD CONSTRAINT `fk_cap_them_quyen_user_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cap_them_quyen_user_ct`
--
ALTER TABLE `cap_them_quyen_user_ct`
  ADD CONSTRAINT `fk_cap_them_quyen_user_ct_IdCQ` FOREIGN KEY (`IdCQ`) REFERENCES `cap_them_quyen_user` (`IdCQ`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `cham_cong_nv`
--
ALTER TABLE `cham_cong_nv`
  ADD CONSTRAINT `fk_cham_cong_nv_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chi_dinh_pt`
--
ALTER TABLE `chi_dinh_pt`
  ADD CONSTRAINT `fk_chi_dinh_pt_IdBACT` FOREIGN KEY (`IdBACT`) REFERENCES `benh_an_noi_tru_ct` (`IdBACT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_pt_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_pt_IdNVTH` FOREIGN KEY (`IdNVTH`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_pt_IdPB` FOREIGN KEY (`IdPB`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chi_dinh_tt`
--
ALTER TABLE `chi_dinh_tt`
  ADD CONSTRAINT `fk_chi_dinh_tt_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_tt_IdNVTH` FOREIGN KEY (`IdNVTH`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_tt_IdPB` FOREIGN KEY (`IdPB`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chi_dinh_tt_vs_benh_an_ngoai_tru`
--
ALTER TABLE `chi_dinh_tt_vs_benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_chi_dinh_tt_vs_benh_an_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_tt_vs_benh_an_ngoai_tru_IdThuThuat` FOREIGN KEY (`IdThuThuat`) REFERENCES `chi_dinh_tt` (`IdThuThuat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chi_dinh_tt_vs_benh_an_noi_tru_ct`
--
ALTER TABLE `chi_dinh_tt_vs_benh_an_noi_tru_ct`
  ADD CONSTRAINT `fk_chi_dinh_tt_vs_benh_an_noi_tru_ct_IdBACT` FOREIGN KEY (`IdBACT`) REFERENCES `benh_an_noi_tru_ct` (`IdBACT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chi_dinh_tt_vs_benh_an_noi_tru_ct_IdThuThuat` FOREIGN KEY (`IdThuThuat`) REFERENCES `chi_dinh_tt` (`IdThuThuat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chuan_doan_vs_benh_an_ngoai_tru`
--
ALTER TABLE `chuan_doan_vs_benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_chuan_doan_vs_benh_an_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chuan_doan_vs_benh_an_ngoai_tru_IdBenh` FOREIGN KEY (`IdBenh`) REFERENCES `danh_muc_benh` (`IdBenh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chuan_doan_vs_benh_an_noi_tru`
--
ALTER TABLE `chuan_doan_vs_benh_an_noi_tru`
  ADD CONSTRAINT `fk_chuan_doan_vs_benh_an_noi_tru_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chuan_doan_vs_benh_an_noi_tru_IdBenh` FOREIGN KEY (`IdBenh`) REFERENCES `danh_muc_benh` (`IdBenh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chuan_doan_vs_ket_qua_cls`
--
ALTER TABLE `chuan_doan_vs_ket_qua_cls`
  ADD CONSTRAINT `fk_chuan_doan_vs_ket_qua_cls_IdBenh` FOREIGN KEY (`IdBenh`) REFERENCES `danh_muc_benh` (`IdBenh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chuan_doan_vs_ket_qua_cls_IdKQCLS` FOREIGN KEY (`IdKQCLS`) REFERENCES `ket_qua_cls` (`IdKQCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chuc_vu_vs_nv`
--
ALTER TABLE `chuc_vu_vs_nv`
  ADD CONSTRAINT `fk_chuc_vu_vs_nv_IdCV` FOREIGN KEY (`IdCV`) REFERENCES `chuc_vu` (`IdCV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_chuc_vu_vs_nv_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danh_muc_benh_vs_khoa`
--
ALTER TABLE `danh_muc_benh_vs_khoa`
  ADD CONSTRAINT `fk_danh_muc_benh_vs_khoa_IdBenh` FOREIGN KEY (`IdBenh`) REFERENCES `danh_muc_benh` (`IdBenh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_danh_muc_benh_vs_khoa_IdKhoa` FOREIGN KEY (`IdKhoa`) REFERENCES `khoa` (`IdKhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danh_muc_benh_vs_thuoc`
--
ALTER TABLE `danh_muc_benh_vs_thuoc`
  ADD CONSTRAINT `fk_danh_muc_benh_vs_thuoc_IdBenh` FOREIGN KEY (`IdBenh`) REFERENCES `danh_muc_benh` (`IdBenh`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_danh_muc_benh_vs_thuoc_IdThuoc` FOREIGN KEY (`IdThuoc`) REFERENCES `danh_muc_thuoc` (`IdThuoc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `danh_muc_cls_vs_khoa`
--
ALTER TABLE `danh_muc_cls_vs_khoa`
  ADD CONSTRAINT `fk_danh_muc_cls_vs_khoa_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_danh_muc_cls_vs_khoa_IdKhoa` FOREIGN KEY (`IdKhoa`) REFERENCES `khoa` (`IdKhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `duyet_tk`
--
ALTER TABLE `duyet_tk`
  ADD CONSTRAINT `fk_duyet_tk_IdCV` FOREIGN KEY (`IdTK`) REFERENCES `thong_ke` (`IdTK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_duyet_tk_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `file_tk`
--
ALTER TABLE `file_tk`
  ADD CONSTRAINT `fk_file_tk_IdTK` FOREIGN KEY (`IdTK`) REFERENCES `thong_ke` (`IdTK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giay_chuyen_vien_vs_benh_an_ngoai_tru`
--
ALTER TABLE `giay_chuyen_vien_vs_benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_giay_chuyen_vien_vs_benh_an_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giay_chuyen_vien_vs_benh_an_noi_tru`
--
ALTER TABLE `giay_chuyen_vien_vs_benh_an_noi_tru`
  ADD CONSTRAINT `fk_giay_chuyen_vien_vs_benh_an_noi_tru_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giay_ra_vien`
--
ALTER TABLE `giay_ra_vien`
  ADD CONSTRAINT `fk_giay_ra_vien_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoa_don_dv_ngoai_tru`
--
ALTER TABLE `hoa_don_dv_ngoai_tru`
  ADD CONSTRAINT `fk_hoa_don_dv_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hoa_don_dv_ngoai_tru_IdNVLap` FOREIGN KEY (`IdNVLap`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoa_don_dv_noi_tru`
--
ALTER TABLE `hoa_don_dv_noi_tru`
  ADD CONSTRAINT `fk_hoa_don_dv_noi_tru_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hoa_don_dv_noi_tru_IdNVLap` FOREIGN KEY (`IdNVLap`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ket_luan_cls`
--
ALTER TABLE `ket_luan_cls`
  ADD CONSTRAINT `fk_ket_luan_cls_IdKQCLS` FOREIGN KEY (`IdKQCLS`) REFERENCES `ket_qua_cls` (`IdKQCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ket_qua_cls`
--
ALTER TABLE `ket_qua_cls`
  ADD CONSTRAINT `fk_ket_qua_cls_IdCLS` FOREIGN KEY (`IdCLS`) REFERENCES `can_lam_sang` (`IdCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ket_qua_cls_IdNVTH` FOREIGN KEY (`IdNVTH`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ket_qua_cls_ct`
--
ALTER TABLE `ket_qua_cls_ct`
  ADD CONSTRAINT `fk_ket_qua_cls_ct_IdKQCLS` FOREIGN KEY (`IdKQCLS`) REFERENCES `ket_qua_cls` (`IdKQCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD CONSTRAINT `fk_nhan_vien_IdPB` FOREIGN KEY (`IdPB`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nhan_vien_IdXa` FOREIGN KEY (`IdXa`) REFERENCES `phuong_xa` (`IdXa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `fk_password_resets_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_dk_kham`
--
ALTER TABLE `phieu_dk_kham`
  ADD CONSTRAINT `fk_phieu_dk_kham_IdBN` FOREIGN KEY (`IdBN`) REFERENCES `benh_nhan` (`IdBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_dk_kham_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_dk_kham_IdPK` FOREIGN KEY (`IdPK`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_dk_kham_vs_benh_an_ngoai_tru`
--
ALTER TABLE `phieu_dk_kham_vs_benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_phieu_dk_kham_vs_benh_an_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_dk_kham_vs_benh_an_ngoai_tru_IdPhieuDKKB` FOREIGN KEY (`IdPhieuDKKB`) REFERENCES `phieu_dk_kham` (`IdPhieuDKKB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_dk_kham_vs_benh_an_noi_tru`
--
ALTER TABLE `phieu_dk_kham_vs_benh_an_noi_tru`
  ADD CONSTRAINT `fk_phieu_dk_kham_vs_benh_an_noi_tru_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_dk_kham_vs_benh_an_noi_tru_IdPhieuDKKB` FOREIGN KEY (`IdPhieuDKKB`) REFERENCES `phieu_dk_kham` (`IdPhieuDKKB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_ngoai_tru`
--
ALTER TABLE `phieu_ke_khai_vpct_ngoai_tru`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_ngoai_tru_IdPKK` FOREIGN KEY (`IdPKK`) REFERENCES `phieu_ke_khai_vp_ngoai_tru` (`IdPKK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`
--
ALTER TABLE `phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_cls_IdPKKCT` FOREIGN KEY (`IdPKKCT`) REFERENCES `phieu_ke_khai_vpct_ngoai_tru` (`IdPKKCT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc`
--
ALTER TABLE `phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc_IdPKKCT` FOREIGN KEY (`IdPKKCT`) REFERENCES `phieu_ke_khai_vpct_ngoai_tru` (`IdPKKCT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_ngoai_vs_danh_muc_thuoc_IdThuoc` FOREIGN KEY (`IdThuoc`) REFERENCES `danh_muc_thuoc` (`IdThuoc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_noi_tru`
--
ALTER TABLE `phieu_ke_khai_vpct_noi_tru`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_noi_tru_IdPKK` FOREIGN KEY (`IdPKK`) REFERENCES `phieu_ke_khai_vp_noi_tru` (`IdPKK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`
--
ALTER TABLE `phieu_ke_khai_vpct_noi_vs_danh_muc_cls`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_cls_IdDMCLS` FOREIGN KEY (`IdDMCLS`) REFERENCES `danh_muc_cls` (`IdDMCLS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_cls_IdPKKCT` FOREIGN KEY (`IdPKKCT`) REFERENCES `phieu_ke_khai_vpct_noi_tru` (`IdPKKCT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`
--
ALTER TABLE `phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc`
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc_IdPKKCT` FOREIGN KEY (`IdPKKCT`) REFERENCES `phieu_ke_khai_vpct_noi_tru` (`IdPKKCT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_phieu_ke_khai_vpct_noi_vs_danh_muc_thuoc_IdThuoc` FOREIGN KEY (`IdThuoc`) REFERENCES `danh_muc_thuoc` (`IdThuoc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vp_ngoai_tru`
--
ALTER TABLE `phieu_ke_khai_vp_ngoai_tru`
  ADD CONSTRAINT `fk_phieu_ke_khai_vp_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phieu_ke_khai_vp_noi_tru`
--
ALTER TABLE `phieu_ke_khai_vp_noi_tru`
  ADD CONSTRAINT `fk_phieu_ke_khai_vp_noi_tru_IdBANoiT` FOREIGN KEY (`IdBANoiT`) REFERENCES `benh_an_noi_tru` (`IdBANoiT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phong_ban`
--
ALTER TABLE `phong_ban`
  ADD CONSTRAINT `fk_phong_ban_IdKhoa` FOREIGN KEY (`IdKhoa`) REFERENCES `khoa` (`IdKhoa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `phuong_xa`
--
ALTER TABLE `phuong_xa`
  ADD CONSTRAINT `fk_phuong_xa_IdHuyen` FOREIGN KEY (`IdHuyen`) REFERENCES `quan_huyen` (`IdHuyen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ql_phan_hoi`
--
ALTER TABLE `ql_phan_hoi`
  ADD CONSTRAINT `fk_ql_phan_hoi_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ql_thao_tac`
--
ALTER TABLE `ql_thao_tac`
  ADD CONSTRAINT `fk_ql_thao_tac_IdQLTTCT` FOREIGN KEY (`IdQLTTCT`) REFERENCES `ql_truy_cap_ct` (`IdQLTTCT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ql_truy_cap`
--
ALTER TABLE `ql_truy_cap`
  ADD CONSTRAINT `fk_ql_truy_cap_IdUser` FOREIGN KEY (`IdUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `ql_truy_cap_ct`
--
ALTER TABLE `ql_truy_cap_ct`
  ADD CONSTRAINT `fk_ql_truy_cap_ct_IdQLTT` FOREIGN KEY (`IdQLTT`) REFERENCES `ql_truy_cap` (`IdQLTT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `quan_huyen`
--
ALTER TABLE `quan_huyen`
  ADD CONSTRAINT `fk_quan_huyen_IdTinh` FOREIGN KEY (`IdTinh`) REFERENCES `tinh_tp` (`IdTinh`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tam_ung_cls`
--
ALTER TABLE `tam_ung_cls`
  ADD CONSTRAINT `fk_tam_ung_IdCLS` FOREIGN KEY (`IdCLS`) REFERENCES `can_lam_sang` (`IdCLS`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tam_ung_pt`
--
ALTER TABLE `tam_ung_pt`
  ADD CONSTRAINT `fk_tam_ung_IdPT` FOREIGN KEY (`IdPT`) REFERENCES `chi_dinh_pt` (`IdPT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tam_ung_tt`
--
ALTER TABLE `tam_ung_tt`
  ADD CONSTRAINT `fk_tam_ung_IdThuThuat` FOREIGN KEY (`IdThuThuat`) REFERENCES `chi_dinh_tt` (`IdThuThuat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `the_bhyt`
--
ALTER TABLE `the_bhyt`
  ADD CONSTRAINT `fk_the_bhyt_IdBN` FOREIGN KEY (`IdBN`) REFERENCES `benh_nhan` (`IdBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_the_bhyt_IdCSKBHYT` FOREIGN KEY (`IdCSKBHYT`) REFERENCES `co_so_kham_bhyt` (`IdCSKBHYT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thiet_bi_yt`
--
ALTER TABLE `thiet_bi_yt`
  ADD CONSTRAINT `fk_thiet_bi_yt_IdPB` FOREIGN KEY (`IdPB`) REFERENCES `phong_ban` (`IdPB`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thong_ke`
--
ALTER TABLE `thong_ke`
  ADD CONSTRAINT `fk_thong_ke_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `toa_thuoc_ct`
--
ALTER TABLE `toa_thuoc_ct`
  ADD CONSTRAINT `fk_toa_thuoc_ct_IdTT` FOREIGN KEY (`IdTT`) REFERENCES `toa_thuoc` (`IdTT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_toa_thuoc_ct_IdThuoc` FOREIGN KEY (`IdThuoc`) REFERENCES `danh_muc_thuoc` (`IdThuoc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `toa_thuoc_vs_benh_an_ngoai_tru`
--
ALTER TABLE `toa_thuoc_vs_benh_an_ngoai_tru`
  ADD CONSTRAINT `fk_toa_thuoc_vs_benh_an_ngoai_tru_IdBANgoaiT` FOREIGN KEY (`IdBANgoaiT`) REFERENCES `benh_an_ngoai_tru` (`IdBANgoaiT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_toa_thuoc_vs_benh_an_ngoai_tru_IdTT` FOREIGN KEY (`IdTT`) REFERENCES `toa_thuoc` (`IdTT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `toa_thuoc_vs_benh_an_noi_tru_ct`
--
ALTER TABLE `toa_thuoc_vs_benh_an_noi_tru_ct`
  ADD CONSTRAINT `fk_toa_thuoc_vs_benh_an_noi_tru_ct_IdBACT` FOREIGN KEY (`IdBACT`) REFERENCES `benh_an_noi_tru_ct` (`IdBACT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_toa_thuoc_vs_benh_an_noi_tru_ct_IdTT` FOREIGN KEY (`IdTT`) REFERENCES `toa_thuoc` (`IdTT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_user_IdNV` FOREIGN KEY (`IdNV`) REFERENCES `nhan_vien` (`IdNV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
