# Gboard Extended Search

Morphe patches for Gboard that remove the content filter on GIF and sticker search.

## ❓ About

Gboard asks Tenor for GIFs with `contentfilter=medium` (set by the server flag
`tenor_content_filter_level`). The **Remove GIF search filter** patch sends
`contentfilter=off` instead, for GIF search, sticker search and GIF categories.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=markpaul099/gboard-extended-search

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/markpaul099/gboard-extended-search/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Gboard&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 18.3.2.977415014-release-arm64-v8a |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Changes the package name and app name so the patched Gboard can be installed next to the original. | • Package name<br>• App name |
| [Remove GIF search filter](#remove-gif-search-filter) | Turns off the Tenor content filter for GIF and sticker search, so results are not limited by safe search. |  |
| [Use Google Images for GIF search](#use-google-images-for-gif-search) | Searches animated GIFs on Google Images with SafeSearch off instead of Tenor, covering real life and anime. Sticker search stays on Tenor, and Tenor results are kept if Google returns nothing. Experimental: depends on Google's page layout. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Gboard Extended Search patches are licensed under the [GNU General Public License v3.0](LICENSE)
