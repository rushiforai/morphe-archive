# Vogelkop Morphe Patches — v1.2.3 Verification Report

Date: 2026-11-08 · Bundle: `patches-1.2.3.mpp` (Ed25519 signature VALID,
matches `morphe-signing.pub`)

## What changed in v1.2.3

1. **Research**: can Brave Shields / uBlock Origin block lists replace
   Opera's built-in ad blocker on the three Android variants?
   - Brave Shields and the uBO **extension cannot be installed** on Opera
     for Android / Beta / GX (no extension support on Android).
   - Their **filter lists are already inside Opera**: since Opera for
     Android 86 (Dec 2024) the built-in blocker has a uBlock/AdGuard-list
     compatible engine with Balanced / Enhanced / Custom modes (EasyList,
     uBlock, AdGuard, Malware, NoCoin, Adblock Mobile Ads + regional).
   - Recommendation: patched Opera + built-in blocker on **Enhanced** mode;
     the patches remove what no filter list can reach (native ad SDKs,
     sponsored tiles, hidden partner whitelists, analytics endpoints).
   - Documented in README §"Do Brave Shields or uBlock Origin replace the
     built-in ad blocker?"

2. **Code review** (all 8 patches + extension) — findings fixed:
   - the `PackageInfo.CREATOR` proxy could crash a binder thread if
     anything threw while rewriting a parcel → now returns the untouched
     parcel on any failure;
   - `Parcel.mCreators` / `sPairedCreators` were `clear()`-ed wholesale (a
     racy operation inherited from ApkSignatureKillerEx) → replaced with a
     targeted eviction of only the `android.content.pm.PackageInfo` entries;
   - the spoof depended solely on the fragile CREATOR swap → added a
     deterministic call-site redirect layer (below);
   - the placeholder fingerprint now accepts both compiled shapes of the
     companion initializer.

3. **Community patterns adopted** (from MorpheApp / rushiranpise / hxreborn
   / kveld9 / heval99): the universal "Spoof signature" call-site redirect
   engine (kveld9, MorpheApp PR #2470 lineage), fail-loudly drift reporting,
   hook-count logging, and a CHANGELOG.md.

## Patch-time results (Morphe Desktop CLI)

| Build | Patches applied | Redirected call sites |
|---|---|---|
| Opera stable 103.3.5234.91185 | 7/7 | 157 (getPackageInfo×143, getSigningCertificateHistory×6, hasMultipleSigners×4, getApkContentsSigners×3, hasSigningCertificate×1) |
| Opera Beta 104.0.5262.91143 | 7/7 | 158 (…getApkContentsSigners×3, hasSigningCertificate×2) |
| Opera GX 3.3.18 | 3/3 (analytics, GX tiles, spoof) | 43 (getPackageInfo×40, getSigningCertificateHistory×2, hasMultipleSigners×1) |
| DIAG1 sig-only (Beta) | 1 (spoof) | 158 |

## Post-build verification (all PASS)

- Extension class present in patched dex; **0 placeholder strings remain**
  (package name + official Opera certificate baked in).
- An Application subclass is re-parented to the hook class in every build
  (2 in stable/beta: OperaApplication + LeanplumApplication; 1 in GX).
- Dead ad-module class `com.opera.android.ads.disabled.DisabledByMorphe`
  present ×3 in stable/beta; **0 live tracker endpoints** remain in
  stable/beta dex (all → `0.0.0.0`).
- `libopera.so` byte-identical to the original APK, stored uncompressed
  (same storage as the original APKMirror base, which itself relies on lib
  extraction).
- Output APKs verify with apksig (v2 scheme, CN=Morphe).
- GX: 77 sponsored tiles removed from `preloadedTopSites/*.json`.

## Deliverables in this directory

- `opera-stable-103.3.5234-patched-v1.2.3.apk`
- `opera-beta-104.0.5262-patched-v1.2.3.apk`
- `opera-gx-3.3.18-patched-v1.2.3.apk`
- `beta-diagnostic/opera-beta-DIAG1-sigonly-v123.apk` (+ updated README)
- `SHA256SUMS-v1.2.3.txt`
- (bundle itself ships via the GitHub release: `patches-1.2.3.mpp`)

## Open item

Opera Beta crash-on-open (v1.2.2): no device-side stack trace was ever
captured. v1.2.3's redesigned spoof removes the three most plausible
patch-side mechanisms (binder-thread crash inside the proxy, the parcel-cache
race, reliance on the CREATOR swap). If Beta still crashes with v1.2.3,
please run the 4-step diagnostic pack in `beta-diagnostic/` (README inside)
and report `adb logcat -b crash` output.
