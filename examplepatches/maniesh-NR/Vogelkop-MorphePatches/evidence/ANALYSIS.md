# Opera ad-blocker & ads — reverse-engineering findings

All findings verified against three APKs (Nov 2026):

| App | Version | Source | Key facts |
|---|---|---|---|
| Opera (com.opera.browser) | 103.3.5234.91185 | Play bundle (base.apk v.c. 1910312306) + get.opera.com generic arm64 (v.c. 1910312408) | 7 dex sets, `assets/abp_files/op/` present in base, `split_pangle_ads.apk` split, Chromium core downloaded at runtime |
| Opera Beta (com.opera.browser.beta) | 104.0.5262.91143 | Play bundle (base.apk v.c. 1910404306) | identical layout, identical whitelist assets |
| Opera GX (com.opera.gx) | 3.3.18 (v.c. 199) | Play bundle | **not** a Chromium build — WebView-based app; ad-blocker config downloaded at runtime |

## 1. The paid whitelist (stable & beta)

Opera's built-in ad blocker ("Ad blocking" in settings) is fed by compiled filter
lists in `assets/abp_files/op/<sha256-of-content>.gz`. File names are the SHA-256
of the *decompressed* content. Twelve lists ship in the box; two of them exist
only to let paying partners through:

### `97bda3c5f03d…` — measurement / "Acceptable Ads" whitelist (1.6 KB decompressed)

- `DOCUMENT` page-level exceptions for `*yandex*/*`, `*.google.*/*`, `*://google.*/*`
- `WHITE.PLAIN /DIRECT/` allows for:
  `fls.doubleclick.net`, `google-analytics.com`, `googletagmanager.com`,
  `stats.g.doubleclick.net`, `googleadservices.com`, `ymetrica.com`,
  `mc.yandex.*` (all TLDs), `webvisor.com`, `webvisor.org`,
  `metrika-inf.com`, `metrika-informer.com`

→ Google Analytics, Google Tag Manager, Doubleclick and Yandex Metrica trackers
  are un-blocked by the "ad blocker" that ships enabled by default.

### `f66a1f2c11bd…` — partner/affiliate whitelist (4.0 KB decompressed)

- `DOCUMENT` exceptions (ad blocking disabled on the whole page) for:
  - **Taboola** (`taboola.com`, `taboolanews.com`)
  - **Gambling** (30+): `1xbet.ng`, `1xbeast.net`, `bet1-x17542.com`, `betika.*`,
    `bet9ja.com`, `betpawa.*`, `bongobongo.*`, `hollywoodbets.net`,
    `melbet.com.gh`, `m-bet.*`, `mlott.bet`, `powerbets.*`, `supabets.*`,
    `premierbet.*`, `betway.*`, `livescorebet.com`, `mozzart.com`,
    `mercurybet.com`, `guineegames.com`, `empawalotto.com`, `triple5bet.com`, …
  - **E-commerce affiliates**: `amazon.{com,de,fr,it,es,in,ca,cn,nl,com.be}`,
    `jumia.*` (15 countries), `lazada.*` (8 countries), `flipkart.com`,
    `shoprite.co.za`
  - **Opera properties**: `opera.com`, `opera.news`, `opr.news`,
    `operacricket.com`, `operafootball.com`, `operanewsapp.com`, `opera.thisday.app`,
    `opera.sportskeeda.com`, `opera.wowkeren.com`, `opera.hungama.com`,
    `operamobiletiles.ampxdirect.com`, `hub4games.operacdn.com`, …
  - **Opera content networks**: `apexnews-*.com`, `dailyadvent.com`,
    `dailyactive.info`, `briefly.news`, `guardian.ng`, `pepeshort.com`,
    `gamesnacks.com`, `softgames.com`, `gamezop.com`, `tembo.media`, …
  - Misc: `bybit.com`, `chess.com`, `duckduckgo.com`, `pluto.tv`, `startpage.com`,
    `turbotax.intuit.com`, `unstoppabledomains.com`, …
- `WHITE.PLAIN /DIRECT/` allows for attribution/affiliate trackers:
  `appsflyer.com`, `adjust.com`, `control.kochava.com`, `statcounter.com`,
  `r.bttn.io`, and Commission Junction domains (`qksrv.net`, `tkqlhce.com`,
  `dpbolvw.net`, `anrdoezrs.net`, `emjcd.com`, `kqzyfj.com`, `lijdoqocy.com`,
  `tqlkg.com`, `cj.dotomi.com`), plus Opera ad infrastructure
  (`lsdk.opera-mini.net`, `interstitial.opera-mini.net`, `pay1.op-test.net`,
  `tembo.media`, `eacdn.com`).

