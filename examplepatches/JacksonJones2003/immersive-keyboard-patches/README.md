# Immersive Keyboard Patches

Patches for use with Morphe that make Gboard fill the screen edge to edge.

## ❓ About

On phones with a camera cutout, Android keeps the keyboard window out of the cutout
area in landscape, which leaves an empty strip beside the keyboard. The
`Immersive Keyboard` patch lets Gboard's keyboard window extend under the cutout.

It is a single, independent patch, so it can be applied alongside other Gboard patch
sources such as [jasonwu1994/Gboard-patches](https://github.com/jasonwu1994/Gboard-patches).

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=JacksonJones2003/immersive-keyboard-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.14.0](https://github.com/JacksonJones2003/immersive-keyboard-patches/releases/tag/v1.14.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Gboard&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 18.0.3.954559732-release-arm64-v8a |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Emoji Key On Right](#emoji-key-on-right) | Moves the dedicated emoji key from the left of the spacebar to just left of the enter / search key. |  |
| [Glass Panel](#glass-panel) | Turns the translucent keyboard panel into glass. On vivo OriginOS it uses the system's own glass material, with real refraction, rim light and dispersion; elsewhere it draws lit edges and a sheen. Keys are left as they are. Works on top of Translucent Bottom Bar and Frosted Glass. |  |
| [Glass Press Effect](#glass-press-effect) | Adds vivo-style liquid glass touch feedback: a soft light blooms out from your finger across the keyboard background, and the keys around your finger dip and spring back with a small wobble while the rest of the keyboard stays still. When glide typing, the dip follows your finger. |  |
| [Immersive Keyboard](#immersive-keyboard) | Extends the keyboard under the camera cutout in landscape instead of leaving an empty strip beside it. |  |
| [Theme Follows Dark Mode](#theme-follows-dark-mode) | Adds a "Light & dark pair" menu to the top of Gboard's Themes screen. Choose a theme for light mode and one for dark mode, and the keyboard switches between them when the system dark mode changes. |  |
| [Translucent Bottom Bar](#translucent-bottom-bar) | Makes the bar under the keyboard (behind the globe and close buttons) match the keyboard's color, opacity and blur, for use with transparent themes such as Frosted Glass. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Immersive Keyboard Patches are licensed under the [GNU General Public License v3.0](LICENSE)
