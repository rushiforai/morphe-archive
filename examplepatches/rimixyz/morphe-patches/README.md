# 🧩 rimixyz Morphe Patches

All-in-one personal collection of patches for [Morphe](https://morphe.software) — **Made in Brazil** 🇧🇷.

## ❓ About

This is a clean, all-in-one repository for my personal Morphe patches across multiple Android apps.

> [!NOTE]
> **100% AI-crafted & tested before release:** Every patch in this repository is 100% created with AI, and is tested until it works properly before being released.

> [!WARNING]
> These patches are intended for authorized testing and personal use on apps you own or are explicitly allowed to modify. No APK, XAPK, or other app binary is distributed in this repository.

### How to use these patches

Click the button below, or manually add this repository URL to Morphe Manager: `https://github.com/rimixyz/morphe-patches`

<a href="https://morphe.software/add-source?github=rimixyz/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.4](https://github.com/rimixyz/morphe-patches/releases/tag/v1.3.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 17TRACK&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `yqtrack.app`

**🎯 Supported versions:**

| 3.1.6896.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Restores the original certificate SHA-1 so Firebase Auth (Google login) and push notifications keep working after the APK is re-signed. |  |
| [Force Premium membership](#force-premium-membership) | Rewrites the cached user model to Premium level (4020). Unlocks client-side VIP features and hides ads. Requires a fresh install. |  |
| [Remove Deals ads](#remove-deals-ads) | Hides the 'Deals' tab and campaign ads by forcing the local preference flags to true. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from Google Play. Useful when an app blocks features because it detects a sideloaded install. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

rimixyz Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE).
