# 🎞️🧩 Piko GIF Patch

Companion patch for X/Twitter (`com.twitter.android`) that adds native animated `.gif` download & conversion support alongside [Piko](https://github.com/crimera/piko).

## ❓ About

On X/Twitter, animated GIFs are served as looped `.mp4` streams (`tweet_video/*.mp4`). This patch adds:
- **Case A (Native MP4 → GIF89a conversion)**: Automatically decodes and converts Twitter GIF streams into genuine looping `.gif` files saved in `Pictures/Twitter/`.
- **Case B (Piko Native Downloader & Inline Download Button integration)**: Labels GIFs as `GIF` inside Piko's download dialog and offers both `GIF (.gif)` and `MP4 (.mp4)` variants.
- **Case C (Native X media menu integration)**: Also converts GIFs when downloaded from X's built-in 3-dots / long-press media menu.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager (with **Expert Mode** enabled to combine with Piko): https://github.com/Piel-M/piko-gif-patch

<a href="https://morphe.software/add-source?github=Piel-M/piko-gif-patch">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/Piel-M/piko-gif-patch/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Twitter&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.twitter.android`

**🎯 Supported versions:**

| 12.19.1-release.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Native GIF download](#native-gif-download) | Downloads and converts X/Twitter GIFs into real animated .gif files. Supports Piko Native Downloader, Inline Download Button, and X's media menu. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Piko GIF Patch is licensed under the [GNU General Public License v3.0](LICENSE)
