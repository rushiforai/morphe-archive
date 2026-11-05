# 👋🧩 Beyonder Morphe Patches

## ❓ About

Custom patches by beyonder for apps I like.

> [!IMPORTANT]
> **StrongLifts requires root.** The app is shielded by Google Play PairIP, so the patched build must be mounted over the genuine Play-signed install — a normal sideload will not run.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=callMeBeyonder/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.2](https://github.com/callMeBeyonder/morphe-patches/releases/tag/v1.5.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 HealthifyMe&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| v31.5 | v31.6 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Root Detection](#bypass-root-detection) | Removes the root-detection block so the app can be used on rooted devices. |  |
| [Remove analytics](#remove-analytics) | Stops Firebase Analytics and CleverTap reporting, AppsFlyer attribution, and Facebook automatic app events/advertiser-ID collection. CleverTap push/in-app initialisation is disabled; crash reporting and Branch deep links are kept. |  |
| [Unlock Premium](#unlock-premium) | Unlocks premium and freemium features in the app, including the full macro and micronutrient breakdown for food items and the dashboard freemium card locks, locked-state CTAs (e.g. "Unlock Macros"), and the expired-trial tag chips. Server-delivered content such as diet plans, coaching, and AI features may still require a real subscription. |  |

</details>

<details open>
<summary>📦 CRICFy TV&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 7.3 | 7.4 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass integrity check](#bypass-integrity-check) | Disables the native tamper check that makes a re-signed build fail to decrypt the server configuration on startup. |  |
| [Remove ads](#remove-ads) | Removes the sponsor ads (banner and gate screens) and the full-screen ads. The locked channel dialog is kept. |  |
| [Remove bandwidth sharing (CashRaven)](#remove-bandwidth-sharing-cashraven) | Disables the CashRaven P2P bandwidth-sharing SDK: no opt-in, no background sharing service, no restart on boot, and the sharing menu entry is hidden. |  |
| [Remove unnecessary permissions](#remove-unnecessary-permissions) | Removes the boot-persistence, advertising-ID, install-referrer and package-query permissions the patched build no longer needs. |  |

</details>

<details open>
<summary>📦 MacroFactor Workouts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.4.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Root)](#unlock-premium-root) | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<details open>
<summary>📦 StrongLifts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.4.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro (Root)](#unlock-pro-root) | Unlocks all Pro and PowerPack features. Requires root: the patched build must be mounted over the genuine Play-signed install — a normal sideload will not run. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Beyonder Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
