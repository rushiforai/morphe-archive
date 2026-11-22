# Duolingo Morphe Patches

Morphe patches for Duolingo.

## ❓ About

This repository contains patches for the Duolingo Android app.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/iloxmn/MorphePatches

<a href="https://morphe.software/add-source?github=iloxmn/MorphePatches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://github.com/iloxmn/MorphePatches/releases/tag/v1.0.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Duolingo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.duolingo`

**🎯 Supported versions:**

| 6.105 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Skip Session-End Screens](#skip-session-end-screens) | Pass an empty session-end screen list to Duolingo. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

Every push to `main` automatically builds and publishes a new versioned `.mpp` release.

- Run `./gradlew buildAndroid`
- The built patches .mpp file is named `Duolingo-6.105-<patch-version>.mpp` in `patches/build/libs/`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Duolingo Patches are licensed under the [GNU General Public License v3.0](LICENSE)
