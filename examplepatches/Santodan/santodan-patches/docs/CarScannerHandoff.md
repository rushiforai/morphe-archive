# Car Scanner 2.1.50 inspection and implementation handoff

For the latest local 2.2.21 input, see [CarScanner221.md](CarScanner221.md).
Later device tests exposed 2.1.50's separate ECU certificate gate (`ATSF`);
the universal spoof patch did not resolve it. Existing 2.1.50 hooks remain
unchanged; initial premium-UI success below did not validate ECU connection.

The optional `Car Scanner - Premium status` raw-resource patch rewrites
`SharedSettings.get_AdsProductPurchased()` to return true in the exact original
2.1.50 input. It remains disabled by default. It does not fabricate billing
responses or change purchase/restore writers. The user reported that the patched
app appears to work on device. Individual features, server-controlled features,
independent gates, and purchase/restore behavior have not all been verified.

## Verified input and artifact provenance

- Original: `E:\Morphe\OriginalApps\Car-Scanner-ELM-OBD2_2.1.50.apk`.
- Manifest verified with local `aapt dump badging`: `com.ovz.carscanner`,
  version `2.1.50`, versionCode `42001050`, minSdk 21, targetSdk 35.
- Original SHA-256: `afab252c88104d1c04ed5c0751b6dbfce39be5f90d69e513e174d1ed5336336c`.
- Store: `lib/arm64-v8a/libassemblies.arm64-v8a.blob.so`.
  Extracted inspection store was compared byte-for-byte with that ZIP entry.
- Store SHA-256: `ab629a592cf8cd9ac886119e543489520d2cbb3391adf96218b590fc50482d4b`.
- Valid managed images and hashes are in
  `E:\Morphe\Skills\inspection-evidence\.inspect-carscanner-2.1.50\managed-verified\provenance.json`.
- Earlier files under `step04-managed` are invalid PE images: they were sliced
  from compressed XALZ blocks without LZ4 decompression. Preserve them as prior
  evidence, but do not use them for metadata or IL analysis.
- The new bounded decoder is `../Skills/inspection-evidence/.inspect-carscanner-2.1.50/decompress-managed.py`.
  It uses only Python's standard library and does not alter the original.
- Metadata/IL reader: `../Skills/inspection-evidence/.inspect-carscanner-2.1.50/metadata-reader/` (net10.0,
  no package dependencies). Dumps: `droid-il.txt` and `shared-il.txt` in the
  inspection directory. PowerShell redirection produced UTF-16 files.
- Focused UTF-8 extracts and caller/writer inventory:
  `../Skills/inspection-evidence/.inspect-carscanner-2.1.50/entitlement-evidence.txt`.
  All three extracted DEX files were compared byte-for-byte with the original.
  The APK's assembly-store/AOT entries are only under `lib/arm64-v8a/`.

## Where entitlement state comes from

The app is .NET MAUI. Java purchase listeners forward into managed implementations;
their native declarations do not contain the entitlement logic.

In `CarScannerMaui.dll`, the central observed accessor is:

- Type: `CarScannerMaui.Settings.SharedSettings`.
- Method: `get_AdsProductPurchased`, token `0x06001570`, RVA `0x9DC58`.
- Public instance method, zero parameters, Boolean result; signature bytes
  `20 00 02`. These are managed metadata identities, not DEX descriptors.
- It lazily loads the nullable `_AdsProductPurchased` field from
  `AppSettings.GetValueOrDefault("AdsProductPurchased", false, null)`.
- For a saved true value, it accepts `LicenseFinishDate` equal to DateTime
  MinValue/MaxValue or a date at least as late as UtcNow; otherwise it returns
  false. The iOS receipt fallback is a separate path.
- `set_AdsProductPurchased`, token `0x06001571`, RVA `0x9DCF4`, public instance
  void(Boolean), signature `20 01 01 02`, persists through
  `SettingsV2.AddOrUpdateValue` and notifies `AdsProductPurchased` changes.
  On false it also resets the last licence-check time and cached response.
- `get_IsTrialExpired`, token `0x06001593`, returns false when the purchase
  accessor returns true; otherwise it reads the platform key-pair storage.

Observed readers include `App.get_AppTitle`,
`Settings.MainPageConfigurationProxyItem.get_IsVisible`, coding-page constructors,
and save/apply event handlers. These establish that the accessor affects feature
gates as well as advertising. Do not infer that every premium feature uses it.

Android purchase/restore writers are in `CarScannerMaui.Droid.dll`:
`CarScannerMaui.Droid.InApp.PluginInAppManager` and
`PluginInAppManagerV2GooglePlay` (including asynchronous state-machine methods).
`DroidInAppManager` also writes entitlement state and wraps Google BillingClient
purchase/restore operations.
Trace the relevant nested methods in `droid-il.txt` before choosing a mutation.
`App.CheckRP_DROID` also contains refresh writes in the shared assembly.

The Java bridge `crc64168e9620ca5a041a.PurchaseUpdatedListener` in classes3.dex
registers `CarScannerMaui.Droid.InApp.PurchaseUpdatedListener` and delegates
`onPurchasesUpdated(BillingResult,List)` to its native counterpart.
DEX instruction layout and uniqueness have not been independently verified.
No billing response or purchase token has been fabricated.

## Files prepared and remaining work

