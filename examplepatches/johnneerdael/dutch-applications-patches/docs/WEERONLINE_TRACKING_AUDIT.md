# Weeronline 3.61.0 tracking inventory

This inventory concerns the Play Store split set of Weeronline 3.61.0 (2030006811): `base.apk` with three DEX files, plus ABI, language and density splits; certificate SHA-256 `b8670a2d…f9394`. Weeronline is made by Infoplaza, like Buienalarm. Since 3.37.0 it bundles the same Infoplaza consent wrapper around Didomi, the Facebook SDK and Audience Network, so the Buienalarm approaches apply. It distinguishes packaged capability, inspected entry paths and disabled controls. It does not establish that every runtime or remotely configured telemetry path has been eliminated.

The walkthrough used apktool smali, JADX output, the decoded manifest and endpoint strings. Most app classes keep their names (`com.xs2theworld.weeronline.*`); obfuscated classes are located through unique strings, kept interfaces and signatures. No decrypted HTTP capture is part of the evidence.

Removed since 3.37.0: Piano/Cxense, the LiveRamp SDK and its `privacymanager.io` pings, and Google UMP. Weeronline Plus shares its flag with paid tile customisation. The ad and promotion patches therefore disable each surface separately; the optional Unlock Plus patch deliberately enables that shared flag.

## Ads

| Surface | Control |
| --- | --- |
| Google Ad Manager and PubMatic OpenWrap banners, including the sticky banner | `GoogleAdViewManager`, `OpenWrapAdViewManager` and `AdStateImpl.loadAd` return; `AdViewContainer.loadAd` collapses the view; both Compose `AdContainer` functions emit nothing. |
| Interstitials (Google and OpenWrap) | `InterstitialAdVisibility.shouldShowAd` returns false. |
| Google Mobile Ads startup | `App$initAds$1` returns before `MobileAds.initialize`; `MobileAdsInitProvider` and `AdService` disabled (under **Disable tracking**). |
| Audience Network startup | `AudienceNetworkContentProvider` disabled; its DEX payload is deleted under **Disable tracking**. |
| Main feed ad cards and news-list ads | `CityFragment.access$generateAdCardItems` returns no ad cards; `NewsDataSource` receives its existing ad-free flag. |
| Reserved banner space on ten detail screens | `ad_placeholder` set to `gone`, height 0. |
| Blue Billywig pre-, mid- and post-rolls (IMA/VAST) | Both ad-phase gates (ad scheduling and MSAS) return the player's own "no ad" result, so playback continues with the content. |
| PubMatic app setup and PPID as external user ID | `OpenWrapSDK.setApplicationInfo` and `App.access$updateOpenWrapUserId` return. |
| Sponsored tiles and weather advice (Vue cinema) | `BrandedActivity.isExpired` returns true. |

## Premium promotions

| Surface | Control |
| --- | --- |
| Full-screen subscription push at startup | `UserRepositoryImpl.shouldShowSubscriptionPushScreen` returns false. |
| App-launch promotion paywall (RevenueCat offer from remote config `promotions`) | The promotion list is empty, so no offer is found. |
| Plus screen after declining consent | The declined check in Main, Menu, News detail and Weather text consent observers is false. Onboarding keeps its own handler, which continues the flow. |
| Weeronline Plus menu entry and its "active" label | `MenuFragment.access$renderMenuState` sets both invisible. |
| Plus footer in tile settings | The footer flag in `getItemCount` and `getItemViewType` is 0. |

The post-update sheet in 3.61.0 announces new graphs and is not a Plus promotion, so it is unchanged. Without Unlock Plus, the dialog shown when tapping a locked tile and the My places lock remain, so the lock is explained. The ad and promotion patches alone do not unlock Plus.

## Plus unlock

`UserRepositoryImpl.isAdFree` returns true for dashboard tile visibility and ordering. `IAPStatusImpl$2.invokeSuspend` always emits true so a RevenueCat refresh cannot relock the reactive Plus state. In 3.61.0, My places uses that state for its saved-location rain-notification locks, and `RegisterDeviceGenerator` includes it in the push-registration request. The patch therefore opens the local per-location controls and sends the same Plus flag as a subscriber; actual alert delivery still depends on the NotifyHub service and cannot be established by static inspection.

The manifest exposes the existing day and day-part forecast widgets without a Plus gate. No separate premium UV-index, wind-force or rain-chart widget implementation was found in this APK, so Unlock Plus does not claim to add those widgets.

## Consent screens (Skip consent screens)

