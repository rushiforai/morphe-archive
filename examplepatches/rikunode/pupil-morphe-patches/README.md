# Pupil 6.1.1 gallery swipe and update-check patches

A small [Morphe](https://morphe.software/) patch for the [official Pupil](https://codeberg.org/pupil/Pupil) Android gallery reader.

## Add the source to Morphe

**[Add to Morphe](https://morphe.software/add-source?github=rikunode/pupil-morphe-patches)**

Source: https://github.com/rikunode/pupil-morphe-patches

## Target APK (specific release)

**Pupil 6.1.1** (versionCode 1510, package `xyz.quaver.pupil`).

Download the [official Pupil 6.1.1 APK](https://codeberg.org/pupil/Pupil/releases/download/6.1.1/Pupil-v6.1.1.apk) from [Codeberg](https://codeberg.org/pupil/Pupil/releases/tag/6.1.1).

Verified SHA-256 of that APK:
`9a3513f1f6a0a132a6e187d78e5837eefb086115f2ec19a7de6f7e8e38e2aa09`

## What changes

- Disables **left swiping gallery LIST cards to reveal download/delete actions**.
- Does NOT disable tapping cards, long-press, normal vertical scrolling or reader page navigation.
- Download/delete actions remain available from the three-dot overflow menu.
- Patch is **ON by default**. To restore the swipe action, disable the patch in Morphe Manager and re-patch.
- Does not yet add an in-app runtime ON/OFF toggle.
- Optional **Disable automatic update checks** patch: prevents the built-in update dialog from appearing when Pupil is opened. Manual version checks from Settings still work. It does **not** disable download, watchlist, or other notifications.
- Both patches default to ON in Morphe; they can be selected separately.

**Do not use the earlier v1.0.0 Morphe patch bundle:** it targeted an obsolete 2019-era SwipeLayout and **does not work** on current Pupil versions.

## Implementation and safety

In the official 6.1.1 APK, the `SwipeRevealBox` Compose function creates `androidx.compose.foundation.gestures.AnchoredDraggableElement`. This class appears only in the `SwipeRevealBox` call path. We set the element's `enabled` constructor argument to false and also disable it in the recomposition `update()` method. The patch checks for the **exact** 6.1.1 bytecode layout before applying, and refuses to apply to another layout.

Automatic-update suppression targets the `UpdateKt.checkUpdate$default` bytecode bridge used by `MainComposeActivity.onResume`. It leaves the `UpdateKt.checkUpdate(context, true)` entry point for manual Settings checks intact. Its exact 6.1.1 bytecode layout is checked before patching.

Build compilation and successful patcher execution are separate from actual device testing. Back up Pupil data before replacing the app: Android app-signature mismatch may require uninstall/reinstall, which may erase app data.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.7.6](https://github.com/rikunode/pupil-morphe-patches/releases/tag/v1.7.6)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Pupil&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 6.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable automatic update checks](#disable-automatic-update-checks) | Stop Pupil 6.1.1 checking for updates at startup and showing update prompts. Manual update checking in Settings remains available. |  |
| [Disable gallery left swipe](#disable-gallery-left-swipe) | Disable the left-swipe action tray on Pupil 6.1.1 gallery cards. Preserve taps, long taps, reader gestures and vertical scrolling. |  |
| [Favorites random shortcut](#favorites-random-shortcut) | Random Favorites shortcuts on the Favorites tab, gallery details and optional Downloads navigation slot, with runtime settings. |  |

</details>

<!-- PATCHES_END -->

## Build

Based on the [official Morphe patch template](https://github.com/MorpheApp/morphe-patches-template). Run `./gradlew buildAndroid` with the standard Morphe development environment configured.

## License

Patch code: [GPLv3](LICENSE). The original app is by its respective maintainers. This project is independently maintained and not affiliated with Morphe or Pupil.
