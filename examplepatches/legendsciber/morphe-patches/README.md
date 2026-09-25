# 🧩 legendsciber's Patches

Morphe Patches repository by legendsciber.

## ❓ About

This is a collection of [Morphe](https://github.com/MorpheApp) patches maintained by legendsciber.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.29.0](https://github.com/legendsciber/morphe-patches/releases/tag/v1.29.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Aphelion&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 0.4.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Aphelion Ad-Free Hint Unlock](#aphelion-ad-free-hint-unlock) | Unlocks level hints instantly without watching an ad: the share gate's watch ad action grants the hint immediately, with no ad playback required, even offline. |  |
| [Aphelion Installer Source Fix](#aphelion-installer-source-fix) | Spoofs the installer source as Google Play for every install-source check the game performs, so sideloaded installs pass and the forced Google Play Store redirect on launch is fixed. |  |

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
<summary>📦 Dan The Man&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.14.02 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Dan The Man Free IAP](#dan-the-man-free-iap) | All in-app purchases are granted instantly and free without Google Play billing. |  |

</details>

<details open>
<summary>📦 Extreme Car Driving Simulator&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 7.13.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Extreme Car Driving Add Native Lib](#extreme-car-driving-add-native-lib) | Adds libcurrencyhack.so to assets and helper dex. |  |
| [Extreme Car Driving Unlimited Currencies](#extreme-car-driving-unlimited-currencies) | Sets all in-game currencies (diamonds, coins, upgrade points) to 999,999,999 via IL2CPP API. |  |

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
<summary>📦 Hungry Shark&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 14.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hungry Shark Free IAP](#hungry-shark-free-iap) | All in-app purchases are granted instantly and free without Google Play billing. |  |
| [Hungry Shark Installer Source Fix](#hungry-shark-installer-source-fix) | Spoofs the installer source as Google Play for every install-source check in the game and its SDKs, so sideloaded installs are treated as store installs and the Google Play Store redirect is fixed. |  |

</details>

<details open>
<summary>📦 Red Ball 4&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.17.03 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [RB4 Premium & Skin Unlock](#rb4-premium-skin-unlock) | Unlocks premium, removes ads and unlocks all ball skins. |  |

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

<details open>
<summary>📦 Soccer Star&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 0.3.88 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Soccer Star Ad Removal](#soccer-star-ad-removal) | Disables ads completely: EnableAD always returns false, interstitials and banners are no-ops, Adjust purchase verification is skipped. |  |
| [Soccer Star Instant Rewarded](#soccer-star-instant-rewarded) | Rewarded and interstitial ad flows always report loaded and grant the success callback immediately without playing an ad, including offline. |  |
| [Soccer Star VIP Unlock](#soccer-star-vip-unlock) | Unlocks VIP subscription permanently: ownership keys always report active and unsubscribe can never clear the flag. |  |

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
