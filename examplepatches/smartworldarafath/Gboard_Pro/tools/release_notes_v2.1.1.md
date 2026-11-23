## Overview

Gboard Pro **v2.1.1** is a critical update that restores all signature Gboard Pro custom features, introduces a brand-new **Liquid Glass Default App & Package Icon**, and implements full, native **Edge-to-Edge Display Support** across all settings screens and activities.

---

## What's Changed

### 🎨 Brand-New Liquid Glass Default Icon
* **Native Liquid Glass App Icon**: Replaced default legacy icons with the user-selected high-definition Liquid Glass Gboard Pro emblem.
* **Full Multi-Density Support**: Generated crisp, optimized icon assets across all screen densities (`mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, `xxxhdpi`) for both legacy launchers (`ic_app.png`, `ic_app_round.png`) and modern adaptive icon systems (`mipmap_0x7f110002.webp`).
* **Package Icon Integration**: Integrated seamlessly across app launcher, system settings, recents screen, and notification shades.

### 📱 Full Native Edge-to-Edge Support
* **Immersive System Bar Drawing**: Enabled `setDecorFitsSystemWindows(false)` on Android 11+ (API 30+) with fully transparent status bar and navigation bar.
* **Cutout & Notch Compatibility**: Configured `LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES` for display notches and punch-holes on Android 9+ (API 28+).
* **Smart Inset Padding**: Attached dynamic `OnApplyWindowInsetsListener` to content views to prevent any overlap or clipping with gesture bars, navigation buttons, or camera cutouts.
* **Disabled Contrast Enforcing**: Set `setStatusBarContrastEnforced(false)` and `setNavigationBarContrastEnforced(false)` on Android 10+ (API 29+) to guarantee pure edge-to-edge aesthetics without Android scrim tinting.

### 🔄 Restored Gboard Pro Exclusive Features
* **Material 3 Expressive Themes**:
  * **Blush Lilac**: Signature soft lavender and petal pink pastel palette.
  * **Cotton Candy**: Playful sky blue and pastel magenta palette.
  * **Sunset Peach**: Warm apricot, coral, and terracotta palette.
  * **Fresh Mint**: Refreshing sage, crisp mint, and pine teal palette.
  * **AMOLED Pure Black**: True black `#000000` surface and key background for maximum battery savings on OLED displays.
* **Extended 24-Hour Clipboard Retention**:
  * Unpinned clips retained for up to 24 hours (bypassing Google's 1-hour auto-deletion).
  * 100 recent clip cap with discrete slider selector (1h, 2h, 3h, 6h, 12h, 18h, 24h).
* **Material 3 Expressive About Screen & Live Updater**:
  * Real-time Mbps download speed gauge and update progress indicator.
  * Seamless background checking against `smartworldarafath/Gboard_Pro`.
* **High Refresh Rate & Smooth Transitions**: Enforces 120Hz/144Hz IME window refresh rate for stutter-free fluid typing.

### ⚡ Upstream PixelBoard 1.3.6 Enhancements
* **Candidate Strip Emoji Slot Placement**: Places emoji candidates on the right side of the candidate strip, reserving center slots for speech and predictive completions.
* **Safe Keypress & Cursor Drag Haptic Feedback**: Explicitly passes `FLAG_IGNORE_GLOBAL_SETTING` to guarantee tactile feedback on Honor MagicOS, Huawei EMUI, and devices with system vibration disabled.
* **Screen Rotation Grace Period for Rambler Dictation**: 2500ms grace window with display rotation listener prevents voice session drops during screen rotations and foldable unfolding.
* **Speech Diff Preservation & Microsoft Office Sync**: Retains speech diffs for voice replacements and avoids cursor desynchronization in Microsoft Word/Office apps.
* **Header Minimize Key Positioning**: Places Rambler minimize key next to the close button on the left header position.

---

## Installation & Upgrade

1. Download `Gboard_Pro.apk` from the Assets section below.
2. Install directly on your device (Android 10+ supported; no root required).
3. If upgrading from earlier versions, install directly over your existing installation to preserve all custom settings, dictionary data, and clipboard items.
4. Enable **Gboard Pro** in **Settings > System > Languages & input > On-screen keyboard**.

---

## Package Details
* **App Name**: Gboard Pro
* **Package Name**: `com.gboardpro.app`
* **Version Code**: `176071770`
* **Patch Version**: `v2.1.1`
* **Min SDK**: 29 (Android 10+)
* **Target SDK**: 37 (Android 16+)
* **Architecture**: `arm64-v8a`
* **Signature**: APK Signature Scheme v3 (Verified)

---

## Checksums
* `Gboard_Pro.apk`: `c7d6fdd541674a91abf28c71f9f880ed956db3767ad3ee4911a343a4a2a54f86`
