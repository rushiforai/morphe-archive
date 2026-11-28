# Phase 2 patch analysis devlog

Rules: append-only. Record what failed, why, the attempted fix, and the evidence that the fix worked.

## 2026-11-18 — Pluralsight recon

### Failed: phase2 checklist write was not visible at the expected path
- Attempt: wrote `docs/tasks/phase2-analysis.md` early in the campaign.
- Symptom: later filesystem check reported the file missing and `docs/tasks/` absent.
- Fix: rewrote the checklist as `docs/phase2-analysis.md` and verified the write response.
- Result: checklist now exists at `docs/phase2-analysis.md`.

### Missing: mobile-reverse global references
- Attempt: searched `/home/madusha` for `field-journal.md` and `tool-index.md` referenced by the skill.
- Symptom: neither file exists in the local agent skill installation.
- Fix: used the available `morphe-patching` references, repo precedent corpus, and the installed Android RE toolchain instead; recorded the missing files rather than inventing their contents.
- Result: recon can proceed; this is a tooling limitation, not an APK finding.

### Failed: first Pluralsight decompile launch
- Attempt: launched Apktool and JADX with a not-yet-created `/home/madusha/dev/work/phase2/pluralsight` working directory.
- Symptom: both processes exited before decompilation because `workdir` did not exist.
- Fix: created the work directory and restarted each command once.
- Result: Apktool completed successfully. JADX completed with 11,514 partial-decode errors, but produced 28,452 mapped classes; local source/resource inspection remains available.

### Failed: primary web-search provider returned HTTP 402
- Attempt: used the harness web-search integration for Pluralsight/Skillshare community-patch searches.
- Symptom: the provider rejected the request with HTTP 402, so it returned no search evidence.
- Fix: switched to the available Exa/GitHub CLI backends and exhaustive local searches of all seven community clones plus the official reference clone.
- Result: the app/protection-class searches continued without inventing results; negative repository findings remain explicitly recorded.

