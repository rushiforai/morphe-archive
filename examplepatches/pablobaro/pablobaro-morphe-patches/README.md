# 👋🧩 Pablobaro Morphe patches

Spotify patches for use with Morphe.

## ❓ About

This repository provides patches for Spotify, such as removing ads, hiding upsells and
removing tracking parameters from shared links.

### ⚠️ Known limitation: "Something went wrong" and no playback

Spotify currently refuses to serve content to any build that is not signed by Spotify.
A patched app is always re-signed, so after logging in it may show "Something went wrong"
on the Home tab and fail to play tracks, or skip them after a few seconds.

- This does not depend on which patches are enabled. The official APK, re-signed and with
  no patches applied, fails the same way, while the Play Store install works with the same account.
- It was reproduced on Spotify 9.1.94.1929 and 9.1.98.621.
- Spotify's server answers the Home request with an empty response. The catalog appears to
  require a Google Play Integrity attestation tied to the app's signing certificate.
- There is no known fix that works without root. To get a working app back, uninstall the
  patched app and install the official one from the Play Store.

See [issue #9](https://github.com/pablobaro/pablobaro-morphe-patches/issues/9) for details and updates.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/pablobaro/pablobaro-morphe-patches

<a href="https://morphe.software/add-source?github=pablobaro/pablobaro-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.3](https://github.com/pablobaro/pablobaro-morphe-patches/releases/tag/v1.1.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**Package name:** `com.spotify.music`

**🎯 Supported versions:**

| 9.1.94.1929 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block popup ads](#block-popup-ads) | Blocks fullscreen promotions ("Pendragon" messages) shown when opening the app. |  |
| [Change package name](#change-package-name) | Changes the package name and app name so the patched app can be installed alongside the original Spotify app. | • Package name<br>• App name |
| [Diagnose Spotify client](#diagnose-spotify-client) | Logs signing-certificate queries and integrity-request outcomes without changing them. Does not log authentication tokens or account data. Experimental diagnostic, not a playback fix. |  |
| [Disable ad breaks](#disable-ad-breaks) | Disables the ad slots that play ads between songs. Experimental. |  |
| [Fix third party launchers widgets](#fix-third-party-launchers-widgets) | Allows the Spotify widgets to be added to third party launchers. |  |
| [Hide Premium tab](#hide-premium-tab) | Removes the "Premium" tab from the bottom navigation bar. |  |
| [Hide ad sections](#hide-ad-sections) | Removes brand ad sections from the home and search page. |  |
| [Hide ad views](#hide-ad-views) | Hides ad banners, ad labels, ad overlay controls, the ad player and the audio and embedded ad layouts of the now playing view. |  |
| [Hide context menu upsells](#hide-context-menu-upsells) | Removes "Premium" entries from the context menus of songs, albums and playlists. |  |
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
