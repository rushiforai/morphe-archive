# Material Capsule (`com.pryshedko.mtisland`)

Morphe patches for **Material Capsule** — a Material-You capsule/status-bar
customisation tool (accessibility overlay service, notification listener, gesture
widgets, `WRITE_SECURE_SETTINGS`, `QUERY_ALL_PACKAGES`).

Verified target: **17.3** (versionCode **173**), minSdk 32, targetSdk 36 — an XAPK
(`apkFileType = ApkFileType.APKS`): base `com.pryshedko.mtisland.apk` plus
`config.arm64_v8a` / `config.xxhdpi` / `config.en`.

Base-APK signer (Play): `63e05db5ac02a4147a134b5209edca396cce8c46a9edb09b3173d3d5c821341e`
(`CN=Android, O=Google Inc.`).

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Mock Pro (client-side)** | ✅ | Forces the client-side Pro entitlement (custom colors, card/anim controls, full-size player, app search, widgets, gestures). See *Premium mechanism* below. |
| **Bypass PairIP license check** | ✅ | Material Capsule ships the *license-check-only* PairIP variant (no `VMRunner`/`SignatureCheck`/`StartupLauncher`, no `libpairipcore.so`). Replaces `com.pairip.application.Application` with the real `com.pryshedko.mtisland.App`, removes `LicenseActivity` + `CHECK_LICENSE`, and no-ops `LicenseClient`. |
| **Remove ads** | ✅ | The app ships **no ad SDK and no ad placement** (see findings). The patch additionally disables any ad-SDK init provider and strips the advertising-ID / ad-services permissions. |
| **Disable trackers** | ✅ | Disables Google Analytics for Firebase (measurement receiver/services) and forces all documented Firebase Analytics / AdID collection flags off. |

## Premium mechanism — client-gated, no server entitlement

Recon of the single `classes.dex` (10.4 MB, fully R8-obfuscated) shows the entitlement
is entirely on-device:

- The billing repository (`u40`) holds the Play product IDs
  (`sku_five_dollars`, `sku_extra_option_one/two/three` in-app;
  `sku_one_dollar_with_trial`, `sku_one_half_dollars` subscriptions) and
  `u40.b(...)` = **"the account owns any purchase"** via `queryPurchasesAsync`.
- That boolean is encrypted with an **AndroidKeyStore** AES key (alias
  `pro_version_key`) and persisted in DataStore under `SECURE_DATA` by `uu1.e(Z, …)`.
- Every consumer reads it back by decrypting `SECURE_DATA` with
  `uu1.a(String, SecretKey)` and comparing the plaintext to `"yes"` — both the
  one-shot read `uu1.c(Continuation)Object` and the `uu1`-backed Flow `qu1`
  (`qu1.a(collector, Continuation)`), which feeds the main `wt4.i` pro flow the
  Compose UI collects.

There is **no** server entitlement call. The only network check in this area is Play
Integrity (anti-tamper, `uv3`/`nv3` → `/integrity/nonce` + `/integrity/verify`), which
merely forces the *local* pro read to `false` on devices that fail verification; it
never re-issues or validates the subscription. **So the whole premium set opens
client-side.**

