# 🗺️🎵 Google Maps & YouTube Music Morphe Patches

Custom Morphe patches enabling seamless YouTube Music mini-player integration directly inside Google Maps navigation, alongside package renaming and map data restoration.

## ❓ About

This patch bundle provides:
- **YouTube Music Mini Player in Google Maps**: Allows modded/re-signed YouTube Music apps (standard, Morphe, or ReVanced) to connect to Google Maps as the active media provider.
- **External Media Browser Connections**: Unlocks YouTube Music's MediaBrowserService entitlement gate and whitelist so Google Maps, Android Auto, and external controllers can browse and play media.
- **Package Renaming & Data Restoration**: Lets Google Maps run alongside the stock app with its own package name while keeping maps tile loading, search, and routing working.

### How to use these patches
Install Morphe Manager if you have not yet: https://morphe.software

[Click here to add bartlomiejfornalczyk patches to Morphe Manager](https://morphe.software/add-source?github=bartlomiejfornalczyk/morphe-patches)

Select the app you want to patch inside Morphe Manager, follow all instructions shown.
Add this repository as a custom source in Morphe Manager:
`https://github.com/bartlomiejfornalczyk/morphe-patches`

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/bartlomiejfornalczyk/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Google Maps&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 26.36.04.973607363 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow Morphe YouTube Music mini player](#allow-morphe-youtube-music-mini-player) | Enables YouTube Music and modded media apps as the navigation mini player. | • YouTube Music package name |
| [Allow Morphe YouTube Music package visibility](#allow-morphe-youtube-music-package-visibility) | Adds package queries and permission to AndroidManifest.xml for full media apps visibility. |  |
| [Change package name](#change-package-name) | Installs alongside stock Google Maps under its own package name and adds MicroG spoofing. | • Package name |
| [Restore map data](#restore-map-data) | Lets a re-signed Maps load tiles, search and routing, by sending Google's own package and certificate. |  |

</details>

<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow external media browser connections](#allow-external-media-browser-connections) | Allows Google Maps, Android Auto, and third-party media controllers to connect to YouTube Music. |  |

</details>

<details open>
<summary>📦 YouTube Music (Morphe)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow external media browser connections](#allow-external-media-browser-connections) | Allows Google Maps, Android Auto, and third-party media controllers to connect to YouTube Music. |  |

</details>

<details open>
<summary>📦 YouTube Music (ReVanced)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow external media browser connections](#allow-external-media-browser-connections) | Allows Google Maps, Android Auto, and third-party media controllers to connect to YouTube Music. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License
 
Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
