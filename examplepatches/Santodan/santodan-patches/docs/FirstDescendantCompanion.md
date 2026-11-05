# The First Descendant Companion

Target: **com.nexon.tfdc 1.1.5 (ARM64)**, the latest available original in this
workspace. This is the single reference for its patches and investigation.

## Current status

**Working fix: TFD Companion - Remove illegal apps detection.** This resource
patch is enabled by default for com.nexon.tfdc 1.1.5 on Android 11/API 30+.
It removes only the two unconstrained MAIN and VIEW intent queries from the
manifest. NGSM, its native libraries, warning callbacks, authentication and token
validation remain intact. Specific app, browser, billing and sharing queries and
the original Nexon login callback are preserved.

The user confirmed successful operation with Shizuku installed (token result 0
at 13:13:37.897 on 2026-10-15), then installed the autoclicker and reported that
it also works. These tests cover installed-app coexistence, not every tool or
operation with accessibility services or Shizuku's service active.

**Recommended configuration:** patch the original complete APKS with installed-app
visibility restriction and the Google Play installation-source spoof used in the
successful comparisons. Keep package name com.nexon.tfdc. NGSM validation
diagnostics is optional, disabled by default, and unnecessary for normal use.
The universal installer-source patch remains a separate selection.

**Retired:** Suppress NGSM warnings and shutdown. Its native implementation,
matcher, verifier and Gradle task have been removed, and it is no longer offered
in the current bundle. Controlled comparisons isolated validation result 5000 to
that native suppression configuration. Do not reuse old bundles or patched APKs
containing it.

| Tested configuration | User result |
| --- | --- |
| Original signed splits, both external apps absent | Login and Factory/Favorites work. |
| Morphe rebuild with Google Play source spoof only | Works. |
| Source spoof plus diagnostics, native suppression off, external apps absent | Works; token result 0. |
| Native suppression enabled, even with external apps removed | Abnormal-access alert; validation payload 5000. |
| Diagnostics/source spoof with Shizuku installed, before visibility restriction | Illegal-program warning 111/500381; SIGKILL/status 9 recorded. |
| Visibility restriction plus diagnostics/source spoof, Shizuku installed | Works; token result 0. |
| Same working patch, autoclicker installed | User reports it works. |

### Why package visibility

