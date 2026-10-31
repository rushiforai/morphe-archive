# Car Scanner 2.2.21

The optional **Car Scanner - Premium status** patch supports the latest local
original, `../OriginalApps/Car_Scanner-2.2.21.apk`. Existing 2.1.50 behavior is
preserved without extending its hooks. Use the original APK, not an already
patched input. No universal signature spoof is required for the new ECU hook.

## Proven input and contracts

- Manifest: `com.ovz.carscanner`, `2.2.21`, versionCode `42002021`, minSdk 23,
  targetSdk 36. APK SHA-256:
  `f48e2579c7deb669e2119d39b62854c25fb7d3ba5d614367c242da3b05cac5a0`.
- Only arm64-v8a assembly-store/AOT libraries occur in this input.
  `lib/arm64-v8a/libassembly-store.so` contains XABA v`0x80010003` at ELF
  offset 16384, 216 descriptors and 5616 index bytes. Descriptor 193 identifies
  `CarScannerMaui.dll`, with data offset 9899564 relative to the payload and
  compressed size 24870304. Its XALZ compression index is 124 (distinct from
  XABA descriptor 193). Its decoded PE is 40492032 bytes.
- Store SHA-256:
  `8e27ae5a623eb6edc47e8c90c3592da7f5b0db0384f89a7ba8541489a4d26f67`.
  Decoded shared assembly SHA-256:
  `4cc192ffd7e358be162590a22b38a7f9c9f83e0728a24fbc78ab999493d5f261`.
- `CarScannerMaui.Settings.SharedSettings::get_AdsProductPurchased`, MethodDef
  `0x060015be`, public instance Boolean(), signature `20 00 02`, RVA `0x9e654`,
  PE header offset `0x9c854`: fat header `13 30 04 00 7c 00 00 00 00 00 00 00`,
  124 code bytes, no local signature or exception sections.
- `CarScannerMaui.OBD2.OBDDataReader/<>c::<Initialize>b__181_0`, MethodDef
  `0x06002894`, instance Boolean(String), signature `20 01 02 0e`, RVA
  `0x1a64ec`, PE header offset `0x1a46ec`: fat header
  `13 30 02 00 73 00 00 00 00 00 00 00`, 115 code bytes, no exception sections.
  This delegate is used by Initialize's signature-list `Any` check. On failure
  the caller writes the literal `ATSF` marker, waits five seconds and returns
  false before normal ECU initialization. It does not transmit `ATSF` to the car.
- `libaot-CarScannerMaui.dll.so` SHA-256:
  `87a8bd91e73f0fd9f28754ca079ef753944b84fc5eddcc3f1bd558b3f13e9fbd`.
  `mono_aot_file_info` VA `0x18fb860`, format 187, method-address table VA
  `0x18db380`. Getter entry file offset `0x18d8a74` holds BL `0x97a56fe3`
  targeting VA `0x23ca00` / file offset `0x238a00`. Predicate entry file offset
  `0x18dd5cc` holds BL `0x97b73a55` targeting VA `0x6b3f20` / file offset
  `0x6aff20`. Unlike 2.1.50, these are real compiled bodies.

Both methods return true in IL (`ldc.i4.1; ret`, unreachable NOP padding) and
in AArch64 (`mov w0,#1; ret`, replacing the first eight bytes before any stack
change). Headers, tokens, MVID, remaining compiled code and offsets are preserved.
The exact-image hashes make these matches unambiguous and reject modified inputs.

## Repackaging exit

`assets/cs_profiles.dat` is an integrity manifest, not the vehicle profile
database: it lists SHA-256 hashes of the Android manifest, both DEX files,
resources, assembly store and AOT libraries. `cs_profiles.sig` accompanies it.
Any universal patch can therefore cause integrity failure independently of the
premium hook or ECU certificate check.

