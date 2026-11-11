# Car Scanner 2.2.42

## Model-selection wait: mapped PE alignment

The user reproduced an indefinite **Please, wait...** when applying a Mitsubishi
model on the cloned `com.ovz.carscanner.morphe` 2.2.42 / 42002042 installation on
`emulator-5554`. The supplied `E:/Morphe/logs_patch.log` has no app exception at
that step. Retained evidence and the pre-fix APK/data backup are under
`E:/Morphe/Skills/inspection-evidence/.inspect-carscanner-2.2.42-model-wait`.

The 0.18.1 arm64 repacker replaced XALZ with a plain PE at the compressed block's
original file offset **9828258**, which is 2 mod 4. XALZ decompression provides
aligned memory; a directly mapped plain image needs the same alignment. Mono
rounds the mapped method code-end pointer to a four-byte boundary when locating
extra exception sections. At this unaligned PE base it reads those sections two
bytes late, breaking catch/finally handling. A settings getter can then retain
`y.Locker`, preventing both profile application and startup's current-car/database
initialization from completing. Native counters reproduced the stopped
`get_CurrentCarId` path without changing the original compiled loading logic.

`CarScanner242Arm64` now adds **two leading padding bytes** and moves only the
shared assembly descriptor's data start to **9828260**. Its trailing padding is
recomputed to keep ELF section headers aligned to eight bytes; all following
assembly blocks remain intact. Managed code, AOT bodies, decoder logic, settings
serialization and database work retain their existing transformations.

`VerifyCarScanner242Arm64` independently checks the actual exception-section
address for `y.ad<T>` (RVA `0x9eed8`, PE header `0x9d0d8`, 511 IL bytes, one fat
finally clause at PE `0x9d2e4`, header `0x1c41`). It accepts the corrected mapped
address and rejects the exact previous XALZ starting address. Both packaged patch
alternatives, Android bundle validation and Desktop import passed.

Agent-observed emulator check: the aligned build completes startup, applies the
Mitsubishi **Outlander II, XL, III, ASX, RVR (2.0, 2.4), Lancer X (1.8, 2.0),
ASX (1.8, 2.0), Citroen C-Crosser, Peugeot 3008 (2008-2016), 4007 (2007-2012)
+ CVT** profile, dismisses the wait and returns to Settings showing that selection.
The final normal-manifest, signed APK retains the selection after update/restart.
No app data was cleared. Device ECU connectivity is not tested.

Temporary debug, managed JIT/trace and native-counter builds were diagnostic only.
The managed trace changed exception behavior and must not be used as a production
fix. The delivered APK restores the original manifest, includes the complete
compiled AOT image, and differs from the user's installed APK in only the assembly
store (excluding signature metadata). The diagnostic helper and ADB forwarding
were removed. The original app data backup is retained.

Validated local deliverables before the authorized release refresh:

- `../Apps/Car-Scanner-ELM-OBD2/patches-0.18.1-carscanner-model-wait-fix.mpp`,
  SHA-256 `4aa553bb99f3c1b6ed7479fd168a0a65529fa67a8dd86c4b3edf04a918528434`.
- `../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.42-model-wait-fix.apk`, signed with
  the existing Morphe certificate and installed in place on the emulator;
  SHA-256 `f4657f74285ecfb535fa7cf8389794d23e5a3d56aed0c7e4f5d241f37dc0adc6`.

The initial v0.18.1 asset did not include this alignment fix. The user subsequently
authorized folding the fix into the previous commits and refreshing that existing
release, retaining version 0.18.1. The refresh workflow rebuilds and attests the
bundle at the updated v0.18.1 tag and replaces its existing assets. No additional
release version or feature commit is created. Future commits and publishing still
require a new explicit request for the current changes.

## Arm64 correction after mobile patching failure

The current `../OriginalApps/Car_Scanner-2.2.42.apk` is the user's replacement
**arm64-v8a** original: `com.ovz.carscanner` **2.2.42 / 42002042**, minSdk 23,
targetSdk 36. APK SHA-256:
`79986b0a1621c4e048252ba2ab2ca3228a296348b28a4dc5e22b5dfdc60a14f9`.
Evidence: `E:/Morphe/Skills/inspection-evidence/.inspect-carscanner-2.2.42-arm64`.
The published 0.18.0 build covered only x86_64 2.2.42. An arm64 APK reached
`CarScanner221.patch`, whose original-image hash correctly rejected the new
store. Selecting the experimental alternative separately had the same gap.

`CarScanner242Arm64` adds the reviewed arm64 implementation; the dispatcher
recognizes its assembly-store hash before falling back to the preserved 2.2.21
implementation. Both premium alternatives use this implementation. Unknown or
already modified 2.2.42 arm64 stores fail with an explicit 2.2.42 arm64 error.
Choose only one premium alternative.

