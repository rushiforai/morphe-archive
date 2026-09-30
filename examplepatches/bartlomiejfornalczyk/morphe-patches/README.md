# 👋🧩 Morphe Patches template

WIP Don't download.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=bartlomiejfornalczyk/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.19](https://github.com/bartlomiejfornalczyk/morphe-patches/releases/tag/v1.4.19)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
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

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
