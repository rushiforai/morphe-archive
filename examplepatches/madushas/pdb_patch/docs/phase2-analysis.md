# Phase 2 APK analysis

Batch: `new_patches apk/phase2/`

Order (hardest to easiest, based on expected protection depth):

- [x] Pluralsight (`com.pluralsight`)
- [x] Skillshare (`com.skillshare.Skillshare`)
- [x] We Love Deals (`com.thina.welovedeals`)
- [x] OferHub (`com.oferhub.app`)

Per-app evidence gate:

- [ ] Package/build and signing fingerprint
- [ ] Manifest, resources, and DEX inspected
- [ ] Ads and telemetry entry points mapped
- [ ] Premium/entitlement flow mapped upward and downward
- [ ] Community and internet precedents searched
- [ ] Patch feasibility and candidate fingerprints recorded in `docs/phase2-devlog.md`
- [ ] No unsupported “impossible” claim without both code and precedent evidence

---

## 1. Pluralsight — `com.pluralsight` 2026.11.05 (vc 903935) — ANALYSIS COMPLETE

Workdir: `/home/madusha/dev/work/phase2/pluralsight` (apktool/, jadx/, dex/, base.apk)

### Identity
- Package `com.pluralsight`, versionName `2026.11.05`, versionCode `903935`
- Six dex files (`classes.dex` … `classes6.dex`), ~28.5k classes, heavy R8 obfuscation
- API base `https://app.pluralsight.com/mobile-api`, auth via `Authorization: Bearer <token>` interceptor

### Protection profile — two independent layers
1. **PairIP launch/licensing gate** (standard variant, NOT the full-VM one):
   - `com.pairip.application.Application.attachBaseContext` → `LicenseClient.checkLicense(Context)`
   - `checkLicenseInternal(IBinder)` → `populateInputDataForLicenseCheckV2` → `com.android.vending.licensing.ILicensingService` / `IBackgroundLicensingService`
   - `LicenseClient` holds `licensePubKey` + `packageName = "com.pluralsight"`
   - → covered by the repo's shared PairIP bypass primitive; kills the launch gate only.
2. **App-level entitlement layer** (separate from PairIP — bypassing PairIP unlocks nothing premium):
   - Subscription state: `GET /v1/subscription` → `SubscriptionInfo` Room row (`slices`, `trial`, `subscriptionStatus`, `isPendingVerification`) → drives nav/upsell/paywall chrome
   - Course access: `GET /v2/user/courses` → `CourseAccessResponseDto(viewableModules, mayDownload, isEmbargoed)` → `CourseAccess` / `ViewableModule` Room tables → player + download decisions

### Premium feasibility — SERVER-AUTHORITATIVE (honest classification)
- Offline media: authenticated `POST /v2/library/videos/offline` + `/v2/library/videos/offline/viewreporting`
- Media payload `VideoResponseDto(url, rankedOptions, sessionId)` — `url` is the playable/downloadable location **issued by the server**
- Downloads are decrypted client-side, but the source URLs and authorization come from the server-backed remote data source → client-side decryption is not an unlock lever
- R8-renamed classes (resolve via Kotlin inner-class `.source` metadata):
  - `SubscriptionsRemoteDataSourceImpl` → `remote.datasourceImpl.v`
  - `CourseRemoteDataSourceImpl` → `remote.datasourceImpl.g`
  - `CourseRepositoryImpl` → `repositoriesImpl.g`
  - `CourseLocalDataSourceImpl` → `local.datasourceImpl.c`
  - DTOs: `s34`, `rh0`; media wrapper `su1` (Ktor `HttpResponse`, payload via `getRawContent()`); `na3` = `RankedVideoOptionsResponseDto`
- **Conclusion:** a local patch can strip paywall chrome (cached `SubscriptionInfo` forcing) but CANNOT mint playable/downloadable media. Premium unlock is out of reach client-side; state this honestly in the patch description.

