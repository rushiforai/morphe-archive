# Beyonder Morphe Patches

## About

Custom patches by beyonder for apps I like.

> [!IMPORTANT]
> **Root required: StrongLifts, MacroFactor, MacroFactor Workouts.** These apps are signature-bound (StrongLifts is also shielded by Google Play PairIP), so the patched build must be mounted over the genuine Play-signed install — a normal sideload will not run.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=callMeBeyonder/morphe-patches

## Patches list

Patches are pinned to the versions shown below. A newer app version may not work until support is added — open an issue with the app version if a supported app has updated.

<!-- PATCHES_START -->
> **[v1.21.0](https://github.com/callMeBeyonder/morphe-patches/releases/tag/v1.21.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;33 patches total

**Apps at a glance:**

| App | Versions | Input | Root | Patches |
| --- | --- | :---: | :---: | :---: |
| [Alpha Progression](#app-alpha-progression) | 7.7.1 | APKM |  | 2 |
| [Boostcamp](#app-boostcamp) | 267 | XAPK |  | 1 |
| [C25K](#app-c25k) | 144.27 | APK |  | 1 |
| [Carbon](#app-carbon) | 2.77.6010 | XAPK |  | 1 |
| [Couch to 10K](#app-couch-to-10k) | 117.19 | APK |  | 1 |
| [CRICFy TV](#app-cricfy-tv) | 7.3<br>7.4 | APK |  | 4 |
| [Crossrope](#app-crossrope) | 9.3.9 | XAPK |  | 1 |
| [Gym Day](#app-gym-day) | 1.62.0 | APK |  | 2 |
| [Half Marathon 13.1](#app-half-marathon-13-1) | 96.03 | APK |  | 1 |
| [HealthifyMe](#app-healthifyme) | v31.5<br>v31.6 | XAPK |  | 3 |
| [Home workouts BeStronger](#app-home-workouts-bestronger) | 7.6.9 | XAPK |  | 1 |
| [JuggernautAI](#app-juggernautai) | 3.1.0 | APKS |  | 2 |
| [Jump Rope Challenge](#app-jump-rope-challenge) | 1.8.1 | XAPK |  | 1 |
| [MacroFactor](#app-macrofactor) | 5.8.13 | XAPK | 🔒 | 2 |
| [MacroFactor Workouts](#app-macrofactor-workouts) | 1.4.3 | XAPK | 🔒 | 1 |
| [Marathon 26.2](#app-marathon-26-2) | 2.58 | APK |  | 1 |
| [MovieBox TV](#app-moviebox-tv) | 1.2.3.1113.03 | APK |  | 5 |
| [RP Hypertrophy](#app-rp-hypertrophy) | 1.11.0 | XAPK |  | 1 |
| [Runna](#app-runna) | 8.61.0 | APKS |  | 1 |
| [StrongLifts](#app-stronglifts) | 4.4.1 | APKM | 🔒 | 1 |

> **Input:** APK = single APK · APKM/XAPK/APKS = split containers — patch the whole container, not the base APK. **Root:** must be mounted over the Play-signed install.

<a id="app-alpha-progression"></a>
<details>
<summary>Alpha Progression&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;•&nbsp;&nbsp;APKM</summary>
<br>

**Supported versions:**

| 7.7.1 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Bypass PairIP checks**<br>*(off by default)* | Disables PairIP's native VM, signature check and Play licence verdicts so a re-signed build does not open the Play Store listing or crash, and restores the VM-relocated string literals captured from the genuine build. Experimental: three VM-virtualized receiver/background methods fall back to default return values. |  |
| **Unlock Pro** | Unlocks all Pro features by forcing the web app's own client-side subscription gate (`proVersion.isActive` and the `pro-version` body class) to active. RevenueCat, Play Billing and the account's real server-side entitlement are left untouched. |  |

</details>

<a id="app-boostcamp"></a>
<details>
<summary>Boostcamp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 267 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the Pro surfaces that are computed on-device (Strength Score, per-muscle volume heatmap, auto-progression and the analytics screens) by reporting an active RevenueCat entitlement to the app's JavaScript layer. Server-delivered coach programs still require a real subscription. |  |

</details>

<a id="app-c25k"></a>
<details>
<summary>C25K&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 144.27 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the Zen Unlimited Pass features: removes ads and enables workout stats, workouts, music, height/weight and achievement stats. |  |

</details>

<a id="app-carbon"></a>
<details>
<summary>Carbon&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 2.77.6010 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks Carbon Premium by forcing the app's `isSubscribed` reads to true, stubbing `hasActiveSubscription()` and the RevenueCat entitlement readers (`activeProductId()`, `activeProductPlanId()`, `subscriptionState()`) to a canned active yearly entitlement. Account data the server owns is not affected. |  |

</details>

<a id="app-couch-to-10k"></a>
<details>
<summary>Couch to 10K&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 117.19 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the Zen Unlimited Pass: every plan week, the Zen Powered Music Mixes, the member Fitness Plans page and the Settings Unsubscribe entry, and hides the drawer's buy-product item. Billing is untouched. |  |

</details>

<a id="app-cricfy-tv"></a>
<details>
<summary>CRICFy TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 7.3 | 7.4 |
| :---: | :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Bypass integrity check**<br>*(off by default)* | Disables the native tamper check that makes a re-signed build fail to decrypt the server configuration on startup. |  |
| **Remove ads** | Removes the sponsor ads (banner and gate screens) and the full-screen ads. The locked channel dialog is kept. |  |
| **Remove bandwidth sharing (CashRaven)** | Disables the CashRaven P2P bandwidth-sharing SDK: no opt-in, no background sharing service, no restart on boot, and the sharing menu entry is hidden. |  |
| **Remove unnecessary permissions** | Removes the boot-persistence, advertising-ID, install-referrer and package-query permissions the patched build no longer needs. |  |

</details>

<a id="app-crossrope"></a>
<details>
<summary>Crossrope&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 9.3.9 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Reports the account as premium by forcing the stored `is_premium` check to true and the `membership_tier` getter to the `Standard` tier, which unlocks the paid workout, class, program, benchmark and profile surfaces. Billing is untouched; media the server refuses to serve to free accounts may still fail to load. |  |

</details>

<a id="app-gym-day"></a>
<details>
<summary>Gym Day&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 1.62.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Force Premium Writes**<br>*(off by default)* | Stores true on every write of the PREMIUM_ENABLED preference, so RevenueCat entitlement callbacks and the purchase coroutine can never clear the local premium flag. |  |
| **Unlock Premium** | Unlocks the premium surfaces gated by the app's local PREMIUM_ENABLED flag: premium schedules and workouts, unlimited custom schedules/workouts, statistics ranges, notes, AI exercise tips, coach weeks, export, sign-in, photo upload and the plate calculator. |  |

</details>

<a id="app-half-marathon-13-1"></a>
<details>
<summary>Half Marathon 13.1&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 96.03 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the Zen Unlimited Pass: every plan week, the Zen Powered Music Mixes, the member Fitness Plans page and the Settings Unsubscribe entry, and hides the drawer's buy-product item. Billing is untouched. |  |

</details>

<a id="app-healthifyme"></a>
<details>
<summary>HealthifyMe&nbsp;&nbsp;•&nbsp;&nbsp;3 patches&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| v31.5 | v31.6 |
| :---: | :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Bypass Root Detection** | Removes the root-detection block so the app can be used on rooted devices. |  |
| **Remove analytics** | Stops Firebase Analytics and CleverTap reporting, AppsFlyer attribution, and Facebook automatic app events/advertiser-ID collection. CleverTap push/in-app initialisation is disabled; crash reporting and Branch deep links are kept. |  |
| **Unlock Premium** | Unlocks premium and freemium features in the app, including the full macro and micronutrient breakdown for food items and the dashboard freemium card locks, locked-state CTAs (e.g. "Unlock Macros"), and the expired-trial tag chips. Server-delivered content such as diet plans, coaching, and AI features may still require a real subscription. |  |

</details>

<a id="app-home-workouts-bestronger"></a>
<details>
<summary>Home workouts BeStronger&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 7.6.9 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock BeStronger Pro** | Unlocks BeStronger Pro by injecting an active `BeStronger Pro` RevenueCat entitlement into the `CustomerInfo` map the React Native bridge already builds, and by no-opping the legacy purchase sync that can fail on a re-signed build. RevenueCat's native paywall UI and the account's real server-side entitlement are left untouched. |  |

</details>

<a id="app-juggernautai"></a>
<details>
<summary>JuggernautAI&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;•&nbsp;&nbsp;APKS</summary>
<br>

**Supported versions:**

| 3.1.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Disable Expo OTA updates** | Stops the app from downloading a production JavaScript bundle over the embedded one. Required by bundle patches so a later Expo update cannot replace the patched JavaScript. |  |
| **Unlock Premium** | Unlocks all premium programs by initialising the app's own `SUBSCRIPTION_ENABLED` config flag to false at module init. That is the flag the paywall, the Subscription screen guard, the IAPHUB sync and the walkthrough check all read, so the app runs in its "subscriptions not live" mode: no paywall, premium programs selectable. Expo OTA updates are disabled so a downloaded JS bundle cannot overwrite the patched one. Store and server-side data are not affected. |  |

</details>

<a id="app-jump-rope-challenge"></a>
<details>
<summary>Jump Rope Challenge&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 1.8.1 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks all premium content by forcing every premium gate ("true"===this.state.premium) and every premium flag seed to true in the web bundle. |  |

</details>

<a id="app-macrofactor"></a>
<details>
<summary>MacroFactor&nbsp;&nbsp;•&nbsp;&nbsp;2 patches&nbsp;&nbsp;•&nbsp;&nbsp;XAPK&nbsp;&nbsp;•&nbsp;&nbsp;🔒 root</summary>
<br>

**Supported versions:**

| 5.8.13 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Stub App Check tokens**<br>*(off by default)* | Makes Firebase App Check's Play Integrity token fetch succeed with a throwaway token, so the app no longer reports "Device integrity can't be verified". The server still rejects the token, so AI food search keeps failing there. Client-side check only. |  |
| **Unlock Premium (Root)** | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<a id="app-macrofactor-workouts"></a>
<details>
<summary>MacroFactor Workouts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK&nbsp;&nbsp;•&nbsp;&nbsp;🔒 root</summary>
<br>

**Supported versions:**

| 1.4.3 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium (Root)** | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<a id="app-marathon-26-2"></a>
<details>
<summary>Marathon 26.2&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 2.58 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the Zen Unlimited Pass: every plan week, the Zen Powered Music Mixes, the member Fitness Plans page and the Settings Unsubscribe entry, and hides the drawer's buy-product item. Billing is untouched. |  |

</details>

<a id="app-moviebox-tv"></a>
<details>
<summary>MovieBox TV&nbsp;&nbsp;•&nbsp;&nbsp;5 patches&nbsp;&nbsp;•&nbsp;&nbsp;APK</summary>
<br>

**Supported versions:**

| 1.2.3.1113.03 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Custom seek step** | Lets you choose how far the player skips when seeking, from the player settings. | • Default seek step (seconds) |
| **Disable forced update** | Hides the blocking update dialog and the update prompt. |  |
| **Prefer highest resolution** | Starts videos at the highest available quality instead of 480p. |  |
| **Serve requested resolution** | Makes quality selection work: 480p, 720p, 1080p and 4K actually switch to that resolution. |  |
| **Unlock VIP** | Unlocks VIP-only content and removes region restrictions. |  |

</details>

<a id="app-rp-hypertrophy"></a>
<details>
<summary>RP Hypertrophy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;XAPK</summary>
<br>

**Supported versions:**

| 1.11.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Unlocks the premium training features by answering the web app's subscription request with an active `training` subscription, and disables the PairIP license check so the re-signed build does not open its paywall. Account data that the server owns is not affected. |  |

</details>

<a id="app-runna"></a>
<details>
<summary>Runna&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APKS</summary>
<br>

**Supported versions:**

| 8.61.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Premium** | Reports an active `premium` entitlement to Runna's JavaScript layer, clears the backend's client-side plan lock flags and subscription status, unlocking premium screens, all plan weeks and the plan footer without a Play purchase. |  |

</details>

<a id="app-stronglifts"></a>
<details>
<summary>StrongLifts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch&nbsp;&nbsp;•&nbsp;&nbsp;APKM&nbsp;&nbsp;•&nbsp;&nbsp;🔒 root</summary>
<br>

**Supported versions:**

| 4.4.1 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Pro (Root)** | Unlocks all Pro and PowerPack features. Requires root: the patched build must be mounted over the genuine Play-signed install — a normal sideload will not run. |  |

</details>

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

Beyonder Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
