# 🧩 Morphe Patches

A collection of patches for [Morphe](https://morphe.software).

## ❓ About

This repository contains Morphe patches and publishes them as `.mpp` bundles.

### How to use these patches

Add this repository to Morphe Manager:

<a href="https://morphe.software/add-source?github=Globberry/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or use the repository URL directly: https://github.com/Globberry/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.7.5](https://github.com/Globberry/morphe-patches/releases/tag/v1.7.5)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Keyflow&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 1.5.10 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [PairIP License Check](#pairip-license-check) | Neuters PairIP license verification so the app runs without a valid license. |  |
| [Pro Unlock](#pro-unlock) | Forces all Pro features enabled, keeps Pro active after signer checks, and unlocks Pro exports (including the paid-export receipt check). |  |
| [Signer Identity](#signer-identity) | Forces the app's signer identity, signature checks, and signer-identity string to match the original publisher certificate. |  |
| [[Export] 12 Purchase Allow](#export-12-purchase-allow) | Always accept the paid-export purchase check (LP0JcGi9.MeOIJuj). |  |
| [[Export] 8 Diagnostics](#export-8-diagnostics) | Log the whole export flow to logcat (tag KFPro). Read with: adb logcat -s KFPro |  |
| [[Export] 9 Toast](#export-9-toast) | Show a toast naming the reason the export was cancelled. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The bundle is written to `patches/build/libs/patches-*.mpp`
- Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
