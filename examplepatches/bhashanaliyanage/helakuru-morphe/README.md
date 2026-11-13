# Bhashana’s Morphe Patches

Custom Morphe patches for **Helakuru Lite 3.2.0**. Add keyboard styling and interaction features, then choose which patches to include when you patch the app.

<a href="https://morphe.software/add-source?github=bhashanaliyanage/helakuru-morphe">
  <img src=".github/assets/add-to-morphe.svg" alt="Add Bhashana’s Morphe Patches to Morphe" height="48">
</a>

## Quick start

1. Tap **Add to Morphe** above and confirm adding this patch source.
2. In Morphe, choose **Helakuru Lite** and use the supported version, **3.2.0**.
3. Review the available patches, select the features you want, and start patching. Morphe will guide you through choosing the original app file and installing the patched app.

See the [Morphe Manager guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-simple-mode.md) for patching steps and the [patch source guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) for managing this repository in Morphe.

> **Compatibility:** These Helakuru Lite patches target package `lk.bhasha.helakuru.lite`, version **3.2.0**. Other versions are not listed as supported.

## Features

- **Frosted Glass:** Keyboard blur, transparency, Monet tint, and key tile styling.
- **Personal Photo Themes:** Use a photo as a local keyboard background.
- **Glass Press Effect:** Add a touch glow and optional key dip animation.
- **Keypress Haptics and Sound:** Configure haptic and key click feedback independently.
- **Spacebar Cursor Control:** Hold and swipe on the spacebar to move the text cursor.
- **Keyboard Settings Import/Export:** Back up and restore settings added by these patches.

Each feature is a selectable patch in Morphe. Some patches also add settings inside Helakuru Lite; check those settings after installation to enable or adjust the behavior.

## Personal photo backgrounds

Select **Personal Photo Themes (Helakuru Lite)** in Morphe. In Helakuru Lite’s Themes screen, open **Personal Themes** and choose a photo. The image is stored in the app’s private storage and displayed behind the keyboard; it is center-cropped to fit. The photo is not uploaded.

Accepting a photo turns Frosted Glass off so the photo can show clearly. Use the photo control again to remove the background. Choosing a different color theme also removes the photo override.

## Patch catalog

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/bhashanaliyanage/helakuru-morphe/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Helakuru Lite&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `lk.bhasha.helakuru.lite`

**🎯 Supported versions:**

| 3.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Frosted Glass (Helakuru Lite)](#frosted-glass-helakuru-lite) | Adds adjustable keyboard blur, transparency, Monet tint, and Gboard-style key backgrounds. |  |
| [Glass Press Effect (Helakuru Lite)](#glass-press-effect-helakuru-lite) | Adds a tap bloom and optional key dip animation. |  |
| [Helakuru Lite Diagnostic No-op (no app changes)](#helakuru-lite-diagnostic-no-op-no-app-changes) | Creates a comparison build without modifying Helakuru Lite code. |  |
| [Keyboard Settings Import/Export (Helakuru Lite)](#keyboard-settings-import-export-helakuru-lite) | Export and import settings added by Morphe patches. |  |
| [Keypress Haptics and Sound (Helakuru Lite)](#keypress-haptics-and-sound-helakuru-lite) | Adds independent haptic and system key click feedback settings. |  |
| [Personal Photo Themes (Helakuru Lite)](#personal-photo-themes-helakuru-lite) | Adds independent local photo backgrounds and hides the Pro image and Popular Themes catalogs. |  |
| [Spacebar Cursor Control (Helakuru Lite)](#spacebar-cursor-control-helakuru-lite) | Hold the spacebar and swipe to move the text cursor. |  |

</details>

<!-- PATCHES_END -->

## Build from source

Build the local Morphe bundle with:

```sh
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches.mpp`. For patch development, see the [Morphe development documentation](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md).

## License

Bhashana’s Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE).
