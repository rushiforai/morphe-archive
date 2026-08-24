# 👋🧩 Morphe Patches Chicco
## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=chicco-carone/morphe-patches-chicco

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/chicco-carone/morphe-patches-chicco/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 ProxMobo&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [ProxMobo License Check Bypass](#proxmobo-license-check-bypass) | Disables Google's Play app-licensing (PairIP) check so ProxMobo does not show license errors or close when it is not installed/licensed through Google Play. |  |
| [ProxMobo Premium Unlock](#proxmobo-premium-unlock) | Unlocks Premium by reporting the lifetime product (proxmobo.premium.lifetime) as purchased. On first launch, open Settings and press “Restore Purchases” to activate Premium. |  |

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
