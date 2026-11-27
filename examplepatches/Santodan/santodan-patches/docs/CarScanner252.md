# Car Scanner 2.2.52

The latest reviewed target is **2.2.52 / arm64-v8a only**. `com.ovz.carscanner`,
versionName `2.2.52`, minSdk 23, targetSdk 36. Original APK
`../OriginalApps/Car_Scanner-2.2.52.apk`, SHA-256
`b41220218c83e213152e74ca7e512ac901418973e81e03c89a3e27b1f8667350`. Evidence and
provenance: `E:/Morphe/Skills/inspection-evidence/.inspect-carscanner-2.2.52`.

`CarScanner252` adds the reviewed arm64 implementation. The dispatcher recognizes
its assembly-store hash before falling back to the preserved 2.2.42 and 2.2.21
implementations; the 2.1.50 legacy blob store is handled separately. Both premium
alternatives use this implementation for 2.2.52. Unknown or already modified 2.2.52
arm64 stores fail with an explicit error unless the experimental alternative's
generic fallback can locate the targets structurally (below). Choose only one
premium alternative.

The **guard** (`libusbtransport.so`) and **decoder** (`libvndctx.so`) are
byte-identical to 2.2.21 and 2.2.42, so the failure-only exit scheduler (`0x2abf0`)
and the settings/profile decoder seed selectors (`0x25d68`, `0x23fcc`) retain the
same proven instruction contracts and transformations. Only the assembly store,
the decoded `CarScannerMaui.dll` and the AOT image changed.

## Reviewed contracts

| Image | SHA-256 |
| --- | --- |
| `libassembly-store.so` | `dfbae3589994ffb1bc35ec87ccc0fd91a16c802e2bc0def6122c65fc3ad9756b` |
| decoded `CarScannerMaui.dll` | `089c2f648244425cc15d4de5bfcc0ab280bd2299282d04bc0bba60ec0572e6b0` |
| `libaot-CarScannerMaui.dll.so` | `4c2a19e830a21e591264dc967bdefa72eeef7c3e1c71adf3b08378038a825046` |
| `libusbtransport.so` | `b44e030155fabfc3ce2617a8ad776706a2b43f872bf6644392bd2b811a756ed4` |
| `libvndctx.so` | `2c68f2179bc348ea18bd7e40ba18fb2c21a1b6d77cb98959387994336f2765c5` |

The store is XABA `0x80010003` at ELF payload 16384, with **219** descriptors and
**5694** index bytes. Descriptor **192**, XALZ index **122**, identifies the shared
assembly at file offset **9818840** (four-byte aligned, so no leading padding is
required), compressed length 24113568, decoded length 39861760.

Independent System.Reflection.Metadata inspection confirms:

- `SharedSettings::get_AdsProductPurchased`, token `0x060015de`, instance bool(),
  signature `20 00 02`, RVA `0x9f78c`, body file offset `0x9d98c`, header
  `0x00043013`, 124 IL bytes.
- `OBDDataReader/<>c::<Initialize>b__181_0`, token `0x06002982`, instance
  bool(string), signature `20 01 02 0e`, RVA `0x1afa40`, body file offset
  `0x1adc40`, header `0x00023013`, 115 IL bytes. It is the ECU certificate
  predicate. Both IL bodies become `ldc.i4.1; ret` with unreachable NOP padding.

Mono AOT format **187**: `mono_aot_file_info` at VA `0x19a4ad8`, method-address
table VA `0x1983938`. Getter slot file `0x19810ac` (`BL 0x97a2e521`) targets the
compiled body at file `0x23e530`; predicate slot file `0x1985f3c`
(`BL 0x97b536b1`) targets file `0x6d7a00`. Both prologues
(`0x910003fda9ba7bfd`, `0x910003fda9be7bfd`) are identical to 2.2.42 and become
`mov w0,#1; ret` before any stack changes.

The repackaging failure scheduler at guard `0x2abf0` (`a9bd7bfd`) becomes `ret`;
JNI, hash validation and transport methods are unchanged. The decoder's variant-1
and variant-2 seed selectors at `0x23fcc` and `0x25d68` (`1a881128`) become
`mov w8,w9` so the settings and profile transforms keep their normal seeds.

## Mapped-PE alignment

Unlike the 2.2.42 arm64 block (file start `9828258`, 2 mod 4, which required two
leading padding bytes), the 2.2.52 block starts at `9818840`, already four-byte
aligned. The shared repacker's generic `(-start) & 3` leading padding therefore
evaluates to zero and the plain PE maps at the same aligned address. The verifier
still proves the alignment invariant: the 511-byte settings reader (RVA `0x9f150`,
PE `0x9d350`, one fat finally clause at section header `0x1c41`, flags `2`) reads
its finally section correctly at the aligned mapped address, and a deliberately
two-byte-misaligned mapping misreads it.

## Experimental generic fallback (future builds)

