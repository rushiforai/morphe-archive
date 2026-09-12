# 🧩 d0nj Patches

## ❓ About

Patches for apps I use, built with [Morphe](https://morphe.software).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/d0nj/morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Niagara Launcher&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix home screen numbers tile](#fix-home-screen-numbers-tile) | Niagara's Channels feature registers a diagnostic tip whose message is a giant fingerprint of concatenated hashCode() integers of up to 30 channel items (~850 digits). Because the provider accepts every tip request, this shows up as a tile of giant numbers on the home feed whenever the channel list refreshes, which happens when apps are installed, updated or removed (for example through ADB). Makes the provider decline tip requests so the diagnostic tip is never shown. |  |
| [Remove analytics](#remove-analytics) | Disables all telemetry in Niagara Launcher: the weekly usage-report upload (app launches, notification metadata, survey responses), retention milestone events, GDPR consent sync, Singular attribution sessions and events (advertising ID, app set ID, install referrer, FCM token) and the runtime Firebase Analytics opt-in. |  |
| [Unlock Pro](#unlock-pro) | Makes the entitlement holder always report Pro in Niagara Launcher. Unlocks all Pro features and bypasses the 7-day trial prompt. Server-backed features (account sync, Stripe checkout) are not affected. |  |

</details>

<details open>
<summary>📦 AI Audio Novel Reader&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Makes isPremium() always return true in AI Audio Novel Reader. Unlocks all premium features and disables the 10-hour trial countdown. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=d0nj/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/d0nj/morphe-patches

### 🛠️ Building

To build d0nj Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

d0nj Patches are licensed under the [GNU General Public License v3.0](LICENSE)
