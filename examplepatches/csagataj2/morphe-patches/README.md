# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=csagataj2/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1-dev.4](https://github.com/csagataj2/morphe-patches/releases/tag/v1.0.1-dev.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 MobilKincstár&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 8.10.1-1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Keyboard Discrimination](#disable-keyboard-discrimination) | Prevents the app from detecting specific keyboards. |  |
| [Disable Root Detection](#disable-root-detection) | Disables all root detection checks in MobilKincstár. |  |
| [Disable SSL Pinning](#disable-ssl-pinning) | Disables SSL certificate pinning in MobilKincstár, allowing traffic interception. |  |
| [Disable Screenshot Protection](#disable-screenshot-protection) | Allows taking screenshots and screen recording in MobilKincstár. |  |
| [Disable Tamper Protection](#disable-tamper-protection) | Aggressively bypasses the protector's monitoring services and initialization. |  |

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
