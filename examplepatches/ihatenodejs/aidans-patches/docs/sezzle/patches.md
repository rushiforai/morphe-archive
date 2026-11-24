# Sezzle Patch Specifications

## Overview

This document details the binary bytecode, asset, and resource patches available for **Sezzle: Buy Now, Pay Later** (`com.sezzle.sezzlemobile`).

| Patch Name                                                                                      | Source File                                        | Type                    | Default | Dependencies / Extensions                  | Options                                | Description                                                                                                                                                                   |
| ----------------------------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------- | ------- | ------------------------------------------ | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Remove Ads and Tracking](#patch-remove-ads-and-tracking)                                       | `ads/HideBannerAdsPatch.kt`                        | `compositeFeaturePatch` | `true`  | None                                       | None                                   | Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Thanks network, Playtime, InBrain Surveys) and disables analytics and tracking SDKs at both Dalvik and Hermes layers. |
| [Clean Authentication](#patch-clean-authentication)                                             | `auth/CleanAuthenticationPatch.kt`                 | `rawResourcePatch`      | `true`  | None                                       | `injectPatchWarning` (default: `true`) | Removes the unavailable phone sign-in controls and their explanatory text while keeping Google and Apple sign-in.                                                             |
| [Unlock Custom App Icons](#patch-unlock-custom-app-icons)                                       | `customization/UnlockCustomAppIconsPatch.kt`       | `rawResourcePatch`      | `true`  | None                                       | None                                   | Unlocks Arctic, Peach, Glass, Rainbow, Sand, and Classic launcher icons without Sezzle Premium.                                                                               |
| [Enable App Debugging](#patch-enable-app-debugging)                                             | `dev/EnableAppDebuggingPatch.kt`                   | `resourcePatch`         | `false` | None                                       | None                                   | Injects `android:debuggable="true"` into `AndroidManifest.xml` for ADB debugging.                                                                                             |
| [Unlock Developer Settings](#patch-unlock-developer-settings)                                   | `dev/UnlockDevSettingsPatch.kt`                    | `rawResourcePatch`      | `false` | None                                       | None                                   | Unlocks internal Development Settings menu in Account for all authenticated users.                                                                                            |
| [Unlock Receipt Scanner](#patch-unlock-receipt-scanner)                                         | `features/UnlockReceiptScannerPatch.kt`            | `rawResourcePatch`      | `false` | `Unlock Developer Settings`                | None                                   | Enables receipt scanner from Developer Settings and forces V2 scanner flow to render.                                                                                         |
| [Configure Shortcuts](#patch-configure-shortcuts)                                               | `navigation/ConfigureShortcutsPatch.kt`            | `rawResourcePatch`      | `true`  | None                                       | 7 boolean options (default: `true`)    | Customizes items in "Your Shortcuts" carousel (Refer a Friend, Giveaway, Offers, Rewards, Sezzle Mobile, Amazon Deals, Pay Later Anywhere).                                   |
| [Hide Sezzle Mobile](#patch-hide-sezzle-mobile)                                                 | `navigation/HideSezzleMobilePatch.kt`              | `rawResourcePatch`      | `false` | None                                       | None                                   | Stubs `useIsSezzleMobilePlanEnabled` and hides `MobilePlanSection` in Wallet.                                                                                                 |
| [Remove Promos & Giveaways](#patch-remove-promos--giveaways)                                    | `navigation/RemovePromosAndGiveawaysPatch.kt`      | `rawResourcePatch`      | `true`  | None                                       | 7 boolean options                      | Blocks deal popups, giveaway screens, Knot linking, wallet marketing, playtime, and referrals.                                                                                |
| [Remove Rewards](#patch-remove-rewards)                                                         | `navigation/RemoveRewardsPatch.kt`                 | `rawResourcePatch`      | `true`  | None                                       | None                                   | Removes Rewards bottom navigation tab while keeping Account Sezzle Points accessible.                                                                                         |
| [Remove Sezzle Subscriptions](#patch-remove-sezzle-subscriptions)                               | `navigation/RemoveSezzleSubscriptionsPatch.kt`     | `rawResourcePatch`      | `false` | None                                       | None                                   | Removes references to Sezzle Anywhere and Sezzle Premium subscriptions in Account benefits, Wallet, and Orders help.                                                          |
| [Replace AI Discover with Products](#patch-replace-ai-discover-with-products)                   | `navigation/ReplaceAiDiscoverWithProductsPatch.kt` | `rawResourcePatch`      | `true`  | None                                       | `removeProductsTab` (default: `false`) | Replaces AI Discover tab with original non-AI Products tab and removes AI search callouts.                                                                                    |
| [Rename Shop to Home](#patch-rename-shop-to-home)                                               | `navigation/ReplaceShopWithHomePatch.kt`           | `rawResourcePatch`      | `true`  | None                                       | None                                   | Renames the Shop bottom navigation tab to Home.                                                                                                                               |
| [Clean Home](#patch-clean-home)                                                                 | `navigation/CleanHomePatch.kt`                     | `rawResourcePatch`      | `true`  | None                                       | 4 boolean options                      | Removes shortcuts, store/brand carousels, and promotional banners from the Home tab.                                                                                          |
| [Patch Consent Screen](#patch-patch-consent-screen)                                             | `security/PatchConsentScreenPatch.kt`              | `bytecodePatch`         | `true`  | `Clean Authentication`, `ConsentGate.java` | None                                   | Injects native `ConsentGate` modal dialog into `MainActivity.onCreate` before auth.                                                                                           |
| [Suppress In-App Updates and Rating Prompts](#patch-suppress-in-app-updates-and-rating-prompts) | `security/SuppressUpdatesAndIntegrityPatch.kt`     | `rawResourcePatch`      | `true`  | None                                       | 3 boolean options (default: `true`)    | Neutralizes Hermes update selectors/sagas, update modal, store URLs, trustFall, and rating prompts.                                                                           |

---

## Detailed Patch Specifications

### Patch: Remove Ads and Tracking

- **Name:** Remove Ads and Tracking
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
- **Default State:** `true` (Enabled by default)
- **Type:** Composite Feature Patch (`compositeFeaturePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose

Neutralizes all advertising and tracking SDKs compiled into the native Android shell before they initialize or render ad banners, and strips third-party promotional reward offers (Thanks network and Rokt placements) in Hermes bytecode following purchase or installment payments.

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

##### Hermes Raw Resource Layer (`assets/index.android.bundle`)

Applies the following Hermes bytecode substitutions followed by recalculating the trailing bundle SHA-1 footer hash:

1. **`canShowAd` Selector:** Forces `canShowAd` selector to return `false` (`LoadConstFalse r1; Ret r1`).
2. **`shouldShowRokt` Selector:** Forces `shouldShowRokt` selector to return `false` (`LoadConstFalse r1; Ret r1`).
3. **`shouldShowThanks` Selector:** Forces `shouldShowThanks` selector to return `false` (`LoadConstFalse r1; Ret r1`).
4. **`isAdEnabledForTrigger` Selector:** Forces `isAdEnabledForTrigger` selector to return `false` (`LoadConstFalse r1; Ret r1`).
5. **`isRegisteredTrigger` Selector:** Forces `isRegisteredTrigger` selector to return `false` (`LoadConstFalse r1; Ret r1`).
6. **`isPlacementInCatalog` Selector:** Forces `isPlacementInCatalog` selector to return `false` (`LoadConstFalse r1; Ret r1`).
7. **`useShowThanks` Hook:** Forces the Thanks visibility hook to return `false` (`LoadConstFalse r0; Ret r0`), keeping the modal unmounted.
8. **Thanks Base URL:** Replaces the `https://thanks.is/` loader with `null` (`LoadConstNull r0; Ret r0`).
9. **Braze Banner Component:** Forces `BrazeBannerWithPadding` to return `null` (`LoadConstNull r0; Ret r0`), so the Orders/Home banner does not consume the stubbed native Braze module.

Selectors are located by their property name in the memoized selector wrappers, so the patch is not tied to fixed byte offsets.

- **Mandatory Rehash:** Recalculates trailing Hermes bundle SHA-1 digest via `editor.updateFooterHash()`.

---

### Patch: Clean Authentication

- **Name:** Clean Authentication
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:**
  - `hideReferAFriend` (Boolean, default: `true`)
  - `hideGiveaway` (Boolean, default: `true`)
  - `hideOffers` (Boolean, default: `true`)
  - `hideRewards` (Boolean, default: `true`)
  - `hideSezzleMobile` (Boolean, default: `true`)
  - `hideAmazonDeals` (Boolean, default: `true`)
  - `hidePayLaterAnywhere` (Boolean, default: `true`)
  - `hideSezzlePoints` (Boolean, default: `false`)
  - `hideSezzleSpend` (Boolean, default: `false`)
  - `hideSezzleUp` (Boolean, default: `false`)

#### 1. Motivation & Purpose

Customizes which items appear in the "Your Shortcuts" carousel on Home and Shop tabs.

#### 2. Technical Implementation & Injection Points

Modifies `assets/index.android.bundle`:

1. Validates Hermes function `#90129` (offset `0x01b6cd83`, capacity 57) and donor function `#85895` (offset `0x01b1aa98`, capacity 154).
2. Synthesizes a predicate in the donor region filtering the shortcut item's `name` property. The predicate uses `GetByIdShort` for the bundle's current `name` identifier, `JStrictEqualLong` for the null guard, and short strict-equality jumps for each excluded name. Excluded names are `user_referrals`, `sezzle_mobile`, `offers`, `giveaway`, `earn`, `amazon_deals`, `amazonDeals`, `anywhere`, the cohort-specific `anywhere_{50,75,90,95}_pct_off` variants, and the opt-in `sezzle_points`, `sezzle_spend`, and `sezzle_up`.
3. The string table has no entries for `anywhere_{50,75,90,95}_pct_off` or `sezzle_points`; the patch repurposes inert Storybook source-path strings as donor storage for these names before adding them to the predicate. The null guard uses the long jump variant because the short `Addr8` offset overflows once several names are excluded.
4. Re-points `#90129`'s function header to the synthesized donor logic.
5. Recomputes Hermes footer hash.

---

### Patch: Hide Sezzle Mobile

- **Name:** Hide Sezzle Mobile
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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

- **Base Giveaways (Always applied):** Neutralizes `useRoktGiveawaysEnabled`, `useMarketingGiveaway`, and `useGiveawayScreenStatus`.
- **Deal Popovers:** Stubs `useSelectPopupOffers`, `useStoreOfferModalConfig`, `useWebviewDealsPopoverConfig`, `useSingleMerchantDeal`, `useIsOffersV2Enabled`, and `useIsOfferSurfaceEnabled`.
- **Removed upstream in 5.3.24:** `useGiveawayShopRoutingEnabled` and `useIsNewOfferModalEnabled` no longer exist in the bundle, so no patch step is required.
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
- **Supported Versions:** `5.3.24`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose

Removes the commercial Rewards bottom tab while preserving access to Sezzle Points in Account > Benefits.

#### 2. Technical Implementation & Injection Points

Modifies `assets/index.android.bundle`:

1. Unmounts `EarnTab` in `ProtectedStack` by stubbing `useIsShowEarnTabEnabled` and `useCachedIsShowEarnTabEnabled` to return `false`.
2. Stubs `useEarnButtonOnShopFeature` to return `undefined`, so StoreRoot does not build the Home header's **Get Rewards** pill.
3. The Home `customer/points` shortcut is hidden by the default `hideRewards` option in [Configure Shortcuts](#patch-configure-shortcuts). The Account > Sezzle Points entry remains functional.
4. Recomputes Hermes footer hash.

---

### Patch: Remove Sezzle Subscriptions

- **Name:** Remove Sezzle Subscriptions
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
- **Default State:** `false` (Disabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:** `removeHomeGiftCards` (Boolean, default: `true`)

#### 1. Motivation & Purpose

Removes references to Sezzle's subscription plans (Sezzle Anywhere and Sezzle Premium) across the Account menu benefits list, the Home gift card carousel, Wallet promotional surfaces, and Orders customer support entry points. Gift cards require an active Anywhere subscription, so the Home carousel is removed by default; disable `removeHomeGiftCards` to keep it.

#### 2. Technical Implementation & Injection Points

Modifies `assets/index.android.bundle`:

1. **Account Menu Benefits & Anywhere Banner:** In `AccountView` (`0x12c11ea`), patches the conditional subscriptions branch at offset `+0x133c` (`b0 0c 44` -> `7e 7e 7e`), bypassing the entire subscription array construction and jumping directly to `+0x14ce`, eliminating Sezzle Anywhere and Sezzle Premium benefit entries while preserving remaining benefits (Sezzle Mobile, Sezzle Points, Sezzle Spend, Sezzle Up, Sezzle Balance). Additionally, at offset `+0x11eb`, replaces the Anywhere banner short-circuit evaluation prologue (`10 19 50 b2 06 19 10 19 48` -> `96 19 7e 7e 7e 7e 7e 7e 7e`), forcing condition register `r25` to `false` so that the conditional jump at `+0x11f4` (`b2 2c 19` -> `JmpFalse +0x2c`) always triggers and skips over the entire `sezzleAnywhereBanner` JSX container, passing `false` to the JSX array and cleanly eliminating the "Pay later anywhere Visa is accepted" card banner from the Account screen.
2. **Home Gift Cards Carousel (`removeHomeGiftCards`, default enabled):** Stubs `HorizontalGiftCardStoresList` with `LoadConstNull; Ret`, unmounting the `carousel-giftcards` store carousel on Home. Set `removeHomeGiftCards=false` to keep the carousel.
3. **Wallet Screen Banner:** Neutralizes `WalletBanner` prologue (`34 0e 00 40` -> `93 01 76 01`) and `WalletBannerCarousel` prologue (`34 07 00 40` -> `93 01 76 01`), returning `undefined` to cleanly unmount single and carousel promotional Anywhere subscription banners (`wallet-banner-box`).
4. **Wallet Screen Gift Cards:** Neutralizes `GiftCardsSection` prologue (`34 05 00 40` -> `93 01 76 01`), returning `undefined` to cleanly unmount the Gift cards section (all gift cards require an active Anywhere subscription).
5. **Orders Tab Help:** In `GetHelpScreen`'s priority support closure `#64670` (`0x16ed5a8`), replaces the prologue (`34 01 00 3b 02 01` -> `08 02 00 00 76 02`), returning an empty array `[]` so "Priority Customer Support" (an Anywhere-only feature/ad) is never mounted in the Help options list.
6. Recomputes Hermes footer hash.

> **5.3.24 implementation note:** The Account benefit entries are removed by stubbing the anonymous subscription-section builder (`#82424`) and skipping the `AccountView` Anywhere row at `+0x1343`; the offset details in item 1 reflect an earlier revision.

Note: To remove the "Pay Later Anywhere" shortcut on the home screen carousel, configure the `hidePayLaterAnywhere` option (enabled by default) in [Configure Shortcuts](#patch-configure-shortcuts).

---

### Patch: Replace AI Discover with Products

- **Name:** Replace AI Discover with Products
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
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

### Patch: Rename Shop to Home

- **Name:** Rename Shop to Home
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

#### 1. Motivation & Purpose

Renames the Shop bottom navigation tab to Home. The tab still hosts Sezzle's stock store screen.

#### 2. Technical Implementation & Injection Points

Modifies `assets/index.android.bundle`:

1. Changes the bottom navigation tab label from `"Shop"` to `"Home"` in `ProtectedStack`.
2. Recomputes Hermes footer hash.

#### 3. Why StoreRoot Is Not Rewritten

The previous revision replaced `StoreRoot`'s feed composition with a synthetic dashboard. That wiring does not hold on 5.3.24:

- The synthetic layout passed empty props to `OrdersListHeader` and `ShopTabShortcutsRow`, so the Home content area rendered blank.
- `PaymentStreakBanner`'s spending-power branch dereferences `props.sezzleUpCreditLimit.available_credit_limit_in_cents` without a guard. Mounting it from the synthetic layout produced `Cannot read property 'available_credit_limit_in_cents' of undefined` and the app's `Something went wrong` boundary.
- The StoreRoot dependency table does not map cleanly to the module wrappers assumed by the old layout, so slot substitution alone cannot supply the missing props.

---

### Patch: Clean Home

- **Name:** Clean Home
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None
- **Options:**
  - `removeShortcuts` (Boolean, default: `false`)
  - `removeBrands` (Boolean, default: `true`)
  - `removePromotions` (Boolean, default: `true`)
  - `removeSezzleSpendBanner` (Boolean, default: `false`)

#### 1. Motivation & Purpose

Trims Sezzle's stock Home (the Shop tab renamed by Rename Shop to Home) by unmounting store/brand carousels and promotional banners while keeping the account header, the **Your Shortcuts** row, and the real Sezzle Spend balance notification. The shortcuts row remains available through the opt-in `removeShortcuts` option.

#### 2. Technical Implementation & Injection Points

Modifies `assets/index.android.bundle`. For each configured component, the first four bytes are replaced with `LoadConstNull r0; Ret r0`, so the component renders nothing and the rest of its original body is unreachable:

1. **Shortcuts (`removeShortcuts`):** `ShopTabShortcutsRow`, `ShopTabShortcutsRowView`, `ShopTabAlert`, `EarnSpendPill`, `VcRewardsPill`, `RewardChip`, and `StoreHeaderList`. `StoreHeaderList` renders the **Your Shortcuts** row; it belongs here so `removeBrands` cannot remove the shortcuts row.
2. **Store and brand sections (`removeBrands`):** `CategoryStoresList`, `StoresCarousel`, `RecommendationsCarousel`, circular brand lists/items, category rows, `ShopByCategoryScreen`, Braze content cards, and store carousels.
3. **Promotional banners (`removePromotions`):** `ShopDealsAd`, `NativeAdCard`, `CtaBanner`, `UnlockSpendingPowerBanner`, Amazon spend banners, `RewardsView`, `CashbackRewards`, and `SezzleSpendAnywhereView`.
4. **Sezzle Spend balance banner (`removeSezzleSpendBanner`, opt-in):** `SpendPill` and `ShopSpendCta`. Leave this disabled by default: the banner reports real spendable balance (`shop-spend-cta-pill`), not a marketing promotion.
5. Recomputes Hermes footer hash.

---

### Patch: Patch Consent Screen

- **Name:** Patch Consent Screen
- **Target Package:** `com.sezzle.sezzlemobile`
- **Supported Versions:** `5.3.24`
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
- **Supported Versions:** `5.3.24`
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
