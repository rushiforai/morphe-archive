# Android Auto parked games: GameSnacks, Angry Birds Friends, Angry Birds 2, Draw a Stickman EPIC 3

Date: 2026-11-23 · Inputs: the four APKCube archives on the operator's desktop.

This continues `2026-11-09-aa-parked-games-gate.md`. That pass established that the car-host gate
is not inside the games: Android Auto's own parked-app list is built from a Play-managed
`CradleFeature__app_package_list` allowlist plus the open `android.intent.category.CAR_LAUNCHER`
path, and DriveDeck's `NativeAppCatalog` admits exactly `CAR_LAUNCHER` launcher activities whose
application category is game or video. There is no app-side allowlist to remove.

## Inputs

| App | Package | Version | Build | Signer SHA-256 |
| --- | --- | --- | --- | --- |
| GameSnacks | `com.google.android.apps.automotive.gamesnacks` | 1.40.827663177 | 40 | `d2fd490eb3ee61e4a129d8f6d948935e79e299a1d8290aa5e965e3c1329faab5` |
| Angry Birds Friends | `com.rovio.angrybirdsfriends` | 14.9.0 | 423911 | `3bf281705398004c6f8e4ba8426c3ba2490385c3aeaf6b05b6440396c6a1a50d` |
| Angry Birds 2 | `com.rovio.baba` | 26.7.3 | 50305634 | `3bf281705398004c6f8e4ba8426c3ba2490385c3aeaf6b05b6440396c6a1a50d` |
| Draw a Stickman: EPIC 3 | `com.hitcents.drawastickmanepic3` | 1.13.19873 | 19873 | `25a7ff8640e10732dde4d88f4cdf005b58a5e08d31a3a55a2a0ba771e64c334a` |

## Parked-app findings

1. **Angry Birds Friends and Angry Birds 2 declare `appCategory=0` (game) but no
   `CAR_LAUNCHER`.** Both keep the 2026-11-09 shape, so the manifest-only parked-app patch applies
   unchanged in form: `CAR_LAUNCHER` goes into the launcher activity's `MAIN`/`LAUNCHER` filter and
   the existing category is left alone.
2. **Draw a Stickman: EPIC 3 already is a parked app.** Its launcher activity
   `com.unity.lostcryptlargescreenexample.LargeScreenPlayableActivity` carries `LAUNCHER` and
   `CAR_LAUNCHER`, the application declares `appCategory="game"`, `android:resizeableActivity` is
   true, orientation is `fullUser`, and `android.hardware.type.automotive` is already
   `required="false"`. No manifest patch is needed, so none is offered; the page says so explicitly.
3. **GameSnacks is an Android Automotive OS build, not an Android Auto one.** It is a 23 MB WebView
   shell around `https://gamesnacks.com/embed/aae` (`launchUrl` string, `GamesnacksActivity`), with
   `android.hardware.type.automotive` declared `required="true"`. On a phone that requirement blocks
   the install that a car host needs, so the parked-app patch first flips that one feature to
   `required="false"` and then adds `CAR_LAUNCHER`. `appCategory=0` is already correct.
4. **GameSnacks is not PairIP-protected.** The APK has no `lib/` directory and no PairIP assets; it
   ships five plain DEX files and a stock `stamp-cert-sha256`. There is also no local ad or analytics
   SDK: the only permissions are `INTERNET`, the only third-party services are Play Billing and
   Phenotype, and the games themselves load inside the WebView. No ad or tracking patch is offered,
   because there is nothing local to remove; the page states that the portal's own page content is out
   of reach.

## Ads findings

- **Rovio games (both):** every ad runs through the beacon JNI bridge
  `com.rovio.beacon.ads.AdsSdk`, whose public `load(String)` and `show()` are the only entries the C#
  side calls. Each one posts a synthetic runnable through `Globals.runOnUiThread`; the real work is
  `AdsSdkBase.load(Map)` / `AdsSdkBase.show()` from `lambda$load$0` / `lambda$show$2`. The 26.7.2
  patch rewrote those lambdas, but in these builds `lambda$show$2` has a single register file slot
  (`registers 1` in Friends, `registers 2` in Baba with one local), so a `const/4` + `const-string`
  injection cannot fit there without corrupting `this`.
  The patch therefore replaces the two *public* entries with a report of the game's own
  `AdsSdkConstants.ERROR_NO_FILL` / `ERROR_SHOW_FAILED` object, delivered through the existing
  `AdsSdk.onAdError(AdsSdkConstants$Error)` adapter. The beacon error objects carry both code and
  message, so the injection needs one scratch register, which every one of these methods has. C#
  calls these entries from Unity's main thread, which is the activity's UI thread, so the callback
  arrives on the same thread `runOnUiThread` would have used.
- **Draw a Stickman:** the IL2CPP payload contains only `UnityAdsEngine*` ad symbols; there is no
  AppLovin, IronSource or Audience Network call in native code. Those SDKs ship as Unity Ads
  mediation adapters. Every placement therefore funnels through
  `com.unity3d.services.ads.UnityAdsImplementation`, and the patch sits on its four entries:
  `initialize` completes the callback locally without ever calling `UnityServices` (no
  configuration, gateway or metrics request), `isInitialized`/`isSupported` report true so the C#
  state machine proceeds, `load` reports `UnityAdsLoadError.NO_FILL` and `show` reports
  `UnityAdsShowError.NOT_READY`. No adapter is reached because nothing is ever loaded.

