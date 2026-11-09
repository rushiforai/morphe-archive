# 🧩 legendsciber's Patches

Morphe Patches repository by legendsciber.

## ❓ About

This is a collection of [Morphe](https://github.com/MorpheApp) patches maintained by legendsciber.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.54.1](https://github.com/legendsciber/morphe-patches/releases/tag/v1.54.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;35 patches total
<details open>
<summary>📦 Age Of War 2&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Age Of War 2 Remove Ads](#age-of-war-2-remove-ads) | Removes every ad: the ironSource and LevelPlay SDK is never initialised, so no interstitial, banner or rewarded video can load or be shown. Ad-gated actions still complete through the game's own no-ad fallback, so post-game navigation and ad-gated rewards proceed instantly without a network connection. |  |
| [Age Of War 2 Store Modes Unlock](#age-of-war-2-store-modes-unlock) | All four paid store modes are owned and unlocked without paying: Hacked Mode, Generals Mode, the Let's Party unit skins and the Age Of Spooky unit skins. The game checks ownership through a PlayerPrefs read, and each mode's unlock query now reports as unlocked, so the store rows show as owned and gameplay applies the modes and skins immediately. |  |

</details>

<details open>
<summary>📦 Aphelion&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 0.5.8 |
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

| 1.14.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Dan The Man Free IAP](#dan-the-man-free-iap) | All in-app purchases are granted instantly and free without Google Play billing. |  |

</details>

<details open>
<summary>📦 Death Rover&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.7.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Death Rover Free IAP](#death-rover-free-iap) | Every shop item reports as purchased and stays owned without contacting Google Play: cars, remove ads and double coins come pre-owned, and credit packs are granted instantly and free when bought instead of opening Google Play billing. Rover upgrades are left untouched, so those stay purchasable with the coins you earn. |  |
| [Death Rover Unlimited Turbo](#death-rover-unlimited-turbo) | The turbo no longer runs down: while the turbo is engaged the rover keeps refilling its gauge to the maximum instead of spending it, so you can hold the turbo for the whole drive. Cars without a turbo upgrade are unaffected. |  |

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
<summary>📦 Hill Climb Racing&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.73.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hill Climb Racing Free Store](#hill-climb-racing-free-store) | Every store item is granted instantly and free: coins, gems, paints, ad-skips, ad-free and bundles, without launching Google Play billing. |  |
| [Hill Climb Racing Instant Rewarded Video Rewards](#hill-climb-racing-instant-rewarded-video-rewards) | Rewarded ads pay out instantly: the engine is told a rewarded video is available and receives the started and completed callbacks straight away, so no video plays and every reward is granted offline. |  |

</details>

<details open>
<summary>📦 Hungry Shark&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 14.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hungry Shark Currency Hack](#hungry-shark-currency-hack) | Coins and gems are always set to 2,147,483,647 whenever they are earned, spent, purchased, or loaded from a save. |  |
| [Hungry Shark Installer Source Fix](#hungry-shark-installer-source-fix) | Spoofs the installer source as Google Play for every install-source check in the game and its SDKs, so sideloaded installs are treated as store installs and installer-based Play Store redirects are bypassed. |  |

</details>

<details open>
<summary>📦 New Star Soccer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.32 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [New Star Soccer Free IAP](#new-star-soccer-free-iap) | Every shop item is granted instantly and free when bought, without launching Google Play billing. |  |

</details>

<details open>
<summary>📦 Key Mapper&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Premium](#premium) | Unlocks the floating buttons and assistant trigger features by granting both purchase entitlements, keeping them available even offline where the purchase state cannot be fetched. |  |

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
<summary>📦 Sling Drift&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 5.13.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Sling Drift All Cars Unlock](#sling-drift-all-cars-unlock) | Every car reports as unlocked, so the whole garage is available right away no matter how the car would normally be earned. |  |
| [Sling Drift Instant Rewards](#sling-drift-instant-rewards) | Every ad-gated reward works without watching an ad and without a network connection: continuing after a crash, free car unlocks, free upgrades, the end-of-race multiplier, bonus rubies and daily quest rerolls are granted instantly. |  |
| [Sling Drift Unlimited Money](#sling-drift-unlimited-money) | Rubies are pinned to 999,999,999 whenever they are earned, spent, purchased or loaded from a save, so the balance can never run out and every car stays affordable. |  |
| [Sling Drift VIP Unlock](#sling-drift-vip-unlock) | VIP status and the active subscription are always reported, so VIP cars and every VIP-gated feature stay available without Google Play billing. |  |

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

<details open>
<summary>📦 Solar Smash&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.7.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Solar Smash All Packages Purchased](#solar-smash-all-packages-purchased) | Every in-app purchase package reports as purchased: the all weapons pack, all planets pack, remove ads and unlock levels and achievements stay permanently owned and unlocked, without contacting Google Play. Banner, interstitial and rewarded ads are suppressed via the Remove Ads entitlement. |  |

</details>

<details open>
<summary>📦 Subway Surfers&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.71.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Subway Surfers Free IAP](#subway-surfers-free-iap) | Coins, keys and shop items are granted instantly and free without Google Play billing. |  |
| [Subway Surfers Instant Rewarded Ads](#subway-surfers-instant-rewarded-ads) | Rewarded ad buttons grant their reward immediately without playing a video, and ad availability is forced ready so shop ad offers work without the ad SDK. Interstitial and banner ads are untouched. |  |
| [Subway Surfers Remove Ads](#subway-surfers-remove-ads) | Removes interstitial and banner ads. Depends on Instant Rewarded Ads, so rewarded videos are skipped while their rewards are still granted. |  |

</details>

<details open>
<summary>📦 Temple Run 2&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.136.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Temple Run 2 Free IAP](#temple-run-2-free-iap) | All store purchases (coins, gems, no-ads, characters, deals, potions and perks) are granted instantly and free without Google Play billing, online or offline. The shop, deals and perks tabs keep loading their full catalogue with no network connection, and real-money store items stay visible offline, where Google Play billing never reports prices. |  |
| [Temple Run 2 Instant Rewards](#temple-run-2-instant-rewards) | Every ad-gated reward works without watching an ad and without a network connection: rewarded-map unlocks, potions, power-ups, dailies, battle pass, advent calendar, weekly rewards and rewarded boosts are granted instantly. |  |

</details>

<details open>
<summary>📦 Zen Pinball&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.49.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Zen Pinball Free IAP](#zen-pinball-free-iap) | Coins, tables and every other store item are granted instantly and free, without launching Google Play billing. |  |

</details>

<details open>
<summary>📦 Zombie Tsunami&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.7.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Zombie Tsunami Free IAP](#zombie-tsunami-free-iap) | Every store item is granted the moment you tap buy, with no Google Play billing sheet in between: all coin packs, the coins and diamonds bundle and the double coins upgrade arrive instantly and for free, and coin packs can be bought as many times as you like. |  |
| [Zombie Tsunami Installer Check Fix](#zombie-tsunami-installer-check-fix) | The game's PairIP license client asks Android who installed the package and treats anything other than the Play Store as a failed check, so sideloaded installs are rejected on launch. This makes that one check report the Play Store as the installer. |  |

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
