<a name="top"></a>
<p align="center">
  <a href="https://github.com/kveld9/kveld-extra-morphe-patches/releases/latest"><img src="https://img.shields.io/github/v/release/kveld9/kveld-extra-morphe-patches?color=8A2BE2&label=Release&logo=github&style=flat-square" alt="Latest Release" /></a>
  <a href="https://github.com/kveld9/kveld-extra-morphe-patches/stargazers"><img src="https://img.shields.io/github/stars/kveld9/kveld-extra-morphe-patches?color=8A2BE2&style=flat-square&logo=github" alt="GitHub stars" /></a>
  <a href="https://github.com/kveld9/kveld-extra-morphe-patches/releases"><img src="https://img.shields.io/github/downloads/kveld9/kveld-extra-morphe-patches/total?color=8A2BE2&style=flat-square&logo=github" alt="Total Downloads" /></a>
  <img src="https://img.shields.io/badge/Build_Engine-Morphe_Patcher-8A2BE2?style=flat-square" alt="Build engine: Morphe patcher" />
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-GPLv3-8A2BE2?style=flat-square" alt="License: GNU GPLv3" /></a>
</p>

<h1 align="center">kveld9 Extra Patches</h1>

<p align="center">
  Standalone, app-specific patches for companion targets for use with the <b><a href="https://morphe.software">Morphe</a></b> patcher framework.<br>
  Companion to the main collection: <a href="https://github.com/kveld9/kveld-morphe-patches">kveld-morphe-patches</a>.
</p>

<p align="center">
  <a href="https://morphe.software/add-source?github=kveld9/kveld-extra-morphe-patches"><img src="https://img.shields.io/badge/Morphe_Manager-Add_Patch_Source-8A2BE2?style=for-the-badge&logo=android&logoColor=white" alt="Add Source to Morphe Manager" /></a>
  &nbsp;&nbsp;
  <a href="https://github.com/kveld9/kveld-extra-morphe-patches/releases/latest"><img src="https://img.shields.io/badge/Direct_Download-Get_.MPP_Bundle-0070F3?style=for-the-badge&logo=github&logoColor=white" alt="Download Latest Release" /></a>
  &nbsp;&nbsp;
  <a href="https://t.me/kveldmorphe"><img src="https://img.shields.io/badge/Telegram-Official_Support-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white" alt="Official Telegram Support Group" /></a>
</p>

---

## Table of Contents

![](images/divider-purple.svg)

