# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/TheDefaultState/meowdoku-patches

<a href="https://morphe.software/add-source?github=TheDefaultState/meowdoku-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.3](https://github.com/TheDefaultState/meowdoku-patches/releases/tag/v1.3.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Meowdoku&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.oakever.meowdoku`

**🎯 Supported versions:**

| 1.22.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block banner and native ads](#block-banner-and-native-ads) | Skips banner and native ads entirely and collapses their space in the UI. | • Block banner and native ads |
| [Block interstitial and app-open ads](#block-interstitial-and-app-open-ads) | Skips the full-screen ads between levels and the ones shown when the app opens. | • Block interstitial ads |
| [Block rewarded ads](#block-rewarded-ads) | Blocks rewarded ads, keeps the button visible without a loaded ad and grants the reward instantly. | • Block rewarded ads |
| [Block telemetry](#block-telemetry) | Stops AppsFlyer, Firebase Analytics and Facebook App Events from being started or sent anything. | • Block telemetry |

</details>

<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.example.app`

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

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
