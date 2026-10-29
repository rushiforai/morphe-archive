# 🎬 kyurem39's patches

Morphe patch bundle for [mpvEx](https://github.com/marlboro-advance/mpvEx).

## ❓ About

Morphe patches for **mpvEx** (mpvExtended), the libmpv-based media player for Android.

Current target: `app.marlboroadvance.mpvex` v1.3.1-playstore (universal APK).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=kyurem39/mpvEx-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/kyurem39/mpvEx-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 mpvEx&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.3.1-playstore |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Subtitle translation](#subtitle-translation) | Translates the subtitles of the videos you play into a language you choose, including subtitles embedded in the video file. The on/off switch and the target language live in the kyurem39's patches settings panel. |  |
| [Vietnamese interface](#vietnamese-interface) | Translates the application interface into Vietnamese. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

kyurem39 Morphe patches are licensed under the [GNU General Public License v3.0](LICENSE)
