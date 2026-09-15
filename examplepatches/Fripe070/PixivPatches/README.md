# 🎨 Pixiv Morphe Patches

[![Build Morphe Patch Bundle](https://github.com/Fripe070/PixivPatches/actions/workflows/build.yml/badge.svg)](https://github.com/Fripe070/PixivPatches/actions/workflows/build.yml)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL%203.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Target App](https://img.shields.io/badge/Target%20App-Pixiv%20v6.196.0-0096FA.svg)](https://play.google.com/store/apps/details?id=jp.pxv.android)

A modular, toggleable Morphe patch repository for Pixiv Android (`jp.pxv.android`). Provides enhanced AI work detection and badge indicators, adblocking across all screens, and persistent bottom navigation into submenus.

---

## 📲 Adding to Morphe Manager

### Option 1: One-Tap Installation
Tap the button below from your Android device with Morphe Manager installed:

[![Add to Morphe Manager](https://img.shields.io/badge/Morphe%20Manager-Add%20Patch%20Source-blueviolet?style=for-the-badge&logo=android)](https://morphe.software/add-source?github=Fripe070/PixivPatches)

### Option 2: Manual Setup
1. Open **Morphe Manager** on your Android device.
2. Go to **Settings** ➔ **Sources**.
3. Tap **Add Source** and paste:
   ```text
   https://github.com/Fripe070/PixivPatches
   ```
4. Return to the **Patcher** tab, select **Pixiv**, and configure your desired patches.

---

## 📦 Features Matrix

Each patch is independently toggleable in Morphe Manager or via Morphe CLI:

| Patch ID | Display Name | Default State | Target Scope | Description |
| :--- | :--- | :---: | :--- | :--- |
| `PixivAiFlaggerPatch` | **Pixiv AI Work Flagger** | `Enabled` | Feed, Search, Rankings, Detail, Settings | Identifies AI-generated works; dims thumbnails with red `[AI]` badge (or hides completely); adds top-left floating `[AI]` badge on artwork viewer; adds `[AI]` pill next to title & artist; includes in-app settings with keyboard-safe tag editor. |
| `PixivAdblockerPatch` | **Pixiv Adblocker** | `Enabled` | Global Activities, Feeds | Collapses bottom AdMob / Google Ads banner without leaving dead layout padding; suppresses "Rate this app" review prompt; removes sponsored cards and promotional carousels. |
| `PixivPersistentNavPatch` | **Pixiv Persistent Navigation** | `Enabled` | Submenus, Search Results, Rankings | Keeps the primary bottom navigation bar (`Home`, `Search`, `New`, `Notifications`, `My Page`) docked and functional when navigating into submenus and drill-down views. |
| `PixivDownloaderPatch` | **Pixiv Downloader** | `Enabled` | Detail View | Adds an in-app download action button in the illustration and manga detail bar to save full-resolution artwork directly to Photos with metadata filenames. |
| `PixivPremiumPatch` | **Pixiv Premium Features** | `Enabled` | Search, Settings, Account | Emulates client-side Pixiv Premium membership status, unlocks popularity sorting (`popular_desc`) in search without paywalls, and bypasses user mute limits. |
| `PixivAnalyticsBlockerPatch` | **Pixiv Analytics Blocker** | `Enabled` | App-wide | Neutralizes Firebase Analytics, Google Measurement telemetry, and internal Pixiv event dispatchers for enhanced privacy. |
| `PixivOledThemePatch` | **Pixiv OLED Dark Theme** | `Enabled` | App-wide Dark Mode | Overrides dark gray surface and background colors with pure pitch black (`#ff000000`) for OLED battery savings and true high-contrast dark theme. |

---

## 🎯 Target Compatibility

- **Target Package**: `jp.pxv.android`
- **Target Version**: `6.196.0` (Version code: `68251`)
- **Architectures**: `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`
- **Minimum Android SDK**: Android 8.0 (API 26)
- **Target Android SDK**: Android 15 (API 35/36)

---

## 🛠️ Building From Source

### Prerequisites
- **JDK 21** or newer (Eclipse Temurin recommended)
- **Android SDK** with build-tools (35.0.0 or 36.0.0) and platform `android-35` / `android-36`

### Method A: Gradle Multi-Project Build (CI / Standard)
```bash
# Build the .mpp patch bundle
./gradlew :patches:buildAndroid
```
The compiled patch bundle will be generated at:
```
patches/build/libs/pixiv-patches-1.0.0.mpp
```

### Method B: Offline Local Build Script
For local development or offline test environments where GitHub Packages authentication is not configured:
```cmd
# Windows Batch
build-mpp.bat
```
or via PowerShell:
```powershell
.\build-mpp.ps1
```
This script compiles the Kotlin extension and patch sources using the host's `kotlinc`, `d8`, and `morphe-cli.jar` directly without network requirements.

---

## 💻 CLI Patching Guide

To patch the official Pixiv APK directly using Morphe CLI:

### 1. Check Available Patches
```bash
java -jar tools/morphe-cli.jar list-patches --patches=patches/build/libs/pixiv-patches-1.0.0.mpp
```

### 2. Apply All Default Patches
```bash
java -jar tools/morphe-cli.jar patch \
  --patches=patches/build/libs/pixiv-patches-1.0.0.mpp \
  --out=pixiv-patched.apk \
  pixiv-base.apk
```

### 3. Exclude Specific Patches (Selective Patching)
```bash
# Example: Apply AI Flagger and Persistent Nav, but exclude Adblocker
java -jar tools/morphe-cli.jar patch \
  --patches=patches/build/libs/pixiv-patches-1.0.0.mpp \
  --exclude="Pixiv Adblocker" \
  --out=pixiv-patched.apk \
  pixiv-base.apk
```

### 4. Install Patched APK via ADB
```bash
adb install -r pixiv-patched.apk
```

---

## 📜 Repository Structure

```
pixiv-morphe-repo/
├── .github/
│   └── workflows/
│       └── build.yml               # GitHub Actions CI workflow
├── gradle/
│   ├── wrapper/
│   │   ├── gradle-wrapper.jar
│   │   └── gradle-wrapper.properties
│   └── libs.versions.toml          # Central version catalog
├── patches/
│   ├── build.gradle.kts            # Patch bundle metadata and dependencies
│   └── src/main/kotlin/app/morphe/patches/pixiv/
│       ├── PixivAiFlaggerPatch.kt  # AI flagger bytecode patch
│       ├── PixivAdblockerPatch.kt  # Adblocker bytecode & resource patch
│       └── PixivPersistentNavPatch.kt # Persistent nav bytecode patch
├── extensions/
│   ├── proguard-rules.pro
│   └── pixiv/
│       ├── build.gradle.kts        # Extension Android configuration
│       └── src/main/kotlin/app/morphe/extension/pixiv/
│           ├── aiflag/             # AI detection & UI overlay helpers
│           ├── adblock/            # Ad container collapsing helpers
│           └── navigation/         # Bottom nav injection & routing helpers
├── build-mpp.bat                   # Offline local build script (Batch)
├── build-mpp.ps1                   # Offline local build script (PowerShell)
├── .gitignore
├── README.md
├── build.gradle.kts                # Root build file
└── settings.gradle.kts             # Settings plugin & project configuration
```

---

## ⚖️ License & Disclaimer

This project is licensed under the [GNU General Public License v3.0](LICENSE).  
This repository is an independent open-source project and is not affiliated with, endorsed by, or sponsored by Pixiv Inc.
