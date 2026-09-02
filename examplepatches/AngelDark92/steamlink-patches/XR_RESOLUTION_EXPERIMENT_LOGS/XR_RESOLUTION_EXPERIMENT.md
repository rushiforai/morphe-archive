# Galaxy XR permission-free high-resolution fix

## Final result

The sole active resolution patch for Steam Link `2.0.22` build `5002322` is **Galaxy XR high-resolution 3-projection fix**.

The 2026-09-01 archive `android-surface-trigger-20260901-233206-671.zip` passed:

- Galaxy XR did not enumerate `XR_KHR_android_surface_swapchain`, but accepted the guarded request with result `0` and exposed `xrCreateSwapchainAndroidSurfaceKHR`;
- the helper created a 2x2 Android Surface, obtained its native window, and queued a static transparent-black buffer with alpha `1`;
- every one of the 4 sampled frames contained Valve's original 3 projection layers, 6 views, source handles, order, rectangles, and sRGB8 formats;
- all 4 sampled submissions appended exactly 1 terminal quad, preserved the original 3 layer pointers, performed no copy or reconstruction, and returned success;
- `SYSTEM_ALERT_WINDOW` was absent, AppOp was default, Steam Link owned no type-2038 window, and MediaProjection was inactive;
- the user rated sharpness `MATCHES REFERENCE -> MATCHES REFERENCE -> MATCHES REFERENCE` before, during, and after the palm SystemUI element.

This establishes perceived equality with Valve's native 3-projection APK with Appear on top. The trace independently proves that the application did not reconstruct or downsample Valve's images. It cannot optically measure physical-panel sharpness, so the equality claim remains the user's controlled headset observation backed by unchanged renderer topology.

## Mechanism

OpenXR standardizes composition-layer submission but does not expose the vendor-private Galaxy XR quality-policy input correlated with Android/SystemUI surface participation. The runtime hid the Android-surface extension from enumeration yet accepted it when explicitly requested.

The API layer therefore:

1. requests `XR_KHR_android_surface_swapchain` while retaining a fail-open retry for runtimes that return `XR_ERROR_EXTENSION_NOT_PRESENT`;
2. creates and queues one independent 2x2 Android Surface;
3. forwards Valve's 3 projection layers unchanged;
4. appends the Surface as a tiny terminal quad at `xrEndFrame`.

The extra surface activates the same sharp Galaxy XR compositor behavior previously correlated with Appear on top or a SystemUI element, without requesting overlay permission and without creating a type-2038 window.

## Performance

Valve still renders the native 3 projections. Application GPU work added by the patch is effectively zero: there is no source sampling, shader composite, image copy, resampling, or private full-resolution output. CPU work is limited to API-layer interception, small topology checks, copying 3 layer pointers into a 4-entry submission array, and sampled telemetry. The vendor compositor receives 1 additional static 2x2 quad.

This is substantially lighter than the retired single-projection renderer, which sampled 6 source views into private full-resolution stereo swapchains every frame and required extra GPU rendering, allocations, synchronization, and CPU bookkeeping.

## 10-bit reserve

The accepted run used `35907` (`GL_SRGB8_ALPHA8`) for Valve's 6 source views, so 10-bit was not present. The fix is precision-neutral: Valve's projection swapchain handles and formats pass through unchanged. The auxiliary trigger Surface has its own Android-surface contract and does not force the projection sources to 8-bit. Future Valve RGB10_A2 sources can therefore pass through without changing this resolution fix; the diagnostic retains source-format reporting.

## Retired work

The selectable native single-projection + 10-bit probe, its `libvrlink_scene.so` hook, `libgxr_nspp.so`, CMake target, source, tests, and diagnostic are removed. Its mode/library strings remain cleanup-only so a stale decoded APK cannot be silently combined with the final patch. Older reconstruction, quad-view, permission-matrix, and alternate-projection experiments remain retired for the same reason.

## Developer rebuild

```powershell
cmake -S extensions\resolution-trace-layer -B extensions\resolution-trace-layer\build-android-new -G Ninja `
  -DCMAKE_TOOLCHAIN_FILE="C:/Users/Angelo/Desktop/SteamLink-GalaxyXR-Windows-Toolkit-FULL/GalaxyXR-APK/tools-galaxyxr-native/android-ndk-r27d/build/cmake/android.toolchain.cmake" `
  -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 `
  -DOPENXR_SDK_SOURCE_DIR="C:/Users/Angelo/Desktop/SteamLink-GalaxyXR-Windows-Toolkit-FULL/GalaxyXR-APK/tools-galaxyxr-native/OpenXR-SDK-1.1.61"
cmake --build extensions\resolution-trace-layer\build-android-new --target gxr_android_surface_trigger_passthrough_v1
Copy-Item extensions\resolution-trace-layer\build-android-new\libgxr_ast.so patches\src\main\resources\steamlink\androidxr\
.\gradlew.bat :patches:test :patches:generatePatchesList -PreleaseChannel=stable
```

Static build/tests do not replace the accepted exact-build headset capture.