### Ads
- **No ad SDK at all.** The single `com/google/android/gms/ads` smali file is `AdvertisingIdClient$Info` — a deprecated ad-identifier data holder, not an ad-display SDK.
- `0x7f110108` = `error_message_premium_account_required` string exists but has **no DEX constant reference** (only the generated `R` field) → cannot anchor a fingerprint; do not use it.
- Patch = defensive manifest/permission pass only.

### Telemetry (surgical — do NOT kill Firebase/Mux wholesale; they back playback/remote-config/push)
App-owned entry points (verified anchors, prefer these over SDK-internal greps):
- `pa1` — wraps Firebase Analytics (app-owned sink)
- `MuxAnalyticsRemoteDataSourceImpl` — Mux video-analytics entry point
- `if1` — app-owned Heap init / `startRecording`, Heap app id `2446543239`
- Firebase Analytics/Performance/Crashlytics + Heap + Mux present; **Contentsquare is NOT bundled** — zero `com/contentsquare/**` classes; only Heap's optional bridge reflection + Heap's endpoint string reference it → no separate Contentsquare patch needed
- `AdvertisingIdClient` present (identifier surface) → fold into tracker pass

---

## 2. Skillshare — `com.skillshare.Skillshare` 5.4.81 (vc 7706) — ANALYSIS COMPLETE

Workdir: `/home/madusha/dev/work/phase2/skillshare` (apktool/, jadx/, dex/, base.apk)

### Identity
- Package `com.skillshare.Skillshare`, versionName `5.4.81`, versionCode `7706`, minSdk 21, targetSdk 36
- Signer SHA-256 `da27959206fe1efefc8cbeb8922f6ff3a88f615135e663afef9fdfd82b83aaf4` (CN=fuze.cc)
- 13,804 classes (JADX clean-ish: 43 errors only), 3 dex roots
- Auth: **Auth0 OIDC** (WebAuthProvider, CredentialsManager), legacy cookie session + `Auth0ApiRequestAuthorizationHandler`

### Protection profile — NO PairIP (0 pairip classes), NO ad SDK
- Legacy `CHECK_LICENSE` + `BILLING` manifest permissions remain but are vestigial
- `AD_ID` + `ACCESS_ADSERVICES_AD_ID`/`_ATTRIBUTION` permissions present (defensive strip targets)
- Entitlement is a **single local boolean derived from server JSON** (cleanest unlock surface of the batch)

### Premium — LOW-LEVEL ANCHORS (both trivially patchable)
- **`Lcom/skillshare/skillshareapi/api/models/user/AppUser;->isMember()Z`** — 8-instruction body: `iget-object subscription` → `if-eqz` → return 1/0. **16 invoke sites** across LessonsPresenter (x3 + 2 inner classes), CourseDetailsPresenter, CourseDetailsActivity$setupPremiumCta$1 / $setupVideoPlayer$1, DownloadsActivity, ProjectsFragment, SettingsPresenter (x4), SplashActivity, onboarding/welcome, FirebaseUserUpdater.
  - Patch body: `const/4 v0, 0x1` + `return v0`
- **`Lcom/skillshare/skillshareapi/api/models/VideoMetadata;->isLocked()Z`** — same shape over `videoHashedID` field (returns true when null).
  - Patch body: `const/4 v0, 0x0` + `return v0`
- Server contract (the honest caveat):
  - Playback: `GET /sessions/{session_id}/stream` → `VideoUrls{streams:[{type,url}]}` (hls + dash), parsed in `GetVideo$getRemote$1`
  - Download: `GET /sessions/{video_id}/download` via system DownloadManager (`AndroidDownloader.b`)
  - **`session_id` = `Video.e` = `VideoMetadata.id` (int) — present for ALL videos including locked ones** (only `video_hashed_id` is omitted server-side for locked lessons)
  - So after patching, the client WILL attempt stream/download for premium lessons; whether the server serves them is server-side. `video_hashed_id` nullness is server-decided → the server demonstrably tracks per-user entitlement → premium playback is expected to remain server-gated.
  - `videoHashedIDCf` (Cloudflare variant) is stored in Room but **never consumed** for URL building — no local signing to exploit