Full decompressed contents of both files are in this directory.

## 2. List loading & update mechanics (stable & beta)

- The loader enumerates **all** files in `assets/abp_files/op/` and loads them
  (`AssetManager.list("abp_files/op")` → path helper `"assets:abp_files/" + name`).
- **Bundled assets are not content-verified at load time.** Only lists that the
  updater downloads into the app's files directory are SHA-256-digested and
  verified against their file name.
- Updates come from Opera's OFA (Opera Filter Archive) service:
  `https://ofa-{b,r,o}-sub.osp.opera.software/v1/binary` (POST; the ad-blocker
  component uses `ofa-b-sub`). Lists are gzip blobs in the compiled
  `[default] / BLACK / WHITE / DOCUMENT / …` format.
- The 42-list registry of *user-toggleable* lists (easylist, adguard_ads,
  adguard_mobile_ads, nocoin, opera_fixes, ublock + 36 regional lists) only maps
  list id → display name/subtitle resources; the whitelists above are **not** in
  it — they are always-on core lists.

→ Patch strategy: replace pure-whitelist assets with an empty compiled list
  (byte-identical to Opera's own empty list `e87a67d8…`) under the same file
  name. Detection rule: a list with `DOCUMENT =` / `WHITE.PLAIN` / `WHITE.GLOB`
  and no `BLACK` section is a pure whitelist. This is version-robust (works even
  when Opera renames the files, because the file names are derived from content).

## 3. Built-in ads inventory

### Sponsored Speed Dial / suggested sites (stable & beta)
Room database `com.opera.android.suggested_sites.SuggestedSitesDatabase` with
tables `metadata`, `provider_info`, `partner_data`, `partner_tree`,
`domain_data`. The DAO refresh transaction reads:
`SELECT * FROM partner_data`, `SELECT * FROM partner_tree LIMIT 1`,
`SELECT * FROM domain_data` (identical strings in stable 103 and beta 104).

### Ad mediation layer (stable & beta)
An enum of ad providers maps to module implementations that are loaded
reflectively by class name:

```
com.opera.android.ads.liftoff.LiftoffAdsModuleImpl     (Liftoff / Vungle)
com.opera.android.ads.mintegral.MintegralAdsModuleImpl (Mintegral)
com.opera.android.ads.pangle.PangleAdsModuleImpl       (Pangle / ByteDance)
```

- Pangle ships as a dedicated dynamic-feature split (`split_pangle_ads.apk`,
  ~5 MB) with its own per-language config splits; its activities
  (`com.bytedance.sdk.openadsdk.activity.*`) are declared in the base manifest.
- Opera's first-party ads run through the in-house `ads_mobile_sdk` package
  (~1,770 classes, "neosdk"/OPERA provider in the mediation enum) — deeply
  wired into the promo/news system, so it is **not** surgically patched; the
  visible sponsored tiles are removed by the suggested-sites patch instead.
- Also bundled: AppsFlyer, Leanplum, Google IMA / measurement.

### Opera GX (3.3.18)
- Default start-page tiles from `assets/preloadedTopSites/topSites*.json`:
  2 of 4 default entries are sponsored (Eneba → `operagx.gg/eneba-sd-mob`,
  Instant Gaming → `operagx.gg/4mw`); per-country variants add Amazon
  storefronts tagged `?tag=operagx-mob-sp-sd-<cc>-21`, etc.
- Ad-blocker config is fetched at runtime from
  `https://download.opera.com/download/get/?resource=adblocker_v2` →
  `https://download3.operacdn.com/res/servicefiles/adblocker_v2/adblocker-desktop-202610291634-stable.json`
  (6.4 MB JSON; schema v2). Contents: 52 lists, 102,372 URL rules, 24,730
  element rules, 16 snippets, 1,997 allow rules (707 easylist + 850 easyprivacy
  upstream exceptions, 84 + 356 Opera-custom allows such as
  `||*.opera-api.com`, `||*gxc.gg^` document, `||*.capitalone.com`).
  Included but off-by-default lists: Peter Lowe, AdGuard Base/Tracking, uBO
  filters/privacy/badware/unbreak/quick-fixes/annoyances/cookie-notices, 36
  regional lists — all user-toggleable in Settings → Ad blocking → Manage lists.
- Small internal list from Firebase:
  `firebasestorage.googleapis.com/v0/b/opera-gxm.appspot.com/o/internal_files%2Finternal_filters.json`
  (test rules only).

## 4. Endpoint inventory (for network-level blocking, if desired)

```
ofa-b-sub.osp.opera.software/v1/binary        filter-list updates (browser)
ofa-r-sub / ofa-o-sub.osp.opera.software      regional/other OFA channels
momi-client-sdk-sub.osp.opera.software        MoMi monetization/metrics SDK
download.opera.com/download/get/              adblocker config redirector (GX)
download3.operacdn.com                        adblocker config / service files
vtp.operagx.gg                                GX install-redirect tracker
operamobiletiles.ampxdirect.com               sponsored tiles delivery
lsdk.opera-mini.net, interstitial.opera-mini.net, pay1.op-test.net,
refpakrtsb.top, refpaydc.top, tembo.media     partner ad/affiliate infra
```

## 5. Broken installation dialog (stable & beta) — reverse-engineered

Observed in the wild: after installing a *patched* Opera Beta, the app shows a
modal — *"Your app installation appears to be broken. Try to uninstall and
reinstall Opera Beta again."* This section documents the full chain, traced in
Opera Beta 104.0.5262.91143 (`base.apk`); the same strings and structure exist
in Opera stable 103.3.5234.91185. **It is not a signature or APK-integrity
check** — no code path compares signing certificates, digests of the APK, or
Play Integrity verdicts before showing this dialog.

### 5.1 The dialog builder

All variants are built by one static method:

```
Lkfo;->d0(Landroid/app/Activity; I)V        (obfuscated name; release build)
```

It creates an `AlertDialog.Builder`, is not cancelable, and picks the message
by the `reason` int parameter:

| reason | string resource | text |
|---|---|---|
| 0 | `welcome_init_failure` (0x7f1415a5) | Your app installation appears to be broken. Try to uninstall and reinstall %1$s again. |
| 1 | `welcome_init_emulated_arm` (0x7f1415a4) | The installed app version is supporting ARM but detected hardware is x86 … |
| 2 | `welcome_init_failure` via title/message pair (`0x7f1404b9`/`0x7f1404b8`) | same as 0 with a separate title |
| 3, 4, 5 | `welcome_init_failure` (0x7f1415a5) | same as 0 |

The positive button depends on the installer: if
`r9n.l(context) == "com.android.vending"` it offers *Play Store*
(`welcome_play_store`), otherwise *App settings*.

### 5.2 Who calls `d0`, and when

| caller | gate | meaning |
|---|---|---|
| `BrowserActivity.onCreate` | `OperaApplication.U()` | main browser start-up |
| `Lg9k.onCreate` (base of `PreviousCrashActivity`) | `OperaApplication.U()` | crash-recovery screen |
| `Lcom/opera/android/startup/PreviousCrashActivity;->I(I)` | crash counter (`Lvep;->A(I)I` → 0/1) | shown after a recorded crash |
| `Lku3;->c(I)` | crash counter | crash-recovery callback |
| `Ln6k.invoke` (×2, Compose fragment observers) | fragment state `Lq9k;(reason)` | downstream UI of the flag |

`OperaApplication.U()Z` simply returns
`OperaApplication.h != null`, and `h` (a static `Integer` "reason") is written
in exactly one place — `OperaApplication.onCreate`:

1. if the data dir path (`Context.getDataDir()`) contains any of
   `OperaApplication.K[]` → reason 2,
2. else if the originating installer package
   (`InstallSourceInfo.getOriginatingPackageName()`, via `r9n.s`) contains any
   of `K[]` → reason 3,
3. else if `getFilesDir()` is null or not a directory → reason 4,
4. else `h` stays null and nothing is shown.

`K[]` is a fixed blacklist of app-cloning frameworks, decoded from
`OperaApplication.<clinit>`:

```
dualaid, dualspace, excelliance, gspace, parallel_intl, parallel_lite,
parallelspace, virtualapp, waxmoon
```

On top of that, the whole reason-assignment block only runs in the *main*
process (`Locp;->k()Z` ≙ `!processName.contains(":")`).

### 5.3 What actually triggers it on a patched install

* **Crash recovery.** If any run of the app crashes after the crash handler is
  installed (`OperaApplication.V()` — Chromium breakpad wiring, recorded under
  `crashhandler`), the next launch can route through
  `PreviousCrashActivity` → `d0(activity, 0)` → the "broken installation"
  dialog. A patched build that hits an unrelated one-time startup crash is
  then nagged forever, and the suggested fix (reinstall) reproduces the
  problem. Opera forums show the same dialog on *unmodified* installs
  (rooted devices, Opera 65, LineageOS 17.1).
* **ABI mismatch.** The first-run init (`Lwt2;->c(I)`) constructs
  `Lq9k;(reason = 2)` when the ARM build runs on x86 hardware — relevant when
  splits are merged incorrectly, not to signature checks.
* **Cloned-app sandboxes** match `K[]` and legitimately report reason 2/3.

### 5.4 Why the ad-module rename does not crash the mediation loader

The class names rewritten by *Disable ad modules* are consumed by suppliers
(`Lzdc;`/`Lt0e;`/`Lqyf;` extend a shared holder `Lk8;`). Before any reflective
lookup, the loader probes availability:

```
Lay;->d()  (DI case) :  Class.forName(supplier.className, false, Lqyf;.class.getClassLoader())
                        → TRUE / catch → FALSE
Lk8;->a0()Z          :  returns that Lazy<Boolean>
Lqyf;->s0(Lxo7;)     :  if (!a0()) return new Li0f;(...)   // no-op ads provider
```

Only when the probe succeeds does it call
`Lmzg.k(name, "createAdsProvider", …)` — and `Lmzg.k` itself catches the
lookup exception and returns `null` (the caller's `Objects.requireNonNull`
would NPE, but that path is unreachable while the probe is intact, because the
probe and the lookup use the same string). Renaming the constant therefore
degrades gracefully to "module not installed" — the same state as a device
without the optional `split_pangle_ads.apk`.

### 5.5 Patch response

The *Hide broken installation dialog* patch (v1.1.0) turns `d0` into a no-op
and forces `U()` to `false`, so neither crash recovery nor the clone-detection
flag can interrupt start-up with this dialog. Genuine crashes still surface as
crashes (visible in `adb logcat`), which is more actionable than the dialog.

## 6. MainLibraryBoot, the welcome-splash deadlock and the v1.2.0/v1.2.1 crash

### 6.1 The engine is INSIDE the APK (corrected in v1.2.1)

v1.2.0's notes claimed the Play bundle downloads its Chromium engine at first
run. That is wrong: `base.apk` ships the whole engine — an 84 MB
`lib/armeabi-v7a/libopera.so` (STORED/uncompressed, page-aligned) plus a decoy
32-bit ELF in `lib/arm64-v8a/libdummy.so` that `NativeLibraryHelper` rejects,
which forces every install onto the 32-bit ABI (`android:use32bitAbi="true"`,
`android:multiArch="true"`). The manifest sets `android:extractNativeLibs=
"false"`, so the engine is dlopen-ed straight from the APK and the `.so`
entries must stay uncompressed and aligned through any repack. Morphe's
pipeline does keep them byte-identical (verified on all three apps: identical
CRCs, STORED, 16 KiB-aligned). Engine load is `System.loadLibrary("opera")`
(`Lz4o;->l[0]`), coordinated by the MainLibraryBoot state machine.

### 6.2 MainLibraryBoot

Engine load/start is coordinated by a small state machine (class
`Le7d;` in Beta 104.0.5262.91143, `Ly0d;` in stable 103.3.5234.91185), found
by its `"MainLibraryBoot: "` log tag. States: 1 initial, 2 loading,
3 success, 4 failed with reason `1=LIB_LOAD`, `2=CHROMIUM_START`,
`3=EMULATED_ARM`. The boot `AsyncTask.doInBackground` calls the loader
singleton (`Lwbc;->a()` / `Lr5c;->a()`), catching `UnsatisfiedLinkError` and
the boot exception type; `onPostExecute` re-checks `Build.SUPPORTED_32_BIT_ABIS`
(x86-only ⇒ EMULATED_ARM) and otherwise reports
`b(reason, throwable)`, which logs `"MainLibraryBoot: <REASON>"` and announces
the failure to every registered callback via
`invoke-interface {client, reason}, <callback>-><name>(I)V`.
A separate watchdog (`Lqy3;`) announces `CHROMIUM_START` if startup stalls.

The welcome screen (`WelcomeActivity` via `Lu9k;`) reacts to the failure state
(`Lq9k;`) in its Compose observers (`Ln6k;`/`Lo9k;`) by calling the
*broken installation* dialog builder `Lkfo;->d0` — and nothing else. With
v1.1.x that builder is a no-op, so a failed engine boot left the purple welcome
splash up forever (black screen after the process was killed): the reported
Opera Beta symptom on v1.1.x.

### 6.3 What v1.2.0 actually broke (and v1.2.1 fixed)

v1.2.0's answer to §6.2 was a signature-spoofing extension plus the
announcement rewrite. The extension, however, was compiled against
hand-written Android framework stubs (`tools/android-stubs`, since removed)
that modeled several framework types with the wrong shape:

- `android.util.Base64` was declared as a Kotlin `object`, so the extension
  called a **nonexistent `Base64.INSTANCE` static field** and an
  **instance `decode(String, int)`** (the real method is static, and platform
  classes have no `INSTANCE` field);
- `PackageInfo`'s public *fields* (`packageName`, `signatures`, `signingInfo`)
  were declared as Kotlin `var` properties, so the extension called
  **nonexistent getters** `getPackageName()`/`getSignatures()`/`getSigningInfo()`.

On a device those references throw `NoSuchFieldError`/`NoSuchMethodError`
inside `SignatureHookApp`'s static initializer (which runs before any app
code, because `OperaApplication`/`LeanplumApplication` were re-parented onto
the hook class), i.e. `ExceptionInInitializerError` at process start: the
app dies before drawing anything — the "black screen and the app crashes"
reported for v1.2.0, on every patched app.

