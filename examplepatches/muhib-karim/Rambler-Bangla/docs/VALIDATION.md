# Validation status

Date: 2026-09-20. Environment: offline Linux workspace, JDK 21, no device.

## A. Passed locally (no device required)

| # | Check | Result |
|---|---|---|
| 1 | Policy unit tests (`GboardRamblerLiteScriptRuntimeTest`) | 51/51 pass |
| 2 | Locale matrix: bn-BD / bn-IN / bn-Beng / bn / bn_BD -> NATIVE_PRESENT; bn-Latn / bn-latn / bn-Latn-BD / hi-Latn -> EXPLICIT_LATIN_ONLY; en-US / es -> NO_INDIC; blank/null -> UNKNOWN (stock) | pass |
| 3 | Hinglish override selection: native -> preservation rule; bn-Latn -> stock rule; non-Indic -> dropped; unknown -> stock | pass |
| 4 | SCRIPT GATE rewrite: native-only, sentinel-guarded, byte-identical outside Branch A bullet, idempotent, no-op on 3 kinds of prompt drift | pass |
| 5 | Fixture APK build: smali assemble, d8 extension dex, aapt2 link, v2 sign | pass |
| 6 | `analyze` on fixture: both fingerprints hit in the documented methods | pass |
| 7 | `patch` on fixture: both hooks inserted; enabled-languages value saved to a dedicated register (a register-clobber bug was caught here and fixed); register window grew exactly 3; stock rule string preserved as fail-safe input | pass |
| 8 | Extension-dex merge adds `classes3.dex` | pass |
| 9 | Fail-closed: wrong profile fingerprint -> abort, no output | pass |
| 10 | Fail-closed: tampered stock string in target dex -> abort, no output | pass |
| 11 | Fail-closed: re-patching an already patched build -> abort | pass |
| 12 | Patched+resigned fixture: APK Signature Scheme v2 verifies | pass |
| 13 | androguard parse: stock+patched fixtures valid, package/version read back | pass |

Suite total: 17/17 end-to-end checks + 51/51 unit assertions
(`tests/run_tests.sh`, reproducible).

## B. What the fixture proves and does not prove

The fixture is a self-built synthetic APK containing authored stand-in strings
under the documented class/method anchors. It proves the patching mechanics,
fingerprint gates, register dataflow, fail-closed behavior, dex
reassemblability, extension merge, and signing/parse validity of the pipeline.
It does NOT prove those anchors resolve identically inside the real
`classes3.dex`; that is exactly what `analyze` checks on the real APK at patch
time, fail-closed.

## C. Blocked locally (and why)

- Real patched Gboard APK: not produced. The stock Gboard 18.3.1 APK is a
  proprietary Google binary that must be user-supplied; it is not in this
  environment and is not fetched or published by this project. Everything that
  can be validated without it (A) is validated.
- Morphe/MPP build of the Kotlin patch: the Morphe Gradle plugin resolves from
  a credentialed repository and was unreachable; the patch source is delivered
  compile-reviewed with the one integration assumption (parameter-register
  rebasing when `registerCount` grows) called out in code, and the standalone
  smali route - which has no such assumption - is the validated equivalent.

## D. Requires the Galaxy S23 Ultra (behavior matrix)

Baseline (owner-confirmed): Rambler active, Bengali pack installed, mixed
Bangla+English speech recognized but output Latin-only.

Repeat for Rambler **Lite**, **Base**, and **S** where selectable, stock vs
patched A/B on the same device/account/model state:

1. Primary `bn-BD`, no secondary.
2. Primary `bn-IN`, no secondary.
3. Primary `bn-BD`, secondary `en-US`.
4. Primary `bn-IN`, secondary `en-US`.
5. Primary `bn-Latn`, secondary `en-US` (negative control: must stay Romanized).
6. Primary `en-US`, secondary native Bengali (primary-locale precedence probe).
7. Airplane-mode repeat of 1-4 (isolates the on-device cleanup from cloud
   Rambler; Bengali is absent from Google's official tuned-language list, so
   Base/S may Romanize regardless of any client patch).
8. Standard (non-Rambler) voice typing + one non-Bengali locale (regression).

Per case log: effective primary/secondary tags, active backend, hook status
(`GboardRamblerLiteScriptRuntime.lastHookStatus` via logcat), raw-ASR Unicode
script histogram, final-text Unicode script histogram. Never log audio or
dictated content; tag/script-count telemetry only.

Pass criteria: native Bengali cases show Bengali Unicode for Bengali words and
Latin for English words; `bn-Latn` stays Romanized; no semantic translation;
Standard voice typing and non-Bengali locales unchanged; no startup
regressions.

Decision tree:
- Raw ASR Bengali Unicode + stock final Latin + patched final Bengali =>
  local cleanup root cause confirmed, patch sufficient for Lite.
- Raw ASR already Latin => recognition/model boundary also involved; prompt
  patch may still regenerate script but study `kga`/SODA path next.
- Only Base/S fail => remote boundary; client-side work is exhausted for
  those tiers; report upstream as a language-support request.

## E. Hypothesis-stage experiment (not part of the proven fix)

zh-TW locale-admission seam (Lsdc;/Lrwr;, 18.0.3-verified, removed in
PixelBoard's runtime copy): IF a device decode shows Bengali filtered at the
dictation-eligibility Set, enable `ramblerLiteLocaleAdmissionExperiment` after
capturing 18.3.1 fingerprints for that constructor with `analyze`. The runtime
half (`admitExactBengaliLocales`) is implemented and unit-tested; the bytecode
half needs its own anchors. Do not enable by default: Bengali model/MDD packs
may not exist server-side, and admission without assets is an untested path.


## 2026-09-20: Rambler Bangla side-by-side rename verification

Artifact: `Rambler-Bangla-18.3.1-experimental.apk` (85,862,946 bytes,
SHA-256 bc6eed80b33a0460c314fcec20164b5642f1284fb643e03162c339044c92e7d8)
from base experimental APK 61e771bd92d62ca9415e05aa5a1d7a542add0d2806c1fa81acdd9c81831c8d36.

- androguard: valid APK; package com.aidev2024.ramblerbangla; label
  "Rambler Bangla"; vc 176004238; minSdk 32 / targetSdk 37.
- Provider authorities: 11/11 renamed; zero collisions with the original.
- Declared permissions renamed (pixelbundle.RECEIVER,
  DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION); deeplink host renamed;
  phenotype meta-data renamed.
- Component counts identical to base (31/22/12/11/19/64).
- Residual old-package strings: only intentional extension class names and
  private in-app keys (documented in docs/SIDE-BY-SIDE.md).
- classes.dex: baksmali diff vs base = exactly 14 intended string lines
  (incl. RENAMED_GBOARD_PACKAGE, both feature keys, whitelist sentence).
- ZIP: unzip -t clean; stored entries 4-byte aligned, all 16 .so
  page-aligned 4096 (raw local-header check).
- apksig: verified=true via v2; signer CN=Rambler Bangla (ai-dev-2024
  experimental), cert SHA-256 5a59f77bbf88a2e6ef7344594837bb44b9bf4da98aa1f4c846bb65dc1de6c37b.
- aapt2 badging consistent (package, label, targetSdk 37, arm64-v8a).
