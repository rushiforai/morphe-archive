# 👋🧩 Epxec Patches

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=AlecBlance/android-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/AlecBlance/android-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Sponge&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.8.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Enables the premium features of the app. |  |

</details>

<details open>
<summary>📦 Touch The Notch&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.1.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Enables the premium features of the app. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).<br><br>Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.<br><br>Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |

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
