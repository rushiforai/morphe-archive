# TextNow patches

**App:** TextNow (`com.enflick.android.TextNow`) · **version 6.1.0.1** · versionCode
`12231` · minSdk 14 / targetSdk 26 · APK, **armeabi-v7a only**.

**Signer (SHA-256):** `1428a295a31d63d9e9361cf6c7b71a76b71bf5ff254f7549c7e6d9341e476354`.

TextNow is ad-supported and bundles several mediation networks plus a stack of
analytics SDKs. Goal: **ads + telemetry removal only**.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Remove ads** | ✅ | Disables every ad-network component the app declares and strips the ad-ID / ad-services / install-referrer permissions. |
| **Disable ad SDK** | ✅ | No-ops the Google Mobile Ads `MobileAds.initialize(...)` overloads. |
| **Disable trackers** | ✅ | No-ops the Adjust (attribution) and Flurry (analytics) SDK initialisers. |
| **Disable tracker components** | ✅ | Disables Crashlytics, Google Analytics v3, Firebase-measurement and Flurry components; sets the Firebase/GA opt-outs. FCM push kept. |

## Ads

Ad networks neutralised (manifest `android:enabled="false"`):

- **AdMarvel** — `AdMarvelActivity`, `AdMarvelMediationActivity`
- **Amazon Mobile Ads** — `DTBActivity`
- **AppNext** — `ActionActivity`, `ActionService`, `AdsService`, `OperationService`,
  `ReceiverService`, `bootreceiver`, `AppNextDbFileDownloadService`
- **Google Mobile Ads** — `AdActivity`, plus `MobileAds.initialize(...)` no-oped
- **MoPub** — `MoPubBrowser`, `ConsentDialogActivity`, `MoPubActivity`, `MraidActivity`,
  `MraidVideoPlayerActivity`, `RewardedMraidActivity`

Permissions stripped: `AD_ID`, `ACCESS_ADSERVICES_ATTRIBUTION`,
`ACCESS_ADSERVICES_AD_ID`, `BIND_GET_INSTALL_REFERRER_SERVICE` (defensive — none are
declared by this build).

## Telemetry

- **Crashlytics** — `CrashlyticsInitProvider` disabled + `firebase_crashlytics_collection_enabled=false`.
- **Google Analytics v3** — `AnalyticsReceiver` / `AnalyticsService` / `AnalyticsJobService` disabled.
- **Google Analytics for Firebase** — `AppMeasurementReceiver` / `Service` / `JobService` /
  `AppMeasurementInstallReferrerReceiver` disabled + the Firebase/GA opt-out flags set.
- **Adjust** — `Adjust.onCreate(AdjustConfig)` no-oped.
- **Flurry** — `FlurryAgent.init(Context, String)` no-oped and the Flurry UI activities
  (`FlurryBrowserActivity`, `FlurryFullscreenTakeoverActivity`, `FlurryShareActivity`,
  `FlurryTileAdActivity`) disabled.
- **Kept working:** Firebase core (`FirebaseInitProvider`, `ComponentDiscoveryService`)
  and FCM push (`FirebaseMessagingService`, `FirebaseInstanceIdReceiver`,
  `FirebaseInstanceIdService`) are untouched.

## Verification (2026-11-08)

Build: all four patches apply cleanly (`failedPatches: []`).

Bytecode spot-checks on the patched dex (all now begin `return-void`):
- `com.google.android.gms.ads.MobileAds.initialize(Context)` and
  `.initialize(Context, String)`
- `com.adjust.sdk.Adjust.onCreate(AdjustConfig)`
- `com.flurry.android.FlurryAgent.init(Context, String)`

Manifest (`aapt2 dump xmltree`): every ad-network component and every telemetry
component above has `android:enabled="false"`; the Firebase/GA opt-out meta-data are
present and `false`; `FirebaseMessagingService` is still enabled.

**Device verification not possible in this environment:** TextNow ships only
`armeabi-v7a` natives and the test emulator exposes `x86_64,arm64-v8a` — the install
fails with `INSTALL_FAILED_NO_MATCHING_ABIS`. A 32-bit ARM device (or an armeabi-v7a
emulator image) is required to run it.
