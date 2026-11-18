# 👋🧩 ARY+ Morphe Patches

Morphe patches for ARY+ (`com.release.arylive`).

## ❓ About

Patches to remove ads and bypass the license check in ARY+ (ARY digital streaming app).

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: https://gitlab.com/kamander700/aryplus-morphe-patches

<a href="https://morphe.software/add-source?gitlab=kamander700/aryplus-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://gitlab.com/kamander700/aryplus-morphe-patches/-/releases/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 ARY+&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.release.arylive`

**🎯 Supported versions:**

| 3.8.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass license check](#bypass-license-check) | Bypasses the Pairip (Play Integrity) client-side license check. |  |
| [Hide app ads](#hide-app-ads) | Removes banner, native, interstitial and sticky ads driven by the server ad-experience config. |  |
| [Hide video ads](#hide-video-ads) | Removes IMA pre-roll, mid-roll and post-roll ads from all players. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

ARY+ Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
