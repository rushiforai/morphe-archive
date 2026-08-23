# 👋🧩 Morphe Patches template

jancerny2001 Morphe Patches.

## ❓ About

Currently, this repository contains a single patch for the Czech ISIC app "**Alive App**" (com.bootiq2.gtsisic) to allow screenshots of cards by clearing the FLAG_SECURE flag.
⚠️ It is important to also apply the ["Change installer source"](https://github.com/MorpheApp/morphe-patches#change-installer-source) Morphe core Universal patch, and set it as "Google Play", otherwise the Alive App will not let you use it.

Tested on [Alive App version 3.5.0](https://apkpure.com/alive-app/com.bootiq2.gtsisic/download/3.5.0), but it should work on all future versions as well.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=jancerny2001/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/jancerny2001/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Alive App&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable card screenshot](#enable-card-screenshot) | Allows screenshots of cards by clearing the FLAG_SECURE flag. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

jancerny2001 Patches are licensed under the [GNU General Public License v3.0](LICENSE)
