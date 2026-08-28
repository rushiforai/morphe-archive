# 👋🧩 rafag00's Morphe Patches

A small collection of unofficial patches for Android applications using [Morphe](https://github.com/MorpheApp).

Currently focused on patches for **Sony | Sound Connect**.

## Contents

- [👋🧩 rafag00's Morphe Patches](#-rafag00s-morphe-patches)
  - [Contents](#contents)
  - [How to use these patches](#how-to-use-these-patches)
  - [🩹 Patches](#-patches)
  - [🛠️ Building locally](#️-building-locally)
  - [⚠️ Disclaimer](#️-disclaimer)
  - [📜 License](#-license)

## How to use these patches

Add this repository as a patch source in Morphe:

<https://morphe.software/add-source?github=rafag00/morph-patches>

Alternatively, manually add the repository URL as a patch source:

<https://github.com/rafag00/morph-patches>

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/rafag00/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Sony | Sound Connect&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 13.2.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Use patched YouTube Music in Scene](#use-patched-youtube-music-in-scene) | Redirects the YouTube Music Scene integration to the patched YouTube Music package. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

Build the patch bundle with:

```bash
./gradlew buildAndroid
```

The generated .mpp file will be available under:

```bash
patches/build/libs/
```

See the Morphe documentation for more information about developing and applying patches.

## ⚠️ Disclaimer

These are unofficial third-party patches and are not affiliated with or endorsed by Sony or Morphe.

Patches modify third-party applications and may stop working after application updates. Use them at your own risk.

This repository contains only patch code and does not distribute modified or original application APKs.

## 📜 License

This project is licensed under the GNU General Public License v3.0.
