# Sezzle Architecture & Reverse Engineering Specification

## 1. Overview

| Attribute | Specification |
|---|---|
| **Application Name** | Sezzle: Buy Now, Pay Later |
| **Package Name** | `com.sezzle.sezzlemobile` |
| **Supported Version** | `5.3.9` (Morphe Compatibility: `5.3.9`, `minSdk` 24) |
| **Analyzed Version Code** | `1889` (Derived from APK analysis; Constants specifies version string) |
| **Minimum SDK** | `24` (Android 7.0) |
| **Distribution Format** | APKM (`ApkFileType.APKM`) |
| **Technology Stack** | React Native Fabric (New Architecture) compiled to **Hermes Bytecode v98** (`assets/index.android.bundle`), native Android host (`MainActivity` extending `ReactActivity`), Microsoft CodePush, and Morphe Java extension (`ConsentGate.java`). |
| **Hermes Bytecode Version** | Version `98` (`0x62`), Magic: `c6 1f bc 03 c1 03 19 1f` |

Sezzle is a hybrid financial services application that facilitates "Buy Now, Pay Later" installment payments. The user interface, navigation flows, state management, and business logic are implemented in React Native and compiled ahead-of-time into Hermes Bytecode (HBC v98). The embedded bundle runs within a native Android shell (`base.apk`) that bridges native Android hardware APIs, push notifications, native advertising/survey SDKs, and OTA updates.

---

## 2. Architecture & Runtime Stack

```
                                 Target Sezzle APKM
                                         |
       +-------------------+-------------+-------------+--------------------+
       |                   |                           |                    |
       v                   v                           v                    v
[ Dalvik / Smali ]  [ Hermes HBC v98 ]          [ Native Extension ]   [ XML Resource ]
  bytecodePatch       rawResourcePatch            extendWith             resourcePatch
  Dexlib2 AST         Bytecode & string editing   Java DEX injection     Android DOM XML
  (Ads, RootBeer)     (Shop, Promos, Auth, Icons) (ConsentGate.java)     (Manifest)
       |                   |                           |                    |
       +-------------------+-------------+-------------+--------------------+
                                         |
                                         v
                                Patched Output APK
```

### 2.1 Native Dalvik Layer (`base.apk`)
- **Entry Points:**
  - `com.sezzle.sezzlemobile.MainActivity`: Subclasses `com.facebook.react.ReactActivity`. Initializes `RNBootSplash`, `RNScreensFragmentFactory`, and Firebase.
  - `com.sezzle.sezzlemobile.MainApplication`: Subclasses `android.app.Application` and implements `com.facebook.react.ReactApplication`.
- **React Native Host:** Configures `DefaultReactHost` with packages resolved via `PackageList(mainApplication).getPackages()`.
- **Over-The-Air (OTA) Updates:** Microsoft CodePush (`com.microsoft.codepush.react.CodePush`). In stock code, `MainApplication` supplies `CodePush.getJSBundleFile()` to `DefaultReactHost`. Downloaded CodePush updates take precedence over `assets/index.android.bundle`.
- **Integrity & Security SDKs:**
  - `RootBeer` (`com.scottyab.rootbeer.RootBeer`): Checks for su binaries, root management apps, test-keys, and dangerous system properties.
  - `JailMonkey` (`com.gantix.JailMonkey.JailMonkeyModule`): Publishes root, hook detection (Frida, Substrate, Xposed), and mock-location values through `getConstants()`; `Rooted.RootedCheck.isJailBroken()` supplies its root result.

### 2.2 JavaScript / Hermes Bytecode Layer (`assets/index.android.bundle`)
- **Bytecode Standard:** Hermes v98 (`0x62`), Magic: `c6 1f bc 03 c1 03 19 1f`.
- **String Storage:** 153,256 strings occupying 6,687,552 bytes in the global string table.
- **Navigation Framework:** React Navigation bottom tabs (`@react-navigation/bottom-tabs`) rendered inside `ProtectedStack` (`func #27734`).
- **Binary Mutation Invariants:**
  - Direct opcode substitution: replacing function prologues with `LoadConstFalse r1` (`0x96 0x01`) or `LoadConstUndefined` (`0x93`) followed by `Ret r1` (`0x76 0x01`).
  - Container mutation: resizing children arrays and unmounting commercial modules.
  - Donor string replacement: re-pointing string table entries to unused donor strings of equal or greater length (e.g. storybook paths) to avoid invalidating section offsets.
  - Mandatory trailing SHA-1 digest recalculation via `editor.updateFooterHash()`.

### 2.3 Native Java Extension Layer
- **`ConsentGate` (`app.aidan.extension.sezzle.ConsentGate`):** Packaged via `extensions/extension.mpe` and merged into the target APK's DEX. Injected into `MainActivity.onCreate` to present an un-cancelable `AlertDialog` tracking user acknowledgment in `SharedPreferences` (`patch_consent`, key `acknowledged`).

---

## 3. Telemetry, Advertising & Tracking Systems

