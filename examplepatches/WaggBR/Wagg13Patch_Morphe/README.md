# 🧩 Wagg13 Morphe Patches

> Curated collection of Morphe patches for premium feature unlocks on Android applications.

This repository contains high-quality, actively maintained patches for popular Android apps using the [Morphe](https://morphe.software/) patching framework.

---

## ⚠️ Important Warnings

> 🚫 **No liability for bans.** Using modified apps may violate the terms of service of the applications involved and can lead to warnings, restrictions, or temporary/permanent account bans. **The author is not responsible for any ban, suspension, account restriction, data loss, or any other consequence resulting from the use of these patches.** You use them entirely at your own risk.

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
> **[v1.0.0](https://github.com/WaggBR/Wagg13Patch_Morphe/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Bisbi&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Forces the Premium state source before it is recalculated. |  |

</details>

<details open>
<summary>📦 Tinder&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 17.34.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Tinder Unlimited Rewind](#tinder-unlimited-rewind) | Enables unlimited rewinds (only). Every other premium feature depends on Tinder's servers and cannot be unlocked by a patch.<br><br>⚠️ **Warning:** One UI may cause errors or compatibility issues with the APK when this patch is applied. |  |

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

#### 🔥 Tinder — Rewind Unlock
- **Package:** `com.tinder`
- **Functionality:** Unlocks Unlimited Rewinds (only)
- **Compatibility:** v17.34.1 only (the patch is tied to this exact version)
- **Status:** ✅ Active & Maintained (BETA)
- **Limitations:** No other Tinder feature can be enabled by this patch. All other premium features depend on Tinder's servers, including the photos of people who liked your profile, which are already blurred when they arrive from the server. See **Important Warnings** at the top of this page.
- **Ban risk:** Account restrictions or bans are possible. The author is not responsible for them.

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
   - Error logs (if available)

3. **Report:** Open an [issue on GitHub](https://github.com/WaggBR/Wagg13Patch_Morphe/issues) with:
   ```
   Title: [App Name] — Brief description of issue

   Details:
   - App Version: X.Y.Z
   - Device: [Model]
   - Android: X
   - APK Source: [Source]
   - Architecture: arm64-v8a

   Description:
   [Detailed explanation of the issue]
   ```

> ℹ️ Feature requests for other Tinder premium features will be closed, since they depend on Tinder's servers and cannot be done through a patch.

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
- This project is independent and not affiliated with Tinder, Google, Bisbi, or Morphe. All trademarks are the property of their respective owners.

---

## 🤝 Contributing

Interested in contributing? We welcome:

- **Bug reports** with detailed reproduction steps
- **Feature requests** for new applications to support
- **Patch improvements** with clear explanations
- **Documentation** enhancements

Please open an issue or discussion before submitting pull requests for significant changes.

---

## 💬 Support & Feedback

- **Issues:** [GitHub Issues](https://github.com/WaggBR/Wagg13Patch_Morphe/issues)
- **Discussions:** [GitHub Discussions](https://github.com/WaggBR/Wagg13Patch_Morphe/discussions)

For questions about Morphe itself, visit [Morphe's official documentation](https://morphe.software/).

---

## 📊 Project Statistics

- **Total Patches:** 3 applications
- **Last Updated:** September 2026
- **Status:** Actively maintained
- **Architecture Support:** arm64-v8a (primary)

---

## 🙏 Acknowledgments

- [Morphe Framework](https://morphe.software/) — The powerful patching engine
- [Franticg33k](https://github.com/franticg33k/morphe-patches) — Original Native Camera patch
- Android community for continuous feedback and support

---

**Made with ❤️ by Wagg13**

Last updated: September 2026
