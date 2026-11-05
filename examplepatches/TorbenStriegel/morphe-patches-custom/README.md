# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I use: Weather&Radar premium unlock and Skat premium unlock, with more to come.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=TorbenStriegel/morphe-patches-custom

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.0](https://github.com/TorbenStriegel/morphe-patches-custom/releases/tag/v1.8.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 OneFootball&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 15.145.0 | 15.148.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Disables banner, interstitial, native, app-open and rewarded ads. |  |
| [Hide match FanShop promotions](#hide-match-fanshop-promotions) | Hides the FanShop product carousel on the match overview. |  |
| [Hide match betting odds](#hide-match-betting-odds) | Disables bookmaker betting cards and odds on the match overview while retaining match predictions. |  |

</details>

<details open>
<summary>📦 Weather&Radar&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2026.19 | 2026.21 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Premium](#enable-premium) | Enables premium features: ad-free experience, HD radar and all gated content. Works without an account. |  |

</details>

<details open>
<summary>📦 Skat&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 19.2.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Ads](#remove-ads) | Removes banner and fullscreen (interstitial) ads from the game. Interstitials are reported as shown and closed immediately so the Qt game flow is unaffected. Works without an account. |  |
| [Remove Play Store redirect](#remove-play-store-redirect) | Removes the PairIP license check that redirects to the Play Store and exits on sideloaded installs. |  |

</details>

<details open>
<summary>📦 Park4Night&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.1.62 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Park4Night premium (Pro) access, removing all feature gates for offline maps, advanced filters, and publisher content. |  |

</details>

<details open>
<summary>📦 Toralarm&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.6.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks Toralarm premium content by forcing the subscription state to active. |  |

</details>

<details open>
<summary>📦 Chargeprice&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.4.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium features](#unlock-premium-features) | Unlocks Chargeprice premium features (ad-free, price filters, route planner, favourites, ...) without needing to log in or purchase a subscription. |  |

</details>

<details open>
<summary>📦 ntv&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 8.5.7.1 | 8.6.0.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock ntv Plus](#unlock-ntv-plus) | Unlocks ntv Plus premium features (ad-free, premium content) by forcing the subscription state to active. |  |

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
