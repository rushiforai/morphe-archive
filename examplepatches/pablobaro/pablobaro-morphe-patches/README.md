# 👋🧩 Pablobaro Morphe patches

Spotify patches for use with Morphe.

## ❓ About

This repository provides patches for Spotify, such as removing ads, hiding upsells and
removing tracking parameters from shared links.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/pablobaro/pablobaro-morphe-patches

<a href="https://morphe.software/add-source?github=pablobaro/pablobaro-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/pablobaro/pablobaro-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**Package name:** `com.spotify.music`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block popup ads](#block-popup-ads) | Blocks fullscreen promotions ("Pendragon" messages) shown when opening the app. |  |
| [Disable ad breaks](#disable-ad-breaks) | Disables the ad slots that play ads between songs. Experimental. |  |
| [Fix third party launchers widgets](#fix-third-party-launchers-widgets) | Allows the Spotify widgets to be added to third party launchers. |  |
| [Hide Premium tab](#hide-premium-tab) | Removes the "Premium" tab from the bottom navigation bar. |  |
| [Hide ad sections](#hide-ad-sections) | Removes brand ad sections from the home and search page. |  |
| [Hide ad views](#hide-ad-views) | Hides ad banners, display ads and the ad player. (Only works on older Spotify versions.) |  |
| [Hide context menu upsells](#hide-context-menu-upsells) | Removes "Premium" entries from the context menus of songs, albums and playlists. (Only works on older Spotify versions.) |  |
| [Hide playlist ads](#hide-playlist-ads) | Removes ads embedded into playlists. |  |
| [Hide video ads](#hide-video-ads) | Disables the video ad plugin of the now playing view. |  |
| [Mute audio ads](#mute-audio-ads) | Mutes the music stream while an audio ad plays and restores the volume afterwards. Enabling "Device broadcast status" in the Spotify settings improves the ad detection. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes the tracking parameters (si, utm_source) from shared and copied links. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 🙏 Credits

The Spotify patches are derived from [2eno's patches](https://github.com/2eno/morphe-patches),
licensed under the GNU General Public License v3.0. They have been modified by pablobaro
(support for newer Spotify versions and the new "Disable ad breaks" patch).

## 📜 License

Pablobaro Morphe patches are licensed under the [GNU General Public License v3.0](LICENSE)