- **Conclusion:** paywall-chrome unlock is real and cheap (2 method patches); premium media is expected server-gated — same honest classification as Pluralsight.

### Telemetry — full inventory with init anchors
| SDK | Size | Init anchor (smali) | Notes |
|---|---|---|---|
| **Sentry** | 934 cls | `Lio/sentry/android/core/SentryAndroid;->b(Landroid/content/Context;Lio/sentry/android/core/AndroidLogger;Lio/sentry/Sentry$OptionsConfiguration;)V` @ `Skillshare.smali:812` | manifest has `io.sentry.auto-init=false` → single manual init choke point; also SentryInitProvider + SentryPerformanceProvider in manifest |
| **Blueshift** | 228 cls | `Lcom/blueshift/Blueshift;->initialize(Lcom/blueshift/model/Configuration;)V` @ `Skillshare.smali:1587`; `trackAppOpen(Z)V` @ `:438` | 13 manifest components (AlarmReceiver, ScheduledPushReceiver, NetworkChangeListener, RequestQueueJobService, BulkEventJobService, NotificationWorker, 3 activities). ⚠️ Blueshift also drives rich-push display via FCM → disabling it can kill push notifications; decide per toggle, keep Messaging intact |
| **Singular** | 168 cls | `Lcom/singular/sdk/Singular;->init(Landroid/content/Context;Lcom/singular/sdk/SingularConfig;)Z` @ `Skillshare.smali:1311`; `setCustomUserId` @ `:250` | config keys: `skillshare_518a9fdc` / API key `1e406bb6b13688b03362cdad39634dfa` — clean fingerprint literals |
| **Firebase** | Analytics+Crashlytics+Sessions+Messaging+Installations | app-owned sink: `FirebaseUserUpdater` (sets user props; string "FirebaseCrashlytics component is not present.") | ⚠️ Messaging + Installations feed Blueshift token resync (`BlueshiftManager$b` calls `FirebaseInstallations.getId()`) → do NOT kill Messaging |
| **Facebook Stetho** | 537 cls | no manifest provider, no app-owned init | debug inspector, NOT analytics/tracking → lowest priority, optionally removable |
| **gms/ads** | 6 cls | — | all `AdvertisingIdClient*` (identifier only, not ad display) — same shape as Pluralsight |
| **App-owned events** | — | `MixpanelTracker`/`SkillshareEventTracker` → `POST /events/track` (`EventsTrackService`) | "Mixpanel" is a naming convention only — no Mixpanel SDK ships |

- **Ads: no ad-display SDK at all** (0 ad-network classes) → defensive manifest/permission pass only.
- **Stetho is not a tracker** — do not count the 537 Facebook classes as telemetry when writing the patch description.

---

## 3. We Love Deals — `com.thina.welovedeals` 1.2.0 (vc 87) — ANALYSIS COMPLETE

Workdir: `/home/madusha/dev/work/phase2/welovedeals` (apktool/, jadx/, apks_extracted/)

### Identity
- Package `com.thina.welovedeals`, versionName `1.2.0`, versionCode `87`, minSdk 24, targetSdk 36
- Signer SHA-256 `eb7eaf29abbe462c70dddc9e6ddead80a9ee53fbbbb32a0e02bd4c7c2836953a` (CN=Android, O=Google Inc. — Play-signed)
- 1 dex, **1,787 classes** (JADX: 5 errors only) — smallest app of the batch
- `<application android:name="com.pairip.application.Application" android:extractNativeLibs="false">`

