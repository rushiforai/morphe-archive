# 🧩 LOCKhart07 Patches

Personal patches for use with [Morphe](https://morphe.software). Not affiliated with the Morphe project.

## ❓ About

- **Heads Up! – Unlock all decks** — patches `libil2cpp.so` so every deck reports as owned, no purchase needed. Native (arm64-v8a and armeabi-v7a) byte patch, no dex or resource changes.
- **Heads Up! – Round length** — pick how long each round lasts, right from the deck page.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?gitlab=LOCKhart07/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://gitlab.com/LOCKhart07/morphe-patches/-/releases/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Heads Up!&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 4.15.11 | 4.15.13 | 4.15.14 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide empty custom decks](#hide-empty-custom-decks) | Shows one empty custom deck in My Decks instead of all of them. A new one appears after you restart the app. |  |
| [Round length](#round-length) | Adds an option to change the round length from the deck page. |  |
| [Sort decks alphabetically](#sort-decks-alphabetically) | Sorts My Decks alphabetically instead of by recent purchases and plays. |  |
| [Unlock all decks](#unlock-all-decks) | Unlocks every deck without a purchase. |  |

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
