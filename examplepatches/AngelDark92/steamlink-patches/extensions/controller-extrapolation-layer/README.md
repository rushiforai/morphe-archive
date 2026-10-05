# Controller pose extrapolation layer (2026-10-04)

Source of `libgxr_controller_extrapolation.so`, installed by the opt-in patch
**Controller pose extrapolation (experimental)** for exact Steam Link 2.0.23/5002363.

## What it changes

The Galaxy XR runtime's app-side library `libopenxr_android.so` reads controller poses
from a shared buffer that the compositor writes once per display frame. It can
extrapolate that sample to the `XrTime` an application asks for, but only when the
server flag `com.android.xr.flags.enable_controller_pose_extrapolation_consumer_side`
(namespace `com_android_xr`) is set. On a user build the flag is unset and cannot be
set from the shell: `device_config put` stores the value, but the system property the
library reads is never created.

The layer redirects that library's PLT import of
`server_configurable_flags::GetServerConfigurableFlag` inside the Steam Link process
and answers `true` for this one flag. All other flag reads go to the original function.
It hooks no OpenXR call and changes no Steam Link code.

`adb shell setprop debug.gxr.extrapolation 0` leaves the flag untouched. The property is
read when the runtime first asks for the flag, so restart Steam Link after changing it.
Logcat tag: `GxrExtrapolation`.

## Measurements (Galaxy XR SM-I610, Steam Link 2.0.23/5002363, 2026-10-04)

Taken with a diagnostic layer that counted VRLink's own `xrLocateSpace` calls on the
streamed controller grip pose and polled the same spaces at 500 Hz.

| | Stock | Flag forced |
|---|---|---|
| Distinct poses in VRLink's 360 calls per second | 90 | 360 |
| Distinct poses when polled at 500 Hz | 90 | 500 |
| Pose differs between "now" and "now + 30 ms" | 0 of 500 | 500 of 500 |
| Velocity updates per second | 90 | 90 |

The added poses are the runtime's extrapolation of its 90 Hz samples, not new
measurements. Hand-tracking poses (`ext/hand_interaction_ext`) already update about 195
times per second without the flag and were not part of this change.

The headset measurement used a development build of the same hook; the committed
payload is the CMake build below.

## Build

```powershell
$sdk = "$env:LOCALAPPDATA\Android\Sdk"
$cmake = "$sdk\cmake\3.22.1\bin"
$ndk = "$sdk\ndk\28.2.13676358"
& "$cmake\cmake.exe" -S extensions/controller-extrapolation-layer -B <short build dir> -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$cmake\ninja.exe" `
    "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
& "$cmake\cmake.exe" --build <short build dir> --target gxr_controller_extrapolation
```

Use a short build directory: the fetched OpenXR-SDK tree exceeds the Windows path limit
under deep paths. Copy the result to
`patches/src/main/resources/steamlink/androidxr/libgxr_controller_extrapolation.so` and
update the SHA-256 in `ControllerPoseExtrapolationPatchTest`.
