## Overview

Gboard Pro v1.0.4 brings a comprehensive brand modernization, resolves all settings auto-exit crashes, eliminates multi-launcher icon duplication on custom skins, introduces official modern adaptive app icons, and activates Android 13+ Predictive Back with fluid Material transitions.

---

## What is New in v1.0.4

### 1. Complete Brand Unification (Gboard Pro)
* Renamed all backend strings, bytecode identifiers, preference keys, providers, and settings text catalogs from "PixelBoard" to "Gboard Pro".
* Updated the system package installer label to display "Gboard Pro" during installation and package inspection.
* Updated the Android system "Manage keyboards" input method list to explicitly display "Gboard Pro".

### 2. Modern Official Adaptive App Icon
* Replaced the legacy launcher icon with the modern official Gboard Pro design.
* Generated full adaptive icon sets (vectorized foreground and crisp background) across all Android screen densities: mdpi, hdpi, xhdpi, xxhdpi, and xxxhdpi.
* Bundled dedicated legacy and round mipmap icons for seamless compatibility with third-party launcher replacements and system package managers.

### 3. Desktop Multi-Icon Deduplication Fix
* Resolved an issue where devices running Xiaomi HyperOS, MIUI, or select third-party launchers displayed multiple duplicate desktop icons upon installation.
* Streamlined the manifest launcher architecture to a single, authoritative launcher entry (`com.gboardpro.app.launcher.Default`), preventing unwanted icon duplication.

### 4. Settings Stability and Crash Elimination
* Fixed critical auto-exit exceptions where selecting "About", "Board UI", "Gboard Pro Updates", or "Appearance" caused the application to close unexpectedly.
* Applied explicit runtime theme resolution (`Theme_DeviceDefault_DayNight_NoActionBar`) before `super.onCreate` to eliminate OEM-specific inflation failures.
* Protected all settings activities with hardened exception barriers and resilient fallback layouts.

### 5. Predictive Back and Fluid Motion Transitions
* Enabled Android 13+ (API 33+) Predictive Back gesture support via `android:enableOnBackInvokedCallback="true"` and registered `OnBackInvokedCallback` handlers.
* Implemented Material Motion fade and slide window transitions across settings activities for smooth, responsive navigation.

### 6. High-Refresh-Rate Display and Custom Clipboard Engine
* Maintained up to 144Hz dynamic display mode synchronization on supported hardware (including Redmi Pad 7 Pro) alongside 120Hz and 90Hz adaptive panel support.
* Retained full customizable clipboard history retention (presets and manual hourly input) and Gemini voice typing modernization.

---

## Package Information
* Package Name: com.gboardpro.app
* Version: 1.0.4 (18.4.1.985164140-release-arm64-v8a)
* Architecture: arm64-v8a / Universal
* Minimum Android Version: Android 12 (API level 32)
* Target Android Version: Android 15 / Developer Preview (API level 37)
* Signature Scheme: v1, v2, and v3 signed with release keystore

## Release Assets
* `Gboard_Pro-1.0.4.apk`: Standard versioned package
* `Gboard_Pro-1.0.4-arm64-v8a.apk`: Optimized for 64-bit ARM architecture
* `Gboard_Pro-1.0.4-Universal.apk`: Universal architecture deployment package
* `Gboard_Pro.apk`: Canonical standalone release package
* `Gboard_Pro-1.0.4.mpp`: Morphe patch bundle for custom builder workflows
