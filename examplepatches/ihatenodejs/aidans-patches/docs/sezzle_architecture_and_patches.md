# Sezzle Android App Reverse Engineering & Patching Guide

## Overview

- **App Name:** Sezzle: Buy Now, Pay Later
- **Package Name:** `com.sezzle.sezzlemobile`
- **Analyzed Version:** `5.3.9` (VersionCode: `1889`)
- **Technology Stack:** React Native with Fabric (New Architecture) compiled to **Hermes Bytecode (version 98)**, hosted in native Android (`MainActivity` extending `ReactActivity`).
- **Over-The-Air (OTA) Updates:** Microsoft CodePush (`CodePush.getJSBundleFile()`).

### OTA Update Lock
- `MainApplication` supplies `CodePush.getJSBundleFile()` to `DefaultReactHost`; a downloaded CodePush bundle therefore takes precedence over `assets/index.android.bundle`.
- The `Disable CodePush OTA Bundles` patch replaces that return value with `null` at the host call site. The React host then loads the patched embedded bundle while retaining the CodePush native package for compatibility with base-bundle imports.

---

## App Architecture

### 1. Native Layer (`base.apk`)
- **Entry Points:**
  - `com.sezzle.sezzlemobile.MainActivity`: Subclasses `com.facebook.react.ReactActivity`. Initializes `RNBootSplash`, `RNScreensFragmentFactory`, and Firebase.
  - `com.sezzle.sezzlemobile.MainApplication`: Subclasses `android.app.Application` and implements `com.facebook.react.ReactApplication`.
- **React Native Host:**
  - Configures `DefaultReactHost` with `PackageList(mainApplication).getPackages()`.
  - JS Bundle: `assets/index.android.bundle` (fallback) or CodePush local updates cache.
- **Native Advertising & Rewards SDKs:**
  - **AppLovin MAX:** `com.applovin.reactnative.AppLovinMAXPackage`, `com.applovin.adview.AppLovinFullscreenActivity`, `com.applovin.adview.AppLovinAdView`.
  - **Google Mobile Ads (AdMob):** `io.invertase.googlemobileads.ReactNativeGoogleMobileAdsPackage`, `com.google.android.gms.ads.AdActivity`.
  - **Rokt Marketing / Ads:** `com.rokt.roktsdk.*`, `RoktLayoutView`.
  - **Adjoe (Playtime Rewards):** `io.adjoe.sdk.reactnative.RNPlaytimeSdkPackage`, `AdjoeActivity`.
  - **InBrain Surveys (Reward Surveys):** `com.inbrain.rn.InBrainSurveysPackage`, `SurveysActivity`.
  - **Braze:** `com.braze.reactbridge.BrazeReactBridgePackage`, `ContentCardsActivity` (in-app marketing / promo content cards).

### 2. JavaScript / Hermes Bytecode Layer (`assets/index.android.bundle`)
- **Hermes Bytecode Version:** 98 (`0x62`), Magic: `c6 1f bc 03 c1 03 19 1f`.
- **String Storage:** 153,256 strings across 6,687,552 bytes in the string table.
- **Navigation Framework:** React Navigation bottom tabs (`@react-navigation/bottom-tabs`) rendered inside `ProtectedStack` (`func #27734`).

---

## Target Features & Patch Implementation Analysis

### Patch 1: Remove Ads and Tracking
#### Findings:
Advertising and tracking in Sezzle are sourced across multiple native SDKs and React Native bridges:
1. **AppLovin MAX:**
   - Banners: `AppLovinMAX.AdView` / `AppLovinMAXAdView`
   - Interstitials, Rewarded, App Open: `AppLovinMAXModuleImpl`
   - Core SDK initialization: `AppLovinInitProvider`, `AppLovinSdk`
2. **Google Mobile Ads (AdMob / GAM):**
   - Banners: `ReactNativeGoogleMobileAdsBannerAdViewManager`
   - Interstitials & Rewarded: `ReactNativeGoogleMobileAdsFullScreenAdModule`
   - Initialization & Debugger: `MobileAdsInitProvider`, `MobileAds`, `ReactNativeGoogleMobileAdsModule`
3. **Rokt Embedded / Modal Offers:**
   - Native modules & views: `MPRoktModule`, `RoktLayoutViewManager`, `RoktInternalImplementation`, `Rokt`
4. **Adjoe (Playtime Rewards / Ads):**
   - Native modules & views: `Playtime`, `RNPlaytimeSdkModule`
5. **InBrain Surveys (Reward Surveys / Ads):**
   - Native modules: `InBrainSurveysModule`