The **Car Scanner - Premium status (Experimental)** alternative has no version
restriction. For known builds (2.1.50, 2.2.21, 2.2.42, 2.2.52) it uses the reviewed
exact implementation selected by store hash. For an **unknown** arm64 build whose
store, assembly and AOT image match none of the reviewed hashes, it uses
`CarScannerGeneric`, a best-effort structural transformation:

- The main application assembly is located in the XABA store by content (largest
  XALZ block containing `CarScannerMaui.dll`), not by hash.
- The premium getter and the ECU certificate predicate are located by their stable
  metadata identities — method name plus signature (`get_AdsProductPurchased` /
  `20 00 02` and `<Initialize>b__181_0` / `20 01 02 0e`) — and their IL bodies are
  rewritten to return true.
- The compiled AOT bodies are resolved through the `mono_aot_file_info`
  method-address table (format 187) for the discovered MethodDef rows, verified to
  begin with a standard AArch64 frame prologue, and rewritten to `mov w0,#1; ret`.
  A method with no compiled body (sentinel slot) is left to the IL rewrite.
- The store is rebuilt with the same generic plain-PE placement and ELF relocation
  the exact implementations use.
- The repackaging guard and the settings/profile decoder are verified at their
  known instruction words and disabled; these libraries have been byte-identical
  across every reviewed version.

Anything that cannot be located with confidence throws, so a corrupt store is never
written. This is **not** an automatic port: a genuinely changed future binary
(renamed methods, a different Mono AOT format, a changed guard or decoder) may still
fail here and need review. The method names used are compiler- and property-stable
and have held across 2.2.21, 2.2.42 and 2.2.52.

## Verification

Use Java 21 and the workspace Android SDK:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList `
  :patches:verifyCarScanner252 :patches:verifyCarScanner252Bundle `
  :patches:verifyCarScannerGeneric :patches:verifyAndroidBundle
```

- `verifyCarScanner252` checks managed mutation scope, all 218 other assemblies,
  ELF relocation/bounds, the exact native mutation scope, the settings byte round
  trips, the alignment invariant and rejection of changed/already-patched resources.
- `verifyCarScanner252Bundle` discovers and applies each alternative independently
  to the original and reloads the rewritten store.
- `verifyCarScannerGeneric` proves the experimental structural fallback reproduces
  the exact 2.2.52 store/AOT/guard/decoder byte-for-byte, passes all exact
  structural checks, and fails safe on malformed input. This is the closest
  available proxy for an unknown future build.

### Completed checks

`buildAndroid`, `generatePatchesList`, `verifyCarScanner252`,
`verifyCarScanner252Bundle` and `verifyCarScannerGeneric` passed. The existing
`verifyCarScanner242` and `verifyCarScanner242Bundle` still pass (no regression).
`verifyMorpheDesktopImport` with `morphe-desktop-2.3.0-all.jar` imported all 41
patches across 9 apps. `verifyCarScanner221Bundle` could not run because its
original `OriginalApps/Car_Scanner-2.2.21.apk` is absent from the workspace; the
2.2.21 implementation is unchanged.

Unsigned audit builds of both alternatives were made with the Desktop CLI into
`E:/Morphe/Apps/Car-Scanner-ELM-OBD2/` (`...-2.2.52-patches-0.21.2-premium-unsigned.apk`
and `...-experimental-unsigned.apk`). They are byte-identical, and only
`libaot-CarScannerMaui.dll.so`, `libassembly-store.so`, `libusbtransport.so` and
`libvndctx.so` differ from the original.

Device UI, restart/settings persistence and real ECU connectivity on 2.2.52 require
separate validation. No APK was signed or installed. No release version was changed.

## Porting the next build

1. Extract the four `lib/<abi>/` libraries above from the new original into
   `E:/Morphe/Skills/inspection-evidence/.inspect-carscanner-<version>` and decode
   `CarScannerMaui.dll` from the XABA store.
2. Compare hashes with `.inspect-carscanner-2.2.52/provenance.json`. Guard and decoder
   have been byte-identical so far; if either changed, re-review it before reusing
   the known instruction words.
3. Resolve the getter and predicate by name and signature (above), their RVAs and IL
   bodies, then their AOT slots through the `mono_aot_file_info` method-address table.
   Check the store block start mod 4 (alignment padding).
4. Copy `CarScanner252.java` to a new versioned class with the new constants, select it
   by store hash in `CarScannerManagedPatch`, add the version to
   `CarScannerCompatibility`, and add versioned verifiers and Gradle tasks.
5. Point `VerifyCarScannerGeneric` at the new build: the generic fallback must still
   reproduce the exact output byte for byte. A quick first signal is to apply the
   experimental alternative to the new original before writing the exact class.
6. Write the provenance JSON, a versioned doc, and update `AI_Guide.md`,
   `.github/readme-apps/com.ovz.carscanner.md`, the README table row, and the
   `morphe-*` skills; then run `generatePatchesList` and
   `.github/scripts/generate_patches_readme.py Santodan/santodan-patches main`
   (on Windows set `PYTHONIOENCODING=utf-8`, or its final emoji print fails after
   the README is written).