| File | Role |
| --- | --- |
| `patches/src/main/java/santodan/patches/CarScannerCompatibility.java` | Exact APK package/version metadata |
| `patches/src/main/java/santodan/patches/CarScannerManagedPatch.java` | Discoverable optional raw-resource patch |
| `patches/src/main/java/santodan/patches/CarScannerAssemblyStore.java` | Exact-input LZ4 decoding, getter rewrite, assembly-store/ELF rebuilding |
| `patches/src/test/java/santodan/patches/VerifyCarScannerManaged.java` | Real-input mutation-scope and rejection checks |
| `patches/src/test/kotlin/santodan/patches/VerifyCarScannerManagedBundle.kt` | Packaged patch discovery/application and output reload |
| `docs/CarScannerHandoff.md` | Verified contracts and open questions |

Morphe patcher 1.12.0 exposes `PatchKt.rawResourcePatch` and
`RawResourcePatchBuilder`; their presence was checked with javap against the
installed dependency. This proves a packaging entry point, not successful managed
payload rewriting or runtime feasibility.

### Proven managed/AOT transformation

The exact AOT image SHA-256 is
`904b573b091044d68d120978482f262bfdabe6915870350691c57a4d0886f34d`.
Its exported `mono_aot_file_info` is at VA `0xaa228`, format 187. The
`method_addresses` pointer's AArch64 relative relocation is `0x8a840`.
The getter's zero-based MethodDef index is `0x156f`; its table entry at VA
`0x8fdfc` / file offset `0x87dfc` is `0x97ffea91`, a BL back to the table
itself. LLVM method lookup is absent. Mono treats this sentinel as a missing
compiled method, so this getter uses managed IL. Native libraries stay unchanged.
See the official [Mono AOT runtime source](https://github.com/dotnet/runtime/blob/main/src/mono/mono/mini/aot-runtime.c)
(`Compute method addresses`) and [format definition](https://github.com/dotnet/runtime/blob/main/src/mono/mono/mini/aot-runtime.h).
This proves the absence of a standalone AOT getter body; it does not establish
every premium feature's behavior or rule out inlining in every compiled caller.

The managed RVA `0x9dc58` maps to PE offset `0x9be58`. The fat header is
`13 30 05 00 8e 00 00 00 00 00 00 00`: 12-byte header, 142 code bytes,
no exception sections or local signature. Replace those code bytes with
`17 2a` (`ldc.i4.1; ret`) followed by unreachable NOPs, preserving the header,
metadata identities, MVID, file size, and every other byte of the PE image.

XABA descriptor 121 is at store offset `0x60d0` and points to offset 5053556
relative to payload start 16384, with compressed size 24663182. The patch
decodes the bounded XALZ block and stores the modified image as an uncompressed
PE, a format already present elsewhere in this store. It updates that
descriptor's size, shifts subsequent data/debug/config offsets, extends the
non-allocated ELF `payload` section, and relocates the section-header table.
Padding keeps the ELF64 section headers eight-byte aligned. Name hashes,
mapping indices, allocated ELF segments, and unrelated image blocks are preserved.
The uncompressed store grows by approximately 14.6 MiB before APK ZIP compression.

Store, assembly, and AOT hashes reject incompatible or previously modified input
before writing. No runtime extension or manifest changes are required.

Use Java 21 and `build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
:patches:verifyCarScannerManaged :patches:verifyCarScannerManagedBundle --no-daemon`.
Do not manually bump versions. Target only 2.1.50. Do not commit, push, or install
on a device without a user request.

## Earlier scaffold validation

The net10.0 metadata reader built successfully with zero warnings/errors and
read the identities and IL of both decoded app assemblies. APK/DEX/store
provenance checks passed. `build-local.ps1 :patches:buildAndroid
:patches:generatePatchesList --no-daemon` under Java 21 reported `BUILD SUCCESSFUL`;
generated metadata contains exactly one disabled Car Scanner entry targeting
2.1.50. Both new compiled classes are present in
`patches/build/libs/patches-0.10.1.mpp`. Javadoc emitted missing-comment warnings.
`git diff --check` passed. The bundle has not been applied to the app; no patched
APK was rebuilt, signed, installed, or device-tested.

## Premium-status implementation validation

`build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
:patches:verifyCarScannerManaged :patches:verifyCarScannerManagedBundle --no-daemon`
completed successfully under Java 21. Both real-input verifiers passed. The
generated metadata contains the optional `Car Scanner - Premium status` entry,
and `patches/build/libs/patches-0.10.1.mpp` applies it to the original APK.
All 207 unrelated image blocks remain byte-identical; only the target getter's
142 IL bytes can differ inside the decoded assembly. ELF sections reload within
bounds, the relocated section table is aligned, and incompatible/already-patched
inputs fail. No DEX edits are produced.

The existing independent System.Reflection.Metadata reader loaded
`patches/build/verification/carscanner-managed-bundle/CarScannerMaui.dll` extracted
from the actual packaged-patch output and confirmed token `0x06001570`, the
original declaring type/signature/RVA, and `ldc.i4.1; ret` at the method start.
`git diff --check` passed. Existing Javadoc/deprecation warnings remain.
The patch was built and applied on the host; no final APK was rebuilt, signed,
installed, or tested on a device. Device launch, premium UI/feature behavior,
and purchase/restore lifecycle behavior remain to be checked.

Subsequent user feedback: the patched app appears to work on device. This is
user-reported validation; it does not establish every premium feature or the
purchase/restore lifecycle.
