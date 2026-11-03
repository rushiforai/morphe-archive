# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/srinath1848/nobrokerhood-patches

<a href="https://morphe.software/add-source?github=srinath1848/nobrokerhood-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0-dev.1](https://github.com/srinath1848/nobrokerhood-patches/releases/tag/v1.1.0-dev.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 NoBrokerHood&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `com.app.nobrokerhood`

**🎯 Supported versions:**

| 3.6.6 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NoBrokerHood: Hide door-notification banners (experimental)](#nobrokerhood-hide-door-notification-banners-experimental) | Suppresses optional banners in door push data. |  |
| [NoBrokerHood: Hide entry banner fragment (experimental)](#nobrokerhood-hide-entry-banner-fragment-experimental) | Suppresses entry promotional fragment setup. |  |
| [NoBrokerHood: Hide feed ad cards](#nobrokerhood-hide-feed-ad-cards) | Removes home-feed advertising cards. |  |
| [NoBrokerHood: Hide promotional popups](#nobrokerhood-hide-promotional-popups) | Suppresses application promotional dialogs. |  |
| [NoBrokerHood: Hide visitor-flow ads](#nobrokerhood-hide-visitor-flow-ads) | Removes visitor screen advertising banners. |  |

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

Experimental NoBrokerHood 3.6.6 ad-removal patches.
