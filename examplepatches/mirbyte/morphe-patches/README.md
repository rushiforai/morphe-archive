# mitrosoft Morphe Patches

Patch bundle for use with [Morphe](https://github.com/MorpheApp).

## About

Still trying to figure this out.

Exhaustive testing has not been done. Please report any issues.

### How to use these patches

Click the button below, or manually add this repo URL in Morphe Manager: https://github.com/mirbyte/morphe-patches

<a href="https://morphe.software/add-source?github=mirbyte/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

### Bloomberg requirements

- Bloomberg is not distributed outside Google Play. The APK must come from a legitimate Play Store install on your device, or be extracted from that install with AntiSplit-M by someone else. I won't distribute the APK.
- In the Morphe Android app, tap the APK picker icon (top right), choose the installed app list, and select Bloomberg.
- The patched app is a clone. It installs next to the Play Store version as `com.bloomberg.android.plus.morphe`.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://github.com/mirbyte/morphe-patches/releases/tag/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Bloomberg&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.bloomberg.android.plus`

**🎯 Supported versions:**

| 6.66.0.5604504 | 6.66.0.5604504.069af9ffeb |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clone Bloomberg](#clone-bloomberg) | Changes the package name to com.bloomberg.android.plus.morphe so the app installs next to the Play Store version. Renames custom permissions and provider authorities to match. Makes updating easier as you can get the original APK from Play Store. |  |
| [Disable analytics SDKs](#disable-analytics-sdks) | Turns off AppsFlyer (install tracking and event logging) and Comscore (audience measurement). AppsFlyer does not start, and events it logs report success without being sent. Comscore sends no startup, foreground, view, or stream pings. |  |
| [Disable manifest telemetry](#disable-manifest-telemetry) | Disables Firebase and Google Analytics collection flags, Sentry and Facebook SDK collection flags, the ad ID and install referrer permissions, and the Google Analytics, Measurement, and Sentry components in AndroidManifest.xml. |  |
| [Force subscription and disable ads](#force-subscription-and-disable-ads) | Hides ad components, ad slots, and banner ads, and makes the app report an active device subscription. |  |
| [Remove Japanese fonts](#remove-japanese-fonts) | Removes the NotoSansJP font files from assets/fonts to save space. |  |
| [Rename Bloomberg](#rename-bloomberg) | Changes the launcher name shown under the app icon. | • App name |
| [Skip video ads](#skip-video-ads) | Skips Google dynamic ad insertion for on-demand videos and plays the backup stream instead, when the stream provides one. Fixes video streams that do not play. |  |
| [Strip Bloomberg permissions](#strip-bloomberg-permissions) | Removes the selected permission groups from AndroidManifest.xml. | • Storage<br>• Boot start<br>• Ad ID<br>• Install referrer<br>• Billing |

</details>

<details open>
<summary>📦 TradingView&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**Package name:** `com.tradingview.tradingviewapp`

**🎯 Supported versions:**

| 1.20.86.0.1002565 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AdMob](#disable-admob) | Makes the AdMob availability check return false. |  |
| [Disable GoPro ad fallback](#disable-gopro-ad-fallback) | Disables the GoPro promo fallback triggered by AdMob load failures. |  |
| [Disable analytics](#disable-analytics) | Drops analytics, tracking, and funnel events. |  |
| [Disable brokers feature](#disable-brokers-feature) | Turns off the brokers feature toggle, which broker trading entry points on charts, watchlist, and alerts check. |  |
| [Force local Pro plan](#force-local-pro-plan) | Forces the local plan lookup and plan state to report Pro. Also hides the profile upsell banner. |  |
| [Hide broker UI](#hide-broker-ui) | Hides broker entry points: the Explore Brokers block, the brokers banner and have-account prompt, the More menu's Trade with your broker button, and the trading and up/down arrows buttons below the chart. |  |
| [Hide profile upsell banner](#hide-profile-upsell-banner) | Hides the subscription upsell banner below the profile on the Menu tab. Also hidden by Force local Pro plan. |  |
| [Holy larp](#holy-larp) | Forces the Ultimate badge on the current user. Visual only. |  |
| [Strip permissions](#strip-permissions) | Removes the selected permission groups from AndroidManifest.xml. | • Storage<br>• Calendar<br>• Foreground service<br>• Boot start<br>• Ad ID<br>• Billing |

</details>

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is in `patches/build/libs/patches-*.mpp`
- Patch with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

mitrosoft Morphe Patches is licensed under the [GNU General Public License v3.0](LICENSE)
