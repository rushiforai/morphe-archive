# Reference notes — com.one.goodnight 1.345.0 (version code 634)

Source: `Goodnight_ Voice Chat & Dating_1.345.0_APKPure.xapk` (APKPure, XAPK:
base `com.one.goodnight.apk` ~134MB + `config.arm64_v8a/en/mdpi` splits).
XAPK `manifest.json`: `package_name: com.one.goodnight`, `version_name: 1.345.0`,
`version_code: 634`, `min_sdk: 24`, `target_sdk: 36`.

Method: parsed with Python stdlib only (`zipfile` + `struct` dex `type_ids`
walk + raw byte search). No apktool/jadx here (no Java in Termux), so there
is NO smali yet — every identifier below is real (from dex/JS bytes), but
fingerprints still need smali-level confirmation before writing patches.

## App shape

- React Native (plain, non-Hermes `assets/index.android.bundle`, ~15.7MB,
  starts with `var __DEV__=false`). Most product logic is in this JS.
- Thin native shell: `com.one.goodnight.MainActivity`, `MainApplication`,
  heavily obfuscated single-letter classes (`Lcom/one/goodnight/a`..`z`,
  `A`..`H`) in `classes7.dex`, plus named RN bridge modules (same dex).
- `gatewayprotocol/v1` (~704 types, mostly `*OuterClass` protobuf) looks like
  the ad-stack protocol (`AdDataRefresh*`, `AdFormat*`,
  `AdOperationsConfiguration*`, `AdPlayerConfig*`). No VIP/user messages seen
  in class basenames — entitlement is NOT obviously in this protocol.
- 8 main dex files (`classes.dex`–`classes8.dex`, ~55MB total) + bundled
  `assets/audience_network/classes*.dex` (Meta Audience Network).

## Patch 1 — Premium/VIP unlock (root entitlement; server-driven)

- `membership` object fields (JS): `is_premium`, `is_premium_disco`,
  `is_star_premium`, `is_match_premium`.
- `isAnyPremium()` = OR of all four; `isPremium()` =
  `membership.is_premium || membership.is_premium_disco`.
- `updateUserMembership(membership)` sets `user.membership`, emits
  `AppCenterUserChanged`.
- Server endpoints (JS): `/api/me/vip_info` (`fetchVIPInfo`),
  `/api/me/vip_badge_info_v2` (`fetchVIPInfoV2`). VIP state comes from backend.
- Billing client-side = Google Play Billing (`com/android/billingclient/api/*`,
  `queryPurchases`-era API present). `BILLING` + `CHECK_LICENSE` permissions.
- Paywall analytics constants (JS): `paywall_viewed`, `purchase_initiated`,
  `purchase_completed`, `purchase_canceled`, `purchase_failed`; product kinds:
  `cans`, `disco`, `premium_disco`, `intro`, `spotlight`.
- Consequence: client patch can flip `isPremium`/`membership`, but features
  gated by server responses may still refuse. Device test decides per feature.
  Smali target: the RN-bridge/JNI path that delivers `membership`, or the
  `isPremium` getter if it exists natively (JS shows it as a JS getter, so the
  native patch point is more likely the membership delivery / API parse).

## Patch 2 — Blur removal (profile photos)

- Blur is the "star" game mechanic, NOT an image transform flag. Locale
  strings (JS): "Collect 7 stars to reveal the blurred photos of yourself and
  the other user." / "As long as you chat once a day, you can earn one-star".
- No `avatar_blur`/`unblur`/`mosaic` identifiers anywhere; `blur`×164 in JS is
  almost all RN text-input blur. So the patch point is the star-count/reveal
  gate (find: star count state, `playCountdown`, `notPlay`/`notPlayToday`
  branches), not a blur filter.
- Smali/JS target: star-balance getter or the reveal-condition check.

## Patch 3 — Chat unlock (chat without premium)

- No `chat_lock`/`message_limit`/`need_vip` strings. Currency = "cans"
  (`consumeUserCoin`, "Not Enough Cans" dialogs, `free_cans_to_new_subscriber`
  endpoint `/api/me/free_cans_to_new_subscriber`).
- Matching gate: `dailyLimitUpgradeDialog_*` — "Purchase cans to get more
  telepath tickets or upgrade to "Goodnight Disco" for unlimited matching!".
- `who_views_you` ×14 (+`whoviewsyou` ×2) — "who views you" is a separate
  gated surface, likely same membership flag.
- Smali/JS target: telepath-ticket count check / cans-deduction check on
  match/chat send. Standalone from patch 1 by design.

## Patch 4 — Call timer (free-call limit)

- Locale strings (JS): "Free calls are limited to 3 minutes, the user can
  choose whether to extend the free time" (`angelCallInDialog_desc`);
  `angelRadioFreeEndDialog_title: 'Free Trial Ended'`; "Listening to the call
  requires at least {0} Cans" (`angelRadioNoCansDialog_desc`).
- `calltime`/`calltimeout` dex hits are RN-framework `callTimers` internals —
  NOT the app timeout. Real anchors are the dialog keys above + the free-time
  countdown state behind them. Native voice = Agora (`io/agora` ~600 types,
  `com.one.goodnight.AgoraService`, `AgoraModulesManager`).
- Smali/JS target: free-call countdown / `angelRadioFreeEnd` trigger.

## Ads (context for later)

