# Controller velocity frame layer (2026-10-04)

Source of `libgxr_controller_velocity_frame.so`, installed by the default-on patch
**Controller velocity frame** for exact Steam Link 2.0.23/5002363 and
2.0.20/5001712. The angular velocity frame it
writes into the library's config block differs between 2.0.23 and the legacy bases.

## What it changes

The Galaxy XR runtime reports the controller's linear and angular velocity in a frame
attached to the controller instead of in the base space, and VRLink forwards both
unchanged. SteamVR reads the linear velocity as a world vector, so a thrown object leaves
in the wrong direction: a forward throw goes downward or sideways, depending on how the
controller is held at release.

The layer wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action
(`pamir-stream-pose`) and rewrites the chained `XrSpaceVelocity`:

- linear: pitched by -62.85 degrees about X in the located pose's frame, then rotated by
  the located orientation into the base space;
- angular: pitched by -42.25 degrees about X and left local to the pose, which is how
  SteamVR reads what VRLink 2.0.23 forwards. VRLink 2.0.20 hands it to SteamVR as a
  base-space vector instead (measured on 2.0.20/5001712 with the controller HAL pose layer,
  which reports the same frames, see its notes), so there it is also rotated by the located
  orientation into the base space. The frame is a field of a config block in the library,
  written by the patch (`GXRVFRCFG0000001`, then version `1` at +16 and `angularWorld` at
  +20: `0` local, `1` base space); the bundled library carries `0`.

Poses, other spaces and hand tracking are not touched, and no Steam Link code is changed.
While the [controller HAL pose layer](../controller-hal-pose/README.md) supplies the
velocities, which are then already in these frames, this layer leaves them alone.
The layer is independent of the controller pose extrapolation layer; either can be
installed without the other.

Read when Steam Link starts (logcat tag `GxrVelocityFrame`):

```
adb shell setprop debug.gxr.velocity_frame 0            # report the runtime's velocities unchanged
adb shell setprop debug.gxr.velocity_pitch_linear -62.85
adb shell setprop debug.gxr.velocity_pitch_angular -42.25
adb shell setprop debug.gxr.velocity_frame.angular world  # or local; default from the patch
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
about inconsistent axes for the linear one.

The table above was taken with -62.6 and -42. The defaults are now -62.85 and -42.25: the
grip pose is pitched 42.25 degrees against the controller HAL's own pose (measured on still
controllers to 0.04 degrees, see the
[controller HAL pose layer notes](../controller-hal-pose/README.md)), and the velocities
are in the HAL's frame. The measurement was not repeated with the new values; the change
is a quarter of a degree.

The runtime's own pose extrapolation still moves the pose along the uncorrected vector;
the layer does not change poses.

The with-layer measurement used a development build that carried this code inside the
extrapolation layer; the committed payload is the CMake build below.

## Build

The separate **Controller throw angle (experimental)** patch is limited to
2.0.23/5002363 and 2.0.24/5002395. Its option defaults to 13 degrees, range 0–50
in one-degree steps. It adds a local-X rotation to linear velocity before the
existing pose rotation; it does not change angular velocity, poses or timestamps.
This applies throughout motion, not just at release. It depends on Controller
velocity frame and rejects the HAL pose layer (which bypasses this correction).
The patch is opt-in. The base payload keeps angle zero, including all older builds.

Config version 1 now uses uint32 at +24 for this additional angle and uint32
`0x31524854` at +28 as the capability marker. Old payloads without the marker are
rejected by the optional patch. Zero leaves the original sine/cosine unchanged;
out-of-range native config values are ignored. Morphe rejects values outside 0–50.

Offline Steam Link 2.0.24 captures on 2026-10-25 support +13 degrees as a test
candidate, not a runtime-validated fix: fast-motion median direction error changed
17.27 to 13.17 degrees without time shifting; wrist motion changed 23.72 to 15.24.
Time alignment improves the fit further, but no timing change is included. These
are comparisons against processed OpenVR positions, not physical ground truth.
The 2.0.23 layout shares the existing layer path; fresh throwing validation on
both exact versions remains pending.

```powershell
$sdk = "$env:LOCALAPPDATA\Android\Sdk"
$cmake = "$sdk\cmake\3.22.1\bin"
$ndk = "$sdk\ndk\28.2.13676358"
& "$cmake\cmake.exe" -S extensions/controller-velocity-frame-layer -B ../builds/steamlink-patches/extensions/controller-velocity-frame-layer/build-android -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$cmake\ninja.exe" `
    "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
& "$cmake\cmake.exe" --build ../builds/steamlink-patches/extensions/controller-velocity-frame-layer/build-android --target gxr_controller_velocity_frame
```

Use a short build directory: the fetched OpenXR-SDK tree exceeds the Windows path limit
under deep paths. Copy the result to
`patches/src/main/resources/steamlink/androidxr/libgxr_controller_velocity_frame.so` and
update the SHA-256 in `ControllerVelocityFramePatchTest`.
