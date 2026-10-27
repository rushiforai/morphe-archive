# Strict native loading after the v1.6.0 APK inspection

The supplied `Offline_Games-v3.15.3-patches-v1.6.0.apk` contains all six ad edits,
the DEX loader hook, and a matching native-file manifest. Its three fast-startup
sites remain stock: that patch was not selected in this particular output.

Its Unity `libmain.so` tries an absolute library path first, then retries by
basename if it fails. That fallback can resolve installed stock libraries while
the game appears to start normally. The same mechanism exists in the supported
ARMv7 build. This is a verified possible failure route; without process mappings
or linker errors from the phone, its actual cause is still not established.

## Changes

All Offline Games patches share this loader dependency:

1. `libmain.so` is validated by size, original SHA-256 and exact instructions.
   On failure of the explicit-path `dlopen`, it now returns with a null handle
   instead of retrying a basename. The normal epilogue preserves stack/registers.
   No `FatalError` call is introduced.
2. Unity's Java `System.load(directory/libmain.so)` call is routed through
   `NativeLibraries.loadMain`, which records the exact Java linker exception.
   Its `System.loadLibrary("main")` fallback is replaced with a failure that
   preserves the original error message. Existing try/catch handling is kept.
3. After `NativeLoader.load`, `finishLoad` requires a successful native result
   **and** matching process mappings for `libmain.so`, `libunity.so`, and
   `libil2cpp.so`. Otherwise the existing Unity failure-dialog path receives a
   descriptive error string before Unity's ready flag is set.
4. Mapping checks use `File.getCanonicalFile()`, accepting real filesystem
   aliases rather than merely identical pathname text. Missing, mixed, stock
   and deleted mappings remain failures. We do not accept an arbitrary path
   merely because it ends in the same library name.
5. A `loader=strict-v2` manifest marker plus the changed libmain hash creates a
   new staging-directory identity. Old cached files cannot stand in for this
   loader. Repatching a supported already-patched APK is supported.
6. The strict runtime uses a new `offlinegames.strictv2` class namespace. Morphe's
   extension merge can retain existing method implementations, so reusing the old
   namespace would leave upgraded APKs calling old helper code. Loader calls are
   redirected to the new classes; old unused classes may remain in prior DEX files.

The rebuilt-APK verification caught and corrected a local smali-label relocation
error in the first prerelease. The success branch is constructed with an explicit
label in the live method, and its **actual output branch target** is tested.
Use the stable build, not the early dev.1/dev.2 artifacts.

| ABI | File offset | Stock | New | Failure continuation |
|---|---|---|---|---|
| arm64-v8a | `0xd54` | `mov w1,1` | `b 0x4dcc` | native helper's epilogue |
| armeabi-v7a | `0xbd8` | `mov r0,r6` | `b 0xc40` (Thumb) | native helper's epilogue |

This deliberately favors a visible failure over silently running unchanged
game code. It does not promise to overcome Android linker namespace or SELinux
restrictions; an actual device test is required to establish those.

## User-visible result

- Success: `PatchLab: patched native code loaded` (all three libraries verified).
- Failure: Unity displays `PatchLab native loading failed`, the expected path,
  which library was missing/unexpected, and observed mappings. Failure to load
  libmain includes its Java `UnsatisfiedLinkError`/`SecurityException` text.
- A report is also written to the app's external-files directory, normally
  `Android/data/com.JindoBlu.OfflineGames/files/patchlab-native-load-error.txt`.
  If external-files storage is unavailable, app-private files are used. The
  dialog/log prints the actual report path. No extra storage permission is added.
- The native helper does not return `dlerror` text to Java, so missing engine/
  IL2CPP cases identify the library/mappings without claiming the underlying
  linker reason. Capture the dialog/report if it fails.

Update the source, repatch the full APKS/XAPK, replace the existing mount and
force-stop/restart the game. Do not clear saved data. Explicitly select **Fast
Offline Games startup** if the loading-screen bypass is wanted: the exported
v1.6.0 APK supplied for analysis did not include it.

## Checks

`scripts/verify_strict_loader.py` is called by the output-APK verifiers. It first
reproduces the stock fallback, then executes the patched native helper with
mocked absolute-path success and failure on both ARM64 and Thumb/ARMv7. Failure
must leave the output handle null and must never call basename `dlopen`.
It checks the exact libmain bytes/hash and DEX call sequence before Unity readiness,
including preserved exception handlers and absence of Java System.loadLibrary.

JVM tests cover real symlink aliases, paths containing spaces, missing/deleted/
stock/mixed mappings, and identification of each of the three Unity libraries.
These tests cannot establish which loader restriction occurs on the phone.
