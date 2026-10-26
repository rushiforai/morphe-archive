# Taobao 10.66.30 forensic regression protocol (2026-10-23)

## What is established, and what is not

**Proven from prior offline runs** (see `analysis/native_dinamicx_text_binding.md` and
`analysis/signing_login_callpaths.md`):

- The studied original Taobao APK has SHA-256
  `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`.
- It contains 13 DEX files with 595,518 implemented methods.
- `Ltb/gi6;` (DXButterTextWidgetNode) and `Ltb/cx5;`
  (DXFastTextWidgetNode) have both a setter and a distinct TEXT-attribute
  path that writes the native widget's `text` field.
- Existing signed offline proofs changed four such methods and preserved
  other non-signature APK contents.
- Signer identity changes during ordinary Morphe rebuild/sign.
- Specific DEX login components query signature-derived public-key digests;
  this is **not** proof that home/login necessarily reject a different signer.

**Not proven:** whether any DinamicX hook executes for the actual home / Account
UI, whether a translated label reaches a displayed widget, whether re-signing
is responsible for the login failure, or whether an updated APK can navigate
Account and log in. Original, re-signed-only, and patched APKs have **not**
been executed as a three-way runtime comparison.

Earlier English network errors, recovery pages and the Terms `Agree` button
were English before localization and are **not** translation evidence.

## New diagnostic tools

- `scripts/triage_apk_variants.py` calculates SHA-256 hashes of every
  *decompressed ZIP member* in original, re-signed-only and patched APKs.
  It separates all 13 DEX files, ELF libraries, resources, manifest,
  bundled assets and v1 signing metadata. It also attempts Android
  `apksigner` verification if installed. A different full APK hash alone
  is not evidence of changed app code or native libraries: ZIP metadata
  and APK Signing Blocks also change.
- `scripts/inspect_native_elf.py` reads actual `.so` objects in the
  APK and inventories ELF dependencies, exported JNI symbols and selected
  DinamicX/security-related literal markers. An interesting marker is
  evidence for further investigation, **not** a verified signature check
  or a Java→JNI call edge. Hash comparisons reveal any modified libraries.
- `tests/AnalyzeDinamicXRoutes.java` scans the original DEX for
  direct invokes of the four concrete text hooks, callers two levels deep,
  calls within those implementations, TEXT attribute hashes, actual field
  writes and virtual-method signature candidates. Since superclass
  dispatch / reflection / JNI can bypass an exact direct invocation,
  a missing direct call is **not** evidence the method is unused.
- `tests/VerifyDinamicXNativeLabels.java` now also fingerprints narrow
  literals, branch offsets, invoke-range registers, array payloads
  and switch payloads. Previous checks omitted some of these and could
  fail to detect semantically significant DEX edits.
- `scripts/run_apk_matrix.sh` automates a reproducible four-variant
  Morphe Desktop run, offline checks and report generation against the
  exact-hash original APK. All variants use the same *disposable* test
  signing certificate (which is **not** the official Taobao signer). The
  Morphe CLI builds unsigned outputs which are then signed with `apksigner`
  to avoid a reproduced PKCS12-to-BKS signing alias error.

## Reproduction on a host with the exact original APK

Requirements: JDK 21, Morphe Desktop 1.18.1 all-in-one JAR, `kotlinc`,
Python 3, `keytool`, `readelf` and `apksigner`.

```sh
bash scripts/run_apk_matrix.sh \
  original-Taobao-10.66.30.apk \
  morphe-desktop-1.18.1-all.jar \
  /tmp/taobaolingo-apk-triage
```

Creates:

| Variant | Patch selection | DEX rebuild | Signer |
| --- | --- | --- | --- |
| original | none; unchanged | none | Taobao official |
| control-safe | **no patch** | STRIP_SAFE | local diagnostic signer |
| native-safe | **only four-hook DinamicX labels** | STRIP_SAFE | same diagnostic signer |
| control-full | **no patch** | FULL | same diagnostic signer |
| native-full | **only four-hook DinamicX labels** | FULL | same diagnostic signer |

Reports: `triage-safe.{json,md}`, `triage-full.{json,md}`,
`verified-native-*.log`, `dinamicx-original-callpaths.md`,
`original-native-jni.json` and per-variant Morphe logs.

Original/proprietary APK files and test signing keys are deliberately
**not** uploaded to GitHub. The shell wrapper refuses a source hash
different from the pinned 10.66.30 build.

## Interpretation of runtime comparison (requires a compatible Android host)

1. If **both zero-patch controls fail** while the original succeeds,
   translation code alone cannot explain the failure. Investigate signing
   identity, repackaging, native integrity checks and back-end account binding.
2. If **control-full works but control-safe fails**, suspect stripping /
   DEX class relocation instead of the English string dictionary.
3. If **controls work but native variants fail**, the injected DinamicX
   code, bytecode mode or class loading is implicated. Capture logcat
   around the earliest ART verifier, JNI loader or login exception.
4. If **native variants work but still display Chinese**, look for the
   live template-to-widget dispatch route and whether its field values
   match the exact-label dictionary. Compiled DEX hooks alone are
   insufficient.
5. Compare a **specific originally Chinese screen label** before and
   after patching. A pre-existing English label is not a positive test.

A real Taobao 10.66.30 ARM64 APK has not been booted in this new CI.
The prior successful x86_64 emulator experiments only tested a *different*
helper/overlay application and are not evidence for native Taobao localization.
OCR and overlays are outside the scope of this investigation.

## Android native fixture verification

[The independent native-fixture runtime test](native_fixture_runtime_verified.md)
**passed on Android 15**, covering both setter and template TEXT-attribute
hooks, direct String and SpannableString values, and negative controls.
This was performed with the actual Morphe 2.0 patch source against a
deliberately synthetic fixture, *not* the proprietary ARM64 Taobao APK.
It proves Android runtime execution of injected code, but **not** actual
Taobao UI translation, Account navigation or login functionality.

## Test and evidence policy

The GitHub build workflow runs synthetic-APK binary-diff tests, compiled
ELF/JNI inventory tests and Java tool compilation. These are infrastructure
tests; they **do not substitute for** full original-APK binary analysis,
device execution, network access, login or native UI English verification.
Do not label these checks as a working localized Taobao application.
