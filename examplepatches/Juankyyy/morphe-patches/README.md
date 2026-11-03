# 💫 Juanky's Morphe Patches

Here are some patches for apps that I like


### How to use these patches

You need to have [Morphe](https://morphe.software/) and click the button below 👀

<p>
  <a href="https://morphe.software/add-source?github=Juankyyy/morphe-patches">
    <img src="https://img.shields.io/badge/%E2%9E%95%20%20Add%20to%20Morphe-00fff8?style=for-the-badge" alt="Add to Morphe">
  </a>
</p>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Juankyyy/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Remote Mouse&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 5.315 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable popups](#disable-popups) | Disables rate dialog, what's new dialog and auto update checks. |  |
| [Remove ads](#remove-ads) | Disables banner and interstitial AdMob ads. |  |
| [Unlock PRO](#unlock-pro) | Unlocks all PRO features. |  |

</details>

<details open>
<summary>📦 WaterMinder&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 5.10.10 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove license check](#remove-license-check) | Skips the Play license check so the app starts on installs outside Google Play. |  |
| [Unlock Premium](#unlock-premium) | Unlocks all Premium features. |  |
| [Update check off by default](#update-check-off-by-default) | Disables automatic update checks by default. Keep it off and update only via Morphe. |  |

</details>

<!-- PATCHES_END -->

## ❌ Failed patches

Apps whose premium cannot be unlocked with Morphe patches, documented so the attempt is not repeated.

| 📱&nbsp;App | 🔢&nbsp;Version | 💊&nbsp;Failed patch | 📅&nbsp;Last attempt | 📜&nbsp;Description |
|----------|----------------|----------------|----------------|----------------|
| BitePal (`com.pookies.food.ai`) | 2.34.0 | Unlock Premium | 2026-10-15 | Premium is verified server-side (own `billing.v1.BillingService` backend + Play purchase validation) with the gating logic compiled into Dart native code, out of reach of DEX patches. Forcing BillingClient getters and faking `queryPurchasesAsync` had no effect: banner and locks remained. Google login also breaks on patched builds due to signature mismatch. |
| Amaze Go! (`com.oakever.arrows`) | 1.37.0 | Remove ads | 2026-11-02 | Ships a native packer (Ano/ACE: `libanort.so` + `libu8t.so`, encrypted `global-metadata.dat`). It pins the original signing certificate and kills the process (SIGBUS/SIGSEGV) during Unity startup on any re-signed build. Verified with a patched and an unpatched re-signed APK, and with the pinned hash replaced; all crash. Java signature/install-source spoofs cannot bypass the native check. |

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Juanky's Patches are licensed under the [GNU General Public License v3.0](LICENSE)
