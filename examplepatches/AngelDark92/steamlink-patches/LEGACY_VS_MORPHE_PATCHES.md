# Legacy vs Morphe APK Patch Audit

## Scope

This report compares these decoded APK trees:

- `Steam_Link-v2.0.22-patches-v1.9.0-dev.8` (the Morphe-patched APK)
- `SteamLink-GalaxyXR-v1.4.0-OLEDCal-3` (the older hand-patched APK)

`AndroidManifest.xml`, signing files, and version/build labels are not used to decide whether code is equivalent. Manifest behavior is mentioned only where code depends on a permission or activity declaration.

The examination included:

- SHA-256 inventory of every file in both trees.
- Smali comparison normalized across `smali/` and `smali_classes2/` so DEX partition movement is not mistaken for a code change.
- Method-level diffs for every changed class.
- Semantic comparison of JSON, HTML, XML, and apktool metadata.
- ELF section, segment, dynamic-symbol, dependency, string, and AArch64 instruction analysis for every changed native library.
- Cross-checking the decoded output against current patch sources and Git history.

## Conclusion

The APKs are **not behaviorally equivalent**.

Most application code and assets are identical, and the major video/HMD binary patches are present in both. However, the legacy APK contains meaningful patches that are absent from the Morphe output:

1. Working XR pointer-to-SDL mouse/gamepad hooks.
2. A working managed-panel surface-metrics fix.
3. Six native branch bypasses related to HMD initialization and XR permission/stream gates.
4. Two native Android XR permission-string substitutions.
5. Repeated overlay setup from the real `SteamLink` activity lifecycle.
6. Runtime requests for `FACE_TRACKING` and `BLUETOOTH_CONNECT` in the launcher activity.

The most important Morphe regression is structural: `GxrSdlBridge` and `GxrSurfaceCallback` are present, but nothing calls them. The decoded Morphe APK therefore contains the intended implementations as dead code.

The repository previously had the correct direct bytecode hook. Commit `07a5f80` contains the corrected typed-dexlib2 version. The standalone patch was deleted/moved in `3227658`; the current split patch architecture no longer includes the equivalent hook.

## Inventory Summary

### Whole-tree hash inventory

| Result | Count |
|---|---:|
| Byte-identical paths | 105 |
| Changed paths | 14 |
| Paths only in Morphe tree | 107 |
| Paths only in legacy tree | 102 |

The large only-in-one-tree smali counts are mostly false positives caused by the same classes moving between `smali/` and `smali_classes2/`.

### Smali inventory normalized by class name

| Result | Count |
|---|---:|
| Identical classes | 96 |
| Changed classes | 5 |
| Morphe-only classes | 3 |
| Legacy-only classes | 0 |

Changed classes:

- `com/valvesoftware/steamlink/GalaxyXRPermissionActivity`
- `com/valvesoftware/steamlink/SteamLink`
- `org/libsdl/app/SDLControllerManager`
- `org/libsdl/app/SDLGenericMotionListener_API14`
- `org/libsdl/app/SDLSurface`

Morphe-only classes:

- `com/valvesoftware/steamlink/GxrOverlayBridge`
- `org/libsdl/app/GxrSdlBridge`
- `org/libsdl/app/GxrSurfaceCallback`

## Patches Verified in Both APKs

These behaviors are demonstrably common to both APKs.

### OLED color calibration

Both `libvrlink_scene.so` files contain the replacement 1087-byte video fragment shader with:

- Gamma: `vec3(1.20)`
- Saturation: `c, 1.45`
- Zero-centered dither expression

This corresponds to the current `OLED color calibration` patch's **Final balanced** profile, not its default `Initial` profile.

Relevant current implementation:

- `patches/src/main/kotlin/app/template/patches/steamlink/binary/OledCalibrationPatch.kt`

### Video dithering enabled

Both calibrated shaders contain:

```glsl
) - .5) * .00292;
```

Neither contains the disabled `*.00000` variant. Calibrated dithering is enabled in both APKs.

Relevant current implementation:

- `patches/src/main/kotlin/app/template/patches/steamlink/binary/VideoDitherPatch.kt`

### Native permission prompt bypass

Both scene libraries contain the same patch at file offset `0x1422C4`, the entry of `RequestAndroidPermissions(...)`:

