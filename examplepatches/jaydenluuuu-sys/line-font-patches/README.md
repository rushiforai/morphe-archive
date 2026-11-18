# 🔤 Sidepeek Lab LINE Patches

A custom font patch for LINE. Compatible with Morphe.

## ❓ About

`[General] Custom font` sets a font file from your device as the font of LINE's themes.
Select the patch, then give the full path of a `.ttf`, `.otf` or `.ttc` file in its "Font file" option.

Text that LINE draws without a theme font, such as Jetpack Compose screens, can keep the system font.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=jaydenluuuu-sys/line-font-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/jaydenluuuu-sys/line-font-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 LINE&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.14.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [[General] Custom font](#general-custom-font) | Sets a font file from your device as the font of LINE's themes. Text that LINE draws without a theme font, such as Jetpack Compose screens, can keep the system font. | • Font file |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE)
