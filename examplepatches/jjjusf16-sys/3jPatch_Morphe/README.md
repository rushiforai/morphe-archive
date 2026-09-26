# 🧩 3jPatch Morphe

Version-locked Android patches for the [Morphe](https://morphe.software/) patching framework.

## ❓ About

The initial patch provides client-side cleanup for Grindr 26.17.0. It enables the app's own
presentation flags for suppressing ads and subscription-store surfaces without claiming to
unlock server-backed subscription features.

### How to use these patches

[Add 3jPatch_Morphe directly to Morphe](https://morphe.software/add-source?github=jjjusf16-sys/3jPatch_Morphe)

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/jjjusf16-sys/3jPatch_Morphe/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Grindr&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.17.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Grindr Client-side Cleanup](#grindr-client-side-cleanup) | Enables Grindr's built-in client flags for hiding banner/full-screen ads and subscription-store surfaces. Server-backed premium entitlements are not changed. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

3jPatch_Morphe is licensed under the [GNU General Public License v3.0](LICENSE).
