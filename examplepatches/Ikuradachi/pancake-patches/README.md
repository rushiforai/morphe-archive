# 🥞🧩 Pancake Patches

Personal collection of Morphe patches for apps I like.

## ❓ About

A personal collection of Morphe patches maintained by Ikuradachi.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Ikuradachi/pancake-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Ikuradachi/pancake-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;19 patches total
<details open>
<summary>📦 Bstation&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**🎯 Supported versions:**

| 3.83.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean Me page](#clean-me-page) | Hide creator center section and selected menus (campaign, FAQs, feedback) on the Me profile page. | • Hide Creator Center<br>• Hide Campaign menu<br>• Hide FAQs menu<br>• Hide Feedback menu |
| [Debloat search landing page](#debloat-search-landing-page) | Debloats the search landing page by hiding trending searches, discovery modules, and promotional search bar hints. | • Hide trending searches<br>• Hide discovery modules<br>• Clean search bar hint |
| [Disable floating ads](#disable-floating-ads) | Disables bottom-right promotional floating advertisement overlay. |  |
| [Disable inner push banner](#disable-inner-push-banner) | Disables top slide-down promotional toast and inner-push banner notifications. |  |
| [Disable player outro unlock card](#disable-player-outro-unlock-card) | Disables video player outro unlock video guide bottom-right card. |  |
| [Disable player overlay ads](#disable-player-overlay-ads) | Disables video player in-stream bottom-right overlay ad banners. |  |
| [Disable player recommendation widget](#disable-player-recommendation-widget) | Disables fullscreen video player bottom-right recommendation widget. |  |
| [Disable player watermark](#disable-player-watermark) | Hides the top-right brand logo and copyright/premium watermark in the video player. |  |
| [Disable splash ads](#disable-splash-ads) | Disables cold-start splash advertisement loading and countdown timer. |  |
| [Disable tracking](#disable-tracking) | Disables internal Bilibili telemetry, APM profiling, TradPlus ad mediation, Firebase analytics, Crashlytics, and Facebook AppEvents. |  |
| [GmsCore support](#gmscore-support) | Uses Morphe GmsCore for Google sign-in and sign-out. |  |
| [Hide bottom navigation items](#hide-bottom-navigation-items) | Hide selected bottom navigation bar tabs (Discover, Create, Chats, Me, Shorts). | • Hide Discover tab<br>• Hide Create button (+)<br>• Hide Chats tab<br>• Hide Me tab<br>• Hide Shorts tab |
| [Hide home search bar](#hide-home-search-bar) | Hides the search bar on the Home screen. | • Hide home search bar |
| [Hide home tab bar items](#hide-home-tab-bar-items) | Hide selected horizontal tab bar items on the home screen (Featured, Plaza, Subscriptions, Anime, Shorts, Community, Campaigns). | • Hide Featured tab<br>• Hide Plaza tab<br>• Hide Campaign and Activity tabs<br>• Hide Subscriptions tab<br>• Hide Anime tab<br>• Hide Shorts tab<br>• Hide Community (Opus) tab |
| [Pure discover search bar](#pure-discover-search-bar) | Removes discover tabs and trending searches to make the Discover page a pure search bar. | • Hide discover tabs<br>• Hide trending searches |

</details>

<details open>
<summary>📦 CarbitLink&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 6.5.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracking and analytics (Experimental)](#disable-tracking-and-analytics-experimental) | Attempts to block background telemetry and trackers. Not guaranteed to stop 100% of data collection. |  |
| [Enable browser](#enable-browser) | Shows the browser in the projected mirror grid for non-SDK mode. |  |
| [GmsCore support](#gmscore-support) | Uses Morphe GmsCore for Google sign-in and sign-out. |  |
| [Unlock VIP features](#unlock-vip-features) | Enables Mapbox, Google Maps, Spotify integration, and TwinSpace features. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Pancake Patches are licensed under the [GNU General Public License v3.0](LICENSE)
