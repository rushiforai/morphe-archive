# Shima+ patches

**App:** Shima+ Dynamic Island (`com.piyush.island`) · **version 0.5.1** · versionCode `9`
· minSdk 32 / targetSdk 36 · XAPK bundle (base + `config.mdpi`, **no ABI splits — the app
has no native libraries at all**, single dex).

**Signer (SHA-256):** `eebb863d29141f9157d3c50b47d05d1eb8a734d0c46781b9e3d015b71b751d1d`.

## Patches

| Patch | Default | Toggle key | What it does |
|---|---|---|---|
| **Bypass PairIP** | ✅ | — | Restores the real `com.piyush.island.App` Application, drops `LicenseActivity`/`CHECK_LICENSE`, kills the licence **and trial** checks. |
| **Unlock Pro** | ✅ | `shimaUnlockPro` | Forces every `pro_unlock` entitlement check to `true` (10 sites). |
| **Remove ads** | ✅ | — | Defensive: no ad SDK ships; disables any ad-init provider and strips ad/attribution permissions should one appear. |
| **Disable trackers** | ✅ | — | Defensive: no telemetry SDK ships; adds the official opt-out flags and strips install-referrer. |

## Protection map (recon of 0.5.1)

- **PairIP "lite"**: `com.pairip.application.Application` wraps the real
  `com.piyush.island.App`, and the `com.pairip.licensecheck` package is bundled
  (`LicenseClient` + `TrialClient` + `LicenseContentProvider` + `LicenseActivity`).
  There is **no** `VMRunner`/`SignatureCheck`/`StartupLauncher` and **no**
  `libpairipcore.so` — nothing virtualized, so `killPairIpFull()` (which skips the
  absent VM classes) fully neutralises it. `TrialClient.checkTrialStatus` is only
  reachable through `LicenseClient`, so killing the licence client kills the trial gate.
- **Premium (`pro_unlock`)**: a single Pro product. The owned state is persisted in
  SharedPreferences file `"island_pro"` as a purchase JSON **plus an HMAC-SHA256
  signature** (AndroidKeyStore device key — see `eۭ.à(Lе̱;)`), so the store cannot be
  forged by editing prefs. Every "is Pro?" decision in the app is a **membership test**:

  ```smali
  const-string vX, "pro_unlock"
  invoke-… {…}, L…;->contains(Ljava/lang/Object;)Z   # Purchase.products or parsed JSON list
  move-result vX
  if-eqz vX, :paywall
  ```

  run both on **live Billing purchases** (`Purchase.products` iteration, e.g. `ϲ̈`) and
  on the **signed persisted JSON** (`е̱.á(JSONObject)` → products list, e.g. `аۢ`/`а͈`).

## Unlock Pro — what the patch does

Instead of forging the signed store blob, the patch finds every
`contains("pro_unlock")` boolean result in the dex (a scan anchored on the
`const-string "pro_unlock"` marker followed by `…contains(...)` + `move-result` within a
few instructions) and replaces the `move-result` with `const/4 vX, 0x1` — **10 sites
forced** in 0.5.1. All client-side Pro gates (features, paywall suppression) then open
coherently, whether the check read the live purchases or the signed store.

Because the store itself is untouched, no signature forgery is involved; and the patch
does not fabricate a *server-validated* entitlement (there is none — entitlement is fully
client-side in this app).

## Ads / telemetry

Shima+ ships **no ad SDK and no telemetry SDK** (single dex; no
`com.google.android.gms.ads`, AppLovin, Unity, ironSource, Vungle, Pangle, ByteDance; no
Firebase/Crashlytics/AppsFlyer/Sentry; no `AD_ID`/`ADSERVICES`/install-referrer
permissions declared). The two manifest patches are therefore defensive: they disable the
standard ad-init providers, strip the advertising/attribution permissions and add the
official Firebase/Google-Analytics opt-out flags so nothing can start reporting if a
future build adds it.

## Verification

- **Bytecode (independent re-decode of the patched APK):** all 10 `pro_unlock`
  membership tests now `const/4 vX, 0x1`; manifest `application` is
  `com.piyush.island.App`; `LicenseActivity` and `CHECK_LICENSE` are gone (0 matches);
  opt-out meta-data present.
- **Device (RootEmu, x86_64 Android 14):** `adb install -r -g` → Success; launches to
  `com.piyush.island/.MainActivity` (onboarding renders, including the island preview);
  process alive; **no `Fatal signal`, no `FATAL EXCEPTION`**.