### Failed: all three parallel Pluralsight subagent traces returned HTTP 429
- Attempt: dispatched entitlement-to-media, ads/telemetry, and PairIP subagents in parallel.
- Symptom: provider rate limiting (HTTP 429) killed all three before any evidence returned.
- Fix: campaign rule adopted — no further subagent dispatch; all analysis inline with small targeted searches.
- Result: Pluralsight analysis completed inline; the rule is now recorded in project memory (#116).

### Failed: premium-wall resource ID anchored a fingerprint attempt
- Attempt: tried to fingerprint around string resource `0x7f110108` (`error_message_premium_account_required`).
- Symptom: no DEX constant references the ID — only the generated `R` field exists, so no call path ties to it.
- Fix: abandoned that anchor; traced `SubscriptionInfo` / `CourseAccess` repository boundaries instead.
- Result: anchor never used in any patch; recorded so future passes don't repeat it.

### Failed: JADX omitted primary Pluralsight implementation classes
- Attempt: read `SubscriptionsRemoteDataSourceImpl` / `CourseRepositoryImpl` etc. from the JADX tree.
- Symptom: JADX emitted only the coroutine inner classes for those files.
- Fix: switched those boundaries to APKTool smali; resolved renamed parents through inner-class `.source` metadata.
- Result: full R8 rename map recorded (`remote.datasourceImpl.v`, `repositoriesImpl.g`, …).

### Failed: Pluralsight Contentsquare removal planned as its own patch
- Attempt: planned a dedicated Contentsquare-disable patch.
- Symptom: zero `com/contentsquare/**` classes exist — only Heap's optional bridge reflection + Heap's endpoint string mention the name.
- Fix: dropped the separate patch; Contentsquare is not bundled.
- Result: telemetry scope corrected to Firebase + Heap + Mux only.

### Outcome: Pluralsight premium classified server-authoritative
- Evidence: media URLs returned by server in `VideoResponseDto(url, rankedOptions, sessionId)`; offline path via authenticated `/v2/library/videos/offline`; downloads decrypted locally but sourced from server-issued URLs.
- Decision: no premium patch; PairIP bypass + telemetry surgical removal only, with an honest description.

## 2026-11-19 — Skillshare recon + low-level patch planning

### Failed: initial Facebook-SDK telemetry assumption
- Attempt: counted 537 `com/facebook/*` classes as analytics/ads for the tracker pass.
- Symptom: package breakdown showed **all 537 are `com.facebook.stetho`** — a debug inspector, no manifest provider, no app-owned init.
- Fix: reclassified Stetho as non-tracking (optional removal); re-inventoried telemetry properly.
- Result: real telemetry set is Sentry + Blueshift + Singular + Firebase + app-owned `/events/track`.

### Failed: "Mixpanel" counted as an SDK
- Attempt: treated `com/skillshare/Skillshare/util/analytics/mixpanel/*` as the Mixpanel SDK.
- Symptom: `com/mixpanel` package does not exist (0 classes); `MixpanelTracker` only serialises events and posts them to the app's own `POST /events/track` endpoint.
- Fix: logged as app-owned telemetry naming convention only.
- Result: no Mixpanel entry point in the patch plan.

### Failed: Blueshift init search via `Blueshift.init(` and manager class
- Attempt: located Blueshift init through `BlueshiftManager` (the app-owned wrapper).
- Symptom: `BlueshiftManager.a/b` contain only SSLog logging + Firebase token resync; zero `Blueshift;->init(` call sites tree-wide.
- Fix: enumerated `Blueshift.smali` public methods → `initialize(Lcom/blueshift/model/Configuration;)V`; grep found the single call site at `Skillshare.smali:1587`.
- Result: init anchor pinned (`Skillshare.smali:1587`), plus `trackAppOpen` at `:438`.

### Blocked: proving the Skillshare stream endpoint honours/denies a patched free user
- Attempt: wanted static proof that `GET /sessions/{id}/stream` gates non-members.
- Symptom: server-side behaviour is not in the APK; no device run allowed yet (static-first campaign rule).
- What is proven client-side: `session_id` = `VideoMetadata.id` (int) is present for locked videos, `videoHashedIDCf` is never used to build URLs, and the lock flag is server-decided via `video_hashed_id` nullness — so the server demonstrably tracks per-user entitlement.
- Decision: classify premium playback as expected server-gated (honest description, same as Pluralsight) while shipping the two cheap UI-gate patches; revisit only with a device probe.

### Outcome: Skillshare classified, 2 patch anchors + telemetry inventory recorded
- `AppUser.isMember()Z` (16 invoke sites) and `VideoMetadata.isLocked()Z` both have 8-instruction bodies — trivial constant-return patches.
- Telemetry init anchors pinned: SentryAndroid `Skillshare.smali:812`, Singular init `:1311`, Blueshift init `:1587`, app-owned Firebase sink `FirebaseUserUpdater`.
- Risks recorded: Blueshift carries rich-push display (toggle-gated); Firebase Messaging/Installations must survive (token resync feeds Blueshift).

## 2026-11-19 — We Love Deals recon

### Decompile clean
- Attempt: apktool + jadx on `We-Love-Deals_1.2.0_apkcube.apks` (extracted `apks_extracted/`, base + 30 split APKs).
- Symptom: none — apktool exit 0, JADX exit 0 with only **5 errors** (1787 classes, 1 dex).
- Result: smallest app of the batch; cleanest decompile.

### Key structural finding: app is Flutter
- Attempt: inventoried plugins by reading `GeneratedPluginRegistrant.smali`.
- Symptom: the registrant has no literal list — plugin names only appear in `catch:` error strings.
- Fix: extracted the 15 plugin names from the error-string constants instead of looking for a normal array.
- Result: plugin list captured (app_links, file_picker, image_compress, inappwebview, lifecycle, secure_storage, fluttertoast, geolocator, google_maps_flutter, jni, jni_flutter, share_plus, shared_preferences, sqflite, url_launcher) — all UI/peripheral, **no in_app_purchase, no firebase, no analytics plugin**.

### Implication recorded: logic ceiling
- All app logic is AOT Dart in `libapp.so` (8.2 MB, `split_config.arm64_v8a.apk`) → premium/ads/telemetry are unreachable from dex.
- `com/thina/welovedeals/MainActivity.smali` is the only app-owned class.

### PairIP variant resolved to LITE with a trial extension
- Verified: only `com/pairip/application/` + `com/pairip/licensecheck/` (37 files) exist; no libpairipcore.so, no VMRunner/StartupLauncher → lite variant.
- Also found a **trial extension** the other pairip-lite apps didn't have: `LicenseClient.stopTrial(Context)V`, `TrialClient.checkTrialStatus(Context)I`, `RepeatedCheckMetadata`.
- Decision: bypass via the proven "satisfy the license state (set the pass pref / route through stopTrial)" idiom rather than blind-killing `LicenseClient`, which would also kill `checkTrialStatus` and risk a crash loop on the trial path. Must verify the exact pref key + "passing" value in `LicenseContentProvider`/`LicenseClient` before writing the patch.

### Outcome: We Love Deals classified — launch-gate-only target
- PairIP-lite bypass is the only real patch available; ads and telemetry passes are defensive no-ops (0 classes of every SDK searched).
- Premium out of reach (Dart-side) — recorded honestly rather than claimed.

### Correction: "satisfy the trial" assumption was wrong
- Attempt: planned to route `checkLicense` through `LicenseClient.stopTrial(Context)` as the satisfier.
- Symptom: reading the body showed `stopTrial` → `lambda$stopTrial$0` → `handleTrialEnd()`, which *ends* the trial (sets `customTrialEndTriggered=true`, `licenseCheckState=CHECK_REQUIRED`) and forces a real network check — the opposite of satisfying.
- Fix: replaced with "force `LOCAL_CHECK_OK` state + no-op the failure/exit paths", grounded in `isLocalCheckPassed()` (gates on `LOCAL_CHECK_OK || LOCAL_CHECK_REPORTED`) and `processResponse` (paywall on code 2, exit on catchall).
- Result: this build is a newer PairIP variant than the repo's `killPairIpFull` targets (custom-trial + `reportSuccessfulLicenseCheck` + `localCheckEnabled`), so the patch must follow the table in `phase2-analysis.md`, not the shared unconditional idiom.

### Key low-level blocker recorded: responses are cryptographically real
- `LicenseResponseHelper.validateResponse(Bundle, packageName)` runs against the plaintext RSA `licensePubKey` field in `LicenseClient`.
- Consequence: no fake "licensed" response is possible in-process — the bypass must no-op `processResponse` (paywall + shutdown paths) instead. Documented so nobody attempts a forged payload.

### Verified no native VM lib
- `split_config.arm64_v8a.apk` ships only `libapp.so`, `libflutter.so`, `libdartjni.so`, `libdatastore_shared_counter.so` — zero pairip native libs → confirms lite variant beyond the class check.

## 2026-11-19 — OferHub recon

### Failed: Facebook class count read as an ads/analytics SDK
- Attempt: inventoried telemetry; found 3,214 `com/facebook/*` classes.
- Symptom: initially implied a Facebook SDK install (login/appevents/ads).
- Fix: enumerated `com/facebook/` subpackages → `animated binaryresource cache callercontext common datasource debug device drawable drawee fbcore fbjni fbreact fresco hermes imageformat imagepipeline imagepipelinebase imageutils infer jni memory nativefilters nativeimagetranscoder proguard react soloader systrace webpsupport widget yoga` — **all Fresco/image-pipeline + jni + RN glue**; zero `login`/`appevents`/`share`/`marketing`.
- Result: OferHub has no Facebook SDK at all — the count was image loading. Telemetry/ads passes recorded as defensive no-ops.

### Key structural finding: React Native / Expo with a Hermes bundle
- Verified: split ships `libreactnative.so`, `libhermes.so`, `libexpo-modules-core.so`, `libappmodules.so`; `assets/index.android.bundle` (1.2 MB) starts with Hermes magic `c61f bc03 c103 191f`.
- Only 13 app-owned classes, both stock Expo template (`MainApplication.onCreate` = release level + `loadReactNative` + `ApplicationLifecycleDispatcher`), so **no app-owned SDK init to hook**.
- Result: dex ceiling = PairIP + manifest components; JS-level logic (and any JS analytics) is out of reach.

### Discovered: PairIP gate is a *subclass*, not a manifest swap
- Attempt: planned to swap `android:name` back to the real Application class as part of the bypass.
- Symptom: reading the smali showed `Lcom/pairip/application/Application; .super Lcom/oferhub/app/MainApplication;` — PairIP's class **extends** the real RN Application and only interposes `attachBaseContext`.
- Fix: bypass reduced to a single no-op of `LicenseClient.checkLicense(Context)V`; `super.attachBaseContext` chains to `MainApplication` and RN boots normally.
- Result: minimal, safest possible patch for this app — no manifest edit, no RN breakage. Contrast: for apps whose pairip Application extends `Landroid/app/Application;` (We Love Deals) a plain no-op is still sufficient because the real class is not needed as the app class.

### Verified OferHub's PairIP is the simpler lite variant
- Field/method anchors match the repo's proven block: `licenseCheckState:Lcom/pairip/licensecheck/LicenseClient$LicenseCheckState;` with the 5-value enum, `localCheckEnabled`, and `{initializeLicenseCheck, connectToLicensingService, processResponse, startPaywallActivity, startErrorDialogActivity, handleError, scheduleAppShutdown, performLocalInstallerCheck}`.
- No `VMRunner`/`StartupLauncher`/`libpairipcore.so`, and **no custom-trial extension** (no `TrialClient`/`stopTrial`/`handleTrialEnd`) — that extension exists only in We Love Deals. Recorded so the We Love Deals plan is not copied here.

### Outcome: OferHub classified — launch-gate-only target
- `LicenseClient.checkLicense` no-op is the only patch; ads and telemetry passes are defensive no-ops (0 classes of every SDK searched, Fresco excluded as non-SDK).
- Premium out of reach (Hermes) — recorded honestly rather than claimed.

