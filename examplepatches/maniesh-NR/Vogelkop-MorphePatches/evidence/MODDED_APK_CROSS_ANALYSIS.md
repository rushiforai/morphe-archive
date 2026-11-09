# Cross-analysis of community modded Opera builds (v1.2.5 source)

Two modded Opera-family APKs shared on mobilism were downloaded, decompiled
and diffed against the matching original builds to harvest techniques for
this bundle. Everything below was verified first-hand in this sandbox
(2026-11-08); download links are time-limited wormhole shares and are not
reproduced here.

| Build | Modder | Claimed changes |
|---|---|---|
| Opera 103.3.5234.91185 (`com.opera.browser`) | **vadj** / "Xtreme Modding" (`com.ap.va`, app-id string `com.xtreme.modding.codes`) | "ads removed, analytics and metrics disabled" |
| Opera Mini 99.1.2254.455 (`com.opera.mini.native`) | **ANiK555** | "No more advertisements, faster app open animation, cleaned ads & debug codes, cleaned total home interface, removed useless permissions, removed banner containers, removed all types of trackers, well optimized" |

Originals used for the diffs: APKMirror `.apkm` bundles of Opera stable
103.3.5234.91185, Opera Mini 99.7.2254.2684 (merged with APKEditor before
diffing, since both mods are merged universal APKs).

## vadj's Opera mod (fully analyzable)

### What he actually changed

1. **Excluded `split_pangle_ads` from his merge.** The class-set diff shows
   6,410 removed classes, grouped as: `com.bytedance.*` 3,731 (the entire
   Pangle SDK), `com.bykv.*`/`com.apm.*`/`com.pgl.*` 462 (Pangle internals),
   `com.iab.*` 89 (the IAB OMOID consent/verification stack Pangle depends
   on), `com.google.ads.mediation.pangle.PangleMediationAdapter`, and the
   `tt_*` Pangle resources (`package_4` in the merged original is entirely
   absent from his build). Mintegral and Liftoff/Vungle SDK classes are
   **still present** in his build — those are statically linked into the
   base dex and cannot simply be deleted.
2. **A self-promotion dialog.** A new injected package `com.ap.va`
   (18 classes, unobfuscated: `abror.java`, `customize/{Colors,Strings,
   dimens,Base64Image}.java`) renders a styled AlertDialog on startup with a
   Telegram button and a "don't show again" switch persisted to
   SharedPreferences `MyPreferences`/`show_dialog`. The `abror.sD(Activity)`
   entry point is called from a patched Opera class.
3. **Nothing else.** Zero manifest changes (48 permissions before and
   after), no endpoint rewrites (all three Opera mediation module class-name
   strings are byte-identical), no start-page/promo resource changes
   (`feed_item_ad`, `promo`, `sponsor`, `ad_blocking` resource sets are
   untouched), Leanplum untouched.

### Lessons for this bundle

- His "analytics and metrics disabled" is only the Pangle deletion; this
  bundle's endpoint rewrite is strictly broader (Leanplum, Firebase
  Analytics, Google Ads/IMA, and — since the v1.2.5 extension — every host
  the Pangle/Vungle/AppsFlyer SDKs contact).
- **The Pangle-split-exclusion safety argument is validated a second way**:
  a build that ships *without* the Pangle classes entirely works, because
  the mediation loader wraps the class lookup in try/catch and falls back to
  the no-op ads provider. That is exactly the mechanism *Disable ad modules*
  relies on since v1.0.0 — we break the class-name constant instead of
  deleting classes (impossible in a Morphe patch), reaching the same runtime
  state while keeping Mintegral/Liftoff covered too.
- The deleted SDK's string pool enumerated the exact hosts the Pangle stack
  contacts; those strings fed the v1.2.5 endpoint extension (see below).

## ANiK555's Opera Mini mod (protected build)

The APK is **DexProtector-protected**: `libdexprotector.so` +
`libstub.so` (runtime, timestamped after the rest), ~23k class defs per dex
across 10 dexes with heavy cross-dex duplication (233k defs → 75k unique;
Opera Mini originals have no such duplication), jadx recovers only ~2.9k
classes per dex with 90k errors, and his own `libANiK555.so` (268 KB) is
injected. Claims like "faster app open animation" or "removed banner
containers" are therefore **not statically verifiable**. What survived:

1. **Manifest permission removals (11, zero additions)** — the single fully
   readable signal, and the direct source of the v1.2.5 permission patch:
   `ACCESS_ADSERVICES_AD_ID`, `ACCESS_ADSERVICES_ATTRIBUTION`,
   `ACCESS_ADSERVICES_TOPICS`, `AD_SERVICES_CONFIG`, `ACCESS_FINE_LOCATION`
   (downgraded to COARSE), `READ_BASIC_PHONE_STATE`, `READ_CONTACTS`,
   `READ_PHONE_STATE`, `BIND_GET_INSTALL_REFERRER_SERVICE`,
   `com.google.android.gms.permission.AD_ID`,
   `com.huawei.appmarket.service.commondata.permission.GET_COMMON_DATA`.
2. **String-pool evidence**: `app-measurement.com` (3→0) and
   `googleads.g.doubleclick.net` (10→0) are gone; `http://127.0.0.1/source_code`
   is added — his dead-host redirect target. `firebaseinstallations.googleapis.com`
   is gone too (we deliberately keep Firebase installs/remote-config: push
   and feature flags depend on them).
3. **Leftovers undermine the "removed all trackers" claim**: AppsFlyer asset
   files (`assets/com/appsflyer/internal/*`) and Leanplum constants remain
   in the APK.
4. His version label (99.1.2254.455) does not match the APKMirror original
   he links (99.7.2254.2684), so class-set diffs are dominated by version
   drift and cannot isolate his code changes.

### What was adopted (v1.2.5)

1. **New patch *Remove ad & tracking permissions*** — the Privacy-Sandbox /
   AD_ID / install-referrer / basic-phone-state / Huawei set, remove-if-
   present, on all four supported packages. `READ_CONTACTS`/`READ_PHONE_STATE`
   do not exist in the current Opera stable/beta/GX manifests, and
   `ACCESS_FINE_LOCATION` is kept (it powers real geolocation sharing; ANiK
   downgraded it, we chose not to).
2. **Endpoint net widened** with every host family the vadj string diff
   exposed: `pangle.io`, `tiktokpangle`, `pglstatp`, `analytics.tiktok.com`,
   `ads.vungle.com`, `appsflyersdk.com`, `appsflyer.com`,
   `google-analytics.com` (bare, covering the `www.`/`ssl.` spellings),
   `crashlytics.com` (GX only) — 93 constants rewritten on stable/beta
   base builds (up from 81), 12 on GX (up from 8), plus more on merged
   builds that include the Pangle split.
3. **Not adopted**: dead-host `127.0.0.1` (our `0.0.0.0` fails faster and
   cannot hit a local listener), class deletion (impossible in Morphe
   patches; the loader-fallback result is equivalent), branding dialogs.
