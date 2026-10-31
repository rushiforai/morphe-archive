# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=mian196/GPhotos-custom-branding

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/mian196/GPhotos-custom-branding/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 7.92.0.977185651 | 7.80.0.929302933 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom app name](#custom-app-name) | Changes the Google Photos app name in the launcher and system settings. | • App name |
| [Custom branding](#custom-branding) | Adds custom Google Photos launcher branding with embedded adaptive icons (or optional custom folder). | • Custom icon folder (optional) |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.


## 📜 License

This repository is licensed under the [GNU General Public License v3.0](LICENSE).

## 🤝 Credits & Acknowledgements

- **Custom Branding Logic & Original Implementation**:
  - Based on the Google Photos custom launcher branding patch originally contributed by [donny110](https://github.com/donny110) to [
ushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches) (licensed under GPLv3).
- **Custom Adaptive Icons & Vector Assets**:
  - Hand-drawn Morphe pinwheel adaptive icon foregrounds and monochrome themed vector assets fetched from [Akash-Sriram/morphe-google-photos](https://github.com/Akash-Sriram/morphe-google-photos).
- **Core Framework**:
  - Built with the [Morphe](https://github.com/MorpheApp) patcher and template ecosystem.

### License & Modification Rights
All upstream projects operate under the **GNU General Public License v3.0 (GPLv3)**. Under the terms of GPLv3, editing, modifying, and redistributing the code and assets are explicitly permitted, provided that:
1. The derivative work remains licensed under the GNU General Public License v3.0.
2. The original copyright and attribution notices are preserved.
3. Source code is made available when distributed.