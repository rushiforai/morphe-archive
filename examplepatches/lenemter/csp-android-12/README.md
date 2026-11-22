# 🎨 Clip Studio Paint Android 12 Patches

Morphe patches to run **Clip Studio Paint (CSP) 5.1.4+** on **Android 12 (API 31)**.

## ❓ About

Original Clip Studio Paint 5.1.4 requires Android 13 (`minSdkVersion 33`). This repository provides Morphe patches that backport the app to Android 12 (API 31):

- **Manifest compatibility:** Lowers `minSdkVersion` from 33 to 31.
- **Resource crash fix (SIGSEGV fault 0x10):** Fixes invalid `@null` drawable entries in `res/layout/edge_keyboard.xml` and `res/drawable/touchkey_*_level.xml` that cause `LevelListDrawable` inflate exceptions on Android 12.
- **Bytecode backporting:** Replaces inlined Android 13+ (API 33) methods (`PackageInfoFlags.of`, `ComponentInfoFlags.of`, and `Process.myProcessName`) with backwards-compatible equivalents.
- **Engine compatibility:** Bypasses Android 13 runtime checks in `PWLegacyJniBuildAndroid.getVersionSdkInt()`.
### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/lenemter/csp-android-12

<a href="https://morphe.software/add-source?github=lenemter/csp-android-12">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/lenemter/csp-android-12/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Clip Studio Paint&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `jp.co.celsys.clipstudiopaint.googleplay`

**🎯 Supported versions:**

| 5.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clip Studio Paint Android 12 Compatibility](#clip-studio-paint-android-12-compatibility) | Enables Clip Studio Paint 5.1.4 to run on Android 12 (API 31) by backporting API 33+ calls and fixing resource crashes. |  |
| [Clip Studio Paint Android 12 Resources](#clip-studio-paint-android-12-resources) | Fixes AndroidManifest.xml and XML drawables for Android 12 compatibility. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Patches are licensed under the [GNU General Public License v3.0](LICENSE)
