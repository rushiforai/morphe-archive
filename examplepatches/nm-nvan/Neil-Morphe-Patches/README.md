# 👋🧩 Neil Morphe Patches

Neil's personal patches for apps, for use with [Morphe](https://morphe.software).

## ❓ About

A personal collection of patches for apps I use, maintained by Neil ([@nm-nvan](https://github.com/nm-nvan)).
This is an independent project and is not affiliated with or endorsed by the Morphe project.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=nm-nvan/Neil-Morphe-Patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/nm-nvan/Neil-Morphe-Patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 theScore&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 26.15.0 | 26.12.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Leagues tab sections](#hide-leagues-tab-sections) | Adds options in Morphe Settings to hide the league chips and the Spotlight section on the Leagues tab. |  |
| [Hide Scorecast blocks](#hide-scorecast-blocks) | Adds options in Morphe Settings to hide blocks on a game's Scorecast tab, such as Game News and Odds. |  |
| [Hide bottom navigation tabs](#hide-bottom-navigation-tabs) | Adds options in Morphe Settings to hide the News, Scores, Favorites and Bet tabs. Leagues is always shown. |  |
| [Hide game and league tabs](#hide-game-and-league-tabs) | Adds options in Morphe Settings to hide individual top tabs on game and league screens. |  |
| [Keep classic game screen](#keep-classic-game-screen) | Adds an option in Morphe Settings (on by default) to keep the classic game screen if theScore turns on its redesigned one, so the game tab and Scorecast patches keep working. |  |
| [Remove ads](#remove-ads) | Removes ads everywhere: the startup splash, banners and large ads on every screen, sponsor ads, full-screen ads and video ads. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Neil Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
