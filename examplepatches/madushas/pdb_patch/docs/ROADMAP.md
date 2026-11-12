# Roadmap

Where the bundle is, what was just hardened, and the highest-leverage work left.
Written 2026-11-12; the reference bar is the official `MorpheApp/morphe-patches`
bundle (200 `Fingerprints.kt`, 183 files using declarative preferences) plus the
community repos we study (`hushgram`, `kveld`, `rushiranpise`, `paresh`).

## The one meta-lesson

Two of our worst bugs were the **same defect**: an enumeration that silently
under-applies.

| Incident | Shape |
|---|---|
| Strava upsells leaked | gate compared a **fixed list of 5** types, defaulted to SHOW for the rest → every new upsell type passed through |
| `killPairIpFull` cleared 0 of 18 | scan re-read an already-consumed dexlib instruction list → matched 18, mutated 0, **build still reported success** |

Both were invisible to the compiler, the build, and the "Applied:" line. The rule
that follows, now enforced in code:

> **Prefer a predicate or a chokepoint over an enumeration; if you must scan, assert
> that the scan that matched candidates actually mutated them.**

Implemented as `shared/Assertions.kt` (`requireProgress(found, mutated, what)`), wired
into `killPairIpFull`, Shima Pro, and the Glassdoor/Jooble AppsFlyer no-ops; Strava's
brand-literal swap already had its own equivalent guard.

## Done (this cycle)

- **Strava upsell leak — root-caused and fixed** (v4): upsell-shape predicate on the
  modular dispatcher, one chokepoint for every subscription bottom sheet (`ww4.a`),
  and `finish()` gates on the three dedicated upsell screens. Verified on 486.11 and
  486.9. `docs/strava.md`.
- **`category` emitted for all 80 patches** — our generator now publishes the grouping
  label (`patches-list.json`, keys `name, description, default, category, dependencies,
  compatiblePackages, options`). Note: the *official* bundle emits `category: null` for
  every patch, so this is ahead of the reference, not behind.
- **`tools/upsell_audit`** — reusable inventory of an app's upsell/paywall surfaces
  (resource-name → id → smali method, plus layout-only usage and upsell-shaped string
  literals). Ran it on adidas, Fitbit, Nike.
- **Fail-closed guards** on every scan-then-mutate step we own.
- **PII/secret hygiene**: a hardcoded account email + first name removed from
  `tools/pdblogin` (see "Open items" — history still contains it).

## Next (ordered by leverage)

### 1. Distribution-channel pivot for integrity-gated apps
Teams is blocked by **Play Integrity** (Google-signed verdict, validated server-side) —
no client patch can pass it. But the *same app* from a non-Play channel (Huawei
AppGallery / Aptoide / APKPure) may ship without the check. Different build, different
gates. Either unlocks a 230 MB Microsoft app or definitively closes it.

### 2. Turn the PairIP pipeline into a documented, reusable flow
`tools/pairip/` (`gd_capture.py` heap→strings, `gd_methods.py` dex→bridge mapping,
`gd_merge.py`→ resources) took Glassdoor from SIGSEGV to a booting app. PairIP is on
most Play apps; this is a pipeline for an app *class*, and it is the missing half of
the adidas (14.4.0 base) and Glassdoor (`setContentView`) residual work.

### 3. Generalise the heap-dump trick: runtime state extractor
We own the hard part (a working ART HPROF parser). Many things written off as
"server-side" are client-evaluated **config blobs** — dumping the original build's
config object yields the flag names *and* the reader to patch. Candidates already on
our list: Nike dark-mode's remote flag, ProtonVPN's `FeatureFlag` system, Teams.

### 4. Extract `shared/` modules
We have 10 `ads/` and 12 `trackers/` near-duplicate patches. The official repo has a
real `shared/{ad,interaction,layout,misc}` module + a shared settings library. One
place to fix; updates stop touching 14 apps.

### 5. Per-feature `Fingerprints.kt` + "verified against" comments
Official: **200** files. Us: **0** (everything inline). This is the single biggest
readability/diagnosability gap — it turns a post-update break into a five-minute fix.

### 6. Declarative preference model + locales
Official: 183 files use `SwitchPreference`/`ListPreference`/`StringResource`, plus
`crowdin.yml` for translations. We hand-roll a Java settings Activity per app with
hardcoded English. Adopting the declarative model removes bespoke UI code, makes
switches translatable, and keeps Manager options for rebuild-time choices only.

### 7. Universal patches + borrowed wins
Port kveld's `universal/` set (`ApkJunkCleaner`, `BackgroundSyncPurge`,
`DpiResourceSlimmer`) — they serve "every app strips ads+telemetry" and the Teams
"unbloat" goal, once, for all apps. Then look at `rushiranpise` (our exact
`app/template/patches/…` skeleton, 172 fingerprints) for new targets.

### 8. Release engineering
A CI matrix that patches **every declared target** per app (we have been bitten twice
by target drift: 486.9 vs 486.11; adidas 14.4/14.12), a device matrix (x86_64 emulators
cannot run arm64-only bundles — Strava), and a schema test on `patches-list.json`.

### 9. `docs/LESSONS.md`
Consolidate the scattered gotchas into rule form: register-clobber trap, one-shot
dexlib instruction streams, `FAIL=exit-1`, pexpect exit-code masking, missing ABI
split → `UnsatisfiedLinkError`, the dex-order trap (`buildAndroid` must be the last
gradle task). We have paid for each of these at least once.

## Open items (need a human decision)

- **Repo history contains an account email.** Removed from the working tree, but
  `origin/main` still has it in commit `88e8f06` *and* in the current tree until this
  fix is pushed. Purging history needs a rewrite + force-push (`git filter-repo`) —
  destructive, so it is not done unilaterally.
- **adidas**: best-effort PairIP (see `docs/adidas.md`); 14.4.0 is the better base.
- **Glassdoor**: boots to the real `MainActivity`, empty root view (VM-only
  `setContentView`); `docs/glassdoor.md`.
- **Teams**: runtime-gated by Play Integrity; unbloat applied only.
- **Nike dark mode**: patch verified in bytecode; visual confirmation needs a sign-in.
