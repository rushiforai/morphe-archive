# 🧩 sircoderin Patches

Small UX fixes for apps I use, packaged as a Morphe patch bundle.

## ❓ About

### Kvaesitso

[Kvaesitso](https://github.com/MM2-0/Kvaesitso) can be opened as a search-only overlay (its "assistant" mode) on top of another launcher. These patches make that overlay feel smoother:

- **Instant search dismiss**: swipe-to-close finishes as soon as the swipe is released, instead of waiting for the swipe animation to fully settle. This removes the ~350 ms of frozen blur before the home screen comes back.
- **Search fade-in**: the overlay fades and gently scales in when it opens, mirroring the close animation, instead of popping in.

Tested on Kvaesitso 1.41.0 (official GitHub release).

### Twilight

[Twilight](https://play.google.com/store/apps/details?id=com.urbandroid.lux) tints the screen with an overlay, and that overlay ends up in screenshots taken with the system shortcut (power + volume down). Twilight's own screenshot button avoids this, but only when you take the screenshot through Twilight's pop-up.

- **Untint screenshots**: Twilight records the exact tint it draws. When a new screenshot is saved, it removes that tint from the image in place, a fraction of a second later. A screenshot is only changed when its pixels match a tint that was on screen at that moment, so screenshots taken while the filter was paused stay untouched.

Grant Twilight **All files access** after installing (Settings → Apps → Twilight → Permissions), so it can edit screenshots. Tested on Twilight 14.32 (Play Store release).

### New app versions

A daily GitHub Action checks for new stable releases of the patched apps (Kvaesitso on GitHub, Twilight on APKMirror). When one appears, it is added to the supported versions and a new patch release is published, so Morphe Manager shows "App update available". Versions added this way are not hand-tested. If a new version breaks a patch, patching fails and the installed app stays as it is.

Unofficial and not affiliated with the patched apps or the Morphe project.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/sircoderin/morphe-patches

<a href="https://morphe.software/add-source?github=sircoderin/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/sircoderin/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Kvaesitso&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `de.mm20.launcher2.release`

**🎯 Supported versions:**

| 1.41.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Instant search dismiss](#instant-search-dismiss) | Closes the search overlay as soon as the swipe-to-close is released, instead of after the swipe animation fully settles (removes the frozen blur when closing). |  |
| [Search fade-in](#search-fade-in) | Fades and gently scales the search overlay in when it opens, mirroring the close animation. |  |

</details>

<details open>
<summary>📦 Twilight&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.urbandroid.lux`

**🎯 Supported versions:**

| 14.32 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Untint screenshots](#untint-screenshots) | Removes Twilight's screen tint from screenshots taken with the system shortcut (power + volume). Needs "All files access" granted to Twilight. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

sircoderin Patches are licensed under the [GNU General Public License v3.0](LICENSE)
