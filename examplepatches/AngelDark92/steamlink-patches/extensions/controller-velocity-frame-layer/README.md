# Controller velocity frame layer (2026-10-04)

Source of `libgxr_controller_velocity_frame.so`, installed by the opt-in patch
**Controller velocity frame (experimental)** for exact Steam Link 2.0.23/5002363.

## What it changes

The Galaxy XR runtime reports the controller's linear and angular velocity in a frame
attached to the controller instead of in the base space, and VRLink forwards both
unchanged. SteamVR reads the linear velocity as a world vector, so a thrown object leaves
in the wrong direction: a forward throw goes downward or sideways, depending on how the
controller is held at release.

The layer wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action
(`pamir-stream-pose`) and rewrites the chained `XrSpaceVelocity`:

- linear: pitched by -62.6 degrees about X in the located pose's frame, then rotated by
  the located orientation into the base space;
- angular: pitched by -42 degrees about X and left local to the pose, which is how
  SteamVR reads what VRLink forwards.

Poses, other spaces and hand tracking are not touched, and no Steam Link code is changed.
The layer is independent of the controller pose extrapolation layer; either can be
installed without the other.

Read when Steam Link starts (logcat tag `GxrVelocityFrame`):

```
adb shell setprop debug.gxr.velocity_frame 0            # report the runtime's velocities unchanged
adb shell setprop debug.gxr.velocity_pitch_linear -62.6
adb shell setprop debug.gxr.velocity_pitch_angular -42
```

## Measurements (Galaxy XR SM-I610, Steam Link 2.0.23/5002363, 2026-10-04)

Taken on the PC from the controller poses as VRLink delivers them to a SteamVR driver,
both controllers, with the controller pose extrapolation layer installed. The reference
is the displacement of the streamed positions over 44 ms; samples between 0.7 and 8 m/s
(linear) and above 3 rad/s (angular). Values are the median angle between the reported
vector and the reference, left / right controller.

| | Stock (97 s) | With the layer (169 s) |
|---|---|---|
| Linear velocity, read as a world vector | 44 / 55 degrees | 15 / 17.5 degrees |
| Angular velocity, read as local to the pose | 18 / 33 degrees | 12 / 14 degrees |
| Linear speed against the positions | 98% / 98% | 98% / 100% |

Stock, the linear error grows with speed (120 degrees at 3-8 m/s on the right controller)
and no time shift reduces it. Rotating the stock vectors into the pose frame with 42
degrees of pitch brought them to 7 / 12 degrees (linear) and 6 / 12 degrees (angular),
which is where the two angles come from. The streamed pose is pitched -20.6 degrees
against the runtime's grip pose, hence -62.6 for the linear velocity. With the layer, the
best remaining fixed rotation is 2-4 degrees for the angular velocity and 11-18 degrees
about inconsistent axes for the linear one, so the defaults were left as they are.

The runtime's own pose extrapolation still moves the pose along the uncorrected vector;
the layer does not change poses.

The with-layer measurement used a development build that carried this code inside the
extrapolation layer; the committed payload is the CMake build below.

## Build

```powershell
$sdk = "$env:LOCALAPPDATA\Android\Sdk"
$cmake = "$sdk\cmake\3.22.1\bin"
$ndk = "$sdk\ndk\28.2.13676358"
& "$cmake\cmake.exe" -S extensions/controller-velocity-frame-layer -B <short build dir> -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$cmake\ninja.exe" `
    "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
& "$cmake\cmake.exe" --build <short build dir> --target gxr_controller_velocity_frame
```

Use a short build directory: the fetched OpenXR-SDK tree exceeds the Windows path limit
under deep paths. Copy the result to
`patches/src/main/resources/steamlink/androidxr/libgxr_controller_velocity_frame.so` and
update the SHA-256 in `ControllerVelocityFramePatchTest`.
