# SeveriT Patches

Personal Morphe patches.

## ❓ About

- **Strava → Custom accent color**: replaces Strava's orange (`#FC5200`) and its whole
  shade scale with a color of your choice, in light and dark theme. Covers XML color
  resources, vector drawables (optional) and the hard-coded Compose color schemes.
  Verified against Strava 480.15.
- **Strava → Custom map route color**: sets the color of route / activity lines on maps
  (and optionally the live recording line), independently of the accent color.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/SeveriT/morphe-patches

<a href="https://morphe.software/add-source?github=SeveriT/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/SeveriT/morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Strava&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.strava`

**🎯 Supported versions:**

| 480.15 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom accent color](#custom-accent-color) | Replaces Strava's orange brand color and its lighter and darker shades with a color of your choice, in both light and dark theme. | • Accent color<br>• Recolor icons and badges |
| [Custom map route color](#custom-map-route-color) | Changes the color of route and activity lines drawn on maps, independently of the accent color. | • Route color<br>• Recording line color |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