```text
20 00 80 52    mov w0, #1
c0 03 5f d6    ret
```

This bypasses VRLink's native permission dialog and returns success immediately.

Relevant current implementation:

- `patches/src/main/kotlin/app/template/patches/steamlink/binary/PermissionPromptPatch.kt`

### HMD pose offset and velocity zeroing

Both APKs have the same effective HMD-only patch:

- Pose query timestamp offset: `78,000,000 ns` (`78 ms`).
- Six exported velocity floats at offsets `28`, `32`, `36`, `40`, `44`, and `48` are zeroed.
- Target function: `QSVLDeviceHmd::GetPose(XRQContext&, PackedPose_t&)`.

The six stores are identical in both files:

| File offset | Bytes | Meaning |
|---:|---|---|
| `0xFED48` | `7f1e00b9` | `str wzr, [x19,#28]` |
| `0xFED4C` | `7f2200b9` | `str wzr, [x19,#32]` |
| `0xFED50` | `7f2600b9` | `str wzr, [x19,#36]` |
| `0xFED5C` | `7f2a00b9` | `str wzr, [x19,#40]` |
| `0xFED60` | `7f2e00b9` | `str wzr, [x19,#44]` |
| `0xFED6C` | `7f3200b9` | `str wzr, [x19,#48]` |

The branch at `0xFEAD8` targets `0x2166B0` in Morphe and `0x2166D0` in legacy. The trampoline body is equivalent. The 32-byte placement difference is caused by the legacy ELF layout, not a different pose offset.

Relevant current implementation:

- `patches/src/main/kotlin/app/template/patches/steamlink/binary/HmdOnlyPatch.kt`

### Device and controller configuration

The decoded APKs have semantically identical copies of:

- `assets/config/hmd_config.json`
- `assets/config/controller_config.json`
- `assets/config/default_config.json`
- `assets/webui/dash/index.html`
- `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json`

Line-ending and final-newline differences account for several different hashes.

Common device configuration includes:

- Samsung tracking/manufacturer identity.
- `Oculus Quest Pro` model compatibility identity.
- `XR_EXT_eye_gaze_interaction` request.
- Oculus Touch interaction profile remapped to Galaxy XR controller identities.
- Galaxy XR controller pose offsets.
- `preflight.ignore_microphone_muted=false`.

## Meaningful Java/Smali Differences

### 1. XR pointer input works only in the legacy APK

The legacy APK patches both SDL input entry points.

#### Touch path

Legacy `SDLSurface.onTouch(...)` calls a private `routeXrPointerAsMouse(MotionEvent)` method before stock SDL processing.

The method:

- Accepts Android tool type `UNKNOWN` or `FINGER`.
- Sends mouse hover coordinates through `SDLActivity.onNativeMouse(...)`.
- Converts down/pointer-down to primary mouse down and synthetic SDL `PAD_A` down.
- Converts up/pointer-up/cancel to primary mouse up and synthetic SDL `PAD_A` up.
- Preserves the original SDL touch processing afterward.

#### Generic-motion path

Legacy `SDLGenericMotionListener_API14.onGenericMotion(...)` calls its own `routeXrPointerAsMouse(MotionEvent)` method before stock processing.

It handles hover enter/move/exit and button press/release (`ACTION_BUTTON_PRESS=11`, `ACTION_BUTTON_RELEASE=12`) and forwards them to the same mouse and gamepad paths.

#### Synthetic controller path

Legacy `SDLControllerManager` adds:

- Static field `mGxrSyntheticPadAdded`.
- Method `sendGxrSyntheticPad(boolean)`.
- Synthetic device ID `0x475852`.
- Controller name `Galaxy XR Spatial Select`.
- SDL button code `0x60` (`PAD_A`).

The method registers the synthetic joystick once and then calls `onNativePadDown` or `onNativePadUp`.

#### Morphe state

The Morphe APK instead contains `GxrSdlBridge`, which implements equivalent routing, but there are **no references to `GxrSdlBridge` from any base class**. `SDLSurface.onTouch` and `SDLGenericMotionListener_API14.onGenericMotion` remain stock.

This can directly explain XR rays moving without selecting UI buttons, or total loss of XR pointer handling in the 2D launcher.

#### Required fix

