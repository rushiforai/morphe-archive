# 👋🧩 Bugg4s Patches

Personal patches for use with [Morphe](https://morphe.software).

## ❓ About

This repository contains patches I develop for apps I use, compatible with the Morphe patcher.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Bugg4/bugg4s-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Bugg4/bugg4s-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 OPL Monitor&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.3.65 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change installer source](#change-installer-source) | Spoofs the installer source so the app appears to be installed from an app store. Required for the patched app to pass the startup license check, otherwise it redirects to Google Play and closes. | • Spoofed package installer name |
| [Remove ads](#remove-ads) | Removes banner, interstitial, rewarded, rewarded interstitial, app open and native ads by preventing the Google Mobile Ads SDK from loading them. |  |
| [Remove internet permission](#remove-internet-permission) | Removes the INTERNET permission from the manifest. This stops the app from reaching the network at all, which also prevents app update checks. This will likely break features that download data, such as DTC descriptions, VIN decoder gauges and function files. |  |
| [Spoof app version](#spoof-app-version) | Changes the version name the app reports to itself. Reporting a version higher than any published release can prevent the in-app update prompt. The spoofed version will also be shown in the app's about screen. | • Spoofed version |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Bugg4s Patches are licensed under the [GNU General Public License v3.0](LICENSE)
