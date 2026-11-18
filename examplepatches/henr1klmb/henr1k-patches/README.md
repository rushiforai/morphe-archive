<div align="center">

# 🧩 Henriks Morphe Patches

**A personal collection of Android patches built for the Morphe Patcher.**

[![Release](https://img.shields.io/github/v/release/henr1klmb/henr1k-patches?style=for-the-badge&color=6E56CF)](https://github.com/henr1klmb/henr1k-patches/releases)
[![Pre-Release](https://img.shields.io/github/v/release/henr1klmb/henr1k-patches?include_prereleases&label=dev&style=for-the-badge&color=E5484D)](https://github.com/henr1klmb/henr1k-patches/releases)
[![License](https://img.shields.io/github/license/henr1klmb/henr1k-patches?style=for-the-badge&color=30A46C)](LICENSE)
[![Issues](https://img.shields.io/github/issues/henr1klmb/henr1k-patches?style=for-the-badge&color=F76B15)](https://github.com/henr1klmb/henr1k-patches/issues)

[Quick Add to Morphe](https://morphe.software/add-source?github=henr1klmb/henr1k-patches) · [Patch List](#-available-patches) · [Build Guide](#-building-from-source) · [FAQ](#-faq)

</div>

---

> [!IMPORTANT]
> **Scope & Limitations**  
> These patches focus on client-side improvements, removing in-app ads, tracking SDKs, and many more. Features enforced strictly on the server side (cloud sync, AI backends, server-validated subscriptions) cannot be modified here.

---

## 🎯 What's Inside

This repository houses custom patches I maintain with the help of AI. They are tested on multiple devices and emulator before being released! This is made by me, a human ;)

---

## 🚀 Get the patches

### Option 1: One-Click Source Import (Recommended)
Tap the link below on your Android device to register this repository directly in **Morphe Manager**:

👉 **[Add `henr1klmb/henr1k-patches` to Morphe](https://morphe.software/add-source?github=henr1klmb/henr1k-patches)**

### Option 2: Manual Setup
1. Open **Morphe Manager** and navigate to **Sources** → **+**.
2. Paste the repository URL:
   ```text
   https://github.com/henr1klmb/henr1k-patches
   ```
3. *(Optional)* Enable **Pre-releases** in Morphe's settings if you want to test experimental patches. Work in progress! (Please don't complain about bugs etc in that case, thats why its pre-release)

---

## 🩹 Available Patches

<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/henr1klmb/henr1k-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;26 patches total
<details>
<summary>📦 DB Navigator&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `de.hafas.android.db`

**🎯 Supported versions:**

| 26.20.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark mode](#amoled-dark-mode) | Replaces dark background colors in night mode with pure black (#FF000000). |  |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |
| [Enable screenshots](#enable-screenshots) | Allow taking screenshots and screen recordings. |  |

</details>

<details>
<summary>📦 NetMirror&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `app.netmirror.netmirrornew`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom icon](#custom-icon) | Changes the app name and optionally replaces the launcher icon. | • App name<br>• Custom icon PNG path (optional) |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |

</details>

<details>
<summary>📦 Channel 4&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.channel4.ondemand`

**🎯 Supported versions:**

| 9.8.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Disables pre-roll, mid-roll video and other ads. |  |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |

</details>

<details>
<summary>📦 Comparify&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.akshat.comparify`

**🎯 Supported versions:**

| 2.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Disables ad banners and rewarded ads |  |
| [Disable tracking](#disable-tracking) | Disables Tracking, Analytics and PairIP license checks. |  |

</details>

<details>
<summary>📦 HelloFit Pro&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.app.cy.hellofitpro`

**🎯 Supported versions:**

| 1.3.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Disables ads. |  |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |
| [Enable custom watchfaces](#enable-custom-watchfaces) | Enables custom watchfaces. |  |

</details>

<details>
<summary>📦 ÖBB Scotty&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `de.hafas.android.oebb`

**🎯 Supported versions:**

| 9.0.5 (72) |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Blocks Wegfinder ad, marketing banners and others. |  |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |
| [Enable OSM map](#enable-osm-map) | Activates the built-in OpenStreetMap / HaCon map engine | • Tile server URL |

</details>

<details>
<summary>📦 SBB Mobile&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `ch.sbb.mobile.android.b2c`

**🎯 Supported versions:**

| 12.27.0.87.master |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Disables multiple ad types. |  |
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |
| [Enable screenshots](#enable-screenshots) | Allows taking screenshots and screen recordings. |  |

</details>

<details>
<summary>📦 mobile.de&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `de.mobile.android.app`

**🎯 Supported versions:**

| 10.28.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracking](#disable-tracking) | Disables Trackers and Analytics. |  |
| [Hide AI](#hide-ai) | Hides AI Assistant and summaries etc. |  |
| [Hide CHECK24 insurance](#hide-check24-insurance) | Hides the CHECK24 vehicle insurance section in additional services. |  |
| [Hide sponsored ads](#hide-sponsored-ads) | Hides sponsored listings, ads, and in-feed ad banners. |  |

</details>

<details>
<summary>📦 mydealz&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.tippingcanoe.mydealz`

**🎯 Supported versions:**

| 8.21.01 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracking](#disable-tracking) | Disables Tracking and Analytics. |  |
| [Hide popups](#hide-popups) | Disables in-app review prompts, popups, and surveys. |  |
| [Hide sponsored deals](#hide-sponsored-deals) | Hides sponsored deals, discussions, and in-feed advertisement cards. |  |

</details>

<details>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.reddit.frontpage`

**🎯 Supported versions:**

| 2026.46.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide AutoModerator comments](#hide-automoderator-comments) | Automatically collapses comments from AutoModerator in threads by default. |  |

</details>

<!-- PATCHES_END -->

---

## 🛠️ Building from Source

To compile the `.mpp` patch bundle locally, make sure **JDK 17 or 21** and the **Android SDK** are configured:

```bash
git clone https://github.com/henr1klmb/henr1k-patches.git
cd henr1k-patches
./gradlew assembleRelease
```

The compiled patch bundle will be generated inside `patches/build/libs/`. For details on applying `.mpp` bundles via CLI or desktop tools, check the [Morphe Documentation](https://github.com/MorpheApp/morphe-documentation).

---

## 🐛 Reporting Issues

If an app update breaks an existing patch, feel free to open an issue. To help reproduce the problem quickly, please include:

- **Target App:** Name, package ID, and exact version number (e.g., `de.mobile.android.app`).
- **APK Source:** Clean, unmodded APK architecture (`arm64-v8a` preferred—no pre-patched or repacked splits).
- **Bundle Channel:** Whether you used a `stable` release or a `dev` pre-release.
- **Crash Logs:** Relevant stack traces captured via `adb logcat`.

---

## 💬 FAQ

<details>
<summary><strong>Why don't Google Sign-In or Google Cloud features work after patching?</strong></summary>
<br>
Patching requires re-signing the APK with a custom key, which invalidates signature checks used by Google Play Services. Install <strong>MicroG</strong> if an app relies on Google account authentication.
</details>

<details>
<summary><strong>Which APK format should I download?</strong></summary>
<br>
Always start from an unmodified APK or split bundle (<code>arm64-v8a</code>) obtained from a trusted archive such as APKMirror, or the ones suggested in the Morphe Manager .
</details>

<details>
<summary><strong>Can you add a patch for App XYZ?</strong></summary>
<br>
You are welcome to open an enhancement request, as long as the requested feature is handled client-side and not locked behind server authentication.
</details>

---

## ⚖️ Disclaimer & License

This project is intended strictly for **educational and personal research purposes**. It is not affiliated with or endorsed by any of the application developers mentioned in this repository. Use at your own risk, and support developers by purchasing legitimate subscriptions where applicable.

- Built on top of [Morphe](https://github.com/MorpheApp/) and [ReVanced](https://github.com/revanced).
- Distributed under the [GNU General Public License v3.0](LICENSE).