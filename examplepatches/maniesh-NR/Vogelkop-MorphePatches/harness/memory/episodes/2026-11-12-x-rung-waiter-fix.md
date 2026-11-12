# Episode: W-rung verdicts → W2 root cause → X-rung build (2026-11-12)

## Context

- User reported W1/W2 device results. W1 boots (= S3 verdict, four-innocent
  combo cleared). W2: installs clean, patches visibly work (no T&C, no
  default-browser, no data-collection step; wallpaper picker shows), but
  "Start browsing" freezes the app and relaunch gives a black screen.
- Sandbox had been recycled (recycle #3, before this session): work/ tree
  gone, only .tools/recon dumps + jadx/baksmali survived.

## What happened

- Deep smali analysis of the onboarding state machine using the recon dumps
  (classes3 = smali-c3, classes = smali-c1, q0n via jadx-beta):
  - Flow driver: `q0o.f()` → `cek` case 10 (classes.dex) iterates `pyl.d`
    (due-step queue); at queue exhaustion checks `q0o.d` = `tzn` case 2 =
    `m9k.e.g()`; false → posts `q0n(16)` = `g49` "Almost there!" screen
    instead of `k0o.d` (END → `L()` → `J()` → `g9k.J()` → browser).
  - `m9k` = fresh-install startup-dependency waiter; `e` seeds from
    `has_waited_for_startup_dependencies || !J()`, `J()` = `version_code ==
    0` = fresh. Deps: `j9k` (remote-config bundle, retry via
    `avj.g(2, mni-23)` startup-state-bit queue + `i9k` observer) and `bac`
    (Leanplum/Braze start response). `g49`'s give-up timeout (`mni` case 24
    → `m9k.R(true)`) is scheduled through the `umi` flow delayed executor.
    None of these fire in the patched flow → permanent hang; S1's
    "Almost there!" hang was the same gate.
  - `q0n` step factories decoded: 14 = T&C screen (y8k), 15 = hch splash
    (delayed_launch_fragment, 10 s force-launch timeout), 16 = g49.
  - Corroboration: W2 relaunch = black because the rebuilt queue is empty
    (PERSONALIZATION wrote its done-pref) so `cek` hits the waiter check
    immediately.
- Designed and built the X-rung (v1.3.1-R3):
  - 02f: `m9k.<init>` seeds the waiter TRUE (dead-code `const/4 p5, 0x1`
    before `Boolean.valueOf`) — first run parity with steady-state.
  - 02h: `q0o.f()` splash posting bypassed (`if-eq` → `goto/16`) — the
    "Opera logo + loading bar" screen never shows (user expected it gone).
  - X1 = W2 + 02f (differential); X2 = W2 + 02f + 02h (feature candidate).
- Toolchain re-provisioned for the raw-dex pipeline: smali 3.0.10 library
  jar (Google Maven `com.android.tools.smali`) + baksmali fat jar +
  antlr-runtime 3.5.3 on the classpath; build-tools r34; artifacts
  re-fetched from the sandbox-storage release (C1, keystore, W2 rebuilt
  dex) and hash-checked; W2 dex provenance verified by marker check before
  editing.
- Host verification passed for both builds: structural gate 0 failures,
  binary-patch anchors held, smali-tree diff vs W2 = exactly 1/2 files,
  entry-diff vs C1 = {classes3.dex, resources.arsc, 3 sig files}, all 9
  patch markers re-verified inside the signed APKs.
- Uploaded X1/X2 APKs + X-rung dexes + X-RUNG-SHA256SUMS.txt to the storage
  release.

## Outcome / handoff

- X-rung awaiting device results (flash X2 first, X1 fallback; protocol in
  `docs/X-RUNG-README.md`).
- If X2 boots through first-run and reopen: v1.3.1 is DONE → tag/release,
  then start v1.3.2 #8 implementation (adblock defaults + Secure DNS) on
  the X2 lineage per `evidence/adblock-defaults-recon.md` §4.
- If X1 boots but X2 fails: 02h guilty (unexpected); re-test with a
  variant that keeps the splash.
- If X1 also fails: waiter model incomplete — pull `vogelkop-diag.log` and
  re-examine (next suspects: the umi flow executor itself, or the
  pushed-content tzn-1 deferral).
