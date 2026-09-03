# Bruddas Patches

Repository for Morphe Patches.
<p align="center">

![GitHub Release](https://img.shields.io/github/v/release/bruddaa/bruddas-morphe-patches?style=for-the-badge)
![License](https://img.shields.io/github/license/bruddaa/bruddas-morphe-patches?style=for-the-badge)
![GitHub Stars](https://img.shields.io/github/stars/bruddaa/bruddas-morphe-patches?style=for-the-badge)
![GitHub Forks](https://img.shields.io/github/forks/bruddaa/bruddas-morphe-patches?style=for-the-badge)


</p>

### About


Patches for a variety of apps. I created this repo for the main purpose to get to know reverse engineering and android development. This repo is built with the help of AI

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

- Click here to add these patches to Morphe: https://morphe.software/add-source?github=bruddaa/bruddas-morphe-patches
- Or add by URL `https://github.com/bruddaa/bruddas-morphe-patches`
<br>

## Available Patches

<!-- PATCHES_START -->
> **[v1.2.0](https://github.com/bruddaa/bruddas-morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**3 patches** across **3 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Music player**](PATCHES.md#music-player-commediamusicmp3musicplayer) | 1 | `246.02` | [`com.media.music.mp3.musicplayer`](https://play.google.com/store/apps/details?id=com.media.music.mp3.musicplayer) |
| 2 | [**PrinterShare**](PATCHES.md#printershare-comdynamixsoftwareprintershare) | 1 | `12.25.0` | [`com.dynamixsoftware.printershare`](https://play.google.com/store/apps/details?id=com.dynamixsoftware.printershare) |
| 3 | [**Unit Converter**](PATCHES.md#unit-converter-comveewalabsunitconverter) | 1 | `2.0.2` | [`com.veewalabs.unitconverter`](https://play.google.com/store/apps/details?id=com.veewalabs.unitconverter) |
<!-- PATCHES_END -->
<br><br>

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.
<br><br>

## Disclaimer

> **⚠️ Legal Notice**
>
> This project is provided for **educational and research purposes only**. The patches in this repository modify third-party applications and may violate the terms of service of those applications.
>
> - This project is **not affiliated** with any of the app developers listed above.
> - Use these patches **at your own risk**. The author is not responsible for any consequences.
> - If you are a developer or rights holder and believe this project infringes on your rights, please [submit a takedown request](https://placeholder.com/) and the relevant patches will be **promptly removed**.
> - Users are encouraged to **support developers** by purchasing legitimate subscriptions if they find the apps useful.

<br><br>

## ❤️ Credits

Thanks to:

- [Morphe](https://github.com/MorpheApp/)
- [Revanced](https://github.com/revanced)
- [rushiranpise](https://github.com/rushiranpise/morphe-patches/)

## 📜 License

Bruddas Patches are licensed under the [GNU General Public License v3.0](LICENSE)
