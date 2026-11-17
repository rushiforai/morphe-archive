# E4 — Packaging & Signing (MoE panel, 2026-11-16)

Agent: general-purpose (glm-5.3). Mandate: signature matrix, stale v1/v2,
zip structure, Play Protect correlation.

## Verdict
Packaging/signing/alignment are CONSTANT across v9-v12 and healthy for the
target device class. The v10->v12 regression is exactly and only
classes.dex + classes3.dex. The crash cause lives in the dex patch.

## Findings
- apksigner 33.0.2 matrix: ALL FOUR builds verify as v3-only (v1=false,
  v2=false, v3=true), identical cert 62c9fa6f...a96adf, RSA 4096/SHA384.
  The prior audit's "v10 = v1+v2+v3" claim is WRONG — there is no signing
  difference between working v10 and crashing v12.
- v1 trio regenerated per build; MANIFEST.MF digests match actual entries;
  v1 fails only on INCOMPLETE COVERAGE (914/6390 entries uncovered, 189
  phantom names — same in all builds). Inert on minSdk 29.
- Zip: dexes DEFLATED; resources.arsc STORED 4-aligned; 10x .so STORED
  4096-aligned; zipalign verified x4. v10 and v12 .so data offsets
  byte-identical. (Latent, identical in all builds: only 3/10 .so are
  16KB-aligned — a future Android 15+ 16KB-page risk, not this regression.)
- AndroidManifest.xml and resources.arsc byte-identical across all four
  (versionCode 1910404306, targetSdk 37, minSdk 29).
- Full 6,393-entry CRC diff v10 vs v12: exactly 5 differing entries
  (2 dexes + 3 signature files).
- Play Protect dialog difference: not explainable by any local packaging
  change; most plausibly server-side reputation/stateful per-package
  memory on the install device. Its disappearance is not evidence of a
  packaging defect.
- v3-only cannot cause a delayed runtime crash on Android 10+
  (highest-scheme-wins verification; GET_SIGNATURES returns the cached
  custom cert consistently).
