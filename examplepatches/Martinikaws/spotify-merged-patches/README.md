# Spotify merged patches

An unofficial personal bundle that combines two Spotify patch sets for use with
[Morphe](https://morphe.software/):

- [spicetify/morphe-patches](https://github.com/spicetify/morphe-patches) (base, all 8 patches, unchanged)
- [pablobaro/pablobaro-morphe-patches](https://github.com/pablobaro/pablobaro-morphe-patches) (9 patches, ported)

This is not affiliated with or supported by either project. Do not report problems with this
bundle to them. This repository publishes patch source and bundles, not Spotify APKs.

> [!NOTE]
> Target: Spotify 9.1.80.2221, ARM64 (APKM). The Spicetify patches refuse any other version.

[**➕ Add this source to Morphe**](https://morphe.software/add-source?github=Martinikaws/spotify-merged-patches)

## What changed in the merge

- The Spicetify code is untouched and still builds against morphe-patcher 1.x.
- The pablobaro patches were ported from morphe-patcher 2.x to 1.x (`patches/.../pablobaro/patches/shared/Compat.kt`)
  and retargeted from Spotify 9.1.94.1929 to 9.1.80.2221.
- The pablobaro patches run in the finalize phase, after every Spicetify patch. Spicetify verifies
  Spotify's classes against pinned hashes, so they have to see the classes before anything else edits them.
- Left out, because Spicetify already has an equivalent that is verified on this version:
  pablobaro's *Hide Premium tab*, *Hide ad sections* and *Sanitize sharing links*.
  *Diagnose Spotify client* is left out because it is pinned to 9.1.94 class names.

## Patches

From pablobaro: Block popup ads, Mute audio ads, Hide playlist ads, Hide video ads,
Fix third party launchers widgets (on by default), and Disable ad breaks, Hide ad views,
Hide context menu upsells, Change package name (off by default).

From Spicetify: Clean sharing links (on by default), and Theme colors, Pin shortcuts on Home,
Spicetify extensions, Local files from a server, Hide Home and Browse ads, Hide Premium tab,
Hide player ad cards (off by default, configured in Spotify's Spicetify settings).

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Martinikaws/spotify-merged-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;17 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;9.1.94.1929 |
| :---: |
| Experimental Android customization patches; runtime compatibility is still being verified. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block popup ads](#block-popup-ads) | Blocks fullscreen promotions ("Pendragon" messages) shown when opening the app. |  |
| [Change package name](#change-package-name) | Changes the package name and app name so the patched app can be installed alongside the original Spotify app. | • Package name<br>• App name |
| [Clean sharing links](#clean-sharing-links) | Removes sharing identifiers and marketing parameters from open.spotify.com links. Keeps playback timestamps, context, and other parameters. |  |
| [Disable ad breaks](#disable-ad-breaks) | Disables the ad slots that play ads between songs. Experimental. |  |
| [Fix third party launchers widgets](#fix-third-party-launchers-widgets) | Allows the Spotify widgets to be added to third party launchers. |  |
| [Hide Home and Browse ads](#hide-home-and-browse-ads) | Hides image and video brand-ad sections on Home and Browse. Does not suppress audio ads, player ads, or upgrade prompts. Experimental. |  |
| [Hide Premium tab](#hide-premium-tab) | Hides the Premium navigation tab. Change this in Spicetify settings, then restart Spotify. Does not change your subscription or remove other ads. |  |
| [Hide ad views](#hide-ad-views) | Hides ad banners, ad labels, ad overlay controls, the ad player and the audio and embedded ad layouts of the now playing view. |  |
| [Hide context menu upsells](#hide-context-menu-upsells) | Removes "Premium" entries from the context menus of songs, albums and playlists. (Only works on older Spotify versions.) |  |
| [Hide player ad cards](#hide-player-ad-cards) | Hides image brand-ad cards and embedded ad pages in Now Playing. Does not suppress audio ads or other player overlays. Experimental. |  |
| [Hide playlist ads](#hide-playlist-ads) | Removes ads embedded into playlists. |  |
| [Hide video ads](#hide-video-ads) | Disables the video ad plugin of the now playing view. |  |
| [Local files from a server](#local-files-from-a-server) | Streams audio from an HTTPS WebDAV folder or Jellyfin music library into Local Files and Your Library. Configure the server in Spicetify settings; playback needs Spotify's Local audio files setting. Experimental; requires byte-range support. Not available for root mount installs. |  |
| [Mute audio ads](#mute-audio-ads) | Mutes the music stream while an audio ad plays and restores the volume afterwards. Enabling "Device broadcast status" in the Spotify settings improves the ad detection. |  |
| [Pin shortcuts on Home](#pin-shortcuts-on-home) | Pick playlists, albums or Liked Songs to pin first on Home, or turn on Show only my pins to hide Spotify's other shortcuts. Pins are saved on this device; restart Spotify after changing them. |  |
| [Spicetify extensions](#spicetify-extensions) | Adds Android versions of Spicetify extensions to the Spicetify Marketplace's Extensions tab, in Spicetify settings, each off until you turn it on. Trash Bin skips the songs and artists you throw away from their menus. Play a random song plays one from all of Spotify or your library, from a Random pill on Home. Shuffle+ plays a playlist, album or Liked Songs in a truly random order when you long-press the shuffle button in Now Playing, choose Shuffle+ this playlist in a playlist's menu, or use its sheet. Hide podcasts hides podcasts and episodes on Home and in Search, and their filters there and in Your Library, and audiobooks unless you turn that off. |  |
| [Theme colors](#theme-colors) | Choose a theme, such as OLED, or your own colors in Spicetify settings. Requires Android 11 or later. Some screens and hardcoded colors keep Spotify's colors. |  |

</details>

<!-- PATCHES_END -->

## Building

`./gradlew buildAndroid` needs a GitHub token with `read:packages` (`gpr.user` / `gpr.key` Gradle
properties, or `GITHUB_ACTOR` / `GITHUB_TOKEN`). The **Check** workflow builds every pushed branch
and uploads the `.mpp` bundle as an artifact; the **Release** workflow publishes from `main`.
See [CONTRIBUTING.md](CONTRIBUTING.md) for the Spicetify verification tools.

## License

GPLv3, see [LICENSE](LICENSE) and [NOTICE](NOTICE). Both upstream projects are GPLv3.
