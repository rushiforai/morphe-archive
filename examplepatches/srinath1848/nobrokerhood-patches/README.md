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
> **[v1.7.0](https://github.com/srinath1848/nobrokerhood-patches/releases/tag/v1.7.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;19 patches total
<details open>
<summary>📦 NoBrokerHood&nbsp;&nbsp;•&nbsp;&nbsp;19 patches</summary>
<br>

**Package name:** `com.app.nobrokerhood`

**🎯 Supported versions:**

| 3.6.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NoBrokerHood: Default browser, block known ad hosts (experimental)](#nobrokerhood-default-browser-block-known-ad-hosts-experimental) | Keep default-browser support but block known Multipl and Innovid ad-tracking hosts. |  |
| [NoBrokerHood: Hide app-bar banners (experimental)](#nobrokerhood-hide-app-bar-banners-experimental) | Empty app-bar banner entries; may leave a layout placeholder. |  |
| [NoBrokerHood: Hide app-bar island row (test)](#nobrokerhood-hide-app-bar-island-row-test) | Skip the AppBarIsland.kt horizontal row. May hide non-ad items. |  |
| [NoBrokerHood: Hide app-bar response cards (experimental)](#nobrokerhood-hide-app-bar-response-cards-experimental) | Remove app-bar advertising card data before creating banner state. |  |
| [NoBrokerHood: Hide default post-approval card (experimental)](#nobrokerhood-hide-default-post-approval-card-experimental) | Hide the fallback ad card after entry approval. Null handling is untested. |  |
| [NoBrokerHood: Hide expanded notification images (experimental)](#nobrokerhood-hide-expanded-notification-images-experimental) | Hide large banner images in entry/exit notifications while retaining text (3.6.11). |  |
| [NoBrokerHood: Hide feed ad cards](#nobrokerhood-hide-feed-ad-cards) | Hide forum/home-feed ad cards (3.6.11). |  |
| [NoBrokerHood: Hide floating promotional sidebar](#nobrokerhood-hide-floating-promotional-sidebar) | Hide the SideAd.kt Compose renderer attached to the RIGHT_AD home section. |  |
| [NoBrokerHood: Hide home-discover carousel (experimental)](#nobrokerhood-hide-home-discover-carousel-experimental) | Hide cards in the homepage discover carousel; may hide non-ad items too. |  |
| [NoBrokerHood: Hide homepage billboard](#nobrokerhood-hide-homepage-billboard) | Hide the homepage top billboard by clearing TopAdState during construction. |  |
| [NoBrokerHood: Hide homepage top ads (experimental)](#nobrokerhood-hide-homepage-top-ads-experimental) | Supply an empty top-ad list and disable its loading/expanded state. |  |
| [NoBrokerHood: Hide island promotional strip (experimental)](#nobrokerhood-hide-island-promotional-strip-experimental) | Hide homepage items marked ISLAND_BANNER; test against the blue Domino's strip. |  |
| [NoBrokerHood: Hide post-approval ad card (experimental)](#nobrokerhood-hide-post-approval-ad-card-experimental) | Hide the sponsored card shown after entry approval or pre-approval (3.6.11). |  |
| [NoBrokerHood: Hide post-approval multimedia ads](#nobrokerhood-hide-post-approval-multimedia-ads) | Suppress image, GIF, video and Lottie ad cards after approval, without blocking the approval status. |  |
| [NoBrokerHood: Hide promotional popups](#nobrokerhood-hide-promotional-popups) | Suppress app-level marketing dialogs (3.6.11). |  |
| [NoBrokerHood: Hide promotional side tab (experimental)](#nobrokerhood-hide-promotional-side-tab-experimental) | Suppress the draggable multimedia promotion card; verify on-device. |  |
| [NoBrokerHood: Hide visitor-flow ads](#nobrokerhood-hide-visitor-flow-ads) | Hide the visitor-flow promotional carousel (3.6.11). |  |
| [NoBrokerHood: Stop full-screen permission nag](#nobrokerhood-stop-full-screen-permission-nag) | Stop the home-screen full-screen alert reminder without changing permissions. |  |
| [NoBrokerHood: Stop promotional browser launches from notifications](#nobrokerhood-stop-promotional-browser-launches-from-notifications) | Prevent notification-triggered browser ad routes; retain security alerts and in-app event metadata (experimental). |  |

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