Sezzle incorporates advertising networks, survey offerwalls, and behavioral analytics across Dalvik bytecode and Hermes React Native bridges:

| Subsystem | Components / Packages | Target Role |
|---|---|---|
| **AppLovin MAX** | `com.applovin.reactnative.AppLovinMAXPackage`, `AppLovinMAXAdView`, `AppLovinSdk` | Fullscreen interstitials, banners, and app-open ads. |
| **Google Mobile Ads (AdMob)** | `io.invertase.googlemobileads.ReactNativeGoogleMobileAdsPackage`, `MobileAds` | Banner ads and fullscreen interstitial units. |
| **Rokt Marketing** | `com.rokt.roktsdk.*`, `RoktLayoutView`, `MPRoktModule`, `MPRoktModuleImpl` | E-commerce transaction confirmation offers and popups. |
| **Thanks Platform** | `https://thanks.is`, `useShowThanks`, `ThanksWidget`, `ThanksBlock` | Post-payment rewards and sweepstakes offer modals ("Your payment earned you 5 rewards" / "Your payment comes with 5 rewards"). |
| **Adjoe (Playtime)** | `io.adjoe.sdk.reactnative.RNPlaytimeSdkPackage`, `Playtime` | Playtime rewards offerwalls and time-based tracking. |
| **InBrain Surveys** | `com.inbrain.rn.InBrainSurveysPackage`, `InBrainSurveysModule` | Paid market research and survey offerwalls. |
| **AppsFlyer** | `com.appsflyer.reactnative.RNAppsFlyerModule`, `AppsFlyerLib` | Attribution, install referral, and campaign analytics. |
| **FullStory** | `com.fullstory.reactnative.FullStoryModule`, `FS` | Session replay, DOM recording, and interaction telemetry. |
| **Braze** | `com.braze.reactbridge.BrazeReactBridgePackage`, `BrazeBannerManager` | In-app messaging, content cards, and push campaign analytics. |
| **mParticle** | `com.mparticle.reactnative.MParticleModule`, `MParticle` | Customer data platform routing events to downstream brokers. |
| **Firebase Analytics & Perf** | `ReactNativeFirebaseAnalyticsModule`, `FirebasePerformance` | Google app measurement and performance tracking. |
| **Facebook Core SDK** | `FacebookInitProvider`, `FBAppEventsLoggerModule` | Meta App Events, conversion tracking, and Graph API calls. |
| **AppCenter Analytics** | `AppCenterReactNativeAnalyticsModule` | Microsoft mobile diagnostic and crash telemetry. |
| **Advertising ID (AAID)** | `com.google.android.gms.ads.identifier.AdvertisingIdClient$Info` | Hardware advertising identifier tracking. |

---

## 4. Patch Targets Summary

See [Sezzle Patch Specifications](patches.md) for full technical implementation details.

1. **`Remove Ads and Tracking` (`bytecodePatch`) with companion `Remove Ads and Tracking from JS Bundle` (`rawResourcePatch`):** Neutralizes advertising and tracking SDKs at the Dalvik layer and strips Thanks network and Rokt post-payment offers in Hermes bytecode via `dependsOn`.
2. **`Clean Authentication` (`rawResourcePatch`):** Restricts login to Google SSO and unmounts unavailable phone SMS controls.
3. **`Unlock Custom App Icons` (`rawResourcePatch`):** Unlocks launcher icon variants without a Premium subscription.
4. **`Enable App Debugging` (`resourcePatch`):** Adds `android:debuggable="true"` to `AndroidManifest.xml`.
5. **`Unlock Developer Settings` (`rawResourcePatch`):** Unlocks internal Development Settings in Account.
6. **`Unlock Receipt Scanner` (`rawResourcePatch`):** Enables receipt scanning from Development Settings and forces the V2 flow.
7. **`Configure Shortcuts` (`rawResourcePatch`):** Filters items in the "Your Shortcuts" carousel.
8. **`Hide Sezzle Mobile` (`rawResourcePatch`):** Stubs out cellular plan offers in Wallet.
9. **`Remove Promos & Giveaways` (`rawResourcePatch`):** Suppresses deal popups, giveaway flows, Knot card-linking dialogs, and marketing banners.
10. **`Remove Rewards` (`rawResourcePatch`):** Removes the Rewards bottom tab while retaining Account access to Sezzle Points.
11. **`Replace AI Discover with Products` (`rawResourcePatch`):** Restores the original non-AI Products tab.
12. **`Replace Shop with Home` (`rawResourcePatch`):** Replaces commercial store feeds with a clean personal finance dashboard.
13. **`Patch Consent Screen` (`bytecodePatch`):** Injects native `ConsentGate` modal dialog into `MainActivity.onCreate`.
14. **`Suppress In-App Updates and Rating Prompts` (`rawResourcePatch`):** Neutralizes Hermes update sagas, update modals, store URLs, trustFall checks, and rating prompts.
15. **`Suppress Updates and Integrity Checks` (`bytecodePatch`):** Disables CodePush OTA downloads and stubs RootBeer / JailMonkey.
