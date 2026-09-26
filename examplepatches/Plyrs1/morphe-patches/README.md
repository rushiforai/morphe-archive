# 👋🧩 Plyrs1 Morphe Patches

Repository for custom Morphe patches by Plyrs1.

## ❓ About

Custom patches for Android applications.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Plyrs1/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0-dev.1](https://github.com/Plyrs1/morphe-patches/releases/tag/v1.4.0-dev.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;27 patches total
<details open>
<summary>📦 E-Ujian Browser&nbsp;&nbsp;•&nbsp;&nbsp;18 patches</summary>
<br>

**🎯 Supported versions:**

| 3.1.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow System UI](#allow-system-ui) | Allows the status bar and navigation bar to remain visible during the exam. |  |
| [Background Persistence (WakeLock + Foreground Service)](#background-persistence-wakelock-foreground-service) | Keeps the exam process alive in the background using a WakeLock-backed foreground Service. Prevents OS from killing the exam when backgrounded or screen turns off. Service restarts automatically via START_STICKY if killed. |  |
| [Bypass App Blacklist Scan](#bypass-app-blacklist-scan) | Skips the pre-exam scan that blocks exam start if blacklisted apps (AnyDesk, TeamViewer, screen recorders, floating apps) are installed, and launches the exam directly without overlay/DND/ringer prompts. |  |
| [Bypass DND Detection](#bypass-dnd-detection) | Allows the exam to run with Do Not Disturb mode enabled. |  |
| [Bypass Multi-Window Detection](#bypass-multi-window-detection) | Disables split-screen detection so the exam continues normally in split-screen mode. |  |
| [Bypass PiP Detection](#bypass-pip-detection) | Allows the exam to continue when entered into Picture-in-Picture mode. |  |
| [Bypass Silent Mode Detection](#bypass-silent-mode-detection) | Allows the exam to run with the device on silent or vibrate. |  |
| [Bypass Startup Security Checks](#bypass-startup-security-checks) | Skips environment, VM, emulator, hook, and cloner detection in SplashActivity. Allows the app to run on emulators, rooted devices, and virtual environments. |  |
| [Disable Clipboard Guard](#disable-clipboard-guard) | Prevents the app from wiping the clipboard on exam start and when copying text. |  |
| [Disable Focus Loss Alarm](#disable-focus-loss-alarm) | Prevents the delayed alarm triggered when the exam window loses focus. |  |
| [Disable Overlay Guard](#disable-overlay-guard) | Stops the OverlayGuard system window and foreground-recovery loop on focus loss. |  |
| [Disable Touch Obscurity Detection](#disable-touch-obscurity-detection) | Removes the overlay-touch detection that fires an alarm when another window partially covers the exam. |  |
| [Disable Violation Alarm](#disable-violation-alarm) | Suppresses the max-volume alarm tone and vibration triggered on any exam security violation. |  |
| [Disable onPause Alarm](#disable-onpause-alarm) | Prevents the alarm from triggering when the exam activity is paused or backgrounded. |  |
| [Manifest: Background Persistence Permissions](#manifest-background-persistence-permissions) | Adds WAKE_LOCK, FOREGROUND_SERVICE, and FOREGROUND_SERVICE_SPECIAL_USE permissions, registers ExamKeepAliveService, and removes lockTaskMode/excludeFromRecents from ExamActivity. |  |
| [Remove Auto-Pin App](#remove-auto-pin-app) | Disables automatic screen pinning / lock task mode so the app is not pinned to the screen. |  |
| [Remove Screenshot Protection](#remove-screenshot-protection) | Removes FLAG_SECURE so screenshots and screen recording work normally during the exam. |  |
| [Suppress WebView Exam Events](#suppress-webview-exam-events) | Injects a JavaScript monkeypatch into the exam WebView on every page load that freezes the Page Visibility API (document.hidden, document.visibilityState, document.hasFocus) and silently drops blur/visibilitychange/focusout event listeners. This prevents the web-side exam platform from detecting when the browser loses focus or is backgrounded. |  |

</details>

<details open>
<summary>📦 Struk Pom / SPBU&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.2.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Review Dialog](#bypass-review-dialog) | Bypasses the in-app review confirmation dialog when pressing Back on the Home screen, allowing immediate exit. |  |
| [Hide Premium Button](#hide-premium-button) | Hides the Premium upgrade button from both the top action bar on the Home screen and the Settings menu. |  |
| [Remove Ads](#remove-ads) | Removes all banner and interstitial ads by unlocking ad-free premium status and disabling AdMob loaders. |  |

</details>

<details open>
<summary>📦 Pertaminiku&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Licensing](#disable-licensing) | Bypasses PairIP license verification to prevent 'Something went wrong' errors on emulators and devices without Google Play. |  |
| [First Launch Credit](#first-launch-credit) | Shows a one-time 'Patched with ❤️ by Plyrs' notification on first launch. |  |
| [Lifetime Premium](#lifetime-premium) | Unlocks lifetime premium: removes watermark forever, disables ads, unlocks all templates. |  |

</details>

<details open>
<summary>📦 Struk POM&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.17.057 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Startup Permissions](#disable-startup-permissions) | Suppresses indiscriminate startup requests for camera and storage permissions, and configures manifest for direct system camera capture. |  |
| [Hide Gift Button](#hide-gift-button) | Hides the gift / donation button in the top action bar of the main menu. |  |
| [Remove All Ads](#remove-all-ads) | Disables all AdMob preloading, bypasses interstitial ads, and auto-removes the watermark on receipt screens without user interaction. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Plyrs1 Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
