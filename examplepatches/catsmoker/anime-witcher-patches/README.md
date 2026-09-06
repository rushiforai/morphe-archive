# Anime Witcher Morphe Patches

Patches for **Anime Witcher** (`com.anime.witcher`) v1.4.8.

> **Note:** Google login is no longer working.

### How to use

Click here to add these patches to Morphe: https://morphe.software/add-source?github=catsmoker/anime-witcher-patches

Or build locally:
```
./gradlew buildAndroid
```
The `.mpp` file will be in `patches/build/libs/patches-*.mpp`. Apply it using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/catsmoker/anime-witcher-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 Anime Witcher&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 1.4.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options | 🏷️&nbsp;Status |
|----------|----------------|-----------|-----------|
| [AMOLED black theme](#amoled-black-theme) | Sets the dark theme backgrounds (window, toolbars, cards, dialogs) to pure black (#000000) so OLED and AMOLED screens turn those pixels off and battery is saved. Light appearance is unchanged. Original APK: https://www.animewitcher.com/ |  | Optional |
| [Android TV](#android-tv) | Adds full Android TV / Fire TV support: manifest declarations, TV launcher entry and D-pad remote navigation (focusable content rows, focus out of the top bar, dialog focus). Original APK: https://www.animewitcher.com/ |  | Optional |
| [Android TV: D-pad navigation](#android-tv-d-pad-navigation) | Part of Android TV: makes the app fully navigable with a TV / Fire TV remote (focusable content rows, D-pad focus out of the top bar, dialog focus). Original APK: https://www.animewitcher.com/ |  | Optional |
| [Disable VPN detection and alerts](#disable-vpn-detection-and-alerts) | Removes VPN/DNS detection and the VPN alert dialogs. Original APK: https://www.animewitcher.com/ |  | Recommended |
| [Disable ads](#disable-ads) | Disables all ad display logic in the app. Original APK: https://www.animewitcher.com/ |  | Recommended |
| [Play with external player](#play-with-external-player) | Opens episodes in a system intent chooser so the user can pick their favorite video player (VLC, MX Player, etc.). Original APK: https://www.animewitcher.com/ |  | Recommended |
| [Rebranding](#rebranding) | Renames the app to 'Anime Witcher +', changes the package id to app.catsmoker.anime.witcher, badges the icon with a red +, points Telegram links to https://t.me/CATSM0KER and credits the About screen. Original APK: https://www.animewitcher.com/ |  | Recommended |
| [Rebranding: Telegram & About](#rebranding-telegram-about) | Part of Rebranding: points Telegram links to the configured handle (default https://t.me/CATSM0KER) and adds a credit line to the About screen. Original APK: https://www.animewitcher.com/ | • Telegram handle<br>• About credit | Optional |
| [Remove AppLovin initialization](#remove-applovin-initialization) | Removes AppLovin SDK initialization from the Application class. Original APK: https://www.animewitcher.com/ |  | Recommended |
| [Remove startup popup](#remove-startup-popup) | Removes the update/changelog and appearance popups that appear when the app starts. Original APK: https://www.animewitcher.com/ |  | Recommended |

</details>

<!-- PATCHES_END -->

## License

GPLv3
