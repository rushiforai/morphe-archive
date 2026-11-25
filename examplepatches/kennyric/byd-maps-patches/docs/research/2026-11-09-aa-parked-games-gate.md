# Android Auto parked games: where the gate lives

Date: 2026-11-09 · Inputs: APKMirror APKM builds listed at the bottom.

## Question

The Play Store lists Candy Crush Soda Saga, Angry Birds 2 and Beach Buggy Racing as newly
supported Android Auto parked games. None of them show up as a parked app on alternative
Android Auto installations such as DriveDeck or Gearslip. Reverse engineer where the gate is
and patch the games the way the YouTube "Parked app for Android Auto" patch works.

## Findings

1. **The games contain no car-host allowlist.** The decompiled Java layers have no
   `androidx.car.app` code (Candy, VectorUnit) or only analytics use of it (Rovio
   `com.rovio.beacon.CarConnectionTracker` reads the `androidx.car.app.connection` provider to
   report car state). No `HostValidator`, no host package checks, no display-ID or
   screen-capture guards in app code. There is nothing inside the games to patch.

2. **The gate is in Android Auto (gearhead) itself.** gearhead's `GH.ParkedNativeApps`
   (`defpackage.mlb`) builds its parked-app list from two sources
   (`mlb.e`, log labels "Raw list of native apps found" / "Raw list of opted-in native apps
   found"):
   - every `MAIN`/`LAUNCHER` activity filtered by `ktv.e(abzc, packageName)` — an include-only
     package filter whose list is the `CradleFeature__app_package_list` flag
     (`defpackage.acxf.d()`, `acxh` default baked into the APK);
   - every app that declares `android.intent.category.CAR_LAUNCHER` ("opted-in native apps"),
     the open, documented, allowlist-free path.

3. **The baked-in allowlist default decodes to exactly the seven launch games**, each as
   `package:Display name:<16-byte signature blob>` in a proto with `filterMode: 5`
   (include-only), from `acxh.d()`:
   `com.vectorunit.purple.googleplay`, `com.vectorunit.cobalt.googleplay`,
   `com.outfit7.mytalkingtomfriends`, `com.rovio.angrybirdsfriends`, `com.rovio.baba`,
   `com.king.farmheroessaga`, `com.king.candycrushsodasaga`. The flag is server-updatable, so
   Google can add games without app updates. Alternative hosts can neither receive this flag
   nor verify its signature blobs, so they cannot replicate this discovery source.

4. **The three target games declare `appCategory="game"` but not `CAR_LAUNCHER`.** That
   combination is what Play's AA games listing and gearhead's allowlist need, but it gives
   documented-discovery hosts nothing to find. (Rovio's launcher activity
   `com.rovio.abba.vkquality.VkQualityActivity` is `userLandscape` and `resizeableActivity`;
   VectorUnit's `MainActivity` is `sensorLandscape`; Candy's `StritzActivity` is unspecified
   with full `configChanges` — all three already handle car displays.)

## Patch

Mirror `patches/youtube`'s `youtubeParkedCarApp`: a manifest-only resource patch that adds
`android.intent.category.CAR_LAUNCHER` to every `MAIN`/`LAUNCHER` intent filter of the game
(`patches/shared/CarParkedAppManifest.kt`), keeping `appCategory="game"`. The game then
appears on any host that implements the documented discovery — Android Auto's own opted-in
path, DriveDeck and Gearslip — while behavior on Google's allowlisted path stays unchanged.

Per game: `patches/candysoda`, `patches/angrybirds2`, `patches/beachbuggy`. Each declares the
exact APKM input (version, versionCode, minSdk, signer SHA-256) and depends on
`patches.shared.originalInput` for the preflight checks.

## Inputs used

- `com.king.candycrushsodasaga` 1.330.1 (13300010), signer SHA-256
  `ac7f3b3537e8e6797be7270fa4f9f6a2414e660f51a86efd47c75f00603bc328`
- `com.rovio.baba` 26.7.2 (50303381), signer SHA-256
  `3bf281705398004c6f8e4ba8426c3ba2490385c3aeaf6b05b6440396c6a1a50d`
- `com.vectorunit.purple.googleplay` 2026.11.02 (220), signer SHA-256
  `66b46a40a5647e9e514daaad03eb9467601c7329414f6a146db485a86ea4d124`
- gearhead base.apk pulled read-only from the owner's connected phone for the flag analysis.

## Ads and tracking patches (2026-11-09, second run)

The same three games were then reverse engineered for ads and tracking.

- **Beach Buggy Racing**: one policy flag gates everything. `VuDevicePolicy.areAdsAndAgeChecksEnabled`
  is false on televisions and cars and is also handed to the native engine; the patch forces it
  false, so UMP consent, MobileAds and Play Age Signals never start and all ad load/show calls
  fall to the game's native "unavailable" callbacks. Analytics is a single choke point
  (`VuAnalyticsHelper.logEvent`/`setUserProperty`), plus manifest measurement/permission work.
- **Angry Birds 2**: the Unity C# game reaches ads only through the beacon JNI wrapper
  `com.rovio.beacon.ads.AdsSdk` (load/show). The patch skips load (no SDK ever initializes, C# stays
  in its not-ready state) and makes the show runnable report the game's own no-fill
  `onAdError(1, "ads disabled")` on the UI thread. Tracking: install-referrer attribution
  (`Attribution.getInstallReferrer`), advertising-ID collection (`DeviceInfo.getAsyncIdentifiers`
  /`getAdvertisingId` complete with empty values), the Sentry DSN (removal disables auto-init),
  Google measurement and the advertising permissions. Rovio's own C# telemetry
  (cloud/mist/smoke.rovio.com) runs inside IL2CPP together with cloud save and stays out of scope.
- **Candy Crush Soda Saga**: King's ABM bridge mirrors the same shape. The engine initializes ad
  SDKs through `AdProviderSDKAndroid.init` and fills rewarded and interstitial ads through
  `AdProviderModuleAndroid.load`; the patch reports the SDK's own failure callbacks
  (`onSDKInitializedJNI(addr, false, ...)` / `onLoadFailed(addr, 0, "ads disabled")`). Tracking:
  AppsFlyer start, Braze configure, King's Firebase wrapper (init/logEvent/setUserProperty),
  advertising-ID initializer, install-referrer fetch, plus manifest flags: Firebase deactivated,
  measurement components disabled, attribution receivers/provider disabled, Facebook advertiser
  collection off and AD_ID permission removed.

Both patches per game are selected together with "Parked app for Android Auto" in the verified
sessions. One inline-smali constraint surfaced while building them: the Morphe inline smali
compiler rejects jadx-style commas inside method descriptors — write `onAdError(ILjava/lang/String;)V`,
not `onAdError(I,Ljava/lang/String;)V` — and the Candy SDK-init patch calls the static native
`onSDKInitializedJNI` directly instead of storing a wide field first.

## Verified

- `patches.shared.CarParkedAppManifestTest`: 3/3 green; `:patches:test` and `:patches:build` green.
- Real Morphe desktop CLI sessions (`scripts/validate.py`-style, bundle 1.57.0, `--exclusive`)
  on the original base APKs of all three games: `success: true`, applied
  `["Parked app for Android Auto"]`, none failed. Reports:
  `build/validation/parked-games/{candysoda,angrybirds2,beachbuggy}.json`.
- Patched manifests (aapt2 xmltree): exactly one `android.intent.category.CAR_LAUNCHER`, added
  inside the launcher activity's `MAIN`/`LAUNCHER` intent filter; `appCategory` unchanged from
  the original. The successful sessions also prove `originalInput` preflight (package,
  version, versionCode, signer, minSdk) passes with the Morphe decoder on these inputs.
- `check_docs_app_pages.py` PASS (136 pages) against metadata regenerated from the sources;
  `check_markdown_links.py` PASS (1790 links).
- Ads/tracking acceptance (desktop CLI 1.19.1, bundle 1.57.0, FULL bytecode mode + dex verify):
  per game and combined `Hide ads` + `Disable tracking` + `Parked app for Android Auto`, 12/12
  sessions green (`success: true`, all selections applied). Patched APK checks: AD_ID permission
  gone, `firebase_analytics_collection_deactivated=true`, measurement components `enabled=false`,
  Candy attribution receivers/provider `enabled=false` plus Facebook advertiser collection off,
  Angry Birds 2 Sentry DSN removed, `CAR_LAUNCHER` retained, and the `ads disabled` marker
  strings present in the patched dex files. Reports and patched APKs:
  `build/validation/parked-games/`.

## Outcome (2026-11-09)

Angry Birds 2 was dropped from the bundle after device testing: the game boots and no longer
crashes, but stalls on its loading screen because its ~200MB of game content is a **Play-delivered
asset pack** (Play Core `syncPacks` fails with `PACK_UNAVAILABLE (-2)`). Play only serves that
pack to installations whose signing certificate matches the Play listing, so a re-signed (patched)
install can never fetch it. This is a Play Store content-delivery restriction, not a patch
defect — no patch-level or Play Integrity workaround applies. Candy Crush Soda Saga and Beach
Buggy Racing ship all content inside the APKM and are unaffected.

## Not yet verified

No patched APK has been installed on a phone with a car host attached, so the games being
listed on DriveDeck/Gearslip car screens after patching is unproven. Car-screen play sessions
remain an acceptance step for a later connected session.

## Checkout notes (pre-existing, untouched)

- `patches-list.json` is release-owned and left unchanged; validating docs used a regenerated
  copy with the owner's unrelated, untracked `deezertv` work filtered out.
- `docs/site/*/apps/youtube.md` vs released metadata (Automotive layout default) is stale on
  main and self-heals at the next release; `check_docs_site.py` fails identically on a clean
  HEAD checkout.
