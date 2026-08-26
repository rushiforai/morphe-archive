# 🧩 kecerim's Patches

Morphe patches for [dream Player](https://play.google.com/store/apps/details?id=de.cyberdream.dreamepg.player).

## ❓ About

**dream Player** (`de.cyberdream.dreamepg.player`) is a free Enigma2 / IPTV client for Android
phones and tablets. Its premium features — unlimited channels, bouquets and profiles, saving
autotimers, widgets, and an ad-free UI — are unlocked by a single in-app purchase.

The `Unlock premium` patch here turns that flag on. It also stops the app from validating the
purchase against the vendor's license server, which would otherwise revoke it.

> [!NOTE]
> **These patches were written by AI.** Claude reverse-engineered the app, wrote the
> fingerprints and the patch, and verified the resulting bytecode. A human reviewed and
> released it, but keep that origin in mind before you trust it: read the source and check
> the patched app yourself rather than assuming it has had the scrutiny hand-written patches
> normally get.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Kecerim24/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Kecerim24/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 dream Player&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 14.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Unlocks all premium features, removes ads and disables the online license check. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

kecerim's Patches are licensed under the [GNU General Public License v3.0](LICENSE)
