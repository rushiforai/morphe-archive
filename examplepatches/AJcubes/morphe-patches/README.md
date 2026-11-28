# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/AJcubes/morphe-patches

<a href="https://morphe.software/add-source?github=AJcubes/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.11.0](https://github.com/AJcubes/morphe-patches/releases/tag/v1.11.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Cricbuzz&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.cricbuzz.android`

**🎯 Supported versions:**

| 16.12.00 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Cricbuzz Disable Ads](#cricbuzz-disable-ads) | Removes all ads including banner, interstitial, video, and app open ads (always up to date with latest version!) |  |
| [Cricbuzz Premium](#cricbuzz-premium) | Unlocks premium features like live streaming and premium articles (always up to date with latest version!) |  |

</details>

<details open>
<summary>📦 LockMeOut&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.teqtic.lockmeout`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Dynamically injects a return-early bypass into the main license gate and enables debugging (always up to date with latest version!) |  |

</details>

<details open>
<summary>📦 MacroDroid&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.arlosoft.macrodroid`

**🎯 Supported versions:**

| 6.2.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks Pro for MacroDroid - Device Automation (always up to date with latest version!) |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GmsCore support (MicroG)](#gmscore-support-microg) | Routes Google Play Services calls through MicroG instead of real GPS.<br><br>Works for: Google apps (YouTube, Maps, News, Photos) and third-party apps using classic Google Sign-In (Android 13 and below).<br><br>Does not work for: Android 14+ Credential Manager sign-in (most modern third-party apps), Play Integrity / SafetyNet checks, or apps with custom auth.<br><br>Requires MicroG RE installed. Apply with Original app certificate patch. | • MicroG package name<br>• Main activity class (optional)<br>• Custom package name (optional) |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Spoof app signature](#spoof-app-signature) | Makes the app think its signing certificate is unchanged after Morphe re-signs it.<br><br>Useful when an app crashes or shows a tamper warning because it checks its own certificate.<br><br>Does not bypass Play Integrity / SafetyNet hardware attestation.<br><br>Apply with Original app certificate patch. | • Package name override (optional) |
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).<br><br>Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.<br><br>Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
