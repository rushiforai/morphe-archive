# Licensing audit (2026-09-23, V28)

Scope: this repository and the V28 test builds produced from it.

## Repo contents (source side)

| Item | License / status | Notes |
|---|---|---|
| Patch layer (this repo's own code) | GNU GPL v3.0 (LICENSE) | Derivative of PixelBoard + jasonwu1994/Gboard-patches, both GPLv3; compatible. |
| PixelBoard (Akshay Kadam) | GPLv3 | Attributed in ATTRIBUTION.md; architecture and conventions followed. |
| jasonwu1994/Gboard-patches | GPLv3 | Original Advanced Voice / Rambler patches; attributed. |
| smali/baksmali (JesusFreke) | BSD | Build-time tools, fetched not vendored; BSD permits this. |
| Google Gboard binaries, dex/smali dumps, models, keys | Proprietary, NOT in repo | .gitignore excludes *.apk/*.aab/*.dex/*.jks/*.keystore. ATTRIBUTION.md states the policy; verified: repo tree contains no APK/dex/keystore files. |
| Stock Google prompt-policy strings | Referenced by SHA-256 fingerprint + short published fragments only | Full 17.8 KB prompt never reproduced. |

Audit result: no licensing violations found in the repo. Attribution is
complete, modification notices are retained per GPLv3, and the no-Google-binaries
rule holds.

## Built test APKs (binary side, not distributed via this repo)

The V28 test APKs are Gboard 18.3.1 derivatives carrying this patch layer:

| Component inside the APK | License | Obligation check |
|---|---|---|
| Gboard base (Google) | Proprietary | Not licensed for redistribution. Builds are private test artifacts for the project owner; they must not be published or mirrored publicly. This is the binding constraint on any release. |
| OkHttp (Square) | Apache-2.0 | Notice preservation required on redistribution; moot while builds stay private. |
| bundled font software | SIL OFL 1.1 | LICENSE_OFL ships inside the APK; OFL permits bundling. |
| Unicode data | Unicode License | LICENSE_UNICODE ships inside the APK. |
| Kotlin stdlib | Apache-2.0 | Standard. |
| This patch layer | GPLv3 | Source offered via this repo. |

## Obligations and constraints

1. GPLv3 for the patch layer is satisfied by this public-source repo
   (attribution, notices, source availability).
2. The patched APKs embed Google's proprietary binaries. The repo's own policy
   is correct: the patcher requires each user to supply a lawfully obtained
   Gboard APK, and patched APKs must not be redistributed. V28 test builds are
   delivered only to the project owner through private links.
3. Nothing in V28 changes the licensing posture: one new patch-layer class,
   no new third-party code, no new vendored assets.

## Verdict

Repo: clean. Builds: private-test-only constraint stands; do not publish the
APKs or make the repository public while it documents how to produce them for
users who cannot supply their own base APK.