- [Quick Start](#quick-start)
- [Key Advantages](#key-advantages)
- [Supported Targets & Downloads](#supported-targets--downloads)
- [Universal Patches (Companion Source)](#universal-patches-companion-source)
- [Patch Catalog](#patch-catalog)
- [Documentation & Guides](#documentation--guides)
- [Contributing & Feature Requests](#contributing--feature-requests)
- [Community & Support](#community--support)
- [Credits & Contributors](#credits--contributors)
- [Legal Disclaimer](#legal-disclaimer)
- [License](#license)

<a name="quick-start"></a>
## Quick Start

![](images/divider-purple.svg)

1. **Install Morphe Manager**: Download and install the latest release of [Morphe Manager](https://github.com/morphe-app/morphe-manager) on your Android device.
2. **Download Target APK**: Download the supported APK or APKM bundle for your target application, matching the exact version listed in its [Application Guide](#application-guides) (section 1, Target & Compatibility).
3. **Add Patch Source**: Add this repository as a custom patch source in Morphe Manager:
   - Use the one-click [Add Patch Source](https://morphe.software/add-source?github=kveld9/kveld-extra-morphe-patches) action, or manually enter `kveld9/kveld-extra-morphe-patches` in Morphe Manager under **Settings > Sources**.
4. **Patch & Install**: Open Morphe Manager, select the downloaded target APK/APKM, select your desired patches, tap **Patch**, and install the resulting build.

> [!NOTE]
> Root access is not required. Morphe modifies application packages directly in userland. Always use the exact target version specified in the app's guide to satisfy compile-time fingerprint assertions.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="key-advantages"></a>
## Key Advantages

![](images/divider-purple.svg)

- **Zero Runtime Overhead**: compile-time Dalvik bytecode manipulation and XML transformation without background daemons, proxy servers, or Xposed frameworks.
- **Client-Side Telemetry Neutralization**: disables tracking, analytics, and crash reporting at method call sites and manifest components instead of fragile network-level blackholing.
- **Rootless & Standalone**: operates directly on userland APKs and APKM split bundles; no Magisk, KernelSU, or root privileges required.
- **Strict Upstream Parity**: each app targets exactly one version, the latest supported release, with exact fingerprint assertions.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="supported-targets--downloads"></a>
## Supported Targets & Downloads

![](images/divider-purple.svg)

Each app targets exactly one version, the latest supported release. See the [Patch Catalog](#patch-catalog) for the per-app supported version. Each [Application Guide](#application-guides) (section 1, Target & Compatibility) carries the package name, variant, and download source; always use the exact version listed in the Patch Catalog.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="universal-patches-companion-source"></a>
## Universal Patches (Companion Source)

![](images/divider-purple.svg)

This source ships app-specific patches only. Generic maintenance that works on any app (unused languages, screen sizes, packaging leftovers, background activity, common trackers) lives in the companion collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches) as universal patches, and applies to every app in this repo as well.

To use them, add `kveld9/kveld-morphe-patches` as a second source in Morphe Manager (or via [one-click](https://morphe.software/add-source?github=kveld9/kveld-morphe-patches)) alongside this collection.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="patch-catalog"></a>
## Patch Catalog

![](images/divider-purple.svg)


<!-- PATCHES_START -->
<details>
<summary>Instagram&nbsp;&nbsp;•&nbsp;&nbsp;<b>3 patches</b></summary>
<br>

**Supported versions:**

| 447.0.0.55.81 |
| :---: |
| Download com.instagram.android v447.0.0.55.81 (APKM) arm64-v8a 120-480dpi versionCode 385311891 (BUNDLE3 S) from APKMirror |

| Patch | Description | Options |
|----------|----------------|-----------|
| **AR Effects Slimmer** | Strips ARCore native binaries (libarcore_sdk_c.so, libarcore_sdk_jni.so) and AR effect/face tracking asset models. WARNING: Disables camera AR filters, 3D face effects, and body/face tracking. |  |
| **Block Crash & Diagnostics** | Neutralizes crash-dump uploaders, Lacrima detector broadcasts, debug diagnostics, carrier preload trackers, and lead-ads entrypoints. |  |
| **Block Telemetry & Trackers** | Neutralizes Facebook Analytics2, DataTransport, FDID/PhoneId providers, and strips AD_ID permissions. |  |

</details>

<details>
<summary>X&nbsp;&nbsp;•&nbsp;&nbsp;<b>2 patches</b></summary>
<br>

**Supported versions:**

| 12.37.2-prod.01 |
| :---: |
| Download com.twitter.android v12.37.2-prod.01 (APKM) arm64-v8a 120-640dpi versionCode 312372001 (BUNDLE 35 S) from APKMirror |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Background Slimmer** | Disables background periodic jobs, home screen widgets, and companion services to reduce resource usage. |  |
| **Block Telemetry & Trackers** | Blocks tracking services, analytics collection, and advertising identifiers, redirects Braze and Sentry endpoints to 0.0.0.0, and purges Sentry manifest metadata. | • Block Payments & Anti-Fraud Telemetry |

</details>

<details>
<summary>NokoPrint - WiFi, Bluetooth, USB&nbsp;&nbsp;•&nbsp;&nbsp;<b>7 patches</b></summary>
<br>

**Supported versions:**

| 5.28.6 |
| :---: |
| Download com.nokoprint v5.28.6 (XAPK bundle) from APKPure |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Ads** | Blocks ad loaders and unlocks ad-free status. |  |
| **Block Trackers** | Blocks analytics and ad tracking. |  |
| **Printer-Compatible Connections** | Keeps HTTP cleartext for LAN printers and driver downloads and trusts user certificates. Less strict than stock; on by default because some printers need it, disable for maximum strictness. |  |
| **Remove Extra Files** | Deletes hidden ad files and trackers to shrink the app. |  |
| **Remove Extra Stores** | Disables payment components for other app stores you do not use. |  |
| **Skip Welcome Screen** | Skips the first-launch popup (the About menu still works). |  |
| **Stop Background Sync** | Stops background tasks that drain the battery. |  |

</details>

<details>
<summary>CapCut&nbsp;&nbsp;•&nbsp;&nbsp;<b>13 patches</b></summary>
<br>

**Supported versions:**

| 19.9.0 |
| :---: |
| Download com.lemon.lvoverseas v19.9.0 (APK) arm64-v8a nodpi versionCode 19900002 from APKMirror |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Telemetry & Trackers** | Neutralizes Google AppMeasurement, AppsFlyer, ByteDance AppLog, APM/Slardar, Gecko, Pitaya, BDTuring, and UserGrowth event dispatchers. |  |
| **Bypass Effects Region Restriction** | Fixes effects, transitions, and templates failing to load (ByteDance Shark WAF block) by spoofing device_platform to 'windows' and resetting deviceId in effect requests. |  |
| **Bypass GeoBlock Region Restriction** | Forces CapCut GeoBlock config lists (cert, dock, entrance, page, scheme) to empty so region-blocked surfaces stay enabled. Server-refused content may still fail to load. |  |
| **Bypass Signature Check** | Spoofs the official APK signature (SHA-256) for tamper telemetry, drops the server-driven signature blacklist, silences the abnormal-source toast, and disables the Godzilla inject-detect gate so re-signed builds are not blocked. |  |
| **Bypass Unsafe Package Modal** | Replaces the unsafe-package modal fallback URL in the Lynx schema defaults with the real template portal URL so region-blocked or untrusted-client fallbacks open templates instead of the blocking security notice. |  |
| **Locale Assets Slimmer** | Strips unselected CapCut asset locale bundles (assets/locales/*.json) from the APK. English is always preserved. For res/values-* string tables use the canonical universal Remove Extra Languages patch. | • Locales to keep |
| **Native Bloat Slimmer** | Strips non-essential companion native libraries by zeroing bytes in-situ. Always zeroes AppLovin ad crash reporter. WARNING: Stripping speech recognition and synthesis engines (libspeech*.so) disables voice recognition, voiceover captions, and speech-to-text features. | • Trim Speech Engines (Breaks Voice Features) |
| **Neutralize Play Billing** | Stubs Google Play Billing client calls and disables billing manifest components for graceful degradation on devices without GMS. |  |
| **Redirect API to v2 Boot** | Loads effects, feeds and templates where default endpoints are blocked by using official alternate endpoints. |  |
| **Remove Watermark** | Forces CapCut watermark-removal gates and default ending gate to allow export without watermark or outro. |  |
| **Unlock Premium** | Forces CapCut VIP gates to return true (SubscribeImpl, PayVipImpl, UserVipInfo, UserDetailInfo, VipUserServiceImpl, SubscribeCloudImpl) plus central account status flags (BusinessManager). Cloud-gated assets may still fail. |  |
| **Unlock Premium Templates** | Marks premium template styles as available so locked template features stay usable. |  |
| **Unlock Ultra HD Export** | Forces CapCut Ultra HD / high-resolution export gates to unlocked so 4K export options stay available. |  |

</details>

<details>
<summary>Moovit&nbsp;&nbsp;•&nbsp;&nbsp;<b>6 patches</b></summary>
<br>

**Supported versions:**

| 5.203.0.1812 |
| :---: |
| Download com.tranzmate v5.203.0.1812 (APKM) arm64-v8a 160-640dpi versionCode 1812 (BUNDLE 31 S) from APKMirror |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Telemetry & Trackers** | Neutralizes AppsFlyer, Braze, and Inneractive DEX dispatchers, disables analytics services/providers, and strips advertising permissions. |  |
| **Fix Google Maps** | Restores Google Maps rendering by spoofing the original package signature to Google Play Services. | • Google Maps Platform API key<br>• Force Google Maps engine |
| **Remove Ads** | Hides banner and inline ads and neutralizes ad unit ID lookups. |  |
| **Suppress Paywalls** | Suppresses subscription paywalls, onboarding upgrade dialogs, and promotional cards. |  |
| **Unlock Moovit+** | Unlocks Moovit+ premium subscription features locally, including Safe Ride and address search in favorites. |  |
| **Use Places API (New)** | Switches search autocomplete from Places API (Legacy) to Places API (New). Legacy Places is not available in new Cloud projects. Requires Places API (New) to be enabled for the API key. |  |

</details>

<details>
<summary>SUBE&nbsp;&nbsp;•&nbsp;&nbsp;<b>5 patches</b></summary>
<br>

**Supported versions:**

| 2.7.25 |
| :---: |
| Download com.sube.app v2.7.25 (XAPK bundle) from APKPure |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Telemetry & Trackers** | Neutralizes Google AppMeasurement, Firebase Analytics, and Firebase Crashlytics event dispatchers at bytecode entrypoints. |  |
| **Bypass SUBE NFC antenna check** | Bypasses the com.nxp.mifare system feature check in SUBE so the app runs on devices whose ROM does not declare NXP Mifare support. |  |
| **Cut Firebase Entirely** | Rewrites the Firebase Installations API endpoint (firebaseinstallations.googleapis.com) to 0.0.0.0 in DEX bytecode across all classes, severing background FID registration and installation auth tokens. WARNING: Breaks push notifications (FCM) and cloud messaging. |  |
| **Cut Firebase Manifest** | Disables Firebase Cloud Messaging services and instance ID receivers in AndroidManifest.xml. Breaks push notifications and FCM background delivery. |  |
| **SUBE Telemetry Manifest Purge** | Strips advertising permissions, disables measurement services, providers, and install receivers, and injects opt-out metadata flags in AndroidManifest.xml. |  |

</details>

<details>
<summary>Hevy - Gym Log Workout Tracker&nbsp;&nbsp;•&nbsp;&nbsp;<b>4 patches</b></summary>
<br>

**Supported versions:**

| 3.2.2 |
| :---: |
| Download com.hevy v3.2.2 (APKM) arm64-v8a 120-640dpi versionCode 3308730 (BUNDLE) from APKMirror |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Trackers** | Blocks crash reporting, ad attribution and referral tracking. |  |
| **Remove Extra Files** | Deletes tutorial videos, editor stickers and junk to shrink the app. |  |
| **Stop Background Sync** | Stops background sync tasks and alarms that drain the battery. |  |
| **Unlock Pro** | Unlocks Pro features stored on the device (routines, folders, charts). Server-limited items may still need a subscription. |  |

</details>

<details>
<summary>Xiaomi Earbuds&nbsp;&nbsp;•&nbsp;&nbsp;<b>11 patches</b></summary>
<br>

**Supported versions:**

| 1.38.0i |
| :---: |
| Download com.mi.earphone v1.38.0i (XAPK bundle) from APKPure |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Block Trackers** | Stops analytics and usage reporting. |  |
| **Device Privacy Guard** | Hides hardware IDs and lets Bluetooth work without location. |  |
| **Offline Only** | Fully disconnects the app from the internet. Pair your earbuds first. |  |
| **Run on Rooted Devices** | Lets the app run on rooted phones and network tools without crashing. |  |
| **Safer Connections** | Blocks unencrypted traffic and disables certificate pinning. |  |
| **Show All Models** | Shows every earbud model for pairing. |  |
| **Skip Popups & Tutorials** | Skips startup agreements, tutorials, and promo banners. |  |
| **Stop Background Activity** | Stops persistent notifications and background battery drain. |  |
| **Unlock Sound Features** | Enables spatial audio and hearing features on all devices. |  |
| **Unlock for Other Phones** | Enables full features on Samsung, Pixel, and other non-Xiaomi phones. |  |
| **Update Without Account** | Lets guests check and install earbud firmware updates. |  |

</details>

<details>
<summary>IbisPaint X&nbsp;&nbsp;•&nbsp;&nbsp;<b>1 patch</b></summary>
<br>

**Supported versions:**

| 14.1.2 |
| :---: |
| Download jp.ne.ibis.ibispaintx.app v14.1.2 (XAPK bundle) from APKPure |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Enable Prime membership** | Enables app features locked behind the subscription paywall. |  |

</details>

<details>
<summary>SD Maid SE&nbsp;&nbsp;•&nbsp;&nbsp;<b>1 patch</b></summary>
<br>

**Supported versions:**

| 2.2.2-rc0 |
| :---: |
| Download eu.darken.sdmse v2.2.2-rc0 (APK) FOSS-RELEASE versionCode 20202000 |

| Patch | Description | Options |
|----------|----------------|-----------|
| **Unlock Pro** | Unlocks SD Maid SE Pro features. |  |

</details>

<!-- PATCHES_END -->

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="documentation--guides"></a>
## Documentation & Guides

![](images/divider-purple.svg)

### General Documentation

| Document | Description |
| :--- | :--- |
| [Building & Development](docs/building.md) | Toolchain prerequisites, Gradle build tasks, in-situ patching gate, and catalog synchronization. |
| [Project Scope](docs/out-of-scope.md) | Compile-time invariants, single-version policy, and rejected feature categories. |
| [Security Policy](SECURITY.md) | Vulnerability disclosure procedures and supported security models. |
| [Changelog](CHANGELOG.md) | Complete history of changes, patch updates, and releases. |

### Application Guides

| App | Guide |
| :--- | :--- |
| Instagram | [Guide](docs/apps/instagram.md) |
| X | [Guide](docs/apps/twitter.md) |
| Moovit | [Guide](docs/apps/moovit.md) |
| CapCut | [Guide](docs/apps/capcut.md) |
| Hevy | [Guide](docs/apps/hevy.md) |
| NokoPrint | [Guide](docs/apps/nokoprint.md) |
| Xiaomi Earbuds | [Guide](docs/apps/xiaomi_earbuds.md) |
| SUBE | [Guide](docs/apps/sube.md) |
| SD Maid SE | [Guide](docs/apps/sdmse.md) |
| IbisPaint X | [Guide](docs/apps/ibispaint.md) |

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="contributing--feature-requests"></a>
## Contributing & Feature Requests

![](images/divider-purple.svg)

Before proposing new features, review the [Project Scope](docs/out-of-scope.md). Every patch change must pass the in-situ verification gate with 0 failed patches, 0 fingerprint mismatches, and 0 smali compile errors:

```bash
./gradlew runPatchTest -Papp=<targetApp>   # targetApp is the app id (see docs/apps/)
./gradlew check
```

For bug reports, patch inquiries, or feature proposals, open an issue using the templates:
- [Submit an Issue or Feature Request](https://github.com/kveld9/kveld-extra-morphe-patches/issues/new/choose)

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="community--support"></a>
## Community & Support

![](images/divider-purple.svg)

| Channel / Resource | Link | Description |
| :--- | :--- | :--- |
| **Telegram Support** | [t.me/kveldmorphe](https://t.me/kveldmorphe) | Official community discussion, updates, and support group. |
| **Issue Tracker** | [GitHub Issues](https://github.com/kveld9/kveld-extra-morphe-patches/issues/new/choose) | Bug reports and feature proposals using structured templates. |
| **Security Policy** | [SECURITY.md](SECURITY.md) | Reporting security vulnerabilities and disclosure guidelines. |
| **Release Notes** | [Changelog](CHANGELOG.md) / [Releases](https://github.com/kveld9/kveld-extra-morphe-patches/releases) | Detailed history of releases and patch changes. |

> [!NOTE]
> This repository is a companion collection for standalone applications. For Brave, Gboard Lite, TikTok, and other primary targets, visit the main patch repository: **[kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches)**.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="credits--contributors"></a>
## Credits & Contributors

![](images/divider-purple.svg)

<!-- CONTRIBUTORS_START -->
| Contributor | Role & Contributions |
| :--- | :--- |
| <a href="https://github.com/aeries0x"><img src="https://github.com/aeries0x.png" alt="@aeries0x" width="48" height="48" style="border-radius: 50%;" /><br><b>@aeries0x</b></a> | Feature request: Proposed X – Default reply sorting (open replies sorted by Likes) feature request ([#12](https://github.com/kveld9/kveld-extra-morphe-patches/issues/12)). |
| <a href="https://github.com/TheJNXx"><img src="https://github.com/TheJNXx.png" alt="@TheJNXx" width="48" height="48" style="border-radius: 50%;" /><br><b>@TheJNXx</b></a> | Feature request: Proposed Microsoft Word patches (telemetry removal, premium unlock, login requirement removal) feature request ([#36](https://github.com/kveld9/kveld-extra-morphe-patches/issues/36)). |
| <a href="https://github.com/springfurst"><img src="https://github.com/springfurst.png" alt="@springfurst" width="48" height="48" style="border-radius: 50%;" /><br><b>@springfurst</b></a> | Contributed the Use Places API (New) Moovit search patch ([#44](https://github.com/kveld9/kveld-extra-morphe-patches/pull/44)). |
<!-- CONTRIBUTORS_END -->

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="legal-disclaimer"></a>
## Legal Disclaimer

![](images/divider-purple.svg)

**kveld9 Extra Patches** is an independent, community-driven open-source project and is not affiliated, associated, authorized, endorsed by, or in any way officially connected with any of the respective app publishers or their subsidiaries or affiliates.

All product names, logos, brands, and registered trademarks mentioned in this repository are the property of their respective holders. Their inclusion does not imply affiliation with or endorsement by them.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>

<a name="license"></a>
## License

![](images/divider-purple.svg)

This project is licensed under the GNU General Public License v3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for the full license text and copyright notices.

<p align="center"><a href="#top"><b>&uarr; Back to top</b></a></p>