The patch forces both read paths true plus the purchase predicate:
`uu1.c` → `Boolean.TRUE`; `qu1.a` → emit `Boolean.TRUE` downstream; `u40.b` →
`Boolean.TRUE` (so the app's own refresh also persists `"yes"`). Nothing is faked
against Google Play — no purchase is fabricated and Restore-purchase still works.

### Fingerprints / anchors

The app renames every class on each release, so the anchors are **string literals**,
and the pro store / flow classes are then located by **shape**:

- `ProStoreDecryptFingerprint` — static `(String, SecretKey)String` whose body contains
  `AES/CBC/PKCS7Padding`. The matched class is the secure pro store.
- `BillingProductsFingerprint` — the ordered product-ID literals
  `sku_five_dollars` then `sku_one_dollar_with_trial` (two literals because
  `sku_one_dollar_with_trial` alone also appears in the paywall view-model `tz7`).
- The Flow class is found structurally: a class holding a field of the pro-store type
  whose `(collector-interface, Continuation)Object` method collects from a
  FlowCollector-style interface. (`pu1.d` — the mapper's emit — could not be used: its
  `.locals 16` frame pushes `p0/p1` past `v15`, where the inline-smali compiler drops
  references, so the small `.locals 11` flow source `qu1.a` is patched instead.)

Verified anchors on 17.3: `uu1.a`, `uu1.c`, `qu1.a`, `pu1.d`, `u40.<init>`, `u40.b`.

## Findings — ads, telemetry, protections

- **Ads:** none. No `com.google.android.gms.ads`, AppLovin, Unity, ironSource, Vungle,
  Pangle, … classes; no `MobileAdsInitProvider`, ad views, or ad-unit IDs. The only
  hits are Firebase measurement's internal "AdMob ad impression logged" debug string
  and the app's own `apps` catalog table (which records the AdMob app id of *other*
  installed apps it themes) — neither is an ad surface.
- **Telemetry:** Google Analytics for Firebase only (measurement + Installations +
  RemoteConfig infra). No Crashlytics, AppsFlyer, Amplitude, Mixpanel, Sentry,
  AppMetrica, or other analytics/attribution SDK.
- **Protections:** PairIP (license-check-only) + Play Billing 9.1.0 + Play Integrity
  (anti-tamper, informational). No root/hook/emulator checks, no SSL pinning.

## Verified build

`material-capsule-17-3.xapk` → `work/mc_patched.apks` (all 4 patches, bytecode mode
FULL). The patched base was re-signed with a local test keystore and installed with
the three config splits on `emulator-5554` (x86_64, Android 14, `libndk_translation`).

Device evidence:

- **Installs & launches** — `adb install-multiple` → `Success`; `MainAppActivity`
  becomes `topResumedActivity`, process alive, **no** `FATAL`/`VerifyError`/
  `UnsatisfiedLinkError` in logcat. The app completes its onboarding to the
  *Capsule settings* screen.
- **Premium — control vs. patched:**
  - *Control* build (PairIP + trackers + ads only, **Mock Pro disabled**): the home
    screen shows an **"Unlock Pro"** button; tapping it opens the **"Unlock Premium
    features"** paywall ("Custom colors", "Various cards", "App widgets", 3-day trial,
    Restore purchase).
  - *Patched* build (Mock Pro enabled): the **"Unlock Pro"** button is **gone**, and
    the Pro **"Capsule color"** editor (Outline & shadow, Cutout gradient, Night color,
    Transparency) opens with **no** paywall.
- **Manifest (patched APK, `aapt2 dump xmltree`):** `android:name="com.pryshedko.mtisland.App"`;
  zero occurrences of `LicenseActivity` / `CHECK_LICENSE` / `licensecheck`; zero of
  `AD_ID` / `ACCESS_ADSERVICES` / `BIND_GET_INSTALL_REFERRER_SERVICE`; the three
  `AppMeasurement*` components are `enabled=false`; and
  `firebase_analytics_collection_enabled=false`, `…_deactivated=true`,
  `firebase_data_collection_default_enabled=false`,
  `google_analytics_adid_collection_enabled=false`,
  `google_analytics_default_allow_ad_personalization_signals=false`.

## Known limitation

The XAPK ships **arm64-v8a native code only** (`config.arm64_v8a.apk` carries the four
`.so`s; the base APK has none). On an x86_64 emulator they load only through ARM
translation — the test emulator has `libndk_translation.so`, so the app ran. On a
translation-less x86_64 emulator the app will `UnsatisfiedLinkError` on the first
`System.loadLibrary` of an androidx/mlkit native lib.
