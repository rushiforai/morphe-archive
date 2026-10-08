# 🧩 Wagg13 Morphe Patches

[![License: GPLv3](https://img.shields.io/github/license/WaggBR/Wagg13Patch_Morphe?color=blue)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/WaggBR/Wagg13Patch_Morphe?include_prereleases)](https://github.com/WaggBR/Wagg13Patch_Morphe/releases)
[![Open Issues](https://img.shields.io/github/issues/WaggBR/Wagg13Patch_Morphe)](https://github.com/WaggBR/Wagg13Patch_Morphe/issues)
[![Morphe](https://img.shields.io/badge/Patcher-Morphe-7c3aed)](https://morphe.software/)

> Curated collection of Morphe patches for premium feature unlocks on Android applications.

This repository contains high-quality, actively maintained patches for popular Android apps using the [Morphe](https://morphe.software/) patching framework.

---

## ⚠️ Important Warnings

> 🚫 **No liability for bans.** Using modified apps may violate the terms of service of the applications involved and can lead to warnings, restrictions, or temporary/permanent account bans. **The author is not responsible for any ban, suspension, account restriction, data loss, or any other consequence resulting from the use of these patches.** You use them entirely at your own risk.

> 🧪 **Beta patches.** The *Instant Gallery Post* (Instants), *Story Mention Badge* (Instagram) and both *BuzzCast* patches (*Unlock SVIP* and *Hide live room notice*) are currently in **BETA**. Each is pinned to a single exact app version and may behave unexpectedly, stop working, or need re-testing after an app update.

---

## 🚀 Quick Start

### Option 1: Add to Morphe (Recommended)

[➕ **Click here to add this patch source directly to Morphe**](https://morphe.software/add-source?github=WaggBR/Wagg13Patch_Morphe)

### Option 2: Manual Installation

1. Open **Morphe Manager** on your Android device
2. Navigate to **Patch Sources**
3. Add this repository URL:
   ```
   https://github.com/WaggBR/Wagg13Patch_Morphe
   ```
4. Enable patches from the patch list
5. Build and install your patched APK

---

## 📋 Available Patches

<!-- PATCHES_START -->
> **[v1.1.1](https://github.com/WaggBR/Wagg13Patch_Morphe/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Bisbi&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Forces the Premium state source before it is recalculated and adds the mod author signature below the Bisbi version. |  |

</details>

<details open>
<summary>📦 com.guochao.faceshow&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 3.2.90 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide live room notice](#hide-live-room-notice) | Removes the 'healthy live streaming' notice shown in every live chat. |  |
| [Unlock SVIP](#unlock-svip) | Unlocks SVIP features, blocks purchase flow and Unity Ads. |  |

</details>

<details open>
<summary>📦 Instagram Instants&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 444.0.0.45.108 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Instants Mod](#instants-mod) | Support for posting photos from the gallery to Instants via the gallery icon on the home screen. |  |

</details>

<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 439.0.0.37.89 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Story mention indicator](#story-mention-indicator) | Shows an "@N mention" pill in the story header when the story mentions someone. Tap it to list and open the mentioned profiles. |  |

</details>

<details open>
<summary>📦 com.tinder&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 17.34.1 |
| :---: |


| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Tinder Remove Ads](#tinder-remove-ads) | Remove os anúncios exibidos entre os perfis do deck de swipe. |  |
| [Tinder Unlimited Rewind](#tinder-unlimited-rewind) | Bypasses the paywall check and enables unlimited REWIND on FREE accounts. |  |

</details>

<details open>
<summary>📦 Native Camera&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.4 | 1.4.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Forces the premium entitlement in Native Camera. Premium status is stored locally and controls features such as the sub-40-Mbps bitrate cap. Compatible with v1.4 and v1.4.1 (PairIP was removed in v1.4.1). |  |

</details>

<!-- PATCHES_END -->

### Patch Details

#### 🔥 Tinder — Rewind Unlock & No ADS
- **Package:** `com.tinder`
- **Functionality:** Unlocks Unlimited Rewinds (only) & ads blocker
- **Compatibility:** v17.34.1 only (the patch is tied to this exact version)
- **Status:** ✅ Active & Maintained (BETA)
- **Limitations:** No other Tinder feature can be enabled by this patch. All other premium features depend on Tinder's servers, including the photos of people who liked your profile, which are already blurred when they arrive from the server. See **Important Warnings** at the top of this page.
- **Ban risk:** ⚠️ Account restrictions or bans are possible. The author is not responsible for them.

#### 📷 Native Camera — Premium Unlock
- **Package:** `com.rawcam.app`
- **Functionality:** Enables advanced camera features
- **Compatibility:** Compatible with all supported devices
- **Status:** ✅ Active & Maintained (thanks to [Franticg33k](https://github.com/franticg33k/morphe-patches) — I fixed the patch to work with the current version.)

#### 📱 Bisbi — Premium Unlock
- **Package:** `com.nouxi.bisbi`
- **Functionality:** Removes premium subscription restrictions and enables all app features
- **Compatibility:** Latest version support
- **Status:** ✅ Active & Maintained

#### 📸 Instagram — Story Mention Badge
- **Package:** `com.instagram.android`
- **Functionality:** Displays a bubble showing "@" plus the number of times you were tagged on a Story. Turn on/off using the options in the story.
- **Compatibility:** v439.0.0.37.89 only (the patch is tied to this exact version)
- **Status:** 🧪 **Beta** — Errors and Bugs are expected.
- **Ban risk:** ⚠️ Account restrictions or bans are possible. The author is not responsible for them.

#### 📷 Instants — Instant Gallery Post
- **Package:** `com.instagram.moonshot`
- **Functionality:** Posts images straight from the phone's gallery as if they had just been captured live
- **Compatibility:** v444.0.0.45.108 only (the patch is tied to this exact version)
- **Status:** 🧪 **Beta** — Errors and Bugs are expected.
- **Ban risk:** ⚠️ Account restrictions or bans are possible. The author is not responsible for them.

#### 🎥 BuzzCast — Unlock SVIP & Hide Live Notice
- **Package:** `com.guochao.faceshow`
- **Functionality:**
  - **Unlock SVIP:** forces the SVIP state on the client side (VIP level, VIP flag, expiry and badge), stubs the Google Play purchase flow and disables Unity Ads (including the related ad permissions/activities in the manifest).
  - **Hide live room notice:** removes the "healthy live streaming" message that is posted to the chat every time you enter a live room.
- **Compatibility:** v3.2.90 only (the patches are tied to this exact version — the notice patch relies on a version-specific resource ID)
- **Status:** 🧪 **Beta** — Errors and Bugs are expected.
- **Limitations:** Only what is decided on the client can be unlocked. Anything that depends on BuzzCast's servers (for example gifts or paid content validated server-side) cannot be unlocked by a patch.
- **Ban risk:** ⚠️ Account restrictions or bans are possible. The author is not responsible for them.
- **Credits & what changed:** the SVIP patch is based on the original work of **[rushiranpise](https://github.com/rushiranpise/morphe-patches)** — full credit to them for the original idea and implementation. In our tests, the original patch made BuzzCast close a few seconds after opening (on both 3.2.86 and 3.2.90). The Android log showed a `java.lang.VerifyError` on `com.unity3d.ads.UnityAds` ("bad exception entry: startAddr=0 endAddr=0"): the original code wiped the whole body of the Unity Ads methods but left their `try/catch` blocks behind, so Android's verifier rejected the class. Our version never deletes instructions; it only inserts an early return at the start of each method, which keeps the bytecode valid. Other improvements:
  - Re-checked every patched class and method against the 3.2.90 DEX (the old `BuyVipViewModel` stubs no longer exist in this version and were dropped).
  - Merged the VIP, billing and Unity Ads changes (plus the manifest cleanup) into a single **Unlock SVIP** patch.
  - New **Hide live room notice** patch (not in the original).


---

## 🔧 Requirements

- **Morphe Manager** installed on your device
- **Supported Architecture:** arm64-v8a (primary), others may work but untested
- **Android:** 8.0 and above
- **Original APK:** Obtained from official sources (APKMirror, Play Store, etc.)

> ⚠️ **Note:** Patches are tested on arm64-v8a architecture. Other architectures (armeabi-v7a, x86, x86_64) may have compatibility issues.

---

## 📖 Usage Guide

### Building a Patched APK

1. **Prepare your APK:**
   - Download the original APK for the target app
   - Ensure it's the correct architecture (arm64-v8a recommended)

2. **Apply patches in Morphe:**
   - Select the app from the available patches list
   - Choose the version that matches your APK
   - Enable desired patches
   - Configure patch options if available

3. **Generate and Sign:**
   - Click "Build APK"
   - Morphe will sign the patched APK automatically
   - Install the generated APK on your device

### Configuration

Most patches work out-of-the-box with sensible defaults. Some patches may expose configuration options within the app's settings.

---

## 🐛 Reporting Issues

Found a bug or compatibility issue? Help us improve:

1. **Check:** Does the issue persist with the latest patch version?
2. **Gather:** Collect the following information:
   - App version tested
   - Device model and Android version
   - APK source (APKMirror, Play Store, etc.)
   - Architecture (arm64-v8a, etc.)
   - **Error logs (required — reports without logs will be ignored and closed)**

3. **Report:** Open an [issue on GitHub](https://github.com/WaggBR/Wagg13Patch_Morphe/issues) with:
   ```
   Title: [App Name] — Brief description of issue

   Details:
   - App Version: X.Y.Z
   - Device: [Model]
   - Android: X
   - APK Source: [Source]
   - Architecture: arm64-v8a

   Logs (required):
   [Paste the Morphe patching log and/or the crash log here]

   Description:
   [Detailed explanation of the issue]
   ```

> ℹ️ Requests for new premium features for any app will be discontinued, as the vast majority depend on the app's servers and cannot be implemented via an update.

---

## 🛠️ Building from Source

### Prerequisites

- **Git**
- **JDK 21**
- **Android SDK** (with `ANDROID_HOME` set)
- **GitHub personal access token** with `read:packages` (used by Gradle to download Morphe dependencies from GitHub Packages)

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/WaggBR/Wagg13Patch_Morphe.git
   cd Wagg13Patch_Morphe
   ```

2. Set your environment variables:
   ```bash
   export ANDROID_HOME="$HOME/Android/Sdk"
   export GITHUB_ACTOR="your-github-username"
   export GITHUB_TOKEN="your-github-token"
   ```
   Alternatively, put `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`.
   **Never** put your token in the project's `gradle.properties` — that file is committed.

3. Build the patch bundle:
   ```bash
   ./gradlew buildAndroid
   ```

4. Find the built patch bundle at:
   ```
   patches/build/libs/patches-*.mpp
   ```

5. Load the `.mpp` file in Morphe (Desktop or Manager) like any other patch bundle.

---

## 📝 License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)** — see the [LICENSE](LICENSE) file for details.

---

## ⚖️ Disclaimer

- This project is provided **as-is** for educational and research purposes.
- **Use at your own risk. The author is not responsible for account bans, suspensions, restrictions, data loss, or any other consequence of using these patches.**
- Respect the terms of service of the applications being patched.
- This tool should only be used for personal, non-commercial purposes.
- Always download original APKs from official sources.
- This project is independent and not affiliated with Tinder, Google, Bisbi, Instagram, Instants, BuzzCast, or Morphe. All trademarks are the property of their respective owners.

---

## 🤝 Contributing

Interested in contributing? We welcome:

- **Bug reports** — **with error logs attached** (see the rules below)
- **New app requests** — only when you already have a working patch (see the rules below)
- **Patch improvements** with clear explanations
- **Documentation** enhancements

Please open an issue or discussion before submitting pull requests for significant changes.

### 🐞 Bug reports: logs are mandatory

> 🚨 **Bug reports without error logs will be ignored and closed.** No logs, no investigation — there is no way to find the cause of a crash or a failed patch without them.

A valid bug report must include:

- The **error log** (required): the patching log from Morphe and, if the app crashes or closes after patching, the Android crash log (for example `adb logcat -b crash`, or the error text from the Android feedback/crash screen)
- App version, device model, Android version, APK source and architecture (see [Reporting Issues](#-reporting-issues))

### ➕ New app requests: bring working code

> ℹ️ **New apps are only added if the requester already provides a working patch** (code that has been tested and runs) for that app, ready to be incorporated into this project.

Requests that only name an app, with no working code, will not be accepted. Include the app name, package name, the exact version the code was made for and how you tested it.

---

## 💬 Support & Feedback

- **Issues:** [GitHub Issues](https://github.com/WaggBR/Wagg13Patch_Morphe/issues)
- **Discussions:** [GitHub Discussions](https://github.com/WaggBR/Wagg13Patch_Morphe/discussions)

For questions about Morphe itself, visit [Morphe's official documentation](https://morphe.software/).

---

## 📊 Project Statistics

- **Total Patches:** 6 applications (7 patches)
- **Last Updated:** October 2026
- **Status:** Actively maintained
- **Architecture Support:** arm64-v8a (primary)

---

## 🙏 Acknowledgments

- [Morphe Framework](https://morphe.software/) — The powerful patching engine
- [Franticg33k](https://github.com/franticg33k/morphe-patches) — Original Native Camera patch
- [rushiranpise](https://github.com/rushiranpise/morphe-patches) — Original BuzzCast patch, which our *Unlock SVIP* patch is based on (we fixed the launch crash and updated it for v3.2.90)
- Android community for continuous feedback and support

---

**Made with ❤️ by Wagg13**

Last updated: October 2026

---

## 💖 Support This Project

If these patches save you time, consider supporting development:

<div align="center">
  <a href="https://buymeacoffee.com/mkr_infinity" target="_blank">
    <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="50" />
  </a>
</div>

**🪙 Crypto donations:**

| Network | Address |
|---|---|
| 🔷 Ethereum (ETH) | `0x17d312Effe6Ba2A208b10D142736636f50D4a02E` |
| 🟠 Bitcoin (BTC) | `bc1qwppr0ymjas0q6ww3fw982rx2u8r3yzfg9kwmuu` |
| 🟣 Solana (SOL) | `3REozV2tdDgeiCQsUPgg64RSSUGMDhXy6LqBZtZQKKFu` |

> ⚠️ Double-check every character before sending — crypto transfers can't be reversed, and a single wrong character sends funds to an address no one controls.
