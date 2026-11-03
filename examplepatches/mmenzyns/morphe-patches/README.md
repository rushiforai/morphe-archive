# 🛍️ Menzac Patches — Alza Hlídač shopů (CZ / SK)

[![Latest Release](https://img.shields.io/github/v/release/mmenzyns/morphe-patches?color=00A651&logo=github&label=Release)](https://github.com/mmenzyns/morphe-patches/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Compatible App](https://img.shields.io/badge/App-Alza.cz%20%2F%20Alza.sk-00A651.svg)](https://play.google.com/store/apps/details?id=cz.alza.eshop)
[![Powered by](https://img.shields.io/badge/Powered%20by-Hlídač%20shopů-FF5E00.svg)](https://www.hlidacshopu.cz/)

Custom [Morphe](https://github.com/MorpheApp) patch bundle providing native, hardware-accelerated price history charts and real discount tracking from [Hlídač shopů](https://www.hlidacshopu.cz/) inside the official **Alza** Android app (`cz.alza.eshop`).

Supports both **Czech Republic** (`alza.cz`, CZK) and **Slovakia** (`alza.sk`, EUR).

---

## ❓ About

E-shops often advertise discounts that are calculated from artificial, inflated prices. **Hlídač shopů** (Shop Watcher) is an independent non-profit consumer transparency project developed by TopMonks, Apify, and Keboola that monitors long-term historical prices across Czech and Slovak e-commerce sites.

This patch bundle seamlessly integrates Hlídač shopů directly into Alza's native Jetpack Compose user interface, allowing shoppers to verify real discounts before buying without ever having to leave the app.

---

## ✨ Features

- **📈 Inline Price History Chart (Nativní graf historie cen)**
  - Seamlessly embedded into Alza's product detail view using native Jetpack Compose `AndroidView`.
  - Displays up to 365 days of price history, tracking both selling price and former crossed-out price curves.
  - Interactive: tap on the chart to open the product's full page on `hlidacshopu.cz`.
  - Can be collapsed into a compact bar or expanded to full view.
- **🎯 Genuine Discount Calculation (Skutečná sleva dle EU směrnice)**
  - Calculates real discount percentage according to the EU Omnibus Directive (based on the lowest price in the last 30 days before the discount).
  - Unmasks fake sales and misleading crossed-out baseline prices.
- **⚡ Compact Mode (Kompaktní režim)**
  - Replaces intrusive third-party loan/installment financing (HomeCredit) with a clean, responsive price badge and mini-chart placed directly beside the price tag.
  - Automatically adapts to different screen sizes and display densities without wrapping awkwardly.
- **🇨🇿 / 🇸🇰 Czech Republic & Slovakia Support**
  - Automatically identifies whether the current product is on `alza.cz` (CZK) or `alza.sk` (EUR).
  - Full localization support for both Czech and Slovak languages.
- **⚙️ Integrated In-App Settings (Nastavení v aplikaci)**
  - Manage patch options directly within the Alza app under **Menu → Nastavení a zabezpečení**.
  - Toggle **Kompaktní režim (Compact Mode)** on or off anytime on the fly without needing to re-patch the APK.

---

## 📲 How to Use

### 1. Add to Morphe Manager

Tap the button below on your Android device to add this repository directly into **Morphe Manager**:

<a href="https://morphe.software/add-source?github=mmenzyns/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or manually add the source in **Morphe Manager** (`Settings → Sources → Add Source`):
```
https://github.com/mmenzyns/morphe-patches
```

### 2. Patch the Alza App

1. In Morphe Manager, select the **Alza** app (`cz.alza.eshop`).
2. Ensure you have a supported version installed (see list below).
3. Select the patch **Alza Hlídač shopů Price History (CZ / SK)**.
4. Tap **Patch** and install the resulting APK.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.10](https://github.com/mmenzyns/morphe-patches/releases/tag/v1.6.10)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Alza&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `cz.alza.eshop`

**🎯 Supported versions:**

| 2026.21.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Alza Hlídač shopů Price History (CZ / SK)](#alza-hl-da-shop-price-history-cz-sk) | Displays inline price history chart from Hlídač shopů in product detail screen for Czech Republic and Slovakia (alza.cz / alza.sk). Includes compact mode replacing HomeCredit installments and settings in Menu. |  |

</details>

<!-- PATCHES_END -->

---

## 🛠️ Building locally

To compile and package the patch bundle locally:

```bash
# Clone the repository
git clone https://github.com/mmenzyns/morphe-patches.git
cd morphe-patches

# Build the Android patch bundle (.mpp)
./gradlew :patches:buildAndroid
```

The resulting patch bundle will be located at:
```
patches/build/libs/patches-*.mpp
```

You can test and apply the `.mpp` bundle using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) or the Morphe CLI.

For more details, visit the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

---

## 📜 License & Credits

- Price history data and methodology provided by [Hlídač shopů](https://www.hlidacshopu.cz/) (licensed under creative/open terms).
- Patches and extension code developed by [Mark Menzynski](https://github.com/mmenzyns).
- This project is open-source software licensed under the [GNU General Public License v3.0](LICENSE).
