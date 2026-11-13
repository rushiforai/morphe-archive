# Extended YouTube Playlists

Patches for YouTube, for use with [Morphe](https://morphe.software).

## ❓ About

YouTube builds playlists for every channel: all uploads, only videos, only
Shorts, only live streams, the popular ones, the members-only ones. They work,
but the app never lists them. This patch puts them on top of the channel's
**Playlists** tab:

| | All kinds | Videos | Shorts | Live streams |
|---|:---:|:---:|:---:|:---:|
| **All** | ✓ | ✓ | ✓ | ✓ |
| **Popular** | ✓ | ✓ | ✓ | ✓ |
| **Members only** | ✓ | ✓ | ✓ | ✓ |

<img src=".github/assets/screenshot.png" alt="Hidden playlists on top of the Playlists tab of two channels" width="720">

- The cards are the app's own cards: titles come from YouTube in your
  language, with real thumbnails and video counts.
- Empty lists are not shown. A list that is a copy of another one is not shown.
- The tab appears even on a channel that has no public playlists.
- The hidden lists stay first under both sort orders.

### ⚙️ Settings

In the patched app: **Morphe settings → Feed → Channel page → Hidden playlists**.

- **Show hidden playlists**: turn the whole patch on or off. Off, it does nothing.
- **Add Playlists tab**: give the tab to channels that have none.
- One switch for each of the 12 lists. A list that is off is never asked for. On by default:
  **All → Videos** and **Members only → All kinds**.

Morphe asks to restart the app after a change: pages already open keep the old lists. Apply
this patch together with Morphe Patches: the settings and the log come from them.

### How to use these patches

Click the button below, or add this repo url to Morphe Manager by hand:
https://github.com/chocolavv/extended-youtube-playlists

<a href="https://morphe.software/add-source?github=chocolavv/extended-youtube-playlists">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/chocolavv/extended-youtube-playlists/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.google.android.youtube`

**🎯 Supported versions:**

| 21.30.216 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hidden playlists](#hidden-playlists) | Adds an option to show the playlists YouTube builds for every channel in the Playlists tab of the channel. Settings are in Morphe settings > Feed > Channel page. Requires Morphe Patches. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

- Run `./gradlew buildAndroid`.
- The patches file is `patches/build/libs/patches-*.mpp`.
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patches file.

## 📜 License

Extended YouTube Playlists is licensed under the
[GNU General Public License v3.0](LICENSE). Not made by or linked to the
Morphe project or YouTube.
