# 👋🧩 Rosaldivo Patches

Additional patches for use with Morphe.

## ❓ About

Small patches that are meant to be applied together with the official Morphe patches.

- **Playlist track tap action** (YouTube Music): tapping a track inside a playlist or album
  plays only that track, or adds it to the end of the queue, instead of replacing the queue
  with the whole playlist. Pick the behavior with the patch option `Tap action`.
<!--
- **Keep autoplay setting** (YouTube Music): fixes the autoplay switch in Settings > Playback
  turning itself back on when a new track starts. The patch has no options.
-->
- **No mix for single songs** (YouTube Music): with autoplay off, choosing a single song (tapping
  it, or 'Play next' on an empty queue) plays only that song, instead of filling the queue with
  a radio mix. Albums and playlists are not touched. The patch has no options.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Rosaldivo/rosaldivo-morphe-patches

Then patch with both the official Morphe patches and these patches selected.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://github.com/Rosaldivo/rosaldivo-morphe-patches/releases/tag/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;9.46.51 | 🧪&nbsp;9.40.51 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [No mix for single songs](#no-mix-for-single-songs) | When autoplay is off, choosing a single song plays only that song, instead of filling the queue with a radio mix. |  |
| [Playlist track tap action](#playlist-track-tap-action) | Plays only the tapped track of a playlist or album, or adds it to the queue, instead of replacing the queue with the whole playlist. | • Tap action |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Rosaldivo Patches are licensed under the [GNU General Public License v3.0](LICENSE)