The original manifest has one action-only MAIN query and one action-only VIEW
query. The traced native package enumerator at 0x868ea0 calls
getInstalledPackages(0). The emulator's Shizuku package
moe.shizuku.privileged.api exposes a MAIN/LAUNCHER activity. Android filters
PackageManager results according to manifest queries:
[declared visibility](https://developer.android.com/training/package-visibility/declaring),
[automatic visibility](https://developer.android.com/training/package-visibility/automatic).
The change is not a Shizuku-specific allowlist and may help other installed apps.
Some packages remain automatically visible; explicit interactions, files and active
services can also expose apps. Compatibility with every external tool is not
claimed. Subcodes 500381 and 500216 have not been mapped to complete native rules;
neither appears as ASCII, UTF-16 or a little-endian 32-bit literal in the original
ARM64 libraries.

### Artifacts and validation

Bundle: `patches/build/libs/patches-0.10.1.mpp`. Build and verification commands
are below. The packaged visibility verifier checks exact mutation of the original
manifest, preservation of remaining XML/integrations, compiled-manifest reload,
no standalone DEX edits and fail-closed rejection of changed/ambiguous inputs.
Combined verification checks optional diagnostics and retention of all seven
original native libraries. Diagnostics logs numeric token-result codes and failed
validation values, never tokens.

Earlier candidate APK inspection and user device testing are separate evidence.
The unsigned inspection output at
`E:\Morphe\Apps\TFD-Companion\TFD-Companion-1.1.5-visibility-candidate-unsigned.apk`
was rebuilt from the original APKS with visibility, diagnostics and Morphe 1.47.0
Change installer source. Its seven native libraries matched originals exactly;
package/version, callback and diagnostic DEX were verified. Report:
`Skills/inspection-evidence/.inspect-first-descendant-runtime/visibility-candidate-verification.json`.
The agent did not sign/install that artifact. The user subsequently tested their
own rebuilt/installed configuration successfully.

## Implementation files

| File | Purpose |
| --- | --- |
| `patches/src/main/kotlin/santodan/patches/FirstDescendantVisibilityPatch.kt` | Supported manifest visibility restriction. |
| `patches/src/main/java/santodan/patches/FirstDescendantCompatibility.java` | Exact package/version and APKS compatibility. |
| `patches/src/main/java/santodan/patches/FirstDescendantDiagnosticsPatch.java` | Optional result-code logging. |

Verification programs `VerifyFirstDescendantVisibility.kt`,
`VerifyFirstDescendantDiagnostics.kt` and `VerifyFirstDescendantBundle.kt` live
under `patches/src/test/kotlin/santodan/patches/`. Inspection scripts remain under
`patches/src/test/python/`. No runtime extension or older-version mappings were added.

## Original input

- Input: `E:\Morphe\OriginalApps\The-First-Descendant-Companion_1.1.5.apks`.
- SHA-256: `61b48408873dd7cc8f75c9ab65b21419e4e3577371443f1ac3f9359c71325f4d`.
- Base manifest: package `com.nexon.tfdc`, version `1.1.5`, version code `29`,
  minimum SDK `24`, target SDK `36`, label `TFD Companion`.
- Archive APKs: `base.apk`, `split_config.arm64_v8a.apk`,
  `split_config.tvdpi.apk`, `split_config.xxxhdpi.apk`. Preserve the splits when
  eventually rebuilding/installing; the base alone is not the full app.
- Base SHA-256: `cace89a70bab683beeb3d94c02a2c5ceeee6fb4d24578d8e3a4a824c7ae0407e`.
- ARM64 split SHA-256: `03de3b018f3c832a26521aac53ab2c33b6f7e6e5a2cd51fdd4529f25904062f6`.

## Confirmed DEX/resource contracts

These descriptors and instruction sequences come from disassembly of the
original DEX, not source mappings. Focused disassembly is in
`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-1.1.5-repro\`.

| Contract | Confirmed behavior |
| --- | --- |
| `Lcom/nexon/tfdc/activity/TCMainActivity;->r0()Z` | Public final instance method, 3 registers. Loads resource `0x7f120070`, calls `TCApplication$Companion.a(I)Ljava/lang/String;`, then `Boolean.parseBoolean`. Has a catch-all region and defaults to true when no Boolean result exists. |
| `string/enableNgsm`, ID `0x7f120070` | Default value is the string `true`; resource flags are zero. |
| `Lcom/nexon/tfdc/activity/base/TCSdkActivity;->r0()Z` | Base implementation returns false; the main activity overrides it. The intro activity inherits the base implementation. |
| `Lcom/nexon/tfdc/activity/base/TCSdkActivity;->s0(Lkotlin/coroutines/jvm/internal/SuspendLambda;)Ljava/lang/Object;` | Public final instance method, 7 registers. Inside a try region: constructs `NPOptions` in `v2`, invokes `r0()` on `p0`, immediately moves the Boolean result into `v3`, then invokes `NPOptions.setNgsmEnabled(Z)V` with `{v2, v3}`. Sets account options and calls account initialization. |
| `Lcom/nexon/ngsm/Ngsm;->onAbuseDetect(ILjava/lang/String;Z)V` | Public instance method, 5 registers. `p1` is a detection code, `p2` a message, `p3` an exit flag. Tries the activity's `OnAbuseListener` through `ShowMsgBoxFromGame`; otherwise calls `ShowMsgBox(p2,p3)`. This is a generic notification handler, not a proven Shizuku detector. |
| `Lcom/nexon/ngsm/Ngsm;->ShowMsgBox(Ljava/lang/String;Z)V` | Private instance method, 4 registers. Stores the flag in `m_bExit:Z`; returns if the host is missing or destroyed; otherwise schedules `Ngsm$1` on the UI thread. |
| `Lcom/nexon/ngsm/Ngsm$1$1;->onClick(Landroid/content/DialogInterface;I)V` | Reads `m_bExit` through `access$100`; if true invokes `access$200`, which calls `finishGame()`. Also unlocks the dialog lock with exception handling. |
| `Lcom/nexon/ngsm/Ngsm;->finishGame()V` | Private instance method, 3 registers. Opens HOME and starts `Ngsm$2`; that thread calls `Process.killProcess`. |

The NGSM constructor loads `libngsm.so`. Java native entry points include
`ngsmNativeInit`, `ngsmNativeRun`, `ngsmNativePause`, `ngsmNativeResume`, and
`ngsmNativeGetNgsmToken`. `NXPNgsm.initialize`/`run` wrap these operations.

The account flow also retrieves an NGSM token and passes it to
`Lcom/nexon/tfdc/network/TC2AppApi;->d(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;`.
The token coroutine logs `checkNgsmValidation success` or `checkNgsmValidation
fail`, and can cancel on failure. Therefore disabling the entire security module
or suppressing a dialog cannot be assumed to preserve login/server validation.

## Retired native suppression: investigation history

The failed native patch is removed from source and discovery. It replaced six
instructions in the original ARM64 libngsme.so:

| ELF VA | File offset | Historical replacement |
| --- | --- | --- |
| 0xb3baec | 0xb37aec | Scanner response launch -> mov w0, #0 |
| 0xb3bb04 | 0xb37b04 | Scanner shutdown launch -> mov w0, #0 |
| 0xb3bb1c | 0xb37b1c | Scanner exit flag -> mov w28, #0 |
| 0x862054 | 0x85e054 | Shared onAbuseDetect invocation -> nop |
| 0x5f754c | 0x5f354c | Delayed kill(getpid(), SIGKILL) -> mov w0, #0 |
| 0x5f7180 | 0x5f3180 | Response-thread exit_group(0) -> nop |

The three-site revision missed code-111 paths. A five-site revision still produced
EXIT_SELF/status 0 for PIDs 8838 and 9948 on 2026-10-14. The six-site revision
suppressed another five-second exit_group response but failed API validation with
5000, even without Shizuku/autoclicker. Whether this reflected integrity detection
or another required engine behavior was not established. Host mutation tests had
passed but did not establish successful runtime authentication. The working
manifest-only approach supersedes this code; native evidence below is retained
for reference, not as instructions to reintroduce the failed bypass.

## Factory and Favorites validation diagnostics

### Factory/Favorites: abnormal access investigation

Target: original com.nexon.tfdc 1.1.5, base.apk/classes4.dex.
The exact resource 0x7f120073 is error_message_ngsm_s_api:
"Abnormal access detected. The app will now close."

The only code-item containing that resource literal across the original DEX
files is TCSdkActivity$getNgsmToken$2.invokeSuspend(Object):Object, an instance
coroutine with 13 registers. Its declaring descriptor is
Lcom/nexon/tfdc/activity/base/TCSdkActivity$getNgsmToken$2;.

It calls NPAccount.getNgsmToken, inspects NXToyResult.errorCode, and on success
submits ngsmToken to TC2AppApi.d(String,Continuation). If that validation call
succeeds, the first returned integer must exist and equal zero. A nonzero or
missing integer shows the abnormal-access alert and cancels the coroutine.
Other token retrieval errors can also show this same alert. NGSM_INVALID_USER,
NGSM_TOKEN_NOT_EXIST, and NGSM_TOKEN_VERIFY_NOT_COMPLETED instead take a
separate coroutine branch. Neither the message nor this log proves which
particular result was returned.

TCAlertActivity$bindingEvent$1$1.invokeSuspend calls finishAffinity and
System.exit(0) on its process-exit branch. The supplied log explicitly records
System.exit called, status: 0 at 17:32:52.599 (PID 15735), following the Factory
detail activity/dialog flow. This is separate from the earlier native
exit_group response. The nearby WindowLeaked error concerns a loading dialog
in TCMetaResearchActivity; it does not itself establish the termination cause.

### Optional diagnostic patch

For troubleshooting, optionally select **TFD Companion - NGSM validation diagnostics - Troubleshooting purpose**
alongside **TFD Companion - Remove illegal apps detection**. Rebuild from the
original complete APKS and keep package identity com.nexon.tfdc. Diagnostics is
disabled by default; the visibility patch is enabled by default.

The diagnostic patch logs only:

- TFD-NGSM / info: numeric NPAccount token-result error code.
- TFD-NGSM / error: checkNgsmValidation fail : <integer or null>.

It does not enable the global debug logger (which has token logging), log token
values, alter authentication results, suppress this alert, or change its exit.
The original gated failure log is replaced with the same failure message sent
directly to Android Log. Numeric token result logging uses dead scratch
registers v9/v10 immediately before their existing assignments. The failure
branch uses dead v9 for its fixed tag. Register count, validation invocations,
success/failure branches, return values, and coroutine cancellation are retained.
Missing/changed/ambiguous and already-instrumented layouts fail before mutation.

Capture after reproducing Factory -> Favorites:

```powershell
& E:\Morphe\SDK\platform-tools\adb.exe logcat -b main,system,crash -v threadtime -T 1 'TFD-NGSM:I' 'AndroidRuntime:I' '*:S' > E:\Morphe\tfd-validation.log
```

Stop with Ctrl+C after the warning. A diagnostic result will distinguish token
retrieval errors from validation failures; it will not by itself establish
whether an error is local or server-generated. The emulator was disconnected
during this investigation, so no new installation or live reproduction occurred.

## Build and verification

After retiring native suppression, the supported bundle was rebuilt and all
three current verification programs passed. Generated metadata contains exactly
two TFD patches: visibility enabled by default and diagnostics disabled by
default. The actual MPP contains none of the retired native patch classes.

A normal-use unsigned APK was also rebuilt from the original APKS with visibility
and Google Play installer-source spoof, without diagnostics:
`E:\Morphe\Apps\TFD-Companion\TFD-Companion-1.1.5-supported-visibility-unsigned.apk`.
Final inspection verified all seven native libraries unchanged, diagnostic tags
absent, broad MAIN/VIEW queries removed, and original package/version and login
callback retained. This additional artifact was not signed or installed by the
agent; the user device results above apply to the previously tested configuration.

From `E:\Morphe\santodan-patches`:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:verifyFirstDescendantVisibility :patches:verifyFirstDescendantDiagnostics :patches:verifyFirstDescendantBundle :patches:generatePatchesList
```

The build, standalone diagnostic/visibility verification, combined packaged
application, and generated metadata checks passed on 2026-10-15. Diagnostics were
written to DEX and reloaded; result calls and branch opcodes were retained.
Missing/changed and already-instrumented inputs were rejected. Combined testing
confirmed both patches apply together to an unsigned original-split fixture,
with all original native libraries retained and diagnostic DEX reloaded. That fixture is for inspection,
not an installable app. Build logs are under
`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-runtime\build-diagnostics*.log`.

No app was signed or installed by these build/verification steps. User device
tests are distinguished from host verification throughout this document.
No commits, pushes, or release-version bumps were performed.

## Original Java callback evidence

### Original Java warning and shutdown functions

The confirmed Java-side security-result handler is:

```text
Lcom/nexon/ngsm/Ngsm;->onAbuseDetect(ILjava/lang/String;Z)V
```

It belongs to class `com.nexon.ngsm.Ngsm`, packaged in `base.apk/classes4.dex`.
The original build strips the source filename to `SourceFile`; `Ngsm.java` is the
conventional class-to-source name, not a recovered original source file. Exact
original DEX disassembly is saved in
`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-1.1.5-repro\Ngsm.smali`, line 880.

### Full function, reconstructed from original DEX

The parameter names below describe their use; they are not recovered original
parameter names. This is a readable equivalent, not the app's original Java source.

```java
public void onAbuseDetect(int detectionCode, String message, boolean exitApp) {
    if (m_Activity instanceof Ngsm.OnAbuseListener) {
        if (ShowMsgBoxFromGame(detectionCode, message, "onAbuseDetected")) {
            return;
        }
    }
    ShowMsgBox(message, exitApp);
}
```

`ShowMsgBoxFromGame` reflects the host activity's public
`onAbuseDetected(int, String)` method and returns true if invocation completes.
If reflection/invocation throws an `Exception`, it prints the exception and returns
false, allowing the standard NGSM dialog path.

The handler receives the code/message/exit decision. It contains no installed-app
list or Shizuku predicate, and therefore does not itself decide which external
application is considered illegal.

### Warning and termination functions

Readable equivalent of `Ngsm.ShowMsgBox(Ljava/lang/String;Z)V`:

```java
private void ShowMsgBox(String message, boolean exitApp) {
    m_bExit = exitApp;
    if (m_Activity == null || m_Activity.isDestroyed()) {
        return;
    }
    m_Activity.runOnUiThread(new Ngsm$1(this, message));
}
```

`Ngsm$1` builds the alert. `Ngsm$1$1.onClick` checks `m_bExit` and calls
`Ngsm.finishGame()` through the synthetic accessor `access$200` when true.
It also unlocks the dialog lock, retaining exception handling.

Readable equivalent of `Ngsm.finishGame()V`:

```java
private void finishGame() {
    Intent intent = new Intent("android.intent.action.MAIN");
    intent.addCategory("android.intent.category.HOME");
    intent.setFlags(0x10000000); // FLAG_ACTIVITY_NEW_TASK
    m_Activity.startActivity(intent);
    new Thread(new Ngsm$2(this)).start();
}
```

Full readable equivalent of `Ngsm$2.run()V`:

```java
public void run() {
    try {
        Thread.sleep(300L);
    } catch (InterruptedException exception) {
        exception.printStackTrace();
    }
    android.os.Process.killProcess(android.os.Process.myPid());
}
```

`Ngsm$1` and `Ngsm$2` above denote DEX classes; their constructor syntax is
illustrative. These reconstructed excerpts are documentation, not compilable patch
code. The actual smali files retain the precise instructions and exception regions.

## Native package scanning evidence

### Detector identities

Original ELF relative relocations associate these C++ type identities with
the following static addresses in `libngsme.so`. They are not live process
addresses, patch offsets, or recovered virtual-method names.

| Type | Typeinfo VA | Vtable VA |
| --- | --- | --- |
| `CADB` | `0xf20678` | `0xf20618` |
| `CRooting` | `0xf1d718` | `0xf1d6b8` |
| `CHacktoolDex` | `0xf2c708` | `0xf2c6a8` |
| `CHacktoolFile` | `0xf35568` | `0xf35508` |
| `CHacktoolRsc` | `0xf3ae20` | `0xf3adc0` |

The original DEX string tables and readable native strings contain no Shizuku
name. Encoded strings, rule data and other checks remain possible. RTTI alone
does not identify the rule responsible for the user's warning. Saved evidence
includes `native-detector-rtti.json`, `ngsme-symbols.txt`,
`ngsm-native-init-run.asm`, and `ngsme-adb-vtable-slot2.asm` under
`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-1.1.5\`.

### File and scanner function

The native library is `lib/arm64-v8a/libngsme.so` inside the original
`split_config.arm64_v8a.apk`, itself inside
`The-First-Descendant-Companion_1.1.5.apks`.

Library SHA-256:
`4fe741656c3cbc6b98f726fed42956fbae97ce86ee7783cef731582f1c7e15d9`.

The installed-app/file scanner associated with the `CHacktoolFile` native class
starts at ELF virtual address **`0xb39a50`** (file offset **`0xb35a50`**), size
**`0x45d0`** bytes, ending exclusively at **`0xb3e020`**. Its full original ARM64
disassembly is in:

`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-native-complete\hacktool-file-scan.asm`

The original C++ method name and source filename are stripped/obfuscated. For
analysis it can be labeled `sub_B39A50`; that label is not a recovered symbol.
The function extent is independently established by `.eh_frame_hdr` and its FDE.
Do not mistake the nearest exported name printed by objdump (`NgsmEngineCapture`
or an oversized obfuscated symbol) for this function's actual name.

### Confirmed call chain

All addresses below belong to this exact original `libngsme.so`. They are static
ELF virtual addresses, not live process addresses.

| Role (analysis label) | Function address | Confirmed evidence |
| --- | --- | --- |
| `CHacktoolFile` worker | `0xb2e48c` | Calls the package collector at instruction `0xb2e920`; invokes the scanner at `0xb2e948`. Class association follows the original RTTI/vtable, its worker-launch routine, and adjacent worker body. |
| Cached package collector | `0x803af4` | Calls native enumeration at instruction `0x803d20`. |
| Android package enumerator | `0x868ea0` | Decodes `getPackageManager` and `getInstalledPackages`; calls Android through JNI. The `getInstalledPackages` invocation at `0x869558` passes flags zero. Further code accesses `packageName`, `applicationInfo`, `sourceDir`, `dataDir`, and `nativeLibraryDir`. |
| App/file scanning and result handling | `0xb39a50` | Calls the collector at `0xb39bf0`, invokes comparison at `0xb3ac70`, and can invoke the abuse bridge at `0xb3c4d0`. |
| Comparison helper | `0xb3e020` | Processes candidate/rule structures and contains a `memcmp` comparison at `0xb3f514`. Its exact full predicate and rule data have not been reconstructed. |
| Abuse-result JNI bridge | `0x861de8` | Decodes `onAbuseDetect` and uses signature `(ILjava/lang/String;Z)V`; forwards code, message, and the low bit of the exit flag to the Java invocation helper at `0x862054`. |
| Java void-method invocation helper | `0x861948` | Uses JNI `GetMethodID` (table offset `0x108`) and `CallVoidMethodV` (offset `0x1f0`). |
| Java warning handler | `Ngsm.onAbuseDetect(int,String,boolean)` | In `base.apk/classes4.dex`; displays the warning or forwards it to the host activity. The confirmed dialog path can subsequently terminate the app. |

The scanner's call at `0xb3c4d0` supplies the detection code from `w25`, message
from the string object at `sp+0x150`, and the exit flag previously loaded into `w3`
from `sp+0x70`. These are variable results; no Shizuku-specific numeric detection
code is claimed from this call site.

### Encoded strings

The native scalar string decoder uses an index-dependent XOR. For index `i`:

```text
n = 122 + i
key = (n + ((n * 0x80808081) >> 39)) & 255
decoded[i] = encoded[i] XOR key
```

The relevant decoded strings include:

| ELF virtual address | Decoded value |
| --- | --- |
| `0xfea6cf` | `onAbuseDetect` |
| `0xfea7a7` | `getPackageManager` |
| `0xfea7df` | `getInstalledPackages` |
| `0xfea7f4` | `packageName` |
| `0xfea810` | `sourceDir` |
| `0xfea4c3` | `pm list packages -f` |
| `0xfea5fe` | `adb_enabled` |
| `0xfea60a` | `adb_wifi_enabled` |

The presence of the shell command alone does not prove its invocation in the
identified JNI enumeration path. The decoded data table contains 116 printable
strings. Earlier searches examined readable strings only; the encoded values above
explain why those searches missed these native method names.

### What is established and what remains

Established: an actual native external-app/file scanning routine, its package
enumeration inputs, comparison helper, and a direct reporting path to the Java
blocking callback. The full original native functions have been saved, with sizes
verified from unwind records. The implemented response suppression is not Shizuku-specific.

Unresolved: which candidate/rule matched Shizuku on the user's device, the complete
comparison semantics, where that particular rule originates, the precise detection
code, and whether the warning also involves another detector. A stopped Shizuku
service does not remove its installed package or files. No captured runtime evidence identifies the actual matched native rule.

For the next investigation, focus on `sub_B3E020` and its caller `sub_B39A50`, plus
the scanner's runtime inputs/result at `0xb3c4d0`. Do not disable the collector or
all `CHacktoolFile` reports and describe that as a selective Shizuku fix. The generic
JNI abuse bridge has **65 direct call sites** in the engine, so bypassing it would
affect multiple security paths.

### Reproduce and validate

From `E:\Morphe`, use a new output directory:

```powershell
python santodan-patches\patches\src\test\python\trace_first_descendant_native.py --output Skills/inspection-evidence/.inspect-first-descendant-native-complete
```

The script validates the original library hash, decodes the `.data` string table,
checks function extents against unwind records, verifies the six key direct calls
from original ARM64 instructions, and saves full function disassembly plus
`report.json`. This is a read-only trace of the library; it does not apply a patch,
build an APK, or access a device.

## Exit flag assignments

### Exact definitions and forwarding

| Original instruction address | Meaning |
| --- | --- |
| `0xb3b40c` | `mov w28, wzr`: assigns false. |
| `0xb3b528` | `mov x28, xzr`: assigns false on another path. |
| `0xb3bb1c` | `mov w28, #1`: assigns true. |
| `0xb3c0e4` | Saves `w28` to the temporary slot at `sp+0x70`. |
| `0xb3c474` | Loads that saved exit flag into `w3`. |
| `0xb3c4d0` | Calls the bridge at `0x861de8` with code, message, and flag. |

The save occurs before `x28` is reused for a string-buffer pointer. Therefore
following the later contents of `x28` would give the wrong origin for the flag.

### Branch leading to true

At `0xb3bab4`, the scanner reads the engine-state byte at ELF virtual address
`0xff11f0`. The indirect branch at `0xb3bac8`/`0xb3bad4` is resolved through
the original ELF relocations:

- Byte zero: table entry `0xf39750` points to `0xb3bb78`, a waiting/recheck path.
- Byte nonzero: table entry `0xf397d0` points to `0xb3bad8`. This path launches
  threads at `0x5f6908` and `0x5f74f8` and assigns the exit flag true at `0xb3bb1c`.

Readable **partial reconstruction** of this proven slice:

```cpp
// Inside sub_B39A50, after earlier matching/policy branches.
// Descriptive names below are analyst-assigned.
bool exitApp; // assigned false on paths at B3B40C/B3B528

if (engineStateByte_FF11F0 != 0) {
    pthread_create(/* thread entry 0x5F6908, argument: detection code */);
    pthread_create(/* thread entry 0x5F74F8, argument: null */);
    exitApp = true; // B3BB1C
} else {
    // B3BB78: wait/recheck path, including usleep(100000).
}

// On a path reaching the reporting call:
reportAbuse(context, detectionCode, message, exitApp);
```

This is not the complete scanner or a claim that all detections execute this
block. Earlier branches also inspect a matched structure's integer at `+0x18`
and an engine byte at `0xff10a1` (`engine object +0x29`). Their original semantic
names are not recovered. Those branches can skip reporting, so the exit flag
alone is not an installed-app detector.

### Where the engine-state byte is written

The same byte `0xff11f0` is set and reset in the native function starting at
`0xd0fa3c`, ending exclusively at `0xd109f0` (extent from the original FDE):

- `0xd100c4`: writes 1.
- `0xd10418`: writes 0.

This is engine state controlled by another native workflow, not a recovered
`isShizukuInstalled()` Boolean. Its complete instruction listing is saved in
`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-native-complete\engine-state-lifecycle.asm`.
The meaning of that state and the predicates selecting the writer's paths remain
to be reconstructed. Static search also found other writes with the same offset
`0x1f0`, but their base addresses are different; they are not this byte.

### Evidence and limitations

`E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-native-complete\exit-flag-evidence.json`
records the verified original instruction words and resolved branch targets.
The library hash and full scanner/JNI disassembly are documented in
[related evidence](#native-package-scanning-evidence).

Established: the exact false/true assignments, the original engine-state branch
leading to true, the forwarding slot/register, and an upstream writer of that
state. Not established: a readable complete detector, a Shizuku-specific match,
the original C++ symbol names, or all semantic policy conditions.

## Detection gates, engine state and response threads

### There are other checks

The engine-state byte is not the entire installed-app detection predicate. In the
scanner at `0xb39a50`, the path first processes package/file candidates. It calls
the comparison helper at `0xb3ac70`, combines its result with another local result
at `0xb3ad90`, and tests their low bit at `0xb3ad94`. The resulting table branch
selects `0xb3adac` when that bit is nonzero; otherwise it selects `0xb3c65c`, which
skips this warning-preparation path.

On the selected path it reads an integer from the candidate/rule structure at
`x27+0x18` (`0xb3adac`) and later tests it (`0xb3b3dc`). If that integer is zero,
it additionally checks engine-object byte `+0x29` at `0xff10a1`
(`0xb3b3f0`/`0xb3b400`); the zero-byte path skips the reporting block. Another
byte at `x27+0x1c` is converted to a Boolean and supplied to helper `0x80a1c0`.
The actual meanings of these stripped fields and all matching predicates remain
unresolved; they must not be named as Shizuku-specific fields.

Thus matching, policy/structure fields, and engine state affect whether this path
reports or exits. The earlier exit-flag excerpt was a partial slice, not a complete
decision function.

### What engineStateByte_FF11F0 is

`engineStateByte_FF11F0` is an analyst-assigned label, not an original symbol or
configuration key. It denotes one mutable byte at static ELF virtual address
`0xff11f0`, within an engine object starting at `0xff1078` (offset `0x178`).
At runtime the library's load base must be added to these ELF addresses.

Verified facts about the byte:

- The scanner reads it at `0xb3bab4` and `0xb3bcbc`.
- A zero read at `0xb3bab4` selects the waiting/recheck path at `0xb3bb78`.
- A nonzero read selects `0xb3bad8`, which launches native threads, then assigns
  the Java-facing exit flag true at `0xb3bb1c`.
- Native function `0xd0fa3c` writes 1 at `0xd100c4` and 0 at `0xd10418`.
- Between those writer paths, that function invokes processing helpers
  `0xd109f0` and `0xd13918`. The full writer also contains file-access and other
  branches; not every invocation has been reduced to readable control flow.

Its semantic name and purpose have not been recovered. It is not justified to
describe it as `shizukuDetected`, `isRooted`, or a user-facing setting.

### Where detectionCode comes from

In this scanner's warning-preparation path:

```text
B3ADD4: load integer 105 (0x69) into w8
B3ADD8: store it in the local slot x29-0x44
B3C2D8: reload that slot into w25
B3C4CC: move w25 to argument w1
B3C4D0: call the abuse bridge at 861DE8
```

The scanner initializes the code itself; it does not receive that local code as
an input parameter from Java. There is one direct store to that local slot in the
saved function. The slot address is also passed to the native thread at `0x5f6908`
via `pthread_create` at `0xb3baec`. That thread loads the pointed-to integer at
`0x5f6a8c` and passes its value to engine helpers `0x7dc3e4`/`0x7dc78c`.

This establishes the origin as **105 for the identified warning-preparation
path**, not a global code for every external-app detector. It does not establish
that the user's Shizuku warning actually originated from this path. Other native
detectors have separate reporting sites/codes, and the later device warning used code 111 rather than this scanner path's 105.

### Independent native termination is confirmed

The companion thread started at `0xb3bb04` has entry `0x5f74f8`. Its complete
behavior can be reconstructed as:

```cpp
// Reconstructed equivalent. Original function name is stripped.
void* nativeShutdownThread(void* unused) {
    usleep(5000000);       // 5 seconds
    kill(getpid(), 9);    // SIGKILL on the current app process
    return nullptr;
}
```

Evidence: `0x5f7528` calls `usleep` with `0x4c4b40` (5,000,000);
`0x5f7544` calls helper `0xde4bb0`, which invokes ARM64 syscall 172 (`getpid`);
`0x5f7548` sets signal 9 and `0x5f754c` calls `kill`.
The workspace NDK's `asm-generic/unistd.h` and `signal.h` confirm these constants.

Therefore suppressing `Ngsm.onAbuseDetect()` or forcing its received exit flag
false does not remove this already-launched native kill thread. The current native patch addresses the verified response sites independently;
it does not change the detection rules.

### Saved evidence

Under `E:\Morphe\Skills\inspection-evidence\.inspect-first-descendant-native-complete\`:

- `hacktool-file-scan.asm`: the scanner and direct code initialization.
- `engine-state-lifecycle.asm`: function `0xd0fa3c` and both state writes.
- `state-process.asm`, `state-next.asm`: the writer's processing helpers.
- `code-thread.asm`: native use of the detection-code pointer.
- `companion-thread.asm`: complete native shutdown thread.
- `kill-target-helper.asm`: raw `getpid` syscall wrapper.

These findings identify more of the blocking mechanism. The exact candidate/rule
that matches Shizuku or an autoclicker remains unproven, so no selective bypass
has been implemented or claimed.

## Code 111 and original-installation comparison

The user's screenshot reads `Illegal program has been detected(111/500216)` and
the app closes. The device has an autoclicker and a Shizuku variant. The user
subsequently supplied a screenshot of the same `111/500216` warning from what
they initially described as the original app. They later clarified that this
installation was also rebuilt by Morphe with universal installation/no-update
patches. They report that it appears after attempting login.

### Local output verification

Inspected the native library in
`Apps/TFD-Companion/TFD-Companion-1.1.5-patches-1.47.0.apk`.
Its `lib/arm64-v8a/libngsme.so` SHA-256 is
`0912e499fe9eaca9f08374f42e755c878bec90cda86e5b96d567e8b6b0593f51`.
It contains all three intended scanner suppression edits, with no byte differences
outside those sites relative to the original native library. This confirms the
local packaged output; it does not independently identify the installed APK.

### What the new warning establishes

The inspected scanner path initializes detection code 105. The screenshot reports
111, so it cannot be assumed to be the same warning path. The native engine has
additional code-111 reporting calls: `0x605acc`, `0x607b54`, `0x609ef8`, and
`0x615cf0` explicitly pass code 111 to the abuse bridge, with exit flag zero.
These are within a large native function starting at `0x5fd22c`. Their presence
does not alone map subcode 500216 to a specific predicate.

The same large function also has native response-thread launch pairs at
`0x6397e0`/`0x6397f8` and `0x63d2fc`/`0x63d314`. Each second site launches the
verified shutdown thread `0x5f74f8`, independently of the three patched sites.
The exact path from the user's subcode to these launches remains unproven.

The engine has `CMacro` and `CModAppFile` native types. Therefore neither an
autoclicker-specific detector nor a modification/integrity reaction can be ruled
out. No semantic meaning has been assigned to subcode 500216 without evidence.

### Read-only emulator evidence

The installed APK pulled from `emulator-5554` is saved at
`Skills/inspection-evidence/.inspect-first-descendant-runtime/installed-base.apk`. Its package is
`com.nexon.tfdc`, version name `1.1.5`, version code `2147483647` rather than the
original `29`. Its signing certificate is `CN=Morphe`, SHA-256
`c6f46fdf215e35e421ce61153b7fa671a485c3e266ccf03eabfe1d59c900a0d5`.
Its native engine matches the original SHA-256
`4fe741656c3cbc6b98f726fed42956fbae97ce86ee7783cef731582f1c7e15d9`;
the three scanner instructions remain original. Its DEX files were rewritten.
This proves a rebuilt baseline with an unchanged native scanner, not a pristine
application baseline.

The original base and ARM64 split have matching signing identities. The original
base requires ABI and density splits, so a base-only APK installation is not a
valid original installation. On SDK 33+ its signer SHA-256 is
`099fb1775d624b5df6255e85ab89bc59cb27cc8f4f0b7697669b75a79c1ce68b`.
Replacing the existing installation with these original splits has a signing
conflict; do not silently uninstall the existing app or erase its data.

Static evidence also shows code 111 written into a result pointer at native
`0xbbfe40`/`0xbbfe44` in the `CModAppFile` region. It does not prove that the
user's specific subcode is an integrity failure. The exact check producing
`500216` remains unresolved; these observations do not identify a selective detection bypass.

## Browser login identity investigation

### Browser login stall: 2026-10-14

Inspected the user-provided `E:/Morphe/android-full.log` (UTF-16). No raw log or
authentication URLs/tokens are copied into the repository.

The earlier browser-stall session used `com.nexon.tfdc.morphe`, UID 10236, PID 4442.
At 17:16:28.307, Android successfully starts Chrome for Nexon
sign-in. The captured task records show the auth-selector request's applicationid is
`com.nexon.tfdc.morphe`. Another browser launch occurs at 17:16:48.133.
The application remains present at 17:17:49 and Android freezes its background
process at 17:17:59.548. This is background process freezing, not evidence of
the previous SIGKILL. No `FATAL EXCEPTION` was found in that captured session; this does not rule
out intentional exits, which were identified separately.

Read-only `dumpsys package` shows the console login callback activity accepts
`nexonconsoleauth.com.nexon.tfdc`, while the renamed counterpart is absent.
Android `cmd package resolve-activity --brief` with VIEW and BROWSABLE returns
no activity for `nexonconsoleauth.com.nexon.tfdc.morphe://`, but resolves
`nexonconsoleauth.com.nexon.tfdc://` to the installed app's
`com.nexon.platform.ui.auth.selector.web.NUIConsoleLoginActivity`.
The original manifest has the latter original scheme too.

This proves an identity mismatch between the login request and configured
callback. It is a strong candidate for the browser stall, not proof of the
server's actual response or intended redirect: that redirect is not logged.
The log does not establish a server rejection or an NGSM authentication failure.

For subsequent comparisons, rebuild the original complete 1.1.5 APKS with the updated NGSM
patch while retaining package `com.nexon.tfdc`. Disable the universal patch that
renames/clones the package. Keep other user-required universal patches only if
they do not change package identity. Do not modify all authentication schemes or
spoof server results from this evidence. No app was installed or removed during
this inspection. Changing back to the original package may conflict with another
installation; avoid uninstalling or erasing data automatically.

## Reproduce inspection

From `E:\Morphe`:

```powershell
python santodan-patches\patches\src\test\python\inspect_first_descendant.py --output Skills/inspection-evidence/.inspect-first-descendant-new
```

The output directory must be new. The script validates the original archive hash
and base manifest, inventories every split, scans every DEX string table, extracts
and scans native libraries, and saves focused original-DEX disassembly and resource
values. It uses the existing Java 21, Android `aapt`/`apkanalyzer`, and NDK
`llvm-strings` tools. It does not access a device or modify the original input.

Validation performed: this command succeeded with output
`Skills/inspection-evidence/.inspect-first-descendant-1.1.5-repro`; the resulting evidence matches the manually
inspected call chain. The inspection scripts themselves do not require a Gradle build.
