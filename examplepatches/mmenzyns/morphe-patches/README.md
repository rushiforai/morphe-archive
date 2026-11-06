# 🛍️ Menzac Patches — Alza Enhancements (CZ / SK)

[![Latest Release](https://img.shields.io/github/v/release/mmenzyns/morphe-patches?color=00A651&logo=github&label=Release)](https://github.com/mmenzyns/morphe-patches/releases)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Compatible App](https://img.shields.io/badge/App-Alza.cz%20%2F%20Alza.sk-00A651.svg)](https://play.google.com/store/apps/details?id=cz.alza.eshop)
[![Powered by](https://img.shields.io/badge/Powered%20by-Hlídač%20shopů%20%26%20FxAlza-FF5E00.svg)](https://www.hlidacshopu.cz/)

Custom [Morphe](https://github.com/MorpheApp) patch bundle for the official **Alza** Android app (`cz.alza.eshop`), providing price history charts from [Hlídač shopů](https://www.hlidacshopu.cz/), an instant comparator for loyalty benefit prices (Gold, Silver, ISIC, B2B), and enhanced smart link sharing with [fxalza.cz](https://fxalza.cz/).

Supports both **Czech Republic** (`alza.cz`, CZK) and **Slovakia** (`alza.sk`, EUR).

---

## 📦 Features & Included Patches

### 1. 📈 Alza Hlídač shopů Price History (CZ / SK)
- **Nativní graf historie cen (Hlídač shopů)**: Přímo do detailu produktu vkládá hardwarově akcelerovaný interaktivní graf vývoje cen za posledních 365 dní.
- **Výpočet reálné slevy (EU Omnibus směrnice)**: Odhaluje uměle navýšené původní ceny a počítá skutečnou slevu z nejnižší ceny za posledních 30 dní před akcí.
- **3 režimy zobrazení v nastavení**:
  - **Vypnuto**: Graf je zcela skryt a zobrazuje se původní rozvržení Alzy.
  - **Velký**: Velký interaktivní graf pod cenovkou s možností sbalení.
  - **Kompaktní**: Nahrazuje nabídku splátek (HomeCredit) elegantním mini-grafem přímo vedle cenovky s přesným lícováním.

---

### 2. 🏷️ Alza Benefit Prices (CZ / SK)
- **Srovnávač věrnostních a partnerských ceníků**: Přímo v detailu produktu zobrazuje tlačítko s cenovým štítkem (např. *GOLD: 3 199 Kč* nebo *Stejná cena*) a po kliknutí otevírá dialog s kompletní tabulkou všech úrovní:
  - **Gold, Silver, ISIC, Bronze, B2B a Basic**.
- **Chytré seskupování ceníků**: Automaticky sdružuje úrovně se shodnou cenou (např. *Gold + Silver* nebo *OSTATNÍ*) pro maximální přehlednost.
- **Automatické započítání promo akcí**: Podpora pro **AlzaPlus+**, slevové kupóny, cashback a výkupní bonus s interaktivními přepínači přímo v dialogu.
- **Jednoklikové kopírování**:
  - *Kopírovat nabídku*: Zkopíruje kompletní strukturovaný přehled cen všech úrovní s odkazem.
  - *Kopírovat odkaz*: Zkopíruje čistou URL adresu produktu (případně FxAlza odkaz).

---

### 3. 🔗 Alza Smart Link Sharing (FxAlza & Clean) (CZ / SK)
- **Podpora FxAlza odkazů (`fxalza.cz` / `sk.fxalza.cz`)**:
  - Přepisuje sdílené a kopírované odkazy z `alza.cz` na `fxalza.cz` (resp. `sk.fxalza.cz`), což vytváří nádherné a bohaté náhledy (embedy s fotkou a aktuální cenou) na Discordu, Telegramu, WhatsAppu i dalších sítích.
- **Odstranění reklamního textu (Čisté odkazy)**:
  - Automaticky odstraňuje otravné reklamní texty `Odesláno z aplikace Alza: ... A s členstvím AlzaPlus+ ti to doručí zdarma...` při nativním sdílení i kopírování.
- **Nezávisle konfigurovatelné**: Obě možnosti lze samostatně zapnout nebo vypnout v nastavení aplikace.

---

## ⚙️ In-App Nastavení (Settings)

Všechny funkce lze pohodlně konfigurovat přímo v aplikaci Alza pod kartou **Menu → Nastavení a zabezpečení**:
- **Přepínač režimu grafu**: Třístavový segmentovaný ovladač (*Vypnuto* / *Velký* / *Kompaktní*).
- **Tlačítko ceníků Alzy**: Možnost skrýt/zobrazit tlačítko v detailu produktu.
- **Odkazy přes fxalza.cz**: Přepínač pro aktivaci generování náhledových odkazů.
- **Čisté odkazy při sdílení**: Přepínač pro odstranění textu „Odesláno z aplikace Alza“.

---

## 📲 How to Use

### 1. Přidání zdroje do Morphe Manageru

Klepnutím na tlačítko níže na vašem Android zařízení přidáte tento repozitář do **Morphe Manageru**:

<a href="https://morphe.software/add-source?github=mmenzyns/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Nebo vložte odkaz ručně v **Morphe Manageru** (`Settings → Sources → Add Source`):
```
https://github.com/mmenzyns/morphe-patches
```

### 2. Aplikace záplat na Alzu

1. V Morphe Manageru vyberte aplikaci **Alza** (`cz.alza.eshop`).
2. Vyberte podporovanou verzi (viz tabulka níže).
3. Všechny 3 záplaty jsou ve výchozím stavu aktivní (případně si vyberte jen ty, které preferujete).
4. Klepněte na **Patch** a nainstalujte vytvořené APK.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.9.0](https://github.com/mmenzyns/morphe-patches/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Alza&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `cz.alza.eshop`

**🎯 Supported versions:**

| 2026.21.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Alza Benefit Prices (CZ / SK)](#alza-benefit-prices-cz-sk) | Displays benefit prices and tiers (Gold, Silver, ISIC, Bronze, B2B, Basic) with active promotions and coupons in product detail screen for Czech Republic and Slovakia. |  |
| [Alza Hlídač shopů Price History (CZ / SK)](#alza-hl-da-shop-price-history-cz-sk) | Displays inline price history chart from Hlídač shopů in product detail screen for Czech Republic and Slovakia (alza.cz / alza.sk). Includes compact/large mode replacing HomeCredit installments and settings in Menu. |  |
| [Alza Smart Link Sharing (FxAlza & Clean) (CZ / SK)](#alza-smart-link-sharing-fxalza-clean-cz-sk) | Enhances shared and copied Alza product links: enables fxalza.cz (or sk.fxalza.cz) domain for rich embeds on Discord and social media, and removes the 'Odesláno z aplikace Alza' promotional text. Configurable in Menu settings. |  |

</details>

<!-- PATCHES_END -->

---

## 🛠️ Lokální sestavení

Kompilace a vytvoření `.mpp` balíčku:

```bash
# Sestavení Android patch balíčku (.mpp)
./gradlew :patches:buildAndroid --no-daemon
```

Výsledný `.mpp` soubor se nachází v:
```
patches/build/libs/patches-*.mpp
```

---

## 📜 Licence & Zásluhy

- Data historie cen a metodika: [Hlídač shopů](https://www.hlidacshopu.cz/) (TopMonks, Apify, Keboola).
- Služba pro náhledy odkazů: [fxalza.cz](https://fxalza.cz/).
- Vývoj záplat a rozšiřujícího modulu: [Mark Menzynski](https://github.com/mmenzyns).
- Licencováno pod [GNU General Public License v3.0](LICENSE).
