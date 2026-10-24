# dieroboter Patches

Personal patch bundle for Morphe

## AI disclaimer

The patches in this repository were written by AI. Each patch was verified as working at the time of release. These patches are provided as-is, without a warranty of any kind.

---

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=dieroboter/morphe-patches

## Patches list

<!-- PATCHES_START -->
> **[v1.5.2](https://github.com/dieroboter/morphe-patches/releases/tag/v1.5.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;41 patches total
<details>
<summary>File Manager&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Supported versions:**

| 3.8.3 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable analytics and telemetry](#disable-analytics-and-telemetry) | Stops the app's event reporting: its own analytics forwarder and Firebase Analytics' event and user-property methods are no-oped, and the developer crash reporter is never started. Firebase Analytics collection was already disabled by the developer; this removes the remaining plumbing. Remote Config is left running - it is the app's configuration channel, not an event pipeline. |  |
| [Hide premium section in settings](#hide-premium-section-in-settings) | Hides the Premium category and its entry at the top of the Settings screen by setting both preferences invisible whenever the settings screen refreshes. Premium stays unlocked and the payment screen remains reachable from the main menu - only the Settings section is hidden. |  |
| [Remove ad and tracking components](#remove-ad-and-tracking-components) | Removes from the manifest: the AdMob and Firebase auto-init providers and Firebase's measurement and sessions components, so those SDKs do not start at app start; and the ad-tracking permissions (AD_ID, the Ad Services permissions and the install referrer permission). |  |
| [Unlock premium](#unlock-premium) | Reports a valid Premium Basic license to the app: the license manager's verdict methods are made to answer yes, so premium features unlock and ads stop (the app serves no ads to licensed users). The billing code itself is untouched - nothing is purchased. |  |

</details>

<details>
<summary>Flappy Bird&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Supported versions:**

| 1.3 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Adapt to modern displays](#adapt-to-modern-displays) | Adapts the game world to the display: the world height is computed at startup from the screen size, and the scene, pipe and texture geometry follows it, so the game adapts to any screen from 4:3 up through tall phones without bars. On screens shorter than the original 16:9 the background is anchored to the ground, so its skyline and bushes stay sitting on the ground instead of sinking behind it. Also adds display-cutout and immersive window handling and moves the per-frame texture setup to a one-time init call. |  |
| [Convert to 64-bit](#convert-to-64-bit) | Removes the bundled 32-bit native libraries (libandengine.so for armeabi, armeabi-v7a and x86). The engine's native loading is exception-guarded in the stock code and falls back to its Java implementation, so the game becomes ABI-neutral and installs on 64-bit-only devices. |  |
| [Modernize manifest and resources](#modernize-manifest-and-resources) | Makes the game activity the launcher and removes the splash screen and AdMob activity, drops the INTERNET and ACCESS_NETWORK_STATE permissions, raises the SDK levels to the port's min 14 / target 34 (current Android refuses to install the stock target 15), adds an adaptive launcher icon, removes the dead Google sign-in resources, and replaces the sound effects with re-encoded versions. |  |
| [Remove ads and Google services hooks](#remove-ads-and-google-services-hooks) | Hides the AdMob banner and removes the ad request so no ad is ever loaded, disconnects the Google Play Games activity hook, and removes the port-removed tap-zone handler and scene trigger tied to the old services UI. |  |

</details>

<details>
<summary>Geometry Dash Meltdown&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Supported versions:**

| 2.2.147 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable AppMetrica activation](#disable-appmetrica-activation) | Makes AppMetrica.activateReporter a no-op, so the AppMetrica reporter the Yandex mediation glue sets up is never activated and its events are dropped. |  |
| [Disable ad consent flow](#disable-ad-consent-flow) | Flips the AppLovin terms-and-privacy flow in LiteRobTopActivity.setupGAM from enabled to disabled, so the first-launch ad consent dialog never appears. |  |
| [Disable banner and interstitial ads](#disable-banner-and-interstitial-ads) | No-ops the native bridge methods that show banner and interstitial ads (LiteRobTopActivity._enableBanner / _showInterstitial) and makes _hasCachedInterstitial report false. Rewarded video ads are left working. |  |
| [Strip ad tracking permissions](#strip-ad-tracking-permissions) | Removes the ad identifier permissions (AD_ID and the Ad Services permissions: ad ID, attribution and topics) from the manifest. |  |

</details>

<details>
<summary>Geometry Dash SubZero&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Supported versions:**

| 2.2.147 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable AppMetrica activation](#disable-appmetrica-activation) | Makes AppMetrica.activateReporter a no-op, so the AppMetrica reporter the Yandex mediation glue sets up is never activated and its events are dropped. |  |
| [Disable ad consent flow](#disable-ad-consent-flow) | Flips the AppLovin terms-and-privacy flow in LiteRobTopActivity.setupGAM from enabled to disabled, so the first-launch ad consent dialog never appears. |  |
| [Disable banner and interstitial ads](#disable-banner-and-interstitial-ads) | No-ops the native bridge methods that show banner and interstitial ads (LiteRobTopActivity._enableBanner / _showInterstitial) and makes _hasCachedInterstitial report false. Rewarded video ads are left working. |  |
| [Strip ad tracking permissions](#strip-ad-tracking-permissions) | Removes the ad identifier permissions (AD_ID and the Ad Services permissions: ad ID, attribution and topics) from the manifest. |  |

</details>

<details>
<summary>Geometry Dash World&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Supported versions:**

| 2.2.147 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable AppMetrica activation](#disable-appmetrica-activation) | Makes AppMetrica.activateReporter a no-op, so the AppMetrica reporter the Yandex mediation glue sets up is never activated and its events are dropped. |  |
| [Disable ad consent flow](#disable-ad-consent-flow) | Flips the AppLovin terms-and-privacy flow in LiteRobTopActivity.setupGAM from enabled to disabled, so the first-launch ad consent dialog never appears. |  |
| [Disable banner and interstitial ads](#disable-banner-and-interstitial-ads) | No-ops the native bridge methods that show banner and interstitial ads (LiteRobTopActivity._enableBanner / _showInterstitial) and makes _hasCachedInterstitial report false. Rewarded video ads are left working. |  |
| [Strip ad tracking permissions](#strip-ad-tracking-permissions) | Removes the ad identifier permissions (AD_ID and the Ad Services permissions: ad ID, attribution and topics) from the manifest. |  |

</details>

<details>
<summary>GIF Maker&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Supported versions:**

| 2.0.8 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable AppMetrica activation](#disable-appmetrica-activation) | Makes AppMetrica.activateReporter a no-op, so the AppMetrica reporter the Yandex mediation glue sets up is never activated and its events are dropped. |  |
| [Disable Singular telemetry](#disable-singular-telemetry) | Prevents the Singular analytics SDK from initializing: its only init call site (the PremiumHelper Singular manager coroutine) returns immediately. |  |
| [Disable Toto backend](#disable-toto-backend) | Disables the Toto server-driven config/offers backend: its app-start initialization, config reporting (including the background worker), FCM promotional-push token registration and the worker scheduling all become no-ops. |  |
| [Disable ad consent flow](#disable-ad-consent-flow) | Disables the Google UMP ad-consent flow: the SDK's consent request returns immediately, so no consent information is requested and no consent form is ever loaded or shown. |  |
| [Disable rate prompts](#disable-rate-prompts) | Disables the in-app rate-us prompts (the SDK's rate-dialog source gate always returns false) and hides the 'Rate us' row in the settings screen. |  |
| [Hide settings buttons](#hide-settings-buttons) | Hides the 'VIP Customer Support', 'Rate us' and 'Share app' rows in the settings screen, and the rate button on the home screen bar. The support button on the home screen is not affected. |  |
| [Strip ad tracking permissions](#strip-ad-tracking-permissions) | Removes the ad identifier permissions (AD_ID and the Ad Services permissions: ad ID, attribution and topics) from the manifest. |  |
| [Unlock premium](#unlock-premium) | Unlocks premium: forces the PremiumHelper SDK's isPremium check to always return true, which also suppresses banner/interstitial ads and the paywall and relaunch offers through the SDK's own premium paths. |  |

</details>

<details>
<summary>MediaInfo&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Supported versions:**

| 26.10 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Remove premium references](#remove-premium-references) | Removes the visible premium branding: the Subscribe / Manage subscription entry is deleted from the main screen's menu, and the Premium section over the Preferences settings is removed outright (its settings move up into the plain list). The settings themselves stay, and the subscribe screen remains in the app but is no longer reachable. |  |
| [Unlock premium](#unlock-premium) | Unlocks MediaInfo's premium (the dark theme and subscriber features). The subscription verdict is a purely local Play Billing result held by the app's billing manager; this patch makes that verdict permanently 'subscribed'. No account or server is involved - the app has neither. |  |

</details>

<details>
<summary>Solitaire&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Supported versions:**

| 5.9 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable all ads and ad components](#disable-all-ads-and-ad-components) | Disables the game's entire ad stack: AdMob mediation initialization and the banner, interstitial, rewarded and app-open load entry points; Meta Audience Network initialization and loads; and Amazon APS (DTB) ad requests. No ads of any format are fetched or shown. |  |
| [Disable analytics and tracking](#disable-analytics-and-tracking) | Disables AppsFlyer (session start and event logging), Facebook AppEvents (activation, events, purchases, user data) and DoodleBI, the game's own reporting layer and its only Firebase Analytics consumer. No usage or ad-revenue events leave the device through these channels. |  |
| [Remove ad and tracking components](#remove-ad-and-tracking-components) | Removes from the manifest: the ad networks' and Facebook's auto-init providers (AdMob, Audience Network x2, Facebook) and Firebase's init provider, so none of those SDKs initialize at app start; and the ad-tracking permissions (AD_ID, the Ad Services permissions and the install referrer permission). |  |

</details>

<details>
<summary>WiFi FTP Server&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Supported versions:**

| 2.4.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Disable Crashlytics reporting](#disable-crashlytics-reporting) | Disables Firebase Crashlytics data collection and empties the app's Crashlytics log/exception calls, which otherwise report the server URL and configuration on every start and stop. |  |
| [Disable ad consent flow](#disable-ad-consent-flow) | Disables the Google UMP consent flow that gates ad loading. The consent info update never runs and ads are treated as always allowed to load. Has no visible effect if 'Remove banner ads' is also enabled. |  |
| [Disable mDNS service advertisement](#disable-mdns-service-advertisement) | Stops the server from announcing itself as 'WiFiFTP' over mDNS/NSD (_ftp._tcp) on the local network. Direct connections by IP address are unaffected. |  |
| [Hide Get Pro version button](#hide-get-pro-version-button) | Hides the 'Get Pro version' button on the main screen, which only opens the paid Pro app's store listing. |  |
| [Material You icon](#material-you-icon) | Replaces the legacy launcher icon with a Material You adaptive icon: white folder and WiFi glyph on the app's blue, with a monochrome layer for themed icons. |  |
| [Remove Rate this app menu item](#remove-rate-this-app-menu-item) | Removes the 'Rate this app' item, which opens the app's store listing, from the main screen menu. |  |
| [Remove banner ads](#remove-banner-ads) | Removes the AdMob banner ad from the main screen. The ads SDK is never initialized and the banner view is never created or loaded. |  |
| [Strip ad tracking permissions and app ID](#strip-ad-tracking-permissions-and-app-id) | Removes the AdMob application ID, the MobileAds initialization provider and the ad identifier permissions (AD_ID and Ad Services) from the manifest. Requires 'Remove banner ads'. |  |

</details>

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

dieroboter Patches are licensed under the [GNU General Public License v3.0](LICENSE)