6. **Tracking & Analytics SDKs:**
   - **AppsFlyer:** `AppsFlyerLib`, `RNAppsFlyerModule`, `PCAppsFlyerModule`
   - **FullStory:** `FS`, `FullStoryModule`
   - **Braze:** `Braze`, `BrazeReactBridgeImpl`, `BrazeBannerManager`
   - **mParticle:** `MParticle`, `MParticleModule`
   - **Firebase Analytics & Performance:** `FirebaseAnalytics`, `ReactNativeFirebaseAnalyticsModule`, `FirebasePerformance`
   - **Facebook SDK:** `FacebookInitProvider`, `FBAppEventsLoggerModule`
   - **AppCenter Analytics:** `Analytics`, `AppCenterReactNativeAnalyticsModule`
   - **Advertising ID (AAID):** Zeroed out via `AdvertisingIdClient.Info` (`getId` -> `00000000-0000-0000-0000-000000000000`, `isLimitAdTrackingEnabled` -> `true`)

#### Patch Strategy:
- **Native Bytecode Hook (`bytecodePatch`):**
  - Neutralizes entry point methods across all ad and tracking SDKs at the Dalvik layer by prepending immediate returns (`return-void`, `return false`, or dummy constants).
  - Keeps the React Native native module interfaces intact so JavaScript never encounters null/undefined references or property errors.
---

### Patch 2: Replace "Shop" with "Home"
#### Findings:
1. **Tab Title & Icon:**
   - In `ProtectedStack` (`func #27734`):
     - Instruction 2277 calls `t("navigation.Shop")` (string index #7057).
     - String index #58406 is `"navigation.Home"`, which translates to `"Home"`.
     - Route name: `"Shop"` (string index #66990).
     - Tab Icon: `func #57080` loads `"shopping-cart"` (string index #32477). String index #3870 is `"home"`, and #54299 is `"home-outline"`.
2. **Safe Tab Title Renaming:**
   +- Modifies `LoadConstString` in `ProtectedStack` to load string index #58406 (`"navigation.Home"`), which the `t()` localization catalog maps to `"Home"`. (Directly using `"Home"` fails localization lookup and outputs `[missing "en-US.Home" translation]`).
   +- Keeps the tab icon (`shopping-cart`) and internal route name (`Shop`) intact: the tab icon map only defines 6 pre-cached icons (excluding `home`), so querying `home` yields `undefined` and crashes React Navigation.
3. **Home Content / Ads Removal:**
   +- In `StoreRoot` (`func #44055`), `storeDirectoryContainer` mounts `children = [HeaderView, ScrollListView]`.
   +- `ScrollListView` contains all commercial feed content: "Trending This Week", "Most Popular Brands", promotional content card carousels, "Shop The Marketplace", and gift card sections.
   +- The patch alters `NewArray` for the children array to length 1 and replaces `DefineOwnInDenseArray` for `ScrollListView` with `LoadConstUndefined`, completely unmounting all store and promotional feed sections while keeping header navigation (spending power, search bar, profile initial, notification bell) functional.
---

### Patch 3: Remove Rewards
#### Findings:
1. **Rewards Tab Configuration:**
   - Internal Route Name: `EarnTab` (String index #18836).
   - Display Title: Resolved via `useEarnTabTitle` / `resolveEarnTabTitle` (String #31871: `"navigation.EarnTab"` -> displays "Rewards").
   - Sub-screens:
     - `EarnTabParamList:EarnPage`
     - `EarnTabParamList:AllWaysToEarn`
     - `EarnTabParamList:AdjoeDetails` (Adjoe playtime rewards)
     - `EarnTabParamList:SurveyViewAll` (InBrain rewards)
     - `EarnTabParamList:VideoAdsReward` (Rewarded ads)
     - `EarnTabParamList:ClaimedOffers`
     - `EarnTabParamList:Giveaway`
2. **Master Feature Toggle:**
   - In `ProtectedStack` (`func #27734`), the entire `EarnTab` is conditionally mounted using `useIsShowEarnTabEnabled` (`func #24104`).
   - `func #24104` (`useIsShowEarnTabEnabled`) evaluates remote cohorts and user configs.
   - Modifying `func #24104` to unconditionally return `false` (`LoadConstFalse r1; Ret r1` -> `0x96 0x01 0x76 0x01`) completely unmounts the Rewards tab from the bottom navigation bar and disables the Rewards screens.

---

## Multi-App Repository Architecture (`aidans-patches`)

Following the `morphe-patches-template` and production `morphe-patches` layout:

```
aidans-patches/
├── build.gradle.kts
├── settings.gradle.kts
├── gradle.properties
├── patches/
│   ├── build.gradle.kts
│   └── src/main/kotlin/
│       └── app/morphe/patches/
│           ├── shared/
│           │   └── Constants.kt
│           ├── sezzle/
│           │   ├── ads/
│           │   │   └── HideBannerAdsPatch.kt
│           │   ├── navigation/
│           │   │   ├── RenameShopToHomePatch.kt
│           │   │   └── RemoveRewardsPatch.kt
│           │   └── shared/
│           │       └── Constants.kt
│           └── <other_apps>/
│               └── ...
```
