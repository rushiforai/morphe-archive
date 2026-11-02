# 👋🧩 Beyonder Morphe Patches

## ❓ About

Custom patches by beyonder for apps I like.

> [!IMPORTANT]
> **StrongLifts requires root.** The app is shielded by Google Play PairIP, so the patched build must be mounted over the genuine Play-signed install — a normal sideload will not run.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=callMeBeyonder/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/callMeBeyonder/morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
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

| 1.4.1 |
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
