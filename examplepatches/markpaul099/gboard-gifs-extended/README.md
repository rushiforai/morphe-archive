# Gboard GIFs Extended

Morphe patches for Gboard that search GIFs on Google Images, add a settings screen for GIF
search, and let you change the app name and package name.

## ❓ About

- **Google Images GIF Search**: GIF search shows animated results from Google Images, with
  Tenor as a fallback. Sticker search, categories and trending stay on Tenor.
- **GIFs Extended settings**: adds a *GIFs Extended* entry to Gboard's settings with two
  switches, both on by default: *Search Google Images* and *SafeSearch* (also applied to
  Tenor's content filter).
- **Change app name** and **Change package name**: install the patched Gboard next to the
  original.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=markpaul099/gboard-gifs-extended

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/markpaul099/gboard-gifs-extended/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Gboard&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.google.android.inputmethod.latin`

**🎯 Supported versions:**

| 18.5.4.993608717-release-arm64-v8a |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change app name](#change-app-name) | Changes the name shown in the launcher and the keyboard list. | • App name |
| [Change package name](#change-package-name) | Changes the package name so the patched Gboard can be installed next to the original. | • Package name |
| [GIFs Extended settings](#gifs-extended-settings) | Adds a GIFs Extended entry to Gboard's settings with the GIF search switches. |  |
| [Google Images GIF Search](#google-images-gif-search) | Searches GIFs on Google Images, with Tenor as a fallback. SafeSearch can be switched in GIFs Extended settings (on by default). |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Gboard GIFs Extended patches are licensed under the [GNU General Public License v3.0](LICENSE)
