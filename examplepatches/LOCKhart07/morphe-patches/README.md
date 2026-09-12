# 🧩 LOCKhart07 Patches

Personal patches for use with [Morphe](https://morphe.software). Not affiliated with the Morphe project.

## ❓ About

- **Heads Up! – Unlock all decks** — patches `libil2cpp.so` so every deck reports as owned, no purchase needed. Native (arm64-v8a) byte patch, no dex or resource changes.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=LOCKhart07/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/LOCKhart07/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Heads Up!&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.15.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock all decks](#unlock-all-decks) | Unlocks every deck without a purchase by forcing the native ownership checks in libil2cpp.so to report each deck as bought. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

LOCKhart07 Patches are licensed under the [GNU General Public License v3.0](LICENSE)
