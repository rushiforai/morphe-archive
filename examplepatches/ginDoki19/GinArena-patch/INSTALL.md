# WPS card order + naming fix -> v2.11.1

One file changes. Nothing about how the patch works.

```
patches/src/main/kotlin/app/template/patches/wps/PremiumUnlockPatch.kt
```

## What it does

* renames `bypassPrivilegeInterceptor` to **"Unlock premium tools (main switch)"**
* renames `bypassAsyncPrivilegeChecks` to **"Hide the upgrade banner on tool pages"**
* moves both into a readable order: master switch first, then the six that default
  to on, then the four that default to off
* widens the card description so it no longer says "PDF" only

Option **keys** and every **default value** are unchanged, so nothing a user has
already configured gets reset.

## Verified

* builds from a clean `main` checkout, 33 patches / 21 unique names, all 12 packages `ok`
* rebuilt twice from different directories -> **byte-identical** output
* applied to a stock WPS 26.11.0 base APK: **byte-identical result** to the `v2.11.0`
  bundle (0 differing dex, 0 differing archive entries) — proves metadata-only
* 0 duplicate classes of 199,357 / 0 new invoke mismatches against the stock baseline
* 0 out-of-range registers

## Commit message

```
fix(wps): make the master switch the first card and name it clearly
```

`fix:` -> `v2.11.1`.