## Tracking findings

- **Rovio games (both):** identical beacon shape. `DeviceInfo.getAdvertisingIdentifier`,
  `getAdvertisingTrackingEnabled` and `getAppSetId` are the three private helpers behind the
  advertising-identifier callback; `Attribution.hasQueriedReferrer` gates
  `DeviceInfo.shouldQueryInstallReferrer`, and `Attribution.getMetaInstallReferrer` is the
  Facebook/Instagram referrer JSON. All five are turned into constants with their original threading
  intact. Manifest work: the shared measurement/permission helper plus, new in this pass, removal of
  the Privacy Sandbox `ACCESS_ADSERVICES_*` permissions and `AutoLogAppEventsEnabled` /
  `AdvertiserIDCollectionEnabled=false`. Angry Birds 2 additionally keeps the Sentry DSN present but
  empty, because removing the meta-data makes the auto-init provider crash.
  The earlier `getAdvertisingIdentifier`/`getAppSetId`-as-public-methods and `hasQueriedReferrer`
  call-shape from 2026-11-09 no longer matches: those helpers are private statics called from
  `getAsyncIdentifiers`/`getAdvertisingId`, so the patch was re-derived against these builds.
- **Draw a Stickman:** no Java-side analytics at all — no Firebase Analytics, no Crashlytics, no
  measurement receivers. What the game ships beyond Unity Ads is three SDKs wired into the manifest:
  `AppLovinInitProvider` (initOrder 101, initializes MAX before game code), the IronSource
  `IronsourceLifecycleProvider`, and the Facebook Unity plugin. The tracking patch removes the
  advertising and install-referrer permissions, disables both launch providers and turns off
  Facebook's advertiser identifier and event upload. Facebook stays available for sign-in and Play
  Billing is untouched.

## Angry Birds 2 content pack

The 2026-11-09 pass withdrew Angry Birds 2 because `Play Core syncPacks` failed with
`PACK_UNAVAILABLE` for the re-signed install: the APKMirror input shipped no asset pack at all.
This APKCube archive includes `split_UnityDataAssetPack.apk`, whose manifest declares
`dist:type="asset-pack"` with `dist:delivery/install-time` and `dist:fusing include="true"`. A fused
install-time pack is installed by the package installer together with the base APK, so a sideloaded
patch keeps the content. The patched output carries the pack's `assets/aa/...` bundles, including
`assets/aa/catalog.bin`. This removes the delivery blocker; whether the Unity Addressables layer is
happy with a sideloaded fused pack must still be confirmed on a device.

## Patch set

| App | Folder | Patches |
| --- | --- | --- |
| GameSnacks | `patches/gamesnacks` | Parked app for Android Auto |
| Angry Birds Friends | `patches/angrybirdsfriends` | Parked app for Android Auto, Hide ads, Disable tracking |
| Angry Birds 2 | `patches/angrybirds2` | Parked app for Android Auto, Hide ads, Disable tracking |
| Draw a Stickman: EPIC 3 | `patches/stickman3` | Hide ads, Disable tracking |

Shared helpers: `patches/shared/CarParkedAppManifest.kt#allowInstallOutsideAutomotive`,
`patches/shared/RovioBeaconAds.kt`, `patches/shared/RovioBeaconTracking.kt`, and
`patches/shared/GameTrackingManifest.kt#removePermissions` / `#removeAdServicesPermissions`.

## Verified

- `:patches:build` green; bundle `patches-1.101.2.mpp` rebuilt on 2026-11-23.
- Desktop CLI 1.19.1 sessions with `--exclusive --validate --bytecode-mode FULL` on the original
  inputs, all `success: true`, no failed patches:
  - GameSnacks APK → `Parked app for Android Auto`
  - Angry Birds Friends APKS → all three patches
  - Draw a Stickman EPIC 3 APKS → `Hide ads`, `Disable tracking`
  - Angry Birds 2 APKS → all three patches (42 s, 716 MB output including the asset pack)
- Patched manifests (aapt2 xmltree): GameSnacks `hardware.type.automotive required=false` plus one
  `CAR_LAUNCHER` and unchanged `appCategory=0`; Angry Birds Friends and Angry Birds 2 one
  `CAR_LAUNCHER`, zero remaining `AD_ID` / `ACCESS_ADSERVICES_*` / install-referrer permissions, the
  three `com.google.android.gms.measurement.*` components `enabled=false`,
  `firebase_analytics_collection_deactivated=true`, Facebook advertiser flags `false`, and (Angry
  Birds 2) `io.sentry.dsn=""`; Draw a Stickman zero advertising permissions,
  `AppLovinInitProvider` and `IronsourceLifecycleProvider` `enabled=false`, Facebook flags `false`.
