# Buienradar 7.4.8 tracking inventory

This inventory concerns the APKMirror APKM of Buienradar 7.4.8 (7897): `base.apk` plus ABI and density splits. The ABI splits only contain `libandroidx.graphics.path.so` and `libdatastore_shared_counter.so`, with no tracking code. It distinguishes packaged capability, inspected entry paths and disabled controls. It does not establish that every runtime or remotely configured telemetry path has been eliminated.

The walkthrough used apktool smali, JADX output, the decoded manifest and endpoint strings. Obfuscated names are bounded to this DEX version; the patches locate them through strings, signatures and unobfuscated SDK classes. No decrypted HTTP capture is part of the evidence.

## Comparison with the original buienradar-patches

The original repository contained only **Hide ads** (feed ad slots and video pre-roll) and **Hide Premium banner** (Today promotions block). Both are carried over unchanged in behaviour. It had no tracking controls, although the app sends analytics to several parties regardless of the consent choices shown: the Snowplow consent context is hard-coded as `has_given_consent=true, is_analytics=true`.

## Identified collectors and controls

| System / capability found | Inspected path | Control |
| --- | --- | --- |
| Snowplow, RTL tracker (`nl-rtl-prod1.collector.snplow.net`) and DPG Media tracker (`c.dpgmedia.net`); screen, element, funnel, purchase, radar-location and login events, with install-referrer and lifecycle autotracking | `dh9.a` creates both trackers; `so.b/c`, `nn1`, `ch9` null-check them | **Disable tracking**: tracker creation returns before either tracker exists. |
| Kantar/NMO audience ping (`nmortlendpoint.2cnt.net`, `cs_fpid` = Snowplow user ID) | Plugin `yz3` attached to the RTL Snowplow tracker | Stops with the Snowplow tracker. |
| App analytics dispatcher: Firebase Analytics events, Usabilla events, Snowplow events, place/country of interest | `so.c(wo, ema)` | **Disable tracking**: returns immediately. |
| Firebase Analytics / measurement | Manifest flags; OneTrust consent callback grants analytics storage at runtime | `firebase_analytics_collection_deactivated=true`, collection/ad-ID/sGTM/screen flags false, AnalyticsConnectorRegistrar removed, AppMeasurement receiver/services disabled. |
| Firebase Crashlytics | Registrar kept because app code dereferences it | Manifest flag false and `DataCollectionArbiter.isAutomaticDataCollectionEnabled()` returns false, also overriding a persisted opt-in. |
| Firebase Sessions | Registrar kept as a Crashlytics dependency | `firebase_sessions_enabled=false`. |
| Smartocto video-play pings (`ingestion.smartocto.com/v?t=videoPlay`) | Player listener `ue9.j` launches request branch 28 | **Disable tracking**: listener returns. |
| Bitmovin Analytics (`analytics-ingress-global.bitmovin.com`) | `TFKBitmovinPlayer` passes `AnalyticsPlayerConfig.Enabled` and `AnalyticsSourceConfig.Enabled` | `AnalyticsConfiguratorKt.configureAnalytics` returns the player/source without attaching a collector. Licensing calls remain for playback. |
| Usabilla telemetry and event-triggered campaigns (`sdk.out.usbla.net`) | `UbTelemetryRecorder`, `Usabilla.sendEvent` | Telemetry level forced to 0, so nothing is recorded or submitted; `sendEvent` returns. The feedback form opened from Settings remains. |
| Google Mobile Ads (next-generation SDK) startup | `App.onCreate` launches `bd` branch 3 with `ca-app-pub-7228185019169219~6424194274` | **Hide ads**: the launch is skipped; no ad slots or video ads are requested either. |
| Advertising ID, Privacy Sandbox attribution, install referrer | Manifest permissions; `ContentLoader#getAdvertisingId`; Snowplow install referrer | `AD_ID`, `ACCESS_ADSERVICES_*`, `AD_SERVICES_CONFIG` and `BIND_GET_INSTALL_REFERRER_SERVICE` removed. |
| Buienradar Plus trial notification with partner promotion link | `OneTimeNotificationScheduleWorker.c` | **Hide Premium banner**: the job completes without posting. |
| Swrve engagement SDK: device profile, sessions, user properties (`dark_mode`, subscription status), in-app messages, push | `App.onCreate` constructs `SwrveImp`; `fv8`, `gx8` send user properties | **Disable Swrve and location upload** (off by default): forces the SDK's own model-blacklist path, which installs `SwrveEmpty`. |
| Background location upload: latitude, longitude and Swrve user ID to `userapi.buienradar.nl/2.0/userlocation` | `LocationIntelligenceWorker` → `h25.E` → `gn0.a` | **Disable Swrve and location upload**: the request is removed; the worker still stores the last location locally. |

## Consent and Premium screens

| Screen | Path | Control |
| --- | --- | --- |
| First-run pager: Pay-or-OK choice (Premium or "free with personalised ads"), then the OneTrust banner | Splash coroutine `zj9` routes to onboarding until `ONBOARDING_DONE` | **Skip consent screens**: the splash reads onboarding as completed. |
| Pay-or-OK screen on later launches | Same coroutine: shown until `PAY_OR_OK_SEEN_1`, unless Premium | **Skip consent screens**: treated as seen. |
| Automatic OneTrust banner | `s67.b` shows it when `shouldShowBanner()` is true | **Skip consent screens**: the automatic check reports false; a manual request from Privacy settings still opens the preference centre. |
| "Buienradar Premium" partner-offer carousel with "Discover Buienradar Premium" on the Info tab | Promotions state `ShowUI(list, SETTINGS)` in `lm0` (Info) and `nh7` (Pay-or-OK) | **Hide Premium banner**: both become the existing `Hide` state, as for the Today block. |

No consent choice is written: OneTrust groups stay unanswered, which the app's own cache reads as not granted. Premium-only radar layers keep their explanation dialog.

## Retained traffic

- Weather, radar, forecast, location search, tiles, videos and Weerzine content from `*.buienradar.nl` and `api.rtl.nl`.
- Firebase Remote Config, Installations and Cloud Messaging, which deliver configuration and Swrve push.
- OneTrust (`mobile-data.onetrust.io`, `geolocation.1trust.app`), whose configuration still loads at startup so Privacy settings work.
- Google Play Billing and the DPG account login.
- Swrve and the background location upload, unless **Disable Swrve and location upload** is selected.

**Disable Swrve and location upload** is separate and off by default. Buienradar delivers all weather alerts (rain, air quality, barbecue, daily forecast) through Swrve push, and its "Current location" alerts depend on the background location upload. Selecting it disables those alerts.