`com.ovz.carscanner.libusbtransport.UsbTransportProvider` (classes2.dex) loads
`usbtransport` and calls private static native `nativeAttach(Context):void`
from `onCreate():boolean`. `libusbtransport.so` registers that method through
JNI_OnLoad; the registered attach function starts at VA/file offset `0x247ac`.
Its failure path calls `0x2abf0`, which creates a sleeping thread at `0x2b150`
ending at `0x2b1c0` in `_exit(0)`. The exported JNI registration, attach logic,
validation and transport code are preserved. Only the failure-only scheduler's
first instruction (`0xa9bd7bfd`) becomes `ret` (`0xd65f03c0`).
Library SHA-256:
`b44e030155fabfc3ce2617a8ad776706a2b43f872bf6644392bd2b811a756ed4`.

The supplied logcat initially showed app PID 6208 exiting cleanly with code 0,
without an app fatal-exception trace. This is consistent with the above native
exit path, but does not establish which validation failed on the emulator. The
recurring UWB service SIGABRT traces are for a separate system process.

## Verification and limits

Run with Java 21:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyCarScanner221 :patches:verifyCarScanner221Bundle --no-daemon
```

The latest-version verifier checks both IL bodies, every other managed byte,
all 215 unrelated assemblies, ELF relocation/bounds, the exact 16 AOT bytes and
four scheduler bytes, and rejection of changed or already-patched resources.
The bundle verifier applies the discoverable patch to the original APK and
checks the resulting resources with no DEX changes. Existing 2.1.50 verification
tasks can run unchanged for regression coverage.

## Empty profile selector: native decoder seed

The subsequent 08:40 log reproduces `Unexpected BsonType value: -27` inside
`ProfileV2Model.f<List<OBDReaderProfileV2>>`, followed by `LoadProfiles` receiving
a null collection. The embedded database is found, but its decoded bytes are
invalid. This is independent of both the ECU certificate predicate and the
delayed process exit.

`ProfileV2Model.f` (MethodDef `0x06002163`, RVA `0x13539c`) decompresses
`CarScannerMaui.EmbeddedFiles.profiles7.db` then calls `GetShiftStream2` before
constructing BsonReader. Android's `NativeShiftStream` variant 2 invokes
`CarScannerMaui.Droid.Common.c.e` (MethodDef `0x060004fc`, unmanaged calli),
resolved through NativeLibrary.Load/GetExport to `libvndctx.so!n7q3v1`.
That function at VA `0x22d20` calls the variant-specific seed selector at
`0x22f1c`. For variant 2, the selector calls initializer `0x25540`.

The initializer's `csel w8,w9,w8,ne` at VA/file offset `0x25d68`
(`0x1a881128`) selects `0xec225c72` on context-validation success or
`0x9dac8f86` on failure. The following mixing code yields the normal seed 0
or failure seed `0x143a`. The patch replaces only this instruction with
`mov w8,w9` (`0x2a0903e8`), preserving the normal decoding seed. All buffer,
length, stream-position and transform-variant checks and the transform itself
remain unchanged. Original decoder SHA-256:
`2c68f2179bc348ea18bd7e40ba18fb2c21a1b6d77cb98959387994336f2765c5`.
The hash and instruction contract reject changed or already-patched libraries.

Independent host validation extracted the original embedded LZMA resource
(10032980 bytes), decompressed it to 75975218 bytes and reproduced the native
variant-2 byte transform. The failure seed produces BSON element type `0xe5`
(signed -27), exactly matching logcat. The normal seed yields a structurally
valid BSON array of **1323 profiles**; all nested document lengths, value types,
UTF-8 strings and terminators were parsed to the end of the array. It includes
the Mitsubishi Outlander II/XL/III/ASX/RVR/Lancer/CVT profile from the user's
successful original-app connection. No profile database bytes are modified.

The latest-version and packaged-bundle verifiers also check that exactly four
decoder bytes may change and that modified/already-patched decoders fail.
The user confirmed that the unmodified 2.2.21 APK shows profiles on this same
emulator, establishing that the observed empty list is a patching regression.
After adding the decoder fix, buildAndroid, generated metadata and both latest
verification tasks passed. LLVM objdump reloaded the packaged-patch output and
confirmed `mov w8,w9` at `0x25d68`. Rebuilt bundle SHA-256:
`ecdb9bb8688cba338860988100315b8c05c90094448986cf662a9026fa8b1b9c`.

User-reported validation on 2026-10-18: the updated app opened its screens and
profiles successfully in the emulator. After planning a real-device ECU test,
the user subsequently reported that everything was working. This records
successful device operation and ECU connection as user-reported results, not
agent-observed tests. Individual premium features and purchase/restore behavior
have not all been verified.

## Settings reset after restart (2026-10-30)

Reproduced on `emulator-5554` with the installed renamed package
`com.ovz.carscanner.morphe`: complete setup, select Acura OBD-II / EOBD,
press Home, force-stop and relaunch. The old patched app returns to Welcome.
No app data was cleared or app uninstalled during the investigation.

Settings storage `.y::g` (MethodDef `0x06001593`, read) and `.y::m`
(`0x06001599`, write) both use `IPlatformCommonService.GetShiftStream`.
Android implementation `0x0600021d` delegates to `NativeShiftStream.a`
(`0x060004e4`), which creates **variant 1**, not the profile variant 2.
`libvndctx.so!n7q3v1` dispatches variant 1 at `0x22f58` to initializer
`0x230fc`. Its separate `csel w8,w9,w8,ne` at file/VA `0x23fcc`
selects `0x3c6ef372` on validation success or `0xa54ff53a` on failure.
The native mixing sequence yields seed **0** or **0x4566**, respectively.
Variant 1's writer adds position + `0x38`; its reader subtracts position
with a seed-dependent adjustment. The failure seed breaks the round trip
even within the same process; this is not an asynchronous-save timing issue.

The patch additionally changes only `0x23fcc` from `0x1a881128` to
`0x2a0903e8` (`mov w8,w9`). Together with the existing profile correction,
exactly eight decoder bytes may change. The exact original library hash
still rejects modified inputs. Serialization, backup recovery, stream bounds,
flushes and the native byte transform remain unchanged. The verifier checks
both seeds and all 256 byte values across five stream positions, including
buffer boundaries, and rejects damage to either selector.

Built and applied from the original APK with Desktop 1.19.1 plus the official
`Clone app` patch, signed with the matching installed certificate and updated
in place using `adb install -r`. Output:
`../Apps/Car-Scanner-ELM-OBD2/Car-Scanner-2.2.21-settings-fix.apk`.
Packaged decoder matches the bundle verifier's output; both original DEX
files are unchanged. Owned provider authorities and permissions use the cloned
package. `verifyCarScanner221`, `verifyCarScanner221Bundle` and
`verifyAndroidBundle` passed for `patches/build/libs/patches-0.15.0.mpp`.

Agent-observed emulator validation: after the fix, setup completion and the
Acura profile survive Home + force-stop + relaunch. Interface font size changed
from 0 to 1 also survives that process restart (confirmed in the native picker
summary). Restored font size to 0, exited normally with Back and reopened;
the app returns to its main screen, not Welcome. This verifies settings
persistence on the emulator, not ECU connectivity or recovery of settings
already discarded by previous failed loads. LLVM objdump independently
confirmed `mov w8,w9` at `0x23fcc` in the verified decoder.

User confirmation on 2026-10-30: everything appears to be working correctly
after the settings fix. This is additional user-reported validation; no new
real-vehicle ECU test was specified.

Validation on 2026-10-18: `:patches:buildAndroid`, `:patches:generatePatchesList`,
`:patches:verifyCarScanner221`, `:patches:verifyCarScanner221Bundle` and the two
unchanged `verifyCarScannerManaged*` tasks completed successfully under Java 21.
Bundle: `patches/build/libs/patches-0.11.1.mpp` (version was not bumped).
The independent System.Reflection.Metadata reader reloaded the managed image
from the packaged patch output and confirmed both tokens/signatures/RVAs and
`ldc.i4.1; ret`. LLVM objdump independently confirmed both AOT Boolean returns
and the scheduler's `ret`. No final APK was rebuilt, signed or installed, and
no emulator/UI/ECU test was performed by the agent. Subsequent user-reported
runtime validation is recorded above.
