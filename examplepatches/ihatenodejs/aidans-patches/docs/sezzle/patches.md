# Sezzle Patch Specifications

## Overview

This document details the binary bytecode, asset, and resource patches available for **Sezzle: Buy Now, Pay Later** (`com.sezzle.sezzlemobile`).

| Patch Name | Source File | Type | Default | Dependencies / Extensions | Options | Description |
|---|---|---|---|---|---|---|
| [Remove Ads and Tracking](#patch-remove-ads-and-tracking) | `ads/HideBannerAdsPatch.kt` | `bytecodePatch` | `true` | `Remove Ads and Tracking from JS Bundle` | None | Neutralizes AppLovin, AdMob, Rokt, Playtime, InBrain, and tracking SDKs at the Dalvik layer. |
| [Remove Ads and Tracking from JS Bundle](#patch-remove-ads-and-tracking-from-js-bundle) | `ads/HideBannerAdsPatch.kt` | `rawResourcePatch` | `true` | None | None | Neutralizes post-payment reward and offer modals (Thanks network and Rokt placements) in Hermes bytecode. |
| [Clean Authentication](#patch-clean-authentication) | `auth/CleanAuthenticationPatch.kt` | `rawResourcePatch` | `true` | None | `injectPatchWarning` (default: `true`) | Enforces Google sign-in only, removes phone sign-in controls and explanatory text. |
| [Unlock Custom App Icons](#patch-unlock-custom-app-icons) | `customization/UnlockCustomAppIconsPatch.kt` | `rawResourcePatch` | `true` | None | None | Unlocks Arctic, Peach, Glass, Rainbow, Sand, and Classic launcher icons without Sezzle Premium. |
| [Enable App Debugging](#patch-enable-app-debugging) | `dev/EnableAppDebuggingPatch.kt` | `resourcePatch` | `false` | None | None | Injects `android:debuggable="true"` into `AndroidManifest.xml` for ADB debugging. |
| [Unlock Developer Settings](#patch-unlock-developer-settings) | `dev/UnlockDevSettingsPatch.kt` | `rawResourcePatch` | `false` | None | None | Unlocks internal Development Settings menu in Account for all authenticated users. |
| [Unlock Receipt Scanner](#patch-unlock-receipt-scanner) | `features/UnlockReceiptScannerPatch.kt` | `rawResourcePatch` | `false` | `Unlock Developer Settings` | None | Enables receipt scanner from Developer Settings and forces V2 scanner flow to render. |
| [Configure Shortcuts](#patch-configure-shortcuts) | `navigation/ConfigureShortcutsPatch.kt` | `rawResourcePatch` | `true` | None | 5 boolean options (default: `true`) | Customizes items in "Your Shortcuts" carousel (Refer a Friend, Giveaway, Offers, Rewards, Sezzle Mobile). |
| [Hide Sezzle Mobile](#patch-hide-sezzle-mobile) | `navigation/HideSezzleMobilePatch.kt` | `rawResourcePatch` | `false` | None | None | Stubs `useIsSezzleMobilePlanEnabled` and hides `MobilePlanSection` in Wallet. |
| [Remove Promos & Giveaways](#patch-remove-promos--giveaways) | `navigation/RemovePromosAndGiveawaysPatch.kt` | `rawResourcePatch` | `true` | None | 7 boolean options | Blocks deal popups, giveaway screens, Knot linking, wallet marketing, playtime, and referrals. |
| [Remove Rewards](#patch-remove-rewards) | `navigation/RemoveRewardsPatch.kt` | `rawResourcePatch` | `true` | None | None | Removes Rewards bottom navigation tab while keeping Account Sezzle Points accessible. |
| [Replace AI Discover with Products](#patch-replace-ai-discover-with-products) | `navigation/ReplaceAiDiscoverWithProductsPatch.kt` | `rawResourcePatch` | `true` | None | `removeProductsTab` (default: `false`) | Replaces AI Discover tab with original non-AI Products tab and removes AI search callouts. |
| [Replace Shop with Home](#patch-replace-shop-with-home) | `navigation/ReplaceShopWithHomePatch.kt` | `rawResourcePatch` | `true` | None | None | Replaces commercial Shop tab with custom personal finance dashboard Home tab. |
| [Patch Consent Screen](#patch-patch-consent-screen) | `security/PatchConsentScreenPatch.kt` | `bytecodePatch` | `true` | `Clean Authentication`, `ConsentGate.java` | None | Injects native `ConsentGate` modal dialog into `MainActivity.onCreate` before auth. |
| [Suppress In-App Updates and Rating Prompts](#patch-suppress-in-app-updates-and-rating-prompts) | `security/SuppressUpdatesAndIntegrityPatch.kt` | `rawResourcePatch` | `true` | None | 3 boolean options (default: `true`) | Neutralizes Hermes update selectors/sagas, update modal, store URLs, trustFall, and rating prompts. |
| [Suppress Updates and Integrity Checks](#patch-suppress-updates-and-integrity-checks) | `security/SuppressUpdatesAndIntegrityPatch.kt` | `bytecodePatch` | `true` | `Suppress In-App Updates and Rating Prompts` | None | Disables CodePush OTA updates (returns `null` in host) and stubs RootBeer / JailMonkey. |

---

## Detailed Patch Specifications

### Patch: Remove Ads and Tracking

- **Name:** Remove Ads and Tracking
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Remove Ads and Tracking from JS Bundle`

#### 1. Motivation & Purpose
Neutralizes all advertising and tracking SDKs compiled into the native Android shell before they initialize or render ad banners, preserving the React Native native module interfaces so JavaScript code never encounters missing properties or null references.
#### 2. Technical Implementation & Injection Points

##### Dalvik Bytecode Layer
Stubs out entrypoint methods across all advertising and tracking SDKs:
- **AppLovin MAX:** Stubs `AppLovinMAX.AdView`, `AppLovinMAXAdView`, `AppLovinMAXModuleImpl`, `AppLovinInitProvider`, and `AppLovinSdk`.
- **Google Mobile Ads (AdMob):** Stubs `ReactNativeGoogleMobileAdsBannerAdViewManager`, `ReactNativeGoogleMobileAdsFullScreenAdModule`, `MobileAdsInitProvider`, and `MobileAds`.
- **Rokt Marketing:** Stubs `MPRoktModule`, `MPRoktModuleImpl`, `RoktLayoutViewManager`, `RoktLayoutViewManagerImpl`, `RoktInternalImplementation`, `Rokt`, `RoktModalActivity`, `BottomSheetActivity`, and `RoktLayoutView`.
- **Adjoe (Playtime):** Stubs `Playtime` and `RNPlaytimeSdkModule`.
- **InBrain Surveys:** Stubs `InBrainSurveysModule`.
- **Tracking SDKs:** AppsFlyer (`AppsFlyerLib`), FullStory (`FS`), Braze (`Braze`, `BrazeBannerManager`), mParticle (`MParticle`), Firebase Analytics & Perf (`FirebaseAnalytics`, `FirebasePerformance`), Facebook SDK (`FacebookInitProvider`, `FBAppEventsLoggerModule`), and AppCenter Analytics.
- **AAID:** Zeros Google Play Advertising ID via `AdvertisingIdClient.Info` (`getId` -> `"00000000-0000-0000-0000-000000000000"`, `isLimitAdTrackingEnabled` -> `true`).

---

### Patch: Remove Ads and Tracking from JS Bundle

- **Name:** Remove Ads and Tracking from JS Bundle
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Following purchase or installment payments, Sezzle renders third-party promotional reward offers (such as "Your payment earned you 5 rewards!" or "Your payment comes with 5 rewards") powered by the Thanks ad network (`https://thanks.is`) and Rokt fallback placements. This companion asset patch neutralizes the Thanks/Rokt post-payment modal, decision selectors, and inline widgets directly in Hermes bytecode.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle` in-place:
1. **`canShowAd` Selector:** Forces `canShowAd` selector to return `false` (`LoadConstFalse r1; Ret r1`).
2. **`shouldShowRokt` Selector:** Forces `shouldShowRokt` selector to return `false` (`LoadConstFalse r1; Ret r1`).
3. **`shouldShowThanks` Selector:** Forces `shouldShowThanks` selector to return `false` (`LoadConstFalse r1; Ret r1`).
4. **`isAdEnabledForTrigger` Selector:** Forces `isAdEnabledForTrigger` selector to return `false` (`LoadConstFalse r1; Ret r1`).
5. **`isRegisteredTrigger` Selector:** Forces `isRegisteredTrigger` selector to return `false` (`LoadConstFalse r1; Ret r1`).
6. **`isPlacementInCatalog` Selector:** Forces `isPlacementInCatalog` selector to return `false` (`LoadConstFalse r1; Ret r1`).
7. **`enableThanks` Getter:** Forces `enableThanks` getter to return `false` (`LoadConstFalse r0; Ret r0`).
8. **`getThanksBaseUrl` Function:** Stubs `getThanksBaseUrl` to return `null` (`LoadConstNull r0; Ret r0`), blocking WebView requests to `https://thanks.is/`.
9. **`ThanksModal.render()` Method:** Neutralizes `ThanksModal` component's `render()` method to return `null` (`LoadConstNull r0; Ret r0`), preventing the `<ReactNativeModal>` from ever mounting.
10. **Mandatory Rehash:** Recalculates trailing Hermes bundle SHA-1 digest.

---

### Patch: Clean Authentication

- **Name:** Clean Authentication
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:** `injectPatchWarning` (Boolean, default: `true`).

#### 1. Motivation & Purpose
In patched/re-signed builds, phone SMS verification fails due to Play Integrity and reCAPTCHA attestation mismatches. Enforcing Google Single Sign-On (SSO) provides reliable, secure authentication while removing the broken phone number input fields.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. **Unmount Phone Subtree:** Locates the `InnerForm` function whose bytecode at offset `+3587` equals `6f 33 0c 03 0b 0a` and replaces with `94 33 ae 04 00 00` (`LoadConstNull r3; PutByIdShort r1, r3, ...`), causing the phone input subtree to evaluate to null before being added to the social component.
2. **Donor String Recycling:** Re-points string table entries to donor string `../src/features/login/components/loginView/components/loginForm/components/innerForm/components/authPhoneTextInput/authPhoneTextInput.stories` to replace `"Enter your mobile number to log in or sign up."` with a Google-only sign-in prompt (and optional patch disclaimer).
3. **Mandatory Rehash:** Recomputes trailing Hermes footer SHA-1 hash.

---

### Patch: Unlock Custom App Icons

- **Name:** Unlock Custom App Icons
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Unlocks premium launcher app icons (Arctic, Peach, Glass, Rainbow, Sand, and Classic) without requiring an active Sezzle Premium subscription.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. `userShouldSeeChangeAppIcon`: Replaces 4-byte prologue `34 01 00 89` with `LoadConstZero r1; Ret r1` (`97 01 76 01`).
2. `getAppIconNavigationStatus`: Replaces prologue `34 01 00 89 07 01` with `90 01 7c 11 76 01` (continue-return).
3. `AppearanceView` (offset `+0x95`): Replaces `45 06 02 09 37 50` with `96 06 93 00 93 00` to remove the lock icon overlay.
4. Recomputes Hermes footer hash.

---

### Patch: Enable App Debugging

- **Name:** Enable App Debugging
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `false` (Disabled by default)
- **Type:** Android XML Resource Patch (`resourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Allows developers to inspect app storage, databases, and logs via ADB `run-as com.sezzle.sezzlemobile` on production builds.

#### 2. Technical Implementation
Parses `AndroidManifest.xml` and adds `android:debuggable="true"` to the `<application>` element.

---

### Patch: Unlock Developer Settings

- **Name:** Unlock Developer Settings
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `false` (Disabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Exposes Sezzle's internal "Development Settings" screen in Account > Settings for all authenticated accounts, bypassing internal employee cohort checks.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. In `AccountView` (offset `+0x62d`), replaces `6e 25 07 02 2a` with `95 25 7e 7e 7e`.
2. In `DevSettingsView` (offset `+0xef`), replaces `6e 02 02 00 03` with `95 02 7e 7e 7e`, bypassing event-alert cohort checks.
3. Recomputes Hermes footer hash.

---

### Patch: Unlock Receipt Scanner

- **Name:** Unlock Receipt Scanner
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `false` (Disabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** `Unlock Developer Settings`

#### 1. Motivation & Purpose
Enables the receipt scanning feature from Development Settings and forces the modern V2 scanner interface to render.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. Locates all `useIsUpsideReceiptScanningEnabled` functions and replaces their 4-byte prefix `34 03 00 3b` with `LoadConstTrue r1; Ret r1` (`95 01 76 01`).
2. Scans for the unique 25-byte Receipt Scanner V2 visibility selector and replaces its 4-byte prefix `89 01 01 45` with `LoadConstTrue r1; Ret r1`.
3. Recomputes Hermes footer hash.

---

### Patch: Configure Shortcuts

- **Name:** Configure Shortcuts
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:**
  - `hideReferAFriend` (Boolean, default: `true`)
  - `hideGiveaway` (Boolean, default: `true`)
  - `hideOffers` (Boolean, default: `true`)
  - `hideRewards` (Boolean, default: `true`)
  - `hideSezzleMobile` (Boolean, default: `true`)

#### 1. Motivation & Purpose
Customizes which items appear in the "Your Shortcuts" carousel on Home and Shop tabs.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. Validates Hermes function `#97583` (offset `0x019ba337`, capacity 57) and donor function `#75517` (offset `0x017d2ed7`, capacity 152).
2. Synthesizes a predicate in the donor region filtering targeted shortcut string identifiers (`user_referrals`, `sezzle_mobile`, `offers`, `offer`, `giveaway`, `earn`).
3. Re-points `#97583`'s function header to the synthesized donor logic.
4. Recomputes Hermes footer hash.

---

### Patch: Hide Sezzle Mobile

- **Name:** Hide Sezzle Mobile
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `false` (Disabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Hides promotional cellular service offers and phone plan account entry points across the app.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. `useIsSezzleMobilePlanEnabled`: Replaces prologue with `LoadConstFalse r1; Ret r1` (`96 01 76 01`).
2. `MobilePlanSection`: Replaces prologue with `LoadConstUndefined r1; Ret r1` (`93 01 76 01`), unmounting the phone plan card in Wallet.
3. Recomputes Hermes footer hash. Note: To hide the Sezzle Mobile carousel shortcut, configure the `hideSezzleMobile` option in `Configure Shortcuts`.

---

### Patch: Remove Promos & Giveaways

- **Name:** Remove Promos & Giveaways
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:**
  - `blockMerchantDealPopovers` (Boolean, default: `true`)
  - `blockKnotAccountLinking` (Boolean, default: `true`)
  - `blockWalletMarketing` (Boolean, default: `true`)
  - `blockPlaytimeMarketing` (Boolean, default: `true`)
  - `blockReferralsAndSocial` (Boolean, default: `true`)
  - `blockTrivia` (Boolean, default: `false`)
  - `blockNotificationPrompts` (Boolean, default: `false`)

#### 1. Motivation & Purpose
Suppresses promotional popovers, giveaway entry flows, Knot card-linking dialogs, and marketing banners across the app.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
- **Base Giveaways (Always applied):** Neutralizes `useRoktGiveawaysEnabled`, `useGiveawayShopRoutingEnabled`, `useMarketingGiveaway`, and `useGiveawayScreenStatus`.
- **Deal Popovers:** Stubs `useSelectPopupOffers`, `useStoreOfferModalConfig`, `useWebviewDealsPopoverConfig`, `useIsNewOfferModalEnabled`, `useSingleMerchantDeal`, and `useIsOffersV2Enabled`.
- **Knot Account Linking:** Stubs `useKnotActivationModalEnabled`, `useKnotActivationModalGate`, and `useKnotBannerVisibility`.
- **Wallet Marketing:** Stubs `useWalletMarketingMerchants`, `useWalletEmptyStateMarketing`, and `useOfferBoostBanner`.
- **Playtime Campaigns:** Stubs `usePlaytimeCampaigns`.
- **Referrals:** Sets `useIsReferralUnavailable` to return `true`.
- **Trivia:** Stubs `useTriviaGiveawayBanner` and `useTriviaLiveActivityPushToStart`.
- **Notification Prompts:** Stubs `NotificationPermissionModalV2`, `EnableNotificationsModal`, and `useSyncPushPermissionWithBraze`.
- Recomputes Hermes footer hash.

---

### Patch: Remove Rewards

- **Name:** Remove Rewards
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Removes the commercial Rewards bottom tab while preserving access to Sezzle Points in Account > Benefits.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. Unmounts `EarnTab` in `ProtectedStack` by stubbing `useIsShowEarnTabEnabled` to return `false`.
2. Rewires the Home `customer/points` shortcut to dispatch through the P2P deep-link dispatcher directly to `Account > SezzleSpend > SezzlePoints`.
3. Recomputes Hermes footer hash.

---

### Patch: Replace AI Discover with Products

- **Name:** Replace AI Discover with Products
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:** `removeProductsTab` (Boolean, default: `false`).

#### 1. Motivation & Purpose
Replaces the AI Discover search and shopping interface with Sezzle's original non-AI Products tab, and eliminates promotional AI callouts in search bars. Optionally removes the Products tab entirely.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. In `ProtectedStack`, scans for the `useDiscoverTab().isEnabled` call chain and replaces `45 28 0b 31 d9 74` with false constants.
2. Stubs `useDiscoverTabEnabled` to `false`, `SezzleAIBanner` to `null`, and `SezzleAIPill` to `null`.
3. If `removeProductsTab` is `true`, stubs `resolveShouldRenderProductsTab` to `false`.
4. Recomputes Hermes footer hash.

---

### Patch: Replace Shop with Home

- **Name:** Replace Shop with Home
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose
Replaces the commercial "Shop" tab and store feeds with a clean personal finance dashboard.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. Changes bottom navigation tab label from `"Shop"` to `"Home"` using localization string `#58406` (`"navigation.Home"`).
2. In `StoreRoot` (`func #44055`), replaces commercial feed modules with a 4-component dashboard: `HeaderView`, `OrdersListHeader` ("Total you owe"), `PaymentStreakBanner` (spending power and streak), and `ShopTabShortcutsRow` ("Your Shortcuts").
3. In `TotalOwedSectionV2`, removes "Shop now" buttons and redundant badges when viewed from Home.
4. Recomputes Hermes footer hash.

---

### Patch: Patch Consent Screen

- **Name:** Patch Consent Screen
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** `Clean Authentication`
- **Extension Classes:** `app.aidan.extension.sezzle.ConsentGate`

#### 1. Motivation & Purpose
Informs users that the app is patched and prevents interaction until acknowledged.

#### 2. Technical Implementation & Injection Points
1. Packages `extensions/extension.mpe` containing `ConsentGate.java`.
2. Hooks `Lcom/sezzle/sezzlemobile/MainActivity;->onCreate(Landroid/os/Bundle;)V` before `RETURN_VOID` to inject `invoke-static {p0}, Lapp/aidan/extension/sezzle/ConsentGate;->maybeShow(Landroid/app/Activity;)V`.
3. `ConsentGate` renders an un-cancelable `AlertDialog` tracking acceptance in `SharedPreferences` (`patch_consent`, key `acknowledged`). Declining removes the task and closes the app.

---

### Patch: Suppress In-App Updates and Rating Prompts

- **Name:** Suppress In-App Updates and Rating Prompts
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:**
  - `suppressForceUpdates` (Boolean, default: `true`)
  - `bypassTrustFall` (Boolean, default: `true`)
  - `suppressRatingPrompts` (Boolean, default: `true`)

#### 1. Motivation & Purpose
Prevents Hermes Redux update sagas from locking out the app, stubs Play Store URL generation, bypasses trustFall tamper checks, and silences in-app rating prompts.

#### 2. Technical Implementation & Injection Points
Modifies `assets/index.android.bundle`:
1. Stubs `selectShouldForceUpdate` and all `shouldForceUpdateAppSaga` watcher functions.
2. Unmounts `UpdateAppModal`.
3. Neutralizes `getStoreUrl` and `getFullStoreUrl`.
4. Forces Hermes `trustFall`, `isJailBroken`, `hookDetected`, and `canMockLocation` to return `false`.
5. Stubs in-app review rating trigger functions.
6. Recomputes Hermes footer hash.

---

### Patch: Suppress Updates and Integrity Checks

- **Name:** Suppress Updates and Integrity Checks
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.9`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Suppress In-App Updates and Rating Prompts`

#### 1. Motivation & Purpose
Prevents Microsoft CodePush from downloading remote OTA bundles that would overwrite patched Hermes bytecode, and stubs out Dalvik root detection libraries.

#### 2. Technical Implementation & Injection Points
1. In `MainApplication`, intercepts `CodePush.getJSBundleFile()` and forces it to return `null`, ensuring the React Native host always boots from the patched embedded asset bundle (`assets/index.android.bundle`).
2. Stubs all root and environment check methods in `RootBeer` (`isRooted`, `isRootedWithoutBusyBoxCheck`, etc.) to return `false`.
3. Stubs `RootedCheck.isJailBroken()`—the value that `JailMonkeyModule.getConstants()` publishes as `isJailBroken`—to return `false`.

---

