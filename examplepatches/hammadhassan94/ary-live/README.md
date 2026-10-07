# 👋🧩 ARY Live

Community patches for ARY PLUS, for use with Morphe.

## ❓ About

Patches for ARY PLUS (`com.release.arylive`): hide ads, bypass PairIP on resigned sideload, and Original vs Custom app icon.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=hammadhassan94/ary-live

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.3](https://github.com/hammadhassan94/ary-live/releases/tag/v1.0.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 ARY PLUS&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.8.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP license check](#bypass-pairip-license-check) | Skips PairIP / Play license dialog so resigned sideload builds can open. |  |
| [Custom branding](#custom-branding) | Adds options to change the app icon and app name. Select Original for the real ARY PLUS logo, or Custom for the Morphe-style blue plus. | • App name<br>• App icon |
| [Hide ads](#hide-ads) | Disables interstitials, banners, native ads, Revive ads, home feed ad injectors, and IMA video ads. Shows Video ads skipped when drama/player ads are blocked. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

ARY Live is licensed under the [GNU General Public License v3.0](LICENSE)
