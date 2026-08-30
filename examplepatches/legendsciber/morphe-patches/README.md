# 🧩 legendsciber's Patches

Morphe Patches repository by legendsciber.

## ❓ About

This is a collection of [Morphe](https://github.com/MorpheApp) patches maintained by legendsciber.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.22.1](https://github.com/legendsciber/morphe-patches/releases/tag/v1.22.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Block Blast&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 10.4.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Ad Removal](#ad-removal) | Removes all ads (banner, interstitial, rewarded). |  |
| [Premium (Subscription Simulation)](#premium-subscription-simulation) | Simulates an active subscription to unlock premium features. |  |

</details>

<details open>
<summary>📦 Toolbox for Minecraft PE&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 5.4.58 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Google Play Install Check](#bypass-google-play-install-check) | App always behaves as if installed from Google Play, bypassing the install source check. |  |
| [Premium](#premium) | Enables premium features by bypassing in-app purchase verification. |  |

</details>

<details open>
<summary>📦 Hill Climb Racing&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.71.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hill Climb Racing Ad Removal](#hill-climb-racing-ad-removal) | Completely removes ads: banners and interstitials can never be displayed (CFirebaseAds.showBanners/showInterstitial become no-ops) and ad-free is granted once per app start — loadStore() seeds mAdFree = 1, the native engine's poll grants it and the store's own reset (inappPurchasesProcessed) zeroes the field, so no repeated purchase popups. |  |
| [Hill Climb Racing Free Store](#hill-climb-racing-free-store) | Every store item is granted instantly and free: coins, gems, paints, ad-skips, ad-free and bundles, without launching Google Play billing. |  |
| [Hill Climb Racing Instant Rewarded Video Rewards](#hill-climb-racing-instant-rewarded-video-rewards) | Rewarded video ads grant their reward instantly without playing the ad: the native engine receives onVideoStartedSuccess + onVideoCompletedSuccess on the GL thread, exactly as if the video had been watched and completed. |  |

</details>

<details open>
<summary>📦 Pixel Car Racer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.2.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [IAP Bypass](#iap-bypass) | Bypasses in-app purchase verification. All purchases are treated as completed. |  |

</details>

<details open>
<summary>📦 Smash Hit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.5.14 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Smash Hit Premium Unlock](#smash-hit-premium-unlock) | Unlocks premium and all game modes without purchase. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=legendsciber/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/legendsciber/morphe-patches

### 🛠️ Building

To build legendsciber's Morphe Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

legendsciber's Patches are licensed under the [GNU General Public License v3.0](LICENSE)
