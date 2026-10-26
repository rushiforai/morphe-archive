# Emulator native-bridge crash and APK identity: 2026-10-25

## Evidence from previous emulator A/B

The proprietary Taobao APK and signing keys are not distributed.

| Run | Android API | Original | Re-signed only | Meaning |
| --- | --- | --- | --- | --- |
| [40058202655](https://github.com/GoodLight999/TaobaoLingo/actions/runs/40058202655) | 33 | INSTALL_FAILED_NO_MATCHING_ABIS | INSTALL_FAILED_NO_MATCHING_ABIS | Both fail to install |
| [40058204146](https://github.com/GoodLight999/TaobaoLingo/actions/runs/40058204146) | 34 | Installs, crashes | Installs, crashes | Neither is a valid UI/login baseline |

Evidence branches: ci-results-33 and ci-results-34. Both API 34 UI
hierarchies were from com.google.android.apps.nexuslauncher, not Taobao.
The green result of those older workflows did not indicate a working app.

### Native crash in the unpatched re-signed control

The archived API 34 control logcat (ci-results-34/out/resigned/logcat.txt,
approximately lines 1208 and 1276-1290) shows:

- Fatal signal 6 (SIGABRT) in the Taobao process.
- Abort message: 'Cannot process signal 11'.
- libndk_translation.so in the native stack, with
  ndk_translation::HandleHostSignal.
- x86_64 emulator fingerprint in the tombstone.

This is direct evidence of a native-bridge signal-handling abort and
a reason not to attribute this emulator failure to app-signature validation.
The original APK also crashed. Its key log includes MTOP, SecurityGuard,
libsgmain.so and ART abort paths; an equivalent full original tombstone
has not yet been compared. Missing libsgmain.dm warnings alone are
not proof of a fatal missing library.

An independent test confounder was present: the older workflow installed
the original via streaming but the re-signed control via Incremental FS.

## Revised regression controls

The new emulator A/B CI:

1. Pins the original APK SHA-256 and validates a no-patch re-sign.
2. Compares decompressed ZIP members using --strict-control.
3. Forces non-incremental ADB installation for both.
4. Measures install success, main-process liveness and real Taobao UI nodes.
5. Returns a failure if either baseline misses the Taobao UI, preserving
   the diagnostic artifacts without claiming an operational application.
6. Publishes only selected report/status files to public evidence branches,
   not raw logcat or screenshots.

The independent unit tests distinguish install failures, launcher screens,
process death, malformed hierarchy XML and native-bridge abort markers.

The new real-apk-matrix CI independently rebuilds current Morphe Patcher 2
source against the exact original source APK and compares original,
zero-patch STRIP_SAFE, and native DinamicX-patched STRIP_SAFE variants,
signed with a common disposable test certificate. It publishes hashes,
method-diff and native-library content comparisons, not APK files or keys.

## What remains unresolved

The meaningful causal login test needs a native ARM64 Android environment
where the official APK runs normally. Official versus re-signed-only must
be compared before blaming the DinamicX injection. Actual live English
localization requires a before/after comparison of an originally Chinese
Taobao UI widget against the patched build.

The original app signer is not preserved when installing a repackaged APK
normally. Root-mount alternatives are separate experiments; their feasibility
on the user's device is not established.

**Current result:** Emulator signal-handling failure is supported by its
actual tombstone. The device Account/login regression remains unexplained.
Real Taobao native English UI has not been confirmed.

## Executed real APK offline matrix (2026-10-25)

The new workflow [run 40149635567](https://github.com/GoodLight999/TaobaoLingo/actions/runs/40149635567)
**completed successfully** on SHA 5470360d70afb8e56a70fa1344ff1f498aa74837.
Evidence artifact: real-apk-matrix-evidence (GitHub Actions artifact ID 12581987911; temporary, 14-day retention).
The exact SHA-pinned 77,255,755-byte original APK was decrypted in CI without publishing it.

Successful steps:

- Gradle Morphe Patcher 2 MPP build and Morphe Desktop 1.19.0 installation.
- Build zero-patch control and 108-label four-hook DinamicX native variant from the real Taobao APK via STRIP_SAFE.
- Sign both control and modified APKs under a single disposable diagnostic certificate; validate with Android SDK apksigner.
- Independent complete DEX verifier: exactly the four expected DinamicX methods changed among the 595,518 original methods.
- Independent ZIP member comparison: zero changed non-signature code/resources in the zero-patch control.
- Native library payloads remain unmodified.

GitHub job log contains:

    OFFLINE PASS: official signatures, unchanged control resources/code, exactly four changed methods.
    NOT TESTED: Android ARM64 installation, login, Account tab, or real Taobao UI English.

An initial new workflow run failed due missing GitHub Packages env key names.
A second attempt failed because Morphe Desktop Java 21 classes were started under a Java 17 launcher.
Both CI setup problems were corrected and the complete offline matrix was rerun to PASS.
No result here establishes a working app, login or English localization.

## Corrected two-variant emulator regression (2026-10-25)

[Run 40149567863](https://github.com/GoodLight999/TaobaoLingo/actions/runs/40149567863)
executed both official and re-signed-only binaries with adb --no-incremental,
from the same exact original SHA-256, and correctly returned workflow FAILURE.
Persisted in public ci-results-34/out/*/status.json:

| Probe | Install | Liveness at capture | Visible UI | Native bridge abort | Classification |
| --- | --- | --- | --- | --- | --- |
| Official original | PASS | Dead | NexusLauncher | true | APP_NOT_RUNNING |
| Re-signed only | PASS | Alive | Android system UI | true | TAOBAO_UI_NOT_REACHED |

Both scripts returned nonzero (out/probe-exits.txt original_exit=1,
resigned_exit=1), so neither variant met the native Taobao UI gate.
These are not equivalent terminal process states, and the evidence is
insufficient to conclude that re-signing alone causes the physical
device's Account/login regression. Both runs expose the native bridge
SIGABRT confounder on the x86_64 emulator.

## Cross-API native runtime probe: additional observed evidence

[Three-image run 40150040209](https://github.com/GoodLight999/TaobaoLingo/actions/runs/40150040209)
used Google APIs x86_64 emulator images for Android API 30, 34 and 35.
All APK installation and signer checks were required to pass before launching.

| API | Original Taobao | Re-signed only | ABI observation |
| --- | --- | --- | --- |
| 30 | Installs; SIGSEGV; process exited; no Taobao UI | Installs; SIGSEGV; process exited; no Taobao UI | x86_64, x86, arm64-v8a, armeabi-v7a, armeabi advertised |
| 34 | Installs; SIGABRT and native-bridge marker; no Taobao UI | Not completed in this specific run (cancelled by superseding push) | x86_64, arm64-v8a advertised |
| 35 | Installs; SIGABRT and native-bridge marker; no Taobao UI | Not completed in this specific run (cancelled by superseding push) | x86_64, arm64-v8a advertised |

Public evidence branches: ci-results-30, ci-results-34, ci-results-35,
each contains API-specific install and status metadata. The API 30
run fully finished both variants, and deliberately failed the workflow.
API 34/35 had diagnostic evidence for the original APK before cancellation;
they do not yet establish outcomes for the re-signed control within this
particular cross-API run. A revised time-bounded CI probe was then executed.

Importantly, native ARM64 ABI compatibility sufficient for installation
is **not** sufficient for running Taobao or SecurityGuard on these x86_64
emulators. These results do not identify the user's physical-device login
failure or prove that a patched Chinese label becomes English.