Restore the typed direct bytecode hook from Git commit `07a5f80` (`DirectInputFixPatch.kt`):

1. Merge `GxrSdlBridge` through `extension.mpe`.
2. Insert `invoke-static/range` at instruction 0 of real `SDLSurface.onTouch`.
3. Insert `invoke-static/range` at instruction 0 of real `SDLGenericMotionListener_API14.onGenericMotion`.
4. Build instructions with `BuilderInstruction3rc`, not inline smali strings.
5. Make a default top-level XR patch depend on this direct hook.

The historical implementation already computes real parameter v-registers and avoids the v15 limit.

### 2. Managed-panel aspect fix works only in the legacy APK

In stock `SDLSurface.surfaceChanged(...)`, SDL calls `Display.getRealMetrics()` and passes physical display width, height, and density to `nativeSetScreenResolution`. On Galaxy XR this can use combined physical display metrics instead of the managed panel surface, stretching the launcher/splash.

The legacy APK inserts an unconditional branch immediately after `getRealMetrics()` into the existing fallback path. That path sets:

```text
displayWidth  = surfaceChanged width  (p3)
displayHeight = surfaceChanged height (p4)
density       = 1.0
```

The rest of the stock `surfaceChanged` method continues, preserving SDL synchronization, logging, orientation checks, and surface-ready behavior.

The Morphe APK has stock `surfaceChanged` behavior. `GxrSurfaceCallback.applyManagedPanelMetrics(...)` exists but has no caller.

This can directly explain a stretched initial splash or incorrectly scaled launcher.

#### Required fix

Two implementation choices are available:

1. **Exact legacy behavior, preferred for parity:** patch the post-`getRealMetrics` control flow so it uses `p3`, `p4`, and `1.0f`, then continue the original method.
2. **Historical Morphe helper behavior:** restore the `BuilderInstruction3rc` hook from commit `07a5f80`, call `GxrSurfaceCallback.applyManagedPanelMetrics(...)`, then return.

Choice 1 preserves more stock lifecycle code and is the closer reproduction of the known-working legacy APK. Choice 2 is already implemented historically and is easier, but it bypasses the remainder of stock `surfaceChanged`.

### 3. Overlay ownership and retry behavior changed

The legacy `SteamLink` class contains the overlay implementation directly:

- Static `sCompositorOverlay`.
- Static `sOverlayWindowManager`.
- Static `sOverlayPermissionRequested`.
- `ensureCompositorOverlay()`.
- `requestOverlayPermission()`.

`ensureCompositorOverlay()` is called from:

- `SteamLink.onCreate()`.
- `SteamLink.onResume()`.
- Immediately before starting `VRLink`.

It installs a transparent 2x2 `TYPE_APPLICATION_OVERLAY` (`0x7F6`) window and retries from the long-lived SteamLink activity lifecycle.

The Morphe APK removes this code from `SteamLink` and moves it to `GxrOverlayBridge`, called by `GalaxyXRPermissionActivity` before SteamLink launches. Static bridge fields can keep the application-context window alive, but there are no retry calls from `SteamLink` itself.

Potential effects:

- Legacy can recover if permission is granted after launch or if setup fails temporarily.
- Morphe requests permission earlier and avoids duplicate SteamLink launches, but has a narrower retry window.

#### Possible fix

Keep `GxrOverlayBridge`, but directly inject guarded `ensureOverlay(Context)` calls into `SteamLink.onCreate`, `onResume`, and before `VRLink` launch. This preserves the cleaner helper class while restoring legacy retry coverage.

### 4. Launcher permission set differs

Legacy `GalaxyXRPermissionActivity` checks and requests five runtime permissions:

- `android.permission.HAND_TRACKING`
- `android.permission.EYE_TRACKING_FINE`
- `android.permission.FACE_TRACKING`
- `android.permission.RECORD_AUDIO`
- `android.permission.BLUETOOTH_CONNECT`

It launches SteamLink after the permission callback and does not manage overlay permission itself.

Morphe checks and requests only three:

- `android.permission.HAND_TRACKING`
- `android.permission.EYE_TRACKING_FINE`
- `android.permission.RECORD_AUDIO`

Morphe additionally:

