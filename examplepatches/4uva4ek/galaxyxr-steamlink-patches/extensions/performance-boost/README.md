# Steam Link OpenXR CPU/GPU BOOST

Morphe option: **OpenXR CPU and GPU BOOST (experimental)**, default off,
category App & device identity. Included in the independent eight-patch MPP.

Exact supported targets: 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968,
2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395 and 2.0.24/5002527, original package
`com.valvesoftware.steamlinkvr`, ARM64 loader required. Unknown versions are
unchanged even if forced. This is not a claim about every historical/future
Steam Link build or renamed package.

The patch adds two files: an ARM64 library and an APK-local implicit OpenXR
layer manifest. It does not modify existing native code, DEX, Android manifest,
rendering settings, prediction or controller data. It requires a loader that
discovers APK-local implicit layers, as used by the other layers in this repo.

The layer enables `XR_EXT_performance_settings` once per instance. If downstream
extension enumeration is unavailable, it tries enabling the extension and retries
the original create info only on `XR_ERROR_EXTENSION_NOT_PRESENT`. An extension
already requested by the app is never removed or duplicated. Other instance
creation failures retain their original error.

After successful `xrCreateSession` and `xrBeginSession`, it requests
`XR_PERF_SETTINGS_LEVEL_BOOST_EXT` for CPU and GPU independently. Restarts of a
session request again; there is no per-frame loop. Later application performance
requests are passed through unchanged. Unsupported extensions/functions produce
no requests; a rejected hint does not fail session creation/start. Separate
instance/session dispatch is cleaned up on successful destruction. No locks are
held while calling the runtime.

`adb logcat -s GxrPerformanceBoost` shows enabled/function status and both numeric
request results. Success means the runtime accepted a hint, not measured clocks
or an FPS improvement. Frequency, thermal and power policy remain with the
runtime/system. BOOST can increase heat and power use.

API contract: https://registry.khronos.org/OpenXR/specs/1.0/man/html/xrPerfSettingsSetPerformanceLevelEXT.html

## Historical build and validation (2026-10-18)

This section retains original evidence. Current migration validation is in
[VALIDATION](../../docs/VALIDATION.md); historical runtime evidence does not
establish runtime results on beta 5002527.

NDK 28.2.13676358, API 29, static libc++, OpenXR SDK release-1.1.43,
16 KiB ELF alignment. `CMakeLists.txt` builds the library; use an Android toolchain
and `ANDROID_ABI=arm64-v8a`. Copy the library to the canonical resources directory.
`build_standalone.py` takes explicit Java/Kotlin/Morphe/D8/Android JAR/output paths
and builds JVM classes plus Android DEX for the standalone MPP. Put all outputs under the repository external `../builds/steamlink-patches/` directory.

Host mock-runtime test `tests/lifecycle.cpp` exercises the production layer:
extension injection, duplicate suppression, unsupported extension, fallback when
enumeration is unavailable, failed session/begin calls, CPU failure with GPU
continuation, repeated begin, multiple instances and destruction cleanup. PASS
with MSVC; optional CMake `GXR_BOOST_TESTS=ON` enables CTest on a host build.

Morphe Desktop 1.18.1 successfully loads the MPP and applies it to retained actual
2.0.20/5001712 and 2.0.23/5002363 APKs. Reapplication checked on
5001712. Existing entries are byte-preserved. Loader discovery strings verified.
On Galaxy XR, the running Steam Link process logged extension enabled and both CPU/GPU requests returning XR_SUCCESS after create and begin. No clocks/FPS measurement performed.

All production Kotlin sources compile with the local compiler fallback and
catalogs were regenerated with the canonical generator. Gradle is BLOCKED before
compilation by `app.morphe.patches:1.3.4` resolution; no Gradle or CI pass claimed.
Receipts: the initial local `validation.json`, `apk-audits.json`,
`patch-result*.json`, and `bundle/build.json`; compact public evidence is in `diagnostics/steamlink-performance-boost/validation-2026-10-18.md`.

## Use and remove

Import the standalone `.mpp` into Morphe, select the BOOST option when patching
a supported original Steam Link APK, and use your normal app signing/update
workflow. Existing independently selected patches remain necessary for their
features. To remove BOOST, rebuild from the original APK without this option;
merely leaving it unchecked when repatching an already modified APK retains its
existing layer. Preserve package/signing identity and app data when reinstalling.
Reboot does not remove an APK layer. A loader-controlled environment may also use
`GXR_DISABLE_PERFORMANCE_BOOST`. No root module, system change or boot hook.