| Screen | Path | Control |
| --- | --- | --- |
| "Stel je cookies in" onboarding page | `WelcomeNavigationUseCase.navigateToCookies` | Navigates to the location step instead. |
| Didomi consent notice and Infoplaza consent-or-pay wall | Five screens ask the consent manager to show the notice when consent is required; the manager's gate (`e.f`) decides | The gate returns false, so the app's own "not required" path completes, as for paid users. |

No consent choice is written. Privacy settings in the menu still open Didomi's preferences. Didomi still initializes, because those preferences require it.

## Identified collectors and controls (Disable tracking)

| System / capability found | Inspected path | Control |
| --- | --- | --- |
| Firebase Analytics: every app and KMP event and user property | Infoplaza `AnalyticsManager`, single implementation `gf.a` | Event and user-property methods return; `firebase_analytics_collection_deactivated=true`, collection/ad-ID/sGTM/consent flags false, AnalyticsConnectorRegistrar removed, AppMeasurement components and the GA4 server preview activity disabled. |
| Firebase Crashlytics, force-enabled at runtime | `App.onCreate` sets the collection override; `App$CrashlyticsTree` forwards Timber logs | `DataCollectionArbiter` returns false; tree returns; manifest flag false. Registrars stay because app code dereferences Crashlytics. |
| Firebase Performance, woven into HTTP clients | Perf registrars | `firebase_performance_collection_deactivated=true`; collection and logcat flags false. Registrars stay to keep the HTTP wrappers intact. |
| Firebase Sessions | Crashlytics dependency | `firebase_sessions_enabled=false`. |
| Firebase In-App Messaging | Four registrars, no app references | Registrars removed. |
| FCM delivery metrics export to BigQuery | Persisted preference overrides the manifest | Export check returns false; manifest flag false. |
| Google Tag Manager | `assets/containers/GTM-N696CS.json` with Universal Analytics tags | Container deleted; TagManager service and preview activity disabled. |
| Facebook SDK: settings, gatekeepers, anonymous ID, app events, advertiser ID | `FacebookInitProvider` initializes at startup; the consent listener `FacebookConsentController` enables auto-init, app events and the advertiser ID; `FacebookPurchaseLogger` logs purchases | Provider disabled; the three `com.facebook.sdk.*` flags false; consent listener returns; tracking evaluator false; purchase logging returns; `AppEventsLogger` is an inert object, because Dagger still constructs it. |
| Audience Network | Provider loads `assets/audience_network/*.dex` | Provider disabled; both DEX files deleted. |
| Didomi performance and usage metrics | `io.didomi.sdk.e9` | Returns false. Consent API events stay, as in Buienalarm. |
| Infoplaza cross-app PPID | `df.c.a` (PPIDGenerator), PPIDContentProvider, six `READ_PPID` permissions | Generator returns `""`; provider disabled; permissions removed. Stored values are not claimed to be erased. |
| Advertising ID for all SDKs | `AdvertisingIdClient.getAdvertisingIdInfo` | Returns the zero ID with limit-ad-tracking, as Android reports after an opt-out; `AD_ID`, the four `ACCESS_ADSERVICES_*` and `AD_SERVICES_CONFIG` permissions removed. |
| Amazon Privacy Pass | Only PubMatic's OM SDK attestation | `ATTEST` permission and optional library removed. |
| Blue Billywig video statistics (`stats.bluebillywig.com`) | Single sender `H6.c.k` | Returns. |
| Install referrer | Read only by Firebase Analytics | Permission removed; analytics deactivated. |
| RevenueCat optional telemetry | Diagnostics (local or remote setting); Firebase instance ID attribute via `IAPClient` | Diagnostics forced off; the attribute setter returns. Purchases and entitlements are untouched. |
| Unreferenced LiveRamp fallback configuration | `assets/gdpr-liveramp-fallback.json` | Deleted. |

## Retained traffic

- Weather, radar, maps tiles and news from `*.meteoplaza.com`, `imn-rust-lb.infoplaza.io`, `mobile-api.`, `search.`, `service.` and `node-services.weeronline.cloud` and `www.weeronline.nl`, including the first-party advice API that receives the Firebase installation ID.
- Push registration with `notifyhub.infoplaza.io`, Firebase Remote Config (including realtime), Installations and Cloud Messaging (`fcmregistrations.googleapis.com`).
- Didomi configuration and vendor lists (`sdk.privacy-center.org`) and its consent API events (`api.privacy-center.org`).
- RevenueCat (`api.revenuecat.com` and backups) and Google Play Billing for Plus, including RevenueCat paywall events when a paywall is shown.
- Support (`weeronline.reamaze.com`), Blue Billywig video playback and YouTube embeds in news.