v1.2.1 compiles the extension against the **real framework** (Robolectric's
`android-all` AOSP build) and adds `tools/AuditExtDex.java`: after D8, every
`android/*` class/method/field reference in the extension dex is resolved
against the real framework via reflection (including static/instance call-kind
checks), and the build fails if anything does not match. On the v1.2.0
extension the audit reports exactly the four bugs above; on v1.2.1 it reports
4 class refs, 7 method refs and 5 field refs, all valid.

### 6.4 Official certificate

The official `Opera_103_3_5234_91185_Generic_Opera_arm8_LZMA.apk` from
`ftp.opera.com` carries the vendor signing certificate:

```
subject/issuer: CN=Opera Software, C=NO (self-signed)
validity:       2010-03-02 .. 2037-07-18
SHA-256:        5d6afbf87f652af04647ada0df634cf22370900b164b09d50bd23aa2cb5285b8
```

The same vendor key signs Play and get.opera.com builds of Opera, Opera Beta
and Opera GX, so it is embedded (Base64 DER) in the *Spoof app signature*
patch as the default spoof target.

### 6.5 Patch response (v1.2.1)

* **Spoof app signature** — an extension (raw-dex `extensions/extension.mpe`,
  Kotlin port of rushiranpise's `SignatureHookApp`, ApkSignatureKillerEx
  lineage) re-parents `OperaApplication`/`LeanplumApplication` and swaps
  `PackageInfo.CREATOR` with a proxy that rewrites the signature/signing-info
  fields of this package's `PackageInfo` parcels back to the Opera
  certificate. All in-app signature reads — the preinstall partner check,
  the MoMi SDK, metrics — then observe the vendor identity.
