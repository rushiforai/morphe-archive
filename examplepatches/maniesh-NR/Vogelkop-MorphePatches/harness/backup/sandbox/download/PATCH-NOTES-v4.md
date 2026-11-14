# Opera Beta 104 custom build — patch notes (v4, universal APK)

## What changed v3 -> v4

v2/v3 (.apkm bundles, apktool-rebuilt base) were rejected by the device
installer ("There was a problem parsing the package"). Root cause (already
documented in this project's `docs/v1.3.1/BINARY-BUILD.md` from the D-rung
era): apktool's recompiled `resources.arsc` / re-serialized manifest lineage
passes all host checks but fails device-side parsing. v4 abandons the apktool
APK rebuild entirely and returns to the device-proven hybrid pipeline:

1. **Substrate** — APKEditor 1.4.9 `m -i merge_in -o substrate.apk`:
   stock `base.apk` + 27 `split_config.*` splits (pangle excluded), the
   "B0b" recipe (device verdict: boots). 6391 entries, 7 dexes, all `.so`
   STORED, `resources.arsc` STORED, no stale signature files.
2. **Dex patch** — `classes3.dex` extracted, wrapped alone in a zip,
   `apktool d --no-res` (resources never touched), 4 anchored smali edits,
   `apktool b`, harvested dex spliced back with `splice_entry.py`
   (byte-preserving; entry-diff vs substrate = exactly `classes3.dex`).
3. **Finish** — `zipalign -P 16 -f 4` (16 KB page alignment; `.so`/arsc
   STORED preserved), `apksigner sign` with `morphe.keystore`
   (v1+v2+v3, cert SHA-256 `28f79a444459c0a6...` — same key as W/X-rung).

### Verification performed
- structural walk of the rebuilt dex: 48,060 methods, 0 failures
- baksmali roundtrip of the rebuilt dex AND of the final signed APK:
  all 4 patch markers present (P1/P2/P3/02f below)
- apksigner verify (min-sdk 23): v1 true, v2 true, v3 true
- zipalign -c -P 16: OK; aapt2 badging: OK
- final sha256:
  `f159857462c8056590c18353ef56cf5f540fda0178ac24465dda0e5c477a80e9`

## Patch set (identical intent to v2, re-implemented byte-safely)

- **P1 — onboarding master gate**: `OperaApplication.a()Z` head-inserted
  `const/4 v0, 0x1; return v0` (original body left as dead code). This is
  the "app fully set up" gate consumed by `IntentDispatcherActivity.onCreate`
  and `BrowserActivity.onCreate`; forcing true routes both straight to normal
  browser startup — WelcomeActivity (language/EULA/theme) never launches.
- **P2 — personalization sheet**: `cfn` `:pswitch_11`
  (`personalization.onboarding.completed` observable):
  `xor-int/2addr v0, v5` → `const/4 v0, 0x0`. The in-browser
  "Set up your browser" sheet and its "start browsing" button never appear.
- **P3 — splash spinner**: `ssi` `:pswitch_17` runnable drops the
  `findViewById(splash_spinner).setVisibility(VISIBLE)` body (check-cast +
  return-void kept). Purely visual; ViewStub/pre-draw/teardown chain stock.
- **02f — waiter bypass (X-rung freeze fix)**: `m9k.<init>` inserts
  `const/4 p5, 0x1` before the `Boolean.valueOf` waiter seed, so the
  fresh-install startup-dependency waiter never arms (W2 post-mortem root
  cause). First run = steady-state launch parity.

## Dropped from v2 (with reason)

- **P4** (A12+ `windowSplashScreenAnimatedIcon` → blank drawable): a
  resource-table edit, not expressible in the byte-safe pipeline. Residual:
  the OS-drawn system splash icon (Opera logo, ~1 s at cold start on
  Android 12+). To be revisited as an arsc-level retarget patch in v5 if
  the user reports it.
- **P5** (pangle split exclusion): kept, but as a merge-time exclusion
  (splits never enter the universal APK).

## Build artifacts

- `scripts/v4_substrate.sh` — toolchain provisioning + APKEditor merge
- `scripts/apply_v4_patches.py` — the 4 anchored smali edits (assert-1)
- `scripts/build_v4_universal.sh` — rebuild → splice → align → sign → verify
- Deliverable: `OperaBeta-104.0.5262.91143-custom-v4-universal.apk`
