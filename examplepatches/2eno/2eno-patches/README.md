# 🧩 2eno Patches

Ad blocking and anti-tracking patches for apps without official ad free alternatives,
compatible with [Morphe](https://morphe.software).

| App | What the patches do |
|-----|---------------------|
| Spotify | Mute audio ads, hide ad banners, ad sections, popup ads, playlist and video ads, the Premium tab and Premium upsells, remove link tracking. **No Premium unlock.** |
| Kleinanzeigen | Hide ads and "Kleinanzeigen Pur" offers, remove link tracking |
| Untappd | Hide Google ads, feed ad slots and sponsored content |
| InterPals | Hide Google ads |

The same patches are also available for rooted devices as part of the
[NexAlloy](https://github.com/2eno/NexAlloy) LSPosed module, which uses the extension code of this repository.

## ❓ How to use these patches

Add this repository as a patch source in Morphe Manager:
https://morphe.software/add-source?github=2eno/2eno-patches

Or manually: Morphe Manager → Patch sources → ➕ → enter `https://github.com/2eno/2eno-patches`.

Morphe Manager checks the source for updates on its own. To get pre-releases from the `dev` branch,
enable pre-releases for this source.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/2eno/2eno-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Spotify&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block popup ads](#block-popup-ads) | Blocks fullscreen promotions ("Pendragon" messages) shown when opening the app. |  |
| [Fix third party launchers widgets](#fix-third-party-launchers-widgets) | Allows the Spotify widgets to be added to third party launchers. |  |
| [Hide Premium tab](#hide-premium-tab) | Removes the "Premium" tab from the bottom navigation bar. |  |
| [Hide ad sections](#hide-ad-sections) | Removes brand ad sections from the home and search page. |  |
| [Hide ad views](#hide-ad-views) | Hides ad banners, display ads and the ad player. |  |
| [Hide context menu upsells](#hide-context-menu-upsells) | Removes "Premium" entries from the context menus of songs, albums and playlists. |  |
| [Hide playlist ads](#hide-playlist-ads) | Removes ads embedded into playlists. |  |
| [Hide video ads](#hide-video-ads) | Disables the video ad plugin of the now playing view. |  |
| [Mute audio ads](#mute-audio-ads) | Mutes the music stream while an audio ad plays and restores the volume afterwards. Enabling "Device broadcast status" in the Spotify settings improves the ad detection. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes the tracking parameters (si, utm_source) from shared and copied links. |  |

</details>

<details open>
<summary>📦 Kleinanzeigen&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Pur](#hide-pur) | Hides the offers of the ad free subscription "Kleinanzeigen Pur". |  |
| [Hide ads](#hide-ads) | Hides ads in the feed, search results and listings. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Removes the tracking parameters (utm_*) from shared listing and profile links. |  |

</details>

<details open>
<summary>📦 InterPals&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Blocks banner, interstitial, rewarded, app open and native Google ads. |  |

</details>

<details open>
<summary>📦 Untappd&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Blocks banner, interstitial, rewarded, app open and native Google ads. |  |
| [Hide feed ads](#hide-feed-ads) | Removes the ad slots from the activity feed. |  |
| [Hide sponsored content](#hide-sponsored-content) | Removes sponsored beers, venues and posts from all lists. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development

- All changes go to the `dev` branch. Merge `dev` into `main` (merge commit, no squash) for a stable release.
- Use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages: `feat:` and `fix:` create a new release, `chore:` does not.
- Releases, `patches-bundle.json`, `patches-list.json`, `CHANGELOG.md` and the patch list above
  are created by [release.yml](.github/workflows/release.yml). Do not edit them by hand.

### Project layout

- `patches/`: Bytecode patches (Kotlin), one package per app.
- `extensions/twoeno/`: Java code merged into the patched apps.
  It only uses the Android framework and reflection, so [NexAlloy](https://github.com/2eno/NexAlloy)
  compiles the very same code into its Xposed hooks.

### 🛠️ Building locally

Building requires a GitHub token with the `read:packages` scope, because the Morphe
build tools are hosted on GitHub Packages. Add it to `~/.gradle/gradle.properties`:

```properties
gpr.user = your-github-username
gpr.key = ghp_...
```

- Run `./gradlew buildAndroid`
- The patches file is `patches/build/libs/patches-*.mpp`.
  Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

## 📜 License

2eno Patches are licensed under the [GNU General Public License v3.0](LICENSE).
This project is not affiliated with Morphe. See [NOTICE](NOTICE).
