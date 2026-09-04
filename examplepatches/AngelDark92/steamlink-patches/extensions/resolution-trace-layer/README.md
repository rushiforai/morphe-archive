# Resolution helper CPU update (2026-09-03)

The Surface-backed underside experiment for 2.0.22/5002322 is **retired** after the
user reported "doesn't work" on 2026-09-03. Its option, code, build target and
bundled helper are removed. No new capture was reviewed; no cause or GPU result is
claimed. The existing terminal quad is the only active path, and both packaged
helper binaries remain unchanged, including 2.0.20/5001712. Repatch a clean source
with the current high-resolution patch to return to that path.

The existing high-resolution patch installs this shared API layer. Recommendation
bundles already depend on that patch; they do not contain separate copies of its
implementation and do not need membership changes. Repatch the APK using the updated
`.mpp` to receive the new native library; existing installed APKs do not update themselves.

## Behavior and scope

- `libgxr_ast.so`: helper v1.4 for exact Steam Link 2.0.22 builds 5002244, 5002296,
  5002313, 5002318 and 5002322 (3 native projections plus 1 quad).
- `libgxr_ast_5001712.so`: helper v1.2 for exact Steam Link 2.0.20/5001712
  (2 native projections plus 1 quad), installed under the same `libgxr_ast.so` name.
- Other builds retain their existing guards. This update does not add compatibility.
- Frame lookup uses a generation-validated non-owning thread-local cache. Its hits
  avoid both the map mutex and shared-pointer ownership RMWs. Session creation,
  destruction and instance cleanup invalidate caches. The registry outlives caches;
  OpenXR's external destruction synchronization protects the borrowed state during
  a frame. The generation check is not a concurrent memory reclamation algorithm.
- Event processing retains shared ownership and reads event bytes only on
  `XR_SUCCESS`, never on `XR_EVENT_UNAVAILABLE` or errors.
- The quad remains submitted on every eligible frame. Buffer content, size, alpha,
  projection pointers/order, source formats, and GPU behavior are unchanged.

No speedup or new headset validation is claimed from local tests. In particular, a
CPU change does not establish lower runtime GPU composition cost or improved 10-bit output.

Validation for this revision: both Android builds, all 83 Gradle tests, all 3 CTest
targets (also repeated 20 times each), all 6 decoded-base high-resolution audits,
and all 4 decoded-base recommendation-bundle audits passed. The generated
`patches-1.12.1-dev.1.mpp` contains both rebuilt helpers byte-for-byte. Decoded-base
audits are offline patching evidence, not pristine-source APK or headset validation.

## Local build and tests

Run from the repository root. This checkout currently has NDK r27c and cached OpenXR
1.1.43 headers (Android-surface extension revision 4). The obsolete sibling
`GalaxyXR-APK` tool paths are not required. Supply your own equivalent paths if needed.

```powershell
$gxrRoot = (Get-Location).Path
$gxrSdk = Join-Path $gxrRoot 'extensions/controller-velocity-layer/build-android/_deps/openxr_headers-src'
$gxrNdk = Join-Path $gxrRoot '.android-sdk/ndk/27.2.12479018'

# Windows host: native lifecycle tests and the actual 2-/3-projection layer with
# mock Android/OpenXR calls. CTest makes no device connections.
cmake -S extensions/resolution-trace-layer/tests -B extensions/resolution-trace-layer/build-host-tests "-DOPENXR_SDK_SOURCE_DIR=$gxrSdk"
cmake --build extensions/resolution-trace-layer/build-host-tests --config Release
ctest --test-dir extensions/resolution-trace-layer/build-host-tests -C Release --output-on-failure

# Android helpers: use Ninja from PATH, or pass -DCMAKE_MAKE_PROGRAM=<ninja.exe>.
cmake -S extensions/resolution-trace-layer -B extensions/resolution-trace-layer/build-android-cpu -G Ninja "-DCMAKE_TOOLCHAIN_FILE=$gxrNdk/build/cmake/android.toolchain.cmake" "-DOPENXR_SDK_SOURCE_DIR=$gxrSdk" -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static -DCMAKE_BUILD_TYPE=Release
cmake --build extensions/resolution-trace-layer/build-android-cpu
```

After both builds succeed, copy both generated `.so` files to
`patches/src/main/resources/steamlink/androidxr/`. Update the build IDs and pinned
SHA-256 hashes in `OptionalXrPatches.kt` and `AndroidSurfaceTriggerResourceTest.kt`
when publishing a different payload. Gradle does not rebuild these C++ libraries.

```powershell
.\gradlew.bat :patches:test :patches:buildAndroid -PreleaseChannel=experimental
# If the 6 existing decoded-fixture APKs are available:
foreach ($gxrIndex in 0..5) {
    .\gradlew.bat :patches:auditDecodedSteamLinkPatches -PdecodedAuditKind=high-resolution "-PdecodedAuditIndex=$gxrIndex"
    if ($LASTEXITCODE -ne 0) { throw 'High-resolution audit failed' }
}
foreach ($gxrIndex in 0..3) {
    .\gradlew.bat :patches:auditDecodedSteamLinkPatches -PdecodedAuditKind=recommended "-PdecodedAuditIndex=$gxrIndex"
    if ($LASTEXITCODE -ne 0) { throw 'Recommendation-bundle audit failed' }
}
```

The host tests exercise negative-cache invalidation, handle reuse, cleanup, owned
event readers, and persistent render threads taking turns. The integration tests
include the production C++ file for both projection counts, exercise 1000 no-event
polls with stale data and 1000 steady frames, and verify continuous quad submission,
1-time buffer posting, no steady logging, unchanged source pointers, and fail-open
behavior after runtime rejection. They do not simulate the vendor compositor.

## Headset A/B and rollback

Use the same Steam Link base, patch selections, host quality, scene and refresh rate
for the previous and updated payloads. Check cold launch, stop/start streaming,
palm show/hide, DFR-UI attach/detach, and focus loss/resume. Sharpness must remain
stable throughout; record crashes, flicker, or resolution transitions explicitly.

If collecting timing, separate helper CPU from runtime `xrEndFrame`/GPU time and
keep overlay/recording state identical. Smaller timings alone do not prove preserved
resolution. These binaries have not been installed or tested on a headset by this build.

To revert, rebuild from the previous source revision or use the previous `.mpp`
and repatch the same clean APK with the same selections. Do not stack old and new
native helpers or change recommendation bundles to roll back this CPU-only update.
