# Gboard Pro v2.1.0

## Summary
Gboard Pro v2.1.0 incorporates the latest upstream PixelBoard v1.3.6 features and enhancements while preserving every Gboard Pro customization, including Material 3 Expressive theme palettes (Blush Lilac, Cotton Candy, Sunset Peach, Fresh Mint), AMOLED Pure Black keyboard styling, the 24-hour extended clipboard with 100-item cap, and the background update system. This release introduces candidate strip emoji slot positioning, safe keypress haptic feedback bypassing OEM vibration restrictions, extended screen rotation grace periods for Rambler voice dictation, speech diff preservation with dedicated Microsoft Word/Office desynchronization protection, launcher icon visibility toggling across all devices, and lowered minimum SDK requirements supporting Android 10 and Android 11.

---

## What's New in v2.1.0

- **Candidate Strip Emoji Slot Placement**: Repositions suggested emoji candidates onto the right side (Slot 2 for a standard 3-slot strip), ensuring raw verbatim text and predictive autocompletions occupy the left and center slots for seamless typing flow.
- **Safe Keypress & Cursor Drag Haptic Feedback**: Explicitly passes `FLAG_IGNORE_GLOBAL_SETTING` (0x1) during keypress and text handle drag haptic feedback, guaranteeing tactile feedback on Honor MagicOS, Huawei EMUI, and devices where system-wide vibration is disabled.
- **Extended Screen Rotation Grace Window for Voice Dictation**: Increases orientation change grace period to 2500ms with a 1000ms baseline delay and tracks display rotation, keeping Rambler voice typing and audio recording active across device flips and folds.
- **Speech Diff Preservation & Microsoft Word / Office Fix**: Retains speech diffs for voice replacements and mid-sentence voice commands, while automatically detecting Microsoft Word and Office apps to prevent cursor desynchronization to (0, 0).
- **Header Minimize Key Positioning**: Places the Rambler minimize key next to the close key on the left side of the header (`key_pos_header_start_extra_key`) with end slot fallback, keeping both Close and Minimize easily accessible.
- **Rambler Stock Policy & Cursor Awareness**: Enforces `jetson_enable_cursor_awareness` in stock phenotype policy for improved voice editing precision and synchronization.
- **AI Writing Tools Connectivity & Limit Enforcement**: Enforces a 2000-word input limit for Proofread and Rewrite, updates candidate threshold to 0.0, enables the proofread supported apps allowlist, and forces v2 landscape layout.
- **Android 10+ (API 29) Minimum SDK Compatibility**: Lowers `minSdkVersion` to API 29, resolving package parser errors and enabling installation on Android 10 and Android 11 devices.
- **Show in App List Unlocked**: Removes Android 10+ OEM restriction locks on the launcher icon toggle, allowing the app icon to be hidden or shown directly in Preferences on all devices.

---

## Preserved Gboard Pro Features

- **Pro Customization Hub**: Dedicated Pro settings screen grouping Appearance, Board UI, and Advanced Settings.
- **Material 3 Dynamic Appearance Palettes**: Complete UI theme support for Blush Lilac (signature light pink showcase look), Cotton Candy, Sunset Peach, Fresh Mint, and Default (System Dynamic).
- **Board UI AMOLED Pure Black**: Dedicated deep pure-black keyboard styling for OLED displays.
- **24-Hour Default Clipboard Retention**: Extended unpinned clipboard retention to 24 hours, raised history limit to 100 clips, discrete slider (1h, 24h, 7d, 30d, Never), and localized pin tips across 83 languages.
- **Material 3 Expressive About & Updater**: Automated 8-hour background update checks, push notification alerts for new versions, live Mbps download speed meter, and direct APK installation.
- **Personal Dictionary**: Seamless integration with user dictionaries and custom shortcuts.

---

## Release Assets

| Package | Type | Size | Description |
| :--- | :--- | :--- | :--- |
| [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.1.0/Gboard_Pro.apk) | **Signed APK** (Recommended) | ~128.5 MB | Ready-to-install v3-signed universal arm64-v8a release APK (package `com.gboardpro.app`, side-by-side installable). |
| [**patches-1.3.6.mpp**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.1.0/patches-1.3.6.mpp) | **Morphe / Patch Bundle** | ~1.8 MB | Morphe Manager patch bundle with classes.dex root packaging for custom patching workflows. |

---

## Installation

### Option 1: Direct APK Installation (Recommended)
1. Download [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.1.0/Gboard_Pro.apk) directly to your Android device.
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
| **Minimum Android Version** | Android 10 (API 29) or higher |
| **Standalone Coexistence** | Supported (installs alongside factory Gboard without root) |
