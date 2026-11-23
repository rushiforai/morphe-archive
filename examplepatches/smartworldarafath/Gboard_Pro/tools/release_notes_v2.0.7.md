# Gboard Pro v2.0.7

## Summary
Gboard Pro v2.0.7 integrates the latest upstream PixelBoard v1.3.5 stability and server connectivity improvements while preserving every existing Gboard Pro customization, Material 3 Expressive theme palette, AMOLED Pure Black keyboard styling, and background updater system. This release repairs AI Writing Tools server connectivity to eliminate "cannot connect to server" errors, enforces the reliable Gboard Server backend, hardens Direct Boot preference storage against cold boot crashes, refines voice dictation anti-drift logic, and incorporates new interactive UI row components and changelog section styling.

---

## What's New in v2.0.7

- **AI Writing Tools Server Connection Repair**: Enforced the reliable Google Server backend, eliminated timeout and template evaluation failures, and removed "cannot connect to server" errors for Rephrase, Proofreading, and Tone adjustments.
- **Direct Boot & Secure Storage Safety**: Added full user-unlock verification (`UserManager.isUserUnlocked`) and commit-level persistence to prevent crashes and ensure clean flag initialization during cold device reboots before first unlock.
- **Refined V2 Flag Isolation**: Replaced broad wildcard flag matching with an exact V2 flag registry, preventing accidental suppression of stable Writing Tools V1 features.
- **Voice Dictation Speech Diff Preservation**: Preserves speech diffs for voice replacements, word edits in respoken phrases, and mid-sentence cursor placements without overwriting surrounding compositions.
- **Strict Language Policy & Anti-Drift**: Disabled proactive parallel ASR and seamless fallback in Rambler dictation policy to prevent accidental language drift during continuous voice typing.
- **Screen Rotation Grace Window**: 1.5-second grace period across display orientation and size changes, preventing Rambler voice typing sessions from aborting on rotation.
- **Interactive UI Components**: Added support for primary action buttons with animated sync spinners, row badges, and structured changelog section styles in settings.
- **24-Hour Default Clipboard Retention**: Extended unpinned clipboard retention to 24 hours, raised history limit to 100 clips, and preserved localized pin tips across 83 languages.

---

## Preserved Gboard Pro Features

- **Pro Customization Hub**: Top-level Pro screen grouping Appearance, Board UI, and Advanced Settings.
- **Material 3 Dynamic Appearance Palettes**: Complete UI theme support for Blush Lilac (signature light pink showcase look), Cotton Candy, Sunset Peach, Fresh Mint, and Default (System Dynamic).
- **Board UI AMOLED Pure Black**: Dedicated deep pure-black keyboard styling for OLED displays.
- **Material 3 Expressive About & Updater**: Automated 8-hour background update checks, push notification alerts for new versions, live Mbps download speed meter, and direct APK installation.
- **Personal Dictionary**: Seamless integration with user dictionaries and custom shortcuts.

---

## Release Assets

| Package | Type | Size | Description |
| :--- | :--- | :--- | :--- |
| [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.0.7/Gboard_Pro.apk) | **Signed APK** (Recommended) | ~128.4 MB | Ready-to-install v3-signed universal arm64-v8a release APK (package `com.gboardpro.app`, side-by-side installable). |

---

## Installation

### Option 1: Direct APK Installation (Recommended)
1. Download [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.0.7/Gboard_Pro.apk) directly to your Android device.
2. Open the downloaded APK from your file manager or browser downloads.
3. Grant installation permission if prompted and complete installation.
4. Enable Gboard Pro in **Settings > System > Languages & input > On-screen keyboard**.

### Option 2: ADB Sideload
```bash
adb install -r Gboard_Pro.apk
adb shell am force-stop com.gboardpro.app
```

---

## Compatibility

| Specification | Details |
| :--- | :--- |
| **Package Name** | `com.gboardpro.app` |
| **Base Version** | `18.4.1.985164140-release-arm64-v8a` |
| **Architecture** | `arm64-v8a` |
| **Minimum Android Version** | Android 12L (API 32) or higher |
| **Standalone Coexistence** | Supported (installs alongside factory Gboard without root) |