| Image | SHA-256 |
| --- | --- |
| arm64 assembly store | `7b2d468c293ef32ac1d3524819df083b7d27f364bb17549f64244039ced0d8a2` |
| decoded shared assembly | `1b7bb9554abb0a0f3d0d84c47200443fc647305c6d7138d7b305b5e43c6050b7` |
| arm64 AOT image | `aecfeab8c728f860f9fcd2bdb721303c55a159abfdee1727c1b3a89c09772fd6` |

The guard and decoder hashes are identical to the reviewed 2.2.21 originals.
Their scheduler (`0x2abf0`) and settings/profile selectors (`0x23fcc`, `0x25d68`)
therefore retain the same proven instruction contracts and transformations.

The new XABA `0x80010003` has 216 descriptors and 5616 index bytes at ELF payload
16384. Shared assembly descriptor 192 / XALZ index 123 starts at file 9828258,
compressed length 25111997, decoded length 40797184. Independent metadata
inspection confirms the purchase getter token `0x060015dc`, signature `200002`,
RVA `0x9f514`, file header `0x9d714`, code length 124; and the ECU certificate
predicate token `0x06002901`, signature `2001020e`, RVA `0x1ab228`, file header
`0x1a9428`, code length 115. Both IL bodies return true with unreachable NOPs.

Mono format 187: file-info VA `0x19582b0`, table VA `0x1937698`. Getter slot
file `0x1934e04`, BL `0x97a410f7`, targets VA `0x2411e0` / file `0x23d1e0`.
Predicate slot file `0x1939a98`, BL `0x97b61eaa`, targets VA `0x6c9540` / file
`0x6c5540`. Both compiled prologues become `mov w0,#1; ret` before stack changes.
Every other assembly and native byte remains unchanged except the reviewed
scheduler and decoder mutation regions. No older-version mapping was extended.

The existing `verifyCarScanner242` and `verifyCarScanner242Bundle` tasks select
the arm64 verifier when the current original contains arm64 libraries; the
previous x86_64 verifier remains available for that architecture. The bundle
check applies the standard and experimental patches separately.

### Arm64 validation

`verifyCarScanner242`, `verifyCarScanner242Bundle`, the unchanged
`verifyCarScanner221Bundle`, `verifyAndroidBundle` and `verifyMorpheDesktopImport`
all passed. Both premium alternatives applied independently to the replacement
original. Desktop 2.1.1 rebuilt both with `--exclusive --unsigned`; the resulting
APKs are byte-identical, SHA-256
`eeb9f657a1a696c293f194244105a0232e97c7c5e7a333517faa60ac2457b3f7`:

- `../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.42-arm64-premium-unsigned.apk`
- `../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.42-arm64-experimental-unsigned.apk`

The delivered-APK audit confirms exactly the four intended native library entries
change and match the bundle-verifier outputs. Manifest, DEX, assets and unrelated
libraries remain unchanged. The independent metadata reader reloaded both IL
bodies and confirmed true returns with original tokens/signatures/RVAs. Changed
and already-patched resources are rejected, unrelated assemblies/managed bytes
are preserved, and settings byte round trips pass. The local fixed 0.18.0 bundle
before CI versioning has SHA-256
`146b5b3c0a5524e94096b251ef938e4e0ba21ea8c380f1033ccdd5096fd0f065`.
No APK was signed, installed or device/ECU tested. Evidence and build logs remain
in the arm64 evidence directory. Release metadata is updated by CI.

## Historical x86_64 investigation

Historical x86_64 original (replaced at this path): `../OriginalApps/Car_Scanner-2.2.42.apk`, pulled from the installed
`com.ovz.carscanner` on `emulator-5554`. Manifest confirms **2.2.42 / 52002042**,
minSdk 23, targetSdk 36. This APK contains **x86_64 only**. It does not establish
compatibility with an arm64 build of 2.2.42.

APK SHA-256: `a068f95d73d5a4902c0a13fc93fa313f71fa4ffaa30f5a9ac0f87dd70a842c73`.
Evidence: `E:/Morphe/Skills/inspection-evidence/.inspect-carscanner-2.2.42`.

## Patch choices

Select exactly one:

- **Car Scanner - Premium status** adds exact 2.2.42 support. Existing 2.1.50
  and 2.2.21 implementations remain unchanged.
- **Car Scanner - Premium status (Experimental)** has no version-name restriction.
  It retains the legacy store method, the 2.2.21 managed/arm64 method, and the new
  2.2.42 managed/x86_64 method. Archive layout selects the implementation, while
  exact native/store hashes reject unknown or already modified resources. This
  is not an automatic port to future app binaries: changed images need review.

All required transformations are calculated before writing any resources.
Neither patch writes purchase records or modifies a server account.

## Reviewed contracts

`CarScanner242` validates the following original images before mutation:

| Image | SHA-256 |
| --- | --- |
| `libassembly-store.so` | `c335a31f92a2e65d33cee39841c57214d3bded10f1d54d0921b04c22dbcff1ad` |
| decoded `CarScannerMaui.dll` | `13ed668f0e5c13228fbdbe8c93a4defd45b79bcecc62500f020003121cdd5801` |
| `libaot-CarScannerMaui.dll.so` | `1647f3bc6e1f781dbaaae7037d88cbf97742b4729917cde5a388902567183b83` |
| `libusbtransport.so` | `b7d613318de8e9c235cdbcc49aa2af8b3757919aabfbf0341caa03576850c47c` |
| `libvndctx.so` | `1200790584238e24822b4075cd1f768f50932ae4ba99aa852a758f3d7fdd4c7d` |

The store is XABA `0x80030003` at ELF offset 16384, with 216 descriptors and
5616 index bytes. Descriptor **192**, XALZ index **123**, identifies the shared
assembly at file offset 9831424, compressed length 25113624, decoded length
40799232. The new store format differs from 2.2.21's `0x80010003`.

Independent System.Reflection.Metadata inspection confirms:

- `SharedSettings::get_AdsProductPurchased`, token `0x060015dc`, instance bool(),
  signature `20 00 02`, RVA `0x9f518`, file header `0x9d718`, 124 IL bytes.
  It reads the native nullable purchase status and license finish date.
- `OBDDataReader/<>c::<Initialize>b__181_0`, token `0x06002901`, instance
  bool(string), signature `20 01 02 0e`, RVA `0x1ab2b0`, header `0x1a94b0`,
  115 IL bytes. It compares the supplied certificate with the native signature
  allowlist. Both IL bodies become `ldc.i4.1; ret` with unreachable NOP padding.

Mono AOT format 187 has method-address table VA `0x1819098`, with five-byte CALL
entries. Getter slot file `0x1817ddf` targets VA `0x206480` / file `0x202480`;
predicate slot file `0x181dd98` targets VA `0x65d5c0` / file `0x6595c0`.
Both compiled bodies become `mov eax,1; ret` before stack changes (12 bytes total).

The failure scheduler at VA/file `0x2c170` creates a pthread at `0x2c800`, which
sleeps then calls `_exit(0)` at `0x2c860`. Its first byte becomes `ret`; JNI,
validation, transport and the worker body remain unchanged.

Decoder variant 1 converges at `0x225ba`. Replacing its six-byte multiply with
`mov ecx,0x162f2a9e; nop` reproduces the normal multiply result. The following
native XOR produces zero, and the original mixing stores normal seed zero on
all validation paths. This covers settings reads and writes. Variant 2 selects
`0xec225c72` instead of failure constant `0x9dac8f86`; `cmovne ecx,eax` at
`0x2573d` becomes `mov eax,ecx; nop`. Its original mixing also yields seed zero.
Only nine decoder bytes are in the mutation regions; transforms and bounds stay
native. Both variants must remain covered to avoid the previous settings reset.

## Verification

Use Java 21 and the workspace Android SDK:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyCarScanner242 :patches:verifyCarScanner242Bundle :patches:verifyAndroidBundle
```

The host verifier checks managed mutation scope, all 215 other assemblies, ELF
relocation/bounds, exact native mutation scope, settings byte round trips and
rejection of changed/already-patched resources. The bundle verifier discovers
and applies each alternative independently to the original and checks its output.
Historical verifier fixtures and implementations are unchanged.

Device UI, restart/settings persistence and real ECU connectivity on 2.2.42
require separate validation. No APK was signed or installed.

### Completed checks

`buildAndroid`, `generatePatchesList`, `verifyCarScanner242` and
`verifyCarScanner242Bundle` passed. Both alternatives apply independently.
The unchanged `verifyCarScanner221Bundle` passed. The optional unchanged
`verifyCarScannerManagedBundle` could not run because its original
`OriginalApps/Car-Scanner-ELM-OBD2_2.1.50.apk` is absent; no replacement older
fixture was created. Separate `verifyAndroidBundle` and `verifyMorpheDesktopImport`
runs passed with `-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.1.1-all.jar`.
Desktop imported all 38 patches across 9 apps. `git diff --check` passed.

Bundle: `patches/build/libs/patches-0.17.0.mpp`, SHA-256
`a92d24c686d257eb5df0a99f2357138ed0e60db892323e0574b65cb5125a238e`.
No release version was changed.

Desktop 2.1.1 rebuilt each alternative with `--exclusive --unsigned`:

- `../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.42-premium-unsigned.apk`
- `../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.42-experimental-unsigned.apk`

Both APKs have SHA-256
`b5e90cf30bf2cb6ed3a5038bfa186b3617da7ace2ff2338a9eb2fc213c55ffb3`.
The delivery audit compared every non-signature entry with the original: only
the four reviewed native libraries change. Manifest, both DEX files, assets and
all unrelated libraries are unchanged; no archive entries were added. Each
modified library matches its corresponding bundle-verifier output byte for byte.
An independent metadata reader reloaded both patched IL bodies, and LLVM objdump
reloaded the native decoder. Evidence logs and `apk-audit.json` remain in the
canonical 2.2.42 evidence directory. These are host/rebuild results, not device
or ECU test results.