- Displays `Launching Steam Link...`.
- Requests overlay permission through `GxrOverlayBridge`.
- Handles `onActivityResult` and `onResume`.
- Prevents duplicate SteamLink launches.

Because the native permission prompt is bypassed in both APKs, the launcher activity is the only explicit runtime request path. The Morphe activity declares face tracking through another patch but does not request it here. That can leave `XR_ANDROID_face_tracking` unavailable even though the API layer is installed.

#### Required fix

Add `FACE_TRACKING` to the Morphe activity's check/request array. Treat `BLUETOOTH_CONNECT` as a separately testable option: legacy requested it, but it should only be restored if controller discovery or native code still requires it on the target Android XR build.

## Meaningful Asset Difference

### `ui_config.json`: hand interaction profile

Morphe adds:

- Requested extension `XR_EXT_hand_interaction`.
- Select bindings for `/interaction_profiles/ext/hand_interaction_ext` using `aim_activate_ext/value`.
- Pointer bindings using `/input/aim/pose`.

Legacy has only Oculus Touch select and pointer bindings.

This is a real Morphe-only improvement, but it does not compensate for the absent SDL call-site hooks. OpenXR can produce the hand pointer event while the Java/SDL layer still fails to consume it.

Relevant current implementation:

- `patches/src/main/kotlin/app/template/patches/steamlink/androidxr/AndroidXrCompatibilityPatch.kt` (`xrInputRoutingConfigPatch`)

## Native `libvrlink_scene.so` Differences

### Structural facts

| Property | Morphe | Legacy |
|---|---:|---:|
| Size | 2,251,920 | 2,268,304 |
| SHA-256 | `26C44E9AE609CABD1CA3AEC3B7A904AB8A98661C5288A9DE4B9464AA21013BB3` | `EE789C5DE67CB9BC7CECDC3459D9905D25AC9326944066F9A93030F228604232` |
| Dynamic symbols | 5,084 | 5,084 |
| Undefined imports | 428 | 428 |
| `DT_NEEDED` entries | Identical | Identical |

The legacy file is 16,384 bytes larger because its load segments were re-laid out and aligned differently. It does **not** add a dynamic dependency or imported symbol. Do not reproduce the size change as a patch feature.

Only 25 differing bytes belong to Morphe's `.text` section. Twenty-four are six four-byte branch/NOP substitutions; the remaining byte is the HMD branch displacement caused by the relocated equivalent trampoline.

### Legacy-only permission-string substitutions

| Offset | Morphe bytes/string | Legacy replacement | Likely purpose |
|---:|---|---|---|
| `0x93952` | `com.oculus.permission.FACE_TRACKING` | `android.permission.HAND_TRACKING` plus NUL padding | Bypass the Oculus-only face permission gate using an Android XR permission already granted by the launcher. Actual face permission is separately requested by the legacy activity. |
| `0x9C10E` | `com.oculus.permission.EYE_TRACKING` | `android.permission.EYE_TRACKING_FINE` | Make native eye-tracking permission checks use the Android XR permission. |

The first substitution intentionally maps Oculus face permission to `HAND_TRACKING`, not `FACE_TRACKING`. Preserve that exact behavior only for a parity patch; a new implementation should test whether direct `FACE_TRACKING` is accepted by the native call site and runtime.

### Legacy-only branch bypasses

| File offset | Symbol + relative offset | Morphe instruction | Legacy instruction |
|---:|---|---|---|
| `0xFD040` | `QSVLDeviceHmd::Init + 0x554` | `tbz w0,#0,0xFD05C` | `nop` |
| `0xFD048` | `QSVLDeviceHmd::Init + 0x55C` | `cbz w8,0xFD05C` | `nop` |
| `0x10B658` | `XrSceneLobby::SendPermissionsStateToWebView + 0x1C8` | `tbz w20,#0,0x10B6D8` | `nop` |
| `0x1140AC` | `XrSceneStream::Init + 0x24C` | `cbnz w8,0x1140B8` | `nop` |
| `0x1140B4` | `XrSceneStream::Init + 0x254` | `cbz w8,0x114160` | `nop` |
| `0x114168` | `XrSceneStream::Init + 0x308` | `cbz w8,0x11421C` | `nop` |

These edits force execution through paths that stock code conditionally skips. Their locations indicate three intended effects:

- Force HMD initialization past two capability/flag gates.
- Force lobby permission state generation past a boolean gate.
- Force stream initialization past three XR feature/permission gates.

The exact high-level field represented by each register cannot be proven from stripped local-variable information alone. Implement these as separate toggles initially and verify with logcat/OpenXR traces rather than combining all six into one opaque patch.

### Recommended native patch implementation

Create a guarded `rawResourcePatch` for the 5002244 layout:

1. Require the expected file size or a set of known pre/post-patch SHA-256 hashes.
2. At each branch offset, accept either the exact original instruction or `1f 20 03 d5` (`nop`) for idempotence.
3. Replace only after all six preconditions pass.
4. Replace permission strings using exact byte arrays and NUL padding; accept already-patched strings.
5. Commit the write only after every precondition passes.
6. Keep this independent from the HMD pose patch because none of the offsets overlap.
7. Report unexpected bytes with offset and actual hex, as `HmdOnlyPatch.kt` already does.

Suggested split while testing:

- `Android XR native permission names`
- `Force HMD initialization gates`
- `Force lobby permission-state gate`
- `Force stream XR gates`

After device validation proves they are inseparable, they can be grouped behind one top-level compatibility patch.

## Native Bridge Libraries

### `libgxr_face_bridge.so`

Both APKs install an implicit OpenXR API layer named `XR_APILAYER_local_GalaxyXR_face_bridge` that bridges Valve's `XR_FB_face_tracking2` calls to `XR_ANDROID_face_tracking`.

They are different builds:

| Property | Morphe | Legacy |
|---|---:|---:|
| Size | 53,552 | 34,480 |
| SHA-256 | `39F49558A8FC028280C1246F6DBE692702E54EF01E53B999E4940A9009028733` | `0C9F5DFE039A24AE0160AFB4459AA8E29358E4D031432A43B78E0F9C9DF98317` |
| Compiler family | Android clang 18 | Android clang 21 |
| Public layer exports | Same two | Same two |

Both export only:

- `xrCreateApiLayerInstance`
- `xrNegotiateLoaderApiLayerInterface`

Both contain the expected create/destroy/query bridge operations. The Morphe build additionally exposes internal evidence of `xrWaitFrame` interception and a fallback to latest predicted display time for non-positive Valve face query times. This looks like a newer behavioral improvement, not merely a recompile.

Do not replace the Morphe bridge with the smaller legacy binary without a device test. The layer manifest is byte-identical between APKs, so either binary is loaded through the same mechanism.

### Morphe-only `libgxr_xr_bridge.so`

Morphe adds a 181,984-byte native bridge with SHA-256:

```text
002A802F22E6D51AA1E54FA0C1A5F8BA5F0584692C339DB21874E6053F0BF164
```

Its strings and symbols show an OpenXR API layer with:

- Frame/session/swapchain interception.
- Eye and face telemetry.
- Display capability reporting.
- Authenticated TCP/UDP telemetry transport.
- Package/version/permission/overlay diagnostics.

No corresponding implicit API-layer JSON exists in the decoded APK, and no smali or `libvrlink_scene.so` reference names this library. The normal Android native activity still names `vrlink_scene`.

Therefore this file appears **unloaded/inert in this artifact** unless an external loader discovers it by a mechanism not represented in the decoded tree.

Possible fixes:

- If it is intended to run as an implicit OpenXR layer, add and validate its layer manifest under `assets/openxr/1/api_layers/implicit.d/`.
- If it is not intended to load, remove it from `XR Core Runtime` to avoid implying that telemetry/runtime bridge behavior is active.
- Verify loading by checking for its `GXR API: layer loaded` log, not merely file presence.

## Non-meaningful Differences

These do not explain runtime behavior differences:

- DEX partition movement between `smali/` and `smali_classes2/`.
- `default_config.json` final newline.
- `controller_config.json` and dashboard HTML line endings.
- `apktool.yml` filename, versionCode, versionName, target SDK, and `doNotCompress: dex` differences.
- XML removal of unused `xmlns:aapt` declarations.
- Generated `$ic_launcher_background__0` resource alias and `public.xml` entry.
- Signing manifests and certificate files.
- Legacy ELF alignment/segment expansion by 16 KiB.

## Current Morphe Source-to-Output Mismatches

