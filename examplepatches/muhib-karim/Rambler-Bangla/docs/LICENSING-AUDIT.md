# Licensing audit (2026-11-28, v31.5.0)

Scope: this repository (60-patch Morphe suite for Gboard 18.5.4 + legacy 18.3.1 standalone
patcher) and all upstream open-source dependencies integrated through `v31.5.0`.

## Repo contents (source & Morphe `.mpp` patch bundle)

| Item | Upstream / Author | License | Compliance status |
| --- | --- | --- | --- |
| Rambler Bangla original code (3-mode Bangla/Mixed/English dictation, phonetic engine, custom brand logo, Hide launcher icon, native `@` mention strip, persistent clipboard drag-to-reorder) | `muhib-karim` & contributors | **GNU GPL v3.0** (`LICENSE`) | Compatible with all GPL-3.0, MIT, MPL-2.0, and BSD upstreams. |
| Gboard Patches / GboardWu (46 patches + binding compiler + extension framework) | Jason Wu (`jasonwu1994/Gboard-patches`, commit `aa6cb2bb`) | **GNU GPL v3.0** + Morphe §7c | Full attribution, commit snapshot, and GPL §5a modification notice in `NOTICE`, `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, and `docs/index.html`. |
| Gboard Rambler Enhancements (7 patches + dynamic resolver + Settings hub) | `@abotmaker` (`abotmaker/gboard-rambler-enhancements`, commit `5f7e50c2`, v1.3.4) | **GNU GPL v3.0** | Full attribution, commit snapshot, and GPL §5a modification notice in `NOTICE`, `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, and `docs/index.html`. |
| `nl-morphe-patches` / Dutch App Patches (AMOLED Dark, Rambler Extras, Hidden Flags, cloud activation pattern) | `@johninnld` (`johninnld/nl-morphe-patches`, commit `f5607c15`) | **GNU GPL v3.0** + Morphe §7c | Full attribution, commit snapshot, docs link, and GPL §5a modification notice in `NOTICE`, `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, `docs/index.html`, and source headers. |
| PixelBoard (original 18.3.1 carrier & runtime ABI) | Akshay Kadam (`Akshayykadam/PixelBoard`) | **GNU GPL v3.0** | Full attribution and GPL §5a modification notice in `NOTICE`, `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, and source headers. |
| Hex by Anomaly (waveform animations) | Christopher Langton (`anomalyco/hex`) | **MIT License** | Verbatim MIT copyright & permission notice preserved in `THIRD-PARTY-NOTICES.md`; credited in `ATTRIBUTION.md`, `README.md`, and `docs/index.html`. |
| QuickJS / QuickJS-NG (`libgboardpatches_quickjs.so`, inherited via Gboard-patches) | Fabrice Bellard, Charlie Gordon, QuickJS-NG contributors (`quickjs-ng/quickjs`) | **MIT License** | Verbatim MIT copyright & permission notice preserved in `THIRD-PARTY-NOTICES.md` and `ATTRIBUTION.md`. |
| Morphe Patcher & CLI (`app.morphe.patches`) | `MorpheApp` (`morphe.software`) | **GNU GPL v3.0** + Section 7c | Verbatim Section 7c Project Name Restriction preserved in `NOTICE`; distinct product name ("Rambler Bangla") used; Morphe referenced only descriptively. |
| Avro Keyboard phonetic dictionary | `OthmanAhmad/Avro` | **MPL 2.0** | Compatible with GPL-3.0 (MPL-2.0 §3.3); credited in `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, and `docs/index.html`. |
| CMU Pronouncing Dictionary | Carnegie Mellon University | **BSD-style** | Verbatim notice preserved in `NOTICE-cmudict.txt`; credited in `ATTRIBUTION.md` and `THIRD-PARTY-NOTICES.md`. |
| smali / baksmali | JesusFreke | **BSD License** | Fetched at build time via pinned SHA-256 checksums (`scripts/bootstrap_tools.sh`), never vendored. |
| Google Gboard binaries, DEX/smali dumps, models, keys | Google LLC (Proprietary) | **NOT in git** | `.gitignore` excludes `*.apk`, `*.apks`, `*.aab`, `*.dex`, `*.mpp`, `*.rve`, `*.jks`, `*.keystore`. Verified zero proprietary binaries in git history on `main`. |
| Stock Google prompt-policy strings | Google LLC | Hash-only fingerprints | Referenced by SHA-256 fingerprint + minimal identifying anchors only; full 17.8 KB prompt never committed. |

**Source & `.mpp` audit result:** **CLEAN.** All GPL-3.0 §5a/§5b/§7c, MIT, MPL-2.0, and BSD
attribution and notice obligations are satisfied across `LICENSE`, `NOTICE`, `NOTICE-cmudict.txt`,
`ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `README.md`, and `docs/index.html`.

## Patched Gboard APKs (binary side)

Patched Gboard APKs combine this GPL-3.0 patch layer with Google's proprietary Gboard base APK:

| Component inside a patched APK | License | Obligation / Constraint |
| --- | --- | --- |
| Gboard base (Google) | Proprietary | Google's Gboard binaries are not licensed for public redistribution. The clean, zero-risk distribution model (matching Morphe / ReVanced) is publishing **only source code and `patches-*.mpp` bundles** publicly so users patch a Gboard APK they obtain themselves, while keeping pre-patched APKs private for personal/maintainer testing. |
| Bundled open-source components inside Gboard (OkHttp, Kotlin stdlib, SIL OFL fonts, Unicode data) | Apache-2.0 / SIL OFL 1.1 / Unicode | Preserved intact inside the base APK. |
| Rambler Bangla patch layer & extensions (incl. MIT Hex & QuickJS-NG) | GPL-3.0 + MIT | Complete corresponding source code is published in this repository under GPL-3.0 with all MIT/BSD/MPL-2.0/§7c notices preserved. |

## Verdict

- **Git repository & Morphe `.mpp` patch bundles:** 100% open-source license compliant.
- **Patched APK redistribution:** To eliminate proprietary-binary redistribution risk, keep public
  GitHub Releases limited to source + `patches-*.mpp` + `SHA256SUMS.txt` if desired, and keep
  ready-made patched APKs private to the maintainer.
