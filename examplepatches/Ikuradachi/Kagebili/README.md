# Kagebili

BiliBili/Bstation patches for use with Morphe.

## ❓ About

Kagebili focuses exclusively on patches for the BiliBili/Bstation Android app. Patch requests and bug reports should relate to BiliBili/Bstation.

This is an independent project, not affiliated with or endorsed by BiliBili/Bstation or the Morphe project. Available patches and supported app versions are listed below when published.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: https://github.com/Ikuradachi/Kagebili

<a href="https://morphe.software/add-source?github=Ikuradachi/Kagebili">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Ikuradachi/Kagebili/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Bstation&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**Package name:** `com.bstar.intl`

**🎯 Supported versions:**

| 3.83.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean interface](#clean-interface) | Customizes Home, navigation, account and search surfaces, and optional rating prompts. | • Hide home search bar<br>• Hide Featured tab<br>• Hide Plaza tab<br>• Hide Campaign and Activity tabs<br>• Hide Subscriptions tab<br>• Hide Anime tab<br>• Hide Home Shorts tab<br>• Hide Community (Opus) tab<br>• Simplify single-page Home<br>• Hide Discover tab<br>• Hide Create button (+)<br>• Hide Chats tab<br>• Hide Me tab<br>• Hide bottom Shorts tab<br>• Hide Creator Center<br>• Hide Campaign menu<br>• Hide FAQs menu<br>• Hide Feedback menu<br>• Hide search trending searches<br>• Hide discovery modules<br>• Clean search bar hint<br>• Hide discover tabs<br>• Hide Discover trending searches<br>• Disable rating prompts |
| [Clean player](#clean-player) | Hides selected player branding, recommendations, outro cards and optional comments and danmaku. | • Disable player watermark<br>• Disable player recommendation widget<br>• Disable player outro unlock card<br>• Hide user interactions |
| [Disable tracking](#disable-tracking) | Disables internal Bilibili telemetry, APM profiling, TradPlus ad mediation, Firebase analytics, Crashlytics, and Facebook AppEvents. |  |
| [GmsCore support](#gmscore-support) | Uses Morphe GmsCore for Google sign-in and sign-out. |  |
| [Remove ads](#remove-ads) | Hides selected feed, splash, floating, push, overlay and under-player advertisements. | • Hide question cards<br>• Hide feed ads<br>• Disable floating ads<br>• Disable inner push banner<br>• Disable splash ads<br>• Disable player overlay ads<br>• Disable under-player ads |
| [Remove user content](#remove-user-content) | Filters known user videos and creator surfaces, keeps Anime search, and preserves unknown official content and download management. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Kagebili is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for naming and branding restrictions.