- Mediation: AppLovin MAX (~4k `applovin` refs), ironSource/LevelPlay
  (`InterstitialAdModulesManager`, `RewardedAdModulesManager`,
  `NativeBannerViewManager`, `VponBannerViewManager` — all real classes in
  `com.one.goodnight`), AdMob, Vungle, Bigo (`sg/bigo` 2150 types, incl.
  `RealtimeBlurLinearLayout`), Mintegral, Inmobi, Pangle, Chartboost, Unity.
- `shouldShowAd` = `!adDisabled && !isAnyAngel()`; `shouldShowMatchAd` also
  false when any premium flag set — i.e. patches 1 and ads interact.

## Permissions of note

`BILLING`, `CHECK_LICENSE`, `CAMERA`, `RECORD_AUDIO`, `ACCESS_FINE_LOCATION`,
`SYSTEM_ALERT_WINDOW`, `RECEIVE_BOOT_COMPLETED`, `POST_NOTIFICATIONS`.

## Patch 0 (prerequisite) — Play license bypass: gate mapped from real smali

Symptom on device: patched app redirects to the Play Store and exits.
Cause: PairIP protection in `classes2.dex`, wired into the app entry point:

- `Lcom/pairip/application/Application;` extends `MainApplication`; its
  `attachBaseContext` calls, in order: `VMRunner.setContext`,
  `SignatureCheck.verifyIntegrity` (throws `SignatureTamperedException` when
  the APK signature differs from Play — always true for patched APKs; allows
  `expectedSignature` / `expectedLegacyUpgradedSignature` /
  `expectedTestSignature` / hardcoded
  `Vn3kj4pUblROi2S+QfRRL9nhsaO2uoHQg6+dpEtxdTE=`), then
  `LicenseClient.checkLicense`.
- `LicenseClient.checkLicense` → `performLocalInstallerCheck()Z`: SDK<30 or
  no PackageManager bypasses (returns false); system/updated-system app
  passes (returns true); otherwise requires installing package ==
  `com.android.vending`, else "Local install check failed due to wrong
  installer." On failure the LVL path runs and `LicenseActivity` opens the
  Play paywall (`showPaywallAndCloseApp` via `paywallintent` PendingIntent,
  `onStart` ordinal != 0) then `closeApp`/`exitApp` (`System.exit`).
- Same `checkLicense` is also called from
  `LicenseContentProvider.onCreate`, so patching the method itself (not the
  call sites) covers both.
- Patch (`patches/.../license/`): return-early `return-void` in
  `SignatureCheck.verifyIntegrity(Landroid/content/Context;)V` (anchor strings
  `SHA-256`, `Apk signature is invalid.`) and in
  `LicenseClient.checkLicense(Landroid/content/Context;)V` (anchor strings
  `Cannot check license with null context.`,
  `Skipping license check in isolated process.`). All four strings and both
  method signatures verified unique (x1) in 1.345.0 `classes2.dex`.
- Open: PairIP `VMRunner`/`VmDecryptor` regions and any server-side license
  re-checks; device test decides.

## TODO (needs smali)

1. ~~Get smali for 1.345.0 (tooling decision pending)~~ DONE (option a):
   androguard 4.1.4 installed via `pip install --no-deps` + `loguru`,
   `apkInspector`, `pydot`, `networkx`, `pygments`, `click`, `asn1crypto`,
   `mutf8`, `colorama` (system `python-lxml` reused). NOTE: full `pip install
   androguard` fails here (`psutil` has no Android support); apt route
   (apktool/openjdk) failed on mirror network errors. Helper:
   `/data/data/com.termux/files/usr/tmp/opencode/dump_smali.py`
   (kept OUT of the repo). Working dumps: `reference/smali/` (gitignored).
2. ~~Map `membership` delivery path~~ DONE, with a twist (see below).
3. Star-balance/reveal check — patch 2 hinge.
4. Telepath-ticket/cans check on match/chat — patch 3 hinge.
5. Free-call countdown trigger — patch 4 hinge.

## Smali-confirmed (androguard, classes7.dex)

- `Lcom/one/goodnight/InterstitialAdModulesManager;`
  (`ReactContextBaseJavaModule`): `loadInterstitialAd(String)`,
  `show(String)` (posts `Lcom/one/goodnight/r;` runnable via
  `UiThreadUtil.runOnUiThread`), `prepareAds(ReadableArray)`, `getName()`.
  `reference/smali/InterstitialAdModulesManager.txt`.
- `RewardedAdModulesManager` (+`$a/b/c`), `NativeBannerViewManager`,
  `VponBannerViewManager`: `reference/smali/RewardedAdModulesManager.txt`,
  `reference/smali/BannerManagers.txt`.
- `Lcom/one/goodnight/i` (+`$a/b/c/d`) is CAMERA code (CameraDevice,
  SurfaceTexture), not membership. Single-letter app classes are per-feature
  natives; do not assume which is which.
- NO native references to `membership` / `vip_info` / `is_premium` strings in
  `classes2.dex` or `classes7.dex`: VIP/entitlement logic lives in the JS
  bundle and crosses via the generic RN bridge. Consequence for patch 1: a
  dex `bytecodePatch` cannot flip `isPremium()` directly — either a resource
  patch on `assets/index.android.bundle` (check Morphe resource-patch DSL;
  template only shows `bytecodePatch`) or dex patches on the native ad-gate
  methods (e.g. no-op `show`/`loadInterstitialAd`), which give ad removal
  without touching JS.
