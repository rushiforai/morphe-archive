# Avito Patches

Morphe patches for the Avito Morocco app (`se.scmv.morocco`).

## ❓ About

Removes the in-house sponsored banner pinned to the top of the Avito home screen.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/Nizarberyan/Avito-Patches

<a href="https://morphe.software/add-source?github=Nizarberyan/Avito-Patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/Nizarberyan/Avito-Patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Avito&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `se.scmv.morocco`

**🎯 Supported versions:**

| 10.8.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change installer source](#change-installer-source) | Spoofs the installer source so the app appears to be installed from an app store. | • Spoofed package installer name |
| [Clone app](#clone-app) | Changes the app package name to allow installing the same app multiple times. By default ".morphe" is appended to the package name. Each cloned install must use a unique package name. Cloning does not work with all apps and using this patch may cause app crashes or other unexpected behavior. | • Package name<br>• Update permissions<br>• Update providers |
| [Disable Play Store updates](#disable-play-store-updates) | Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting |  |
| [Hide ads](#hide-ads) | Removes the ad network banners from the search results and from the listing pages, and stops the app from requesting ads. |  |
| [Hide shop listings](#hide-shop-listings) | Hides listings posted by shops (boutiques) from the home feed and from search results. Search results show shop listings again when a seller type is selected in the search filters. |  |
| [Hide sponsored campaigns](#hide-sponsored-campaigns) | Removes the sponsored campaigns Avito serves itself on every screen: the sticky banner, notification ads, swipe-up ads and touching points. |  |
| [Override certificate pinning](#override-certificate-pinning) | Overrides certificate pinning, allowing to inspect traffic via a proxy. |  |
| [Spoof signature](#spoof-signature) | Spoofs the package signature of the original APK. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE)