### FLUTTER APP — patch ceiling is the Android side only
`split_config.arm64_v8a.apk` ships `lib/arm64-v8a/libapp.so` (8.2 MB, AOT Dart) + `libflutter.so` (11.6 MB) + `libdartjni.so`. All deal-list, coupon, category, and "premium/deals" logic lives compiled in `libapp.so` → **not dex-patchable** (same shape as batch-2's Jooble). `com/thina/welovedeals/MainActivity.smali` is the only app-owned class.

Registered Dart plugins (15, all UI/peripheral): app_links, file_picker, flutter_image_compress_common, flutter_inappwebview_android, flutter_plugin_android_lifecycle, flutter_secure_storage, fluttertoast, geolocator_android, google_maps_flutter_android, **jni / jni_flutter**, share_plus, shared_preferences_android, sqflite_android, url_launcher_android.
- No in_app_purchase plugin, no Firebase plugin, no analytics plugin → the premium surface (if any) is Dart-side/in Dart-side HTTP, unreachable here.

### Protection — PairIP-lite (37 classes), no full VM, but a NEWER variant with a custom-trial extension
- `com.pairip.application.Application.attachBaseContext` → `Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V` (single call; skips in isolated process, else dispatches to `initializeLicenseCheck()` via `ImmediateTaskExecutor`)
- Package also carries a **trial extension** the other pairip apps here lack: `TrialClient`/`TrialStatus(UNDER_TRIAL / NOT_UNDER_TRIAL / UNKNOWN)`, `LicenseClient.stopTrial` → `handleTrialEnd()`, and `RepeatedCheckMetadata`
- Manifest: `LicenseActivity` (exported=false) declared; `CHECK_LICENSE` permission present
- Variant check: only `application/` + `licensecheck/` roots (37 files) — **no `VMRunner`, no `StartupLauncher`, no `libpairipcore.so` in any split** → lite variant, same shape as Shima+/Material Capsule
- `licensePubKey` is a plaintext RSA public key in `LicenseClient`'s field defaults (not obfuscated) → server responses are cryptographically real → **cannot be forged**

#### PairIP gate — low-level decision points (must be no-opped, not faked)
| Method | Role | Patch |
|---|---|---|
| `initializeLicenseCheck()V` | selects local vs network check from `licenseCheckState` | no-op |
| `processResponse(I, Bundle)V` | code 0 → `LicenseResponseHelper.validateResponse()` then success; **code 2 → `startPaywallActivity(PAYWALL_INTENT)`**; other → throws; catchall → shutdown path | no-op (the only way past a real license denial) |
| `startPaywallActivity(PendingIntent)V` | paywall activity | no-op |
| `startErrorDialogActivity()` | error UI | no-op |
| `handleError(LicenseCheckException)` | catch path | no-op |
| `scheduleAppShutdown()` / `scheduleRepeatedLicenseCheck(...)` | kill + background retries | no-op / `repeatedCheckEnabled=false` in `<clinit>` |
| `performLocalInstallerCheck()Z` | verifies installer | `const/4 v0,0x1; return v0` |
| `handleTrialEnd()` | sets `customTrialEndTriggered=true` + state=`CHECK_REQUIRED`, forcing a real network check | no-op (prevents the trial-extension from re-arming the gate) |
| `checkLicenseInternal(IBinder)` / `bindToLicensingService(Z)` | RPC round trip | optional no-op to skip billing-service traffic |
| `LicenseClient.<clinit>` | static init; inject `sput-object …LicenseCheckState->LOCAL_CHECK_OK` + `sput-boolean v0, repeatedCheckEnabled=false` | anchor for state force |
- `isLocalCheckPassed()` gates on `LOCAL_CHECK_OK || LOCAL_CHECK_REPORTED` — so forcing `LOCAL_CHECK_OK` satisfies the "license ok" predicate everywhere the app checks it. The **fail-safe** is that `processResponse` would later overwrite it on a network response → that is exactly why `processResponse` must be no-op'd, not just the state forced.
- **Honest limitation**: this gets past the **launch gate only**. The app has no dex IAP/billing (`billingclient` = 0 classes), and its deals/limits logic is AOT Dart → any Android-side network enforcement would remain, and the launch gate is the entire reachable surface.

### Ads — NONE
Zero ad-SDK classes: no GMS Ads, no AppLovin/Ironsource/Unity/AdMob/Mopub/Inmobi/AppsFlyer/Adjust/Amplitude/Segment/Mixpanel/Sentry/Singular/Blueshift/Firebase/OneSignal anywhere in the dex. `com/google/android/gms/*` is present only for Maps (`GoogleApiActivity`, `com.google.android.geo.API_KEY`) — location, not ads.
→ ads-removal pass = defensive/no-op (nothing to disable).

### Telemetry — NONE
Same zero result across every tracker search; the 15 Dart plugins are all UI/peripheral. Flutter/Dart would have to register a plugin to get analytics, and none exists. Only `com.google.android.gms` maps usage (API key in manifest).
→ telemetry pass = defensive/no-op.

### Premium — out of reach (honest classification)
No billing client, no IAP plugin, no dex-visible entitlement. Any paywall/deals-limit logic is inside `libapp.so`.
→ **No premium patch.** PairIP-lite bypass launch gate only; ads/telemetry passes are defensive no-ops. Description must say so honestly.

---

## 4. OferHub — `com.oferhub.app` 1.0.0 (vc 5) — ANALYSIS COMPLETE

Workdir: `/home/madusha/dev/work/phase2/oferhub` (apktool/, jadx/, apks_extracted/)

### Identity
- Package `com.oferhub.app`, versionName `1.0.0`, versionCode `5`, minSdk 24, targetSdk 36
- Signer SHA-256 `cf63c2f9a5117ef7ebe6a3d0fd2754d7f6b7e584b4cd39e875dd7456df67778e` (CN=Android, O=Google Inc. — Play-signed)
- 2 dex files, **14,959 classes**, JADX 16 errors

### REACT NATIVE / EXPO app — logic is Hermes bytecode
`split_config.arm64_v8a.apk` ships `libreactnative.so`, `libhermes.so`, `libexpo-modules-core.so`, `libappmodules.so`, `libreact_codegen_safeareacontext.so` + Fresco image stack. App logic lives in `assets/index.android.bundle` (1,196,052 bytes) — **Hermes bytecode** (magic `c61f bc03 c103 191f`), not human-editable JS → same dex-ceiling as batch-2's Jooble. Only **13 app-owned classes** exist (`MainActivity`, `MainApplication` + the generated `R*`/`BuildConfig`), and both are the **stock Expo template** (`getPackages()` from `PackageList`, `getJSMainModuleName()` = `.expo/.virtual-metro-entry`, `onCreate` = `DefaultNewArchitectureEntryPoint.setReleaseLevel` + `loadReactNative` + `ApplicationLifecycleDispatcher.onApplicationCreate`). **No app-owned SDK initialization anywhere** → there is no app-owned telemetry entry point to patch.

Patchable from dex is only the native-side glue: PairIP, and manifest components. Ads/telemetry at the JS level (if any) are inside the Hermes bundle → unreachable.

### Protection — PairIP-lite (no VM), and the gate is a *subclass* of the real app class
- **`com.pairip.application.Application` `.super Lcom/oferhub/app/MainApplication;`** — PairIP's Application subclasses the real RN Application and only interposes `attachBaseContext` → `Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V` before chaining to super. So **React Native stays fully intact** and the manifest application name must NOT be swapped (unlike a manifest-swap-only approach).
- Package set = the simpler lite variant: `application/`, `licensecheck/{LicenseClient, LicenseResponseHelper, LicenseContentProvider, RepeatedCheckMetadata, …}` (30 files) — **no `VMRunner`, no `StartupLauncher`, no `libpairipcore.so`, and no custom-trial extension** (no `TrialClient`/`stopTrial`/`handleTrialEnd`, unlike We Love Deals)
- `LicenseClient` anchors match the repo's proven `killPairIpFull` LicenseClient block exactly:
  - `licenseCheckState:Lcom/pairip/licensecheck/LicenseClient$LicenseCheckState;` with enum `CHECK_REQUIRED / FULL_CHECK_OK / LOCAL_CHECK_OK / LOCAL_CHECK_REPORTED / REPEATED_CHECK_REQUIRED`
  - `localCheckEnabled:Z = true`, `eventualShutdownEnabled:Z = true`, plaintext `licensePubKey` (app-specific RSA key)
  - methods: `initializeLicenseCheck()V`, `connectToLicensingService(...)`, `checkLicenseInternal(IBinder)`, `processResponse(I, Bundle)V` (+ `-$$Nest$mprocessResponse` synthetic accessor), `startPaywallActivity(PendingIntent)V`, `startErrorDialogActivity()V`, `handleError(...)`, `scheduleAppShutdown()V`, `performLocalInstallerCheck()Z`, `reportSuccessfulLicenseCheck(IBinder)`
- **Lowest-risk bypass for this app**: no-op `LicenseClient.checkLicense(Context)V` only (return-void). `attachBaseContext` then chains to `MainApplication`, RN boots normally, no paywall/exit path is ever entered, and nothing else in the app is altered. The fuller LicenseClient no-op set (processResponse / paywall / shutdown / handleError / installer-check→true / `<clinit>` repeated-check off) is only needed if a residual background/repeated check keeps firing — not expected once the launch gate never starts.
- `processResponse` validates responses cryptographically against `licensePubKey` (same as We Love Deals) → no forged licensed response is possible; and because the gate is subclass-based, only the **launch gate** is reachable — this is the entire achievable surface.

### Ads — NONE
0 classes for `com/google/android/gms/ads`, admob, `com/facebook{login,appevents,share,marketing}`. The 3,214 Facebook classes are **Fresco/image-pipeline + jni + fbjni + hermes + yoga + soLoader** (image loading for RN) — **not** ads or analytics. Two corrections to record: Facebook ≠ SDK ads here; `com/facebook` family is the image stack.

### Telemetry — effectively NONE at dex level
- Zero: gms analytics, gms measurement, AppsFlyer, Adjust, Amplitude, Segment, Sentry, Crashlytics.
- Firebase present but only `messaging` (114) + `installations` (81) + a 5-class analytics connector, wired through manifest (`FirebaseInitProvider`, `FirebaseMessagingService`, `FirebaseInstanceIdReceiver`).
- **expo-notifications** registers push tokens with Expo's notification service (JS side).
- Firebase Messaging backs push delivery → **must be kept**; there is no analytics/crash SDK worth removing.
- Expo's JS bundle could still make analytics calls at runtime, but that is inside the Hermes bundle → unreachable from dex (honest limitation, not a claim of "no telemetry exists anywhere").

### Premium — out of reach
Deals/coupons/limits logic is Hermes-compiled. No billing client, no IAP plugin, no dex-visible entitlement anywhere.
→ **No premium patch.** Ads + telemetry passes are defensive no-ops; the single real patch is the PairIP launch-gate bypass.

---

## Phase 2 campaign summary

| App | Protection | Premium feasibility | Ads | Telemetry | Reachable patch |
|---|---|---|---|---|---|
| Pluralsight | PairIP (VM-less standard) + server-authoritative entitlement | server-gated (media URLs server-issued) | none (identifier only) | Firebase/Heap/Mux (surgical) | PairIP bypass + analytics entry-point no-ops |
| Skillshare | none (Auth0 + local `isMember()`) | local UI gates patchable; stream still server-gated | none | Sentry/Blueshift/Singular/Firebase + app-owned `/events/track` | 2 constant-return patches + entry-point no-ops |
| We Love Deals | PairIP-lite **with custom-trial extension** | out of reach (Flutter/Dart) | none | none | PairIP LicenseClient no-op set |
| OferHub | PairIP-lite (subclass gate) | out of reach (Hermes) | none | none (Fresco ≠ Facebook SDK) | `LicenseClient.checkLicense` no-op |

**Community precedent**: no inspectable public patch exists for any of the four apps (searched the local `morphe-community` / `morphe-official-ref` clones, `Escosis/Modded-APKs`, GitHub code/repo search, Exa). MOD claims exist for Skillshare (incl. vc 7706) but expose no diffable patch source. Therefore every hook above was derived from first principles in the APKs and cross-checked against the repo's own proven idioms — none was borrowed.
