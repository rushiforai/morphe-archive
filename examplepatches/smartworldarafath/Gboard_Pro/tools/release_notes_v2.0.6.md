# Gboard Pro v2.0.6 (Beta 2)

## Summary
Gboard Pro v2.0.6 (Beta 2) ports all upstream PixelBoard 1.3.x enhancements onto the Gboard Pro v2.0.5 baseline (`18.4.1.985164140-release-arm64-v8a`) while preserving every existing Gboard Pro customization, Material 3 theme, and background updater feature. This release introduces a 24-hour default clipboard retention policy, raises the recent unpinned clipboard history cap from 5 to 100 clips, adds a discrete 5-step retention slider, localizes honest clipboard retention texts and pin tips across 83 languages, adds Google Sans Flex and Undo settings toggles, fixes Rambler voice dictation transcript handling and minimize-key placement, and polishes full RTL layout alignment.

---

## What's New in v2.0.6 (Beta 2)

- **24-Hour Default Clipboard Retention**: Unpinned copied text and images are retained for 24 hours by default (replacing stock Gboard's 1-hour expiry).
- **100 Recent Clips History**: The unpinned recent clipboard history limit is increased from 5 to 100 items across database queries and pruning passes.
- **Customizable 5-Step Retention Slider**: Choose between `1 hour`, `24 hours`, `7 days`, `30 days`, or `Never` directly inside Gboard Clipboard Settings.
- **Localized Retention Texts & Pin Tips (83 Languages)**: Clipboard intro cards, banner prompts, empty-state messages, and pin tips dynamically match the active retention setting across 83 locales.
- **Google Sans Flex & Undo Toggles**: Added dedicated toggles in Advanced Settings for Google Sans Flex keycap typography and proactive suggestion-strip Undo chips, plus fixed `enable_frequent_emoji_recent_Tab` preference key persistence.
- **Rambler Voice Dictation Fixes**: Preserves verbatim speech transcripts, protects manual edits during live dictation, applies a 1.5-second screen-rotation grace window, activates the toolbar mic for Rambler voice typing, and enforces strict language selection policies.
- **Rambler Minimize Key Support**: Places the dedicated `Back to keyboard` minimize key cleanly in the dictation toolbar and preserves register state across layout transitions.
- **Clean Symbol Key Labels**: Strips escaping backslashes (`\?123`, `\؟`) and unresolved `?attr/` theme attributes from symbol and shifted key labels at runtime.
- **AI Writing Tools & Flag Engine Updates**: Disabled unstable Writing Tools V2 flags by default for V1 stability, updated autocapitalization/decoder/Emojify/Fast-Access flags, and enforced Direct Boot safe flag storage.
- **Full RTL & Settings Provider Polish**: Switched settings layouts, margins, back navigation arrows, and chevrons to bidirectional RTL/LTR APIs, and added `openFile()` APK streaming support in `GboardPatchesSettingsProvider`.

---

## Preserved Gboard Pro Features

- **Pro Customization Hub**: Top-level `Pro` screen grouping `Appearance`, `Board UI`, and `Advanced Settings`.
- **Material 3 Dynamic Appearance Palettes**: Full UI theming across `Blush Lilac`, `Cotton Candy`, `Sunset Peach`, `Fresh Mint`, and `Default (System Dynamic)`.
- **Board UI AMOLED Pure Black**: Dedicated AMOLED pure-black keyboard surface option.
- **Material 3 Expressive About & Updater**: 8-hour background update check scheduling, notification permission alerts when new versions release, live Mbps download progress, and one-tap APK installer.
- **Personal Dictionary**: Preserved dictionary access and runtime customization intact.

---

## Release Assets

| Package | Type | Size | Description |
| :--- | :--- | :--- | :--- |
| [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.0.6/Gboard_Pro.apk) | **Signed APK** (Recommended) | ~128.4 MB | Ready-to-install v3-signed universal arm64-v8a release APK (package `com.gboardpro.app`, side-by-side installable). |

---

## Installation

### Option 1: Direct APK Installation (Recommended)
1. Download [**Gboard_Pro.apk**](https://github.com/smartworldarafath/Gboard_Pro/releases/download/v2.0.6/Gboard_Pro.apk) directly to your Android device.
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