### Dead helper classes

`patches/src/main/kotlin/app/template/patches/steamlink/androidxr/UiCompatibilityPatches.kt` only performs:

```kotlin
extendWith("extensions/extension.mpe")
```

Morphe's class merger can add classes, fields, and missing methods, but cannot replace an implementation for a method that already exists in the base APK. Consequently, edited copies of existing SDL methods do not install their replacement bodies.

The decoded output confirms the failure mode:

- `GxrSdlBridge`: present, no external callers.
- `GxrSurfaceCallback`: present, no external callers.
- Real `SDLSurface.onTouch`: stock.
- Real `SDLGenericMotionListener_API14.onGenericMotion`: stock.
- Real `SDLSurface.surfaceChanged`: stock.

### Historical fix available

Commit `07a5f80` contains the corrected direct hook implementation using:

- `mutableClassDefBy(...)`
- `BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, ...)`
- `BuilderInstruction10x(Opcode.RETURN_VOID)`
- Correct physical parameter-register calculation.

Commit `3227658` deleted the standalone `DirectInputFixPatch.kt` and temporarily moved equivalent logic into `AndroidXrCompatibilityPatch.kt`. The current split architecture no longer contains that private `androidXrInputAndMetricsPatch` block.

This history is stronger evidence than source comments: the missing hook was already diagnosed and fixed once.

## Recommended Reconstruction Order

1. **Restore real SDL call-site hooks.** Use the typed implementation from `07a5f80`; make a default XR patch depend on it.
2. **Restore managed-panel metrics behavior.** Prefer the exact legacy fallback-path behavior if feasible; otherwise restore the historical helper call and test lifecycle effects.
3. **Request `FACE_TRACKING` at runtime.** Keep the Morphe overlay/duplicate-launch protections.
4. **Add guarded native Android XR permission-string substitutions.** Validate eye and face tracking separately.
5. **Add the six native branch bypasses as separate experimental toggles.** Collect logs before grouping them.
6. **Decide overlay ownership.** If startup/full-resolution remains unreliable, restore `SteamLink` lifecycle retries through `GxrOverlayBridge`.
7. **Validate `libgxr_xr_bridge.so` loading.** Add a layer manifest or stop packaging the unused library.
8. **Retain the newer face bridge initially.** It appears to improve face query timing behavior.

## Validation Checklist for Recreated Patches

### Static checks after patching

- `SDLSurface.onTouch` contains a call to `GxrSdlBridge.routeXrPointerAsMouse`.
- `SDLGenericMotionListener_API14.onGenericMotion` contains a call to `routeXrPointerAsMouseGeneric`.
- `SDLSurface.surfaceChanged` no longer forwards full physical display metrics.
- `GalaxyXRPermissionActivity` requests face tracking.
- Native permission strings resolve to Android XR names.
- The six native gate instructions are either all expected originals or all intended replacements.
- OLED shader still contains `vec3(1.20)`, `c, 1.45`, and `*.00292`.
- Permission bypass remains `mov w0,#1; ret` at `0x1422C4`.
- HMD trampoline still encodes 78 ms and all six velocity stores remain zeroing stores.

### Runtime checks

- `SteamLinkGXR` log lines appear after SDL starts.
- XR pointer hover moves the launcher cursor.
- Select produces both primary mouse and SDL `PAD_A` down/up events.
- Splash and launcher preserve managed-panel aspect ratio.
- Overlay permission is requested once and overlay setup can recover after returning from settings.
- Face tracker creation reaches `xrCreateFaceTrackerANDROID` and returns success.
- Eye tracking no longer reports an Oculus permission failure.
- HMD initialization and stream initialization proceed without the legacy gate failures.
- If `libgxr_xr_bridge.so` is retained, `GXR API: layer loaded` appears in logcat.

## Final Assessment

The older APK is not just the same patch set built with a different manifest version. It contains several hand-applied code and native changes that the current Morphe output does not reproduce.

The highest-confidence missing fixes are the SDL pointer hooks and managed-panel metrics patch, because their complete implementations and call sites are visible in the legacy APK and their intended Morphe replacement exists in Git history. The native permission and gate patches are also exact at the byte level, but their six branch bypasses should be restored experimentally because stripped native code limits certainty about each underlying boolean field.