* **Ignore browser boot failures** — in the MainLibraryBoot coordinator, both
  `invoke-interface … -><name>(I)V` failure announcements (the
  `b(I, Throwable)` flush loop and the late-subscriber branch) are rewritten
  to `invoke-interface … ->onSuccess()V`. A boot failure can no longer
  deadlock the welcome screen; startup continues exactly as it does on
  success. The coordinator is located via the stable `"MainLibraryBoot: "`
  log tag and the callback interface via the registration method's parameter
  type — never by obfuscated names (they differ between stable and beta:
  `Le7d;->c(I)V` vs `Ly0d;->e(I)V`).
* **Disable analytics & tracking** (new in v1.2.1) — since Morphe Patcher 2.0
  fingerprint strings match exactly by default, the endpoint scan passes an
  explicit `StringComparisonType.CONTAINS` and rewrites the host substring
  inside each constant (`https://app-measurement.com/x` →
  `https://0.0.0.0/x`). 80 `const-string` constants on stable/beta (in
  `ads_mobile_sdk`, Google IMA and Firebase Measurement code) plus one static
  field value (`Lcom/leanplum/internal/Constants;->API_HOST_NAME =
  "api.leanplum.com"`, rewritten via `MutableField.setInitialValue`), and 8
  constants on GX. Firebase Installations / Remote Config / Storage and all
  Opera first-party hosts are deliberately untouched.

Verified headlessly (Morphe Desktop CLI v2.1.1) on Beta 104.0.5262.91143,
stable 103.3.5234.91185 and GX 3.3.18 APKM inputs: every patch applies; the
patched output was re-disassembled to confirm the re-parenting, the rewritten
announcements, the embedded certificate and the dead-host endpoints; native
libs stay byte-identical/STORED/16 KiB-aligned; the output verifies with
apksig (v2, CN=Morphe); the patched SQL parses in SQLite; and
`tools/AuditExtDex` reports zero unresolved `android/*` references in the
modified dex.
