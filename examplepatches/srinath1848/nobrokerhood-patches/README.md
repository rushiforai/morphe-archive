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
> **[v1.9.0](https://github.com/srinath1848/nobrokerhood-patches/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 NoBrokerHood&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**Package name:** `com.app.nobrokerhood`

**🎯 Supported versions:**

| 3.6.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NoBrokerHood: Default browser, block known ad hosts (experimental)](#nobrokerhood-default-browser-block-known-ad-hosts-experimental) | Keep default-browser support but block known Multipl and Innovid ad-tracking hosts. |  |
| [NoBrokerHood: Hide expanded notification images (experimental)](#nobrokerhood-hide-expanded-notification-images-experimental) | Hide large banner images in entry/exit notifications while retaining text (3.6.11). |  |
| [NoBrokerHood: Hide feed ad cards](#nobrokerhood-hide-feed-ad-cards) | Hide forum/home-feed ad cards (3.6.11). |  |
| [NoBrokerHood: Hide floating promotional sidebar](#nobrokerhood-hide-floating-promotional-sidebar) | Hide the SideAd.kt Compose renderer attached to the RIGHT_AD home section. |  |
| [NoBrokerHood: Hide homepage billboard](#nobrokerhood-hide-homepage-billboard) | Clear both top-billboard state and app-bar banner state to hide rotating top ads. |  |
| [NoBrokerHood: Hide promotional popups](#nobrokerhood-hide-promotional-popups) | Suppress app-level marketing dialogs (3.6.11). |  |
| [NoBrokerHood: Hide visitor promotional island](#nobrokerhood-hide-visitor-promotional-island) | Suppress AppBarIsland single-card and horizontal promotional rendering (experimental). |  |
| [NoBrokerHood: Hide visitor-flow ads](#nobrokerhood-hide-visitor-flow-ads) | Hide the visitor-flow promotional carousel (3.6.11). |  |
| [NoBrokerHood: Skip post-approval ad container (experimental)](#nobrokerhood-skip-post-approval-ad-container-experimental) | Do not initialize the image/video ad RecyclerView after entry approval; preserve approval details. |  |
| [NoBrokerHood: Stop full-screen permission nag](#nobrokerhood-stop-full-screen-permission-nag) | Stop the home-screen full-screen alert reminder without changing permissions. |  |
| [NoBrokerHood: Stop promotional browser launches from notifications](#nobrokerhood-stop-promotional-browser-launches-from-notifications) | Clear advertising click metadata and browser-directed routes from notification intents, preserving security-event fields (experimental). |  |

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