- Patched bytecode (baksmali on the patched APK): `AdsSdk.load`/`show` now report
  `ERROR_NO_FILL`/`ERROR_SHOW_FAILED`; `DeviceInfo.getAdvertisingIdentifier`/`getAdvertisingTrackingEnabled`/`getAppSetId`
  and `Attribution.hasQueriedReferrer`/`getMetaInstallReferrer` return constants;
  `UnityAdsImplementation.initialize` completes locally, `load` reports `NO_FILL`, `show` reports
  `NOT_READY`, `isInitialized`/`isSupported` return true.
- Native libraries and the Angry Birds 2 asset pack survive the rebuild (`libil2cpp.so`,
  `libunity.so`, `libmain.so`, `assets/aa/catalog.bin` present in the patched outputs).
- `:patches:test` for `patches.shared.*` green, including new `GameTrackingManifestTest` cases and
  the `allowInstallOutsideAutomotive` case in `CarParkedAppManifestTest`.
- `python3 -m unittest discover -s tests`: 579 tests OK (45 skipped).
- `scripts/check_docs_app_pages.py`: PASS, 172 pages, against metadata regenerated locally from the
  sources (`:patches:generatePatchesList`).
- `scripts/check_markdown_links.py`: the four reported misses are pre-existing and unrelated
  (`docs/navigation-aa-exit-voice-validation.md`, two Gboard handover anchors); no new page is
  reported.

## Device acceptance (2026-11-23)

Installed from the engineering bundle on the owner's phone and launched:

- **GameSnacks: works.** Installs on the phone with the relaxed automotive feature and opens its
  portal.
- **Draw a Stickman: EPIC 3: works.** No ads observed, and the game runs.
- **Angry Birds Friends: fails.** It shows "OH NO! WHAT HAPPENED? / OOPS! SOMETHING WENT WRONG! /
  Error Code: 00000000000000000000000000000000".
- **Angry Birds 2: fails.** It shows "Oops! Something went wrong. Sorry! / Error: 3090757077" with a
  timestamp and a User ID copy button.

### Angry Birds Friends: the launcher name is misleading, the build is a normal Play build

`com.rovio.angrybirdsfriends` declares exactly one `MAIN`/`LAUNCHER` activity and aapt2 names it
`com.amazon.securebrowser.SecureBrowserActivity`. That name does **not** mean an Amazon Appstore
build: the class `extends com.unity3d.player.UnityPlayerActivity`, so it is the game's own Unity
activity, kept in an Amazon-named package so it can receive the Amazon Prime loot-drop auth reply
(`UnitySendMessage("AmazonPrimeLootDropPopup(Clone)", "OnAuthReply", ...)`). The manifest also uses it
as `custom_notification_android_activity` for push notifications. Rovio ships no signature or
install-source verification in `com.rovio.*`, so nothing here rejects a re-signed install.

An earlier revision of this note claimed the archive was an Amazon Appstore DRM build and the patch
rejected it. That was wrong, based on a name match rather than the class hierarchy; the rejection was
removed in the same session.

### Angry Birds 2: launcher is the normal Rovio activity

`com.rovio.abba.vkquality.VkQualityActivity`, the standard Rovio launcher. Both games are ordinary
Unity builds that boot into their own game code.

### Leading hypothesis, not yet confirmed: Play licence verification

Both games run Android LVL through the same beacon class that carries attribution:
`Attribution.checkLicense(LicenseCheckListener)` binds Play's licensing service, retries on codes
-1/4/257 up to three times and always ends by calling `listener.onSuccess(code, message, extra)`.
A sideloaded install is not a Play-managed install, so that response can be NOT_LICENSED, and Rovio's
C# owns whatever it shows next. Candy Crush and Beach Buggy Racing, which work on the same phone,
carry no such check.

This is a hypothesis, not a finding. It is also the reason the first acceptance step below is a
control run of the **unpatched** archives: if the untouched builds show the same dialog, the patches
are not involved and the fix would be a licence-result patch instead of an ads or tracking change.

### Angry Birds 2: cause not yet established

Nothing in the applied patches has been shown to cause that dialog, and it has not been excluded
either. A bisect is prepared:

- `Parked app for Android Auto` only — no bytecode and no tracking manifest change.
- `Parked app for Android Auto` + `Hide ads` — adds the beacon ad-bridge change, no tracking.

If the parked-only build fails too, the failure is in the input or Rovio's own bootstrap rather than
in this patch set. Reward-ad behaviour also remains unobserved in a running build.

## Not yet verified

- No car host has been attached to a working install of any of these four, so the car-screen listing
  itself is still unproven for all of them.
- Angry Birds 2 loading its fused asset pack after a re-signed sideload is unconfirmed.
- Angry Birds Friends is blocked on a Google Play input.
- Reward ad flows are expected to close on the game's own no-fill path, but that has not been
  observed in a running build.

## Checkout notes

- `patches-list.json` was regenerated locally for the docs and metadata checks and left uncommitted;
  it is release-owned.
- `docs/site/*/reference/catalogue.md`, the entertainment index and the site home page are
  release-owned and were not changed; they regenerate from metadata at the next release.
