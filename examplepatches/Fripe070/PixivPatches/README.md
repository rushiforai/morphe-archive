# 🎨 Pixiv Morphe Patches

[![Build Morphe Patch Bundle](https://github.com/Fripe070/PixivPatches/actions/workflows/build.yml/badge.svg)](https://github.com/Fripe070/PixivPatches/actions/workflows/build.yml)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL%203.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Target App](https://img.shields.io/badge/Target%20App-Pixiv%20v6.196.0-0096FA.svg)](https://play.google.com/store/apps/details?id=jp.pxv.android)

A collection of toggleable Morphe patches for Pixiv on Android (`jp.pxv.android`), adding AI artwork detection, adblocking, persistent navigation, high-res downloads, OLED dark mode, and more.

---

## 📲 Add to Morphe Manager

### Option 1: One-Tap Install
Tap the button below from an Android device with Morphe Manager installed:

[![Add to Morphe Manager](https://img.shields.io/badge/Morphe%20Manager-Add%20Patch%20Source-blueviolet?style=for-the-badge&logo=android)](https://morphe.software/add-source?github=Fripe070/PixivPatches)

### Option 2: Manual Setup
1. Open **Morphe Manager** on your Android device.
2. Go to **Settings** ➔ **Sources**.
3. Tap **Add Source** and enter:
   ```text
   https://github.com/Fripe070/PixivPatches
   ```
4. In the **Patcher** tab, select **Pixiv** and choose your patches.

---

## ✨ Features

| Feature | Description |
| :--- | :--- |
| 🤖 **AI Work Flagger** | Detects and tags AI-generated works. Dims thumbnails with an `[AI]` badge (or hides them entirely), adds an `[AI]` tag next to titles, shows a prominent warning banner on detail pages, and includes custom tag settings. |
| 🚫 **Adblocker** | Removes banner ads, sponsored cards, promotional carousels, and review prompts without leaving blank layout padding. |
| 🧭 **Persistent Navigation** | Keeps the bottom navigation dock visible and accessible across submenus, rankings, and search results. |
| ⬇️ **Artwork Downloader** | Adds an in-app button to download original, full-resolution illustrations and manga directly to your device storage. |
| 💎 **Premium Features** | Unlocks popularity search sorting (`popular_desc`) without a subscription and removes user mute limits. |
| 🔒 **Analytics Blocker** | Blocks Firebase Analytics, Google Measurement telemetry, and Pixiv internal tracking for better privacy. |
| 🌙 **OLED Dark Theme** | Overrides dark gray backgrounds with true pitch-black (`#000000`) for OLED displays and battery savings. |
| 🔍 **Enhanced Viewer & Zoom** | Shows standard-resolution artwork instantly as a placeholder while full-resolution loads, with a discreet HD loading indicator and seamless zoom preservation. |

---

## 🎯 Compatibility

- **Target App**: Pixiv Android (`jp.pxv.android`)
- **Recommended Version**: `6.196.0` (Version code: `68251`)
- **Supported Architectures**: `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`
- **Supported Android Versions**: Android 8.0+ (API 26+)

---

## 🛠️ Building From Source

### Prerequisites
- JDK 21+
- Android SDK (build-tools & platform `android-35` or `android-36`)

### Build with Gradle
```bash
./gradlew :patches:buildAndroid
```
The compiled bundle will be in `patches/build/libs/`.

### Local / Offline Build Script
If building locally without Gradle or GitHub Packages authentication:
```powershell
.\build-mpp.ps1
```
*(or `build-mpp.bat` on Windows Command Prompt)*

---

## 💻 CLI Patching

To patch an APK directly using the Morphe CLI:

```bash
java -jar tools/morphe-cli.jar patch \
  --patches=patches/build/libs/pixiv-patches-*.mpp \
  --out=pixiv-patched.apk \
  pixiv-base.apk
```

Install via ADB:
```bash
adb install -r pixiv-patched.apk
```

---

## ⚖️ License & Disclaimer

This project is licensed under the [GNU General Public License v3.0](LICENSE).  
This is an independent open-source project and is not affiliated with or endorsed by Pixiv Inc.
