# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=belalsalah74/pogo-2

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/belalsalah74/pogo-2/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Pokémon GO&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 0.433.1 | 0.431.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enhanced throw](#enhanced-throw) | Installs the experimental native research loader for Pokémon GO 0.433.1 / 0.431.0 arm64-v8a. |  |
| [Google web sign-in](#google-web-sign-in) | Replaces Google Play Services sign-in with a browser-based Google login so Google accounts work in re-signed builds. Pokémon GO 0.433.1 / 0.431.0. |  |
| [Spoof signature (ROM support)](#spoof-signature-rom-support) | Adds FAKE_PACKAGE_SIGNATURE and fake-signature metadata with Niantic's original certificate for ROMs/microG setups that support signature spoofing. Pokémon GO 0.431.0. |  |

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
