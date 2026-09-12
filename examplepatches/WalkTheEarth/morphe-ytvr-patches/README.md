# 📦🧩 YouTube VR Patches

Morphe patches for YouTube VR (Meta Quest / Horizon OS).

## ❓ About

Patches for the YouTube VR app for Meta Quest (`com.google.android.apps.youtube.vr.oculus`).

YouTube VR is a heavily obfuscated XR app, so many patches made for the regular
YouTube app do not apply here (Shorts, miniplayer, navigation bar, fullscreen
gestures, etc.). This repository contains the patches that make sense on a VR
headset, matched with fingerprints that survive app updates.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=WalkTheEarth/morphe-ytvr-patches

Supported app versions:

| 1.61.48 |
| :---: |

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/WalkTheEarth/morphe-ytvr-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 YouTube VR&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 1.61.48 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable DRC audio](#disable-drc-audio) | Disables DRC (Dynamic Range Compression) audio. |  |
| [Disable QUIC protocol](#disable-quic-protocol) | Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol. | • Disable QUIC protocol |
| [Hide ads](#hide-ads) | Hides video ads. |  |
| [Open links externally](#open-links-externally) | Opens links in an external app instead of the in-app browser. |  |
| [Remove viewer discretion dialog](#remove-viewer-discretion-dialog) | Removes the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| [Spoof app version](#spoof-app-version) | Adds an option to trick the app into thinking you are running a different version. | • Spoofed version name |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

YouTube VR Patches are licensed under the [GNU General Public License v3.0](LICENSE)
