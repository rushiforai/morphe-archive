# Controller pose time layer (2026-10-19)

Source of `libgxr_controller_pose_time.so`, installed by the opt-in patch
**Controller pose time (experimental)** for exact Steam Link 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363 and 2.0.24/5002395
on Galaxy XR firmware I610UEU2AZF3. It is the APK form of the root **Steam Link Pose Time**
module from [galaxyxr-modules](https://github.com/4uva4ek/galaxyxr-modules): same hooks and
arithmetic, but loaded by Steam Link itself as an OpenXR API layer, without root or `ptrace`.

## What it changes

Each controller pose Steam Link sends carries a signed microsecond field at pose block `+0x54`:
the pose's time relative to the packet header. Stock VRLink leaves it 0, so SteamVR treats every
controller pose as taken when the packet was built and predicts from there. The Galaxy XR runtime
labels each controller slot 28.82 ms after the HAL sample the slot carries (measured 2026-10-12),
so neither the packet time nor the label is the sample's own time.

The layer records, for every pose VRLink reads with `GetControllerState`, the label the runtime
consumed for it (`XRInputBufferConsumer::Accessor::consumePose`), keyed by the exact 84 pose
bytes. When `SVLDataLink::SubmitMessage` sends a controller packet, it writes
`(label - compensation - header) / 1000` into `+0x54` of each matching pose. Position,
orientation, velocities, tracking state, the HMD and the packet header stay unchanged; a pose
without a matching label is sent unchanged.

The compensation is the patch option, 0 to 30 ms, default 5 ms:

- **0 ms** sends the runtime's label: SteamVR predicts the least; steady, hands trail slightly.
- **29 ms** (28.82 measured) dates the pose at its sample: SteamVR predicts the full latency;
  most responsive, fast moves can overshoot and jerk.
- Values in between trade the two. With the root module, 0 ms was reported steady but lagging.

## Guards

Hooks are installed once, after the next instance exists (the runtime is loaded by then), and
only when all of these hold; otherwise nothing is hooked and logcat says why (tag `GxrPoseTime`):

- `/system/lib64/libopenxr_android.so` has SHA-256
  `a7dabaa1030cc7979efe987f212488c61b61e8afb9aa3add59f7ae4fbeff4c92` (I610UEU2AZF3);
- the loaded `libvrlink_scene.so` matches a profile by SHA-256 of its `GetControllerState`,
  `SendPoses` and vendor clock code (`profiles.py` prints and checks them), so other patches may
  change unrelated bytes;
- the three function slots (runtime JUMP_SLOT `0x28b520`, scene state and submit JUMP_SLOTs)
  still point at the original functions;
- neither the controller HAL pose layer nor the controller pose extrapolation layer is loaded.

The slots are in RELRO; the layer makes one page writable for each aligned store and read-only
again. The Morphe patch repeats the scene check and the conflict check in `finalize`, after every
selected patch has run.

The root Velocity Frame and Steam Link Pose Time modules refuse to run while an APK correction
layer is mapped; use either this patch set or the modules.

Read when Steam Link starts:

```
adb shell setprop debug.gxr.pose_time 0                 # leave every pose time unchanged
adb shell setprop debug.gxr.pose_time.lead_us 15000     # compensation override, 0..30000 us
```

## Validation and limits

- `tests/native_test.cpp` drives the hooks with fake runtime and scene functions on the host
  (ASan/UBSan): label binding to the exact pose bytes, the field at default/0/28.82/30 ms, that
  only the 4 field bytes change, both hands, unmatched and disabled passthrough, and SHA-256
  vectors.
- `profiles.py` checked the JUMP_SLOT targets and code hashes on installed patched scene
  libraries of 5001712, 5001812, 5001968, 5002244, 5002363 and 5002395; the 5002363
  and 5002395 `GetControllerState` hashes equal their originals.
- Not yet run as an APK layer on a headset. The root module this is ported from was confirmed on
  the headset; it additionally required its own Velocity Frame runtime correction, which this
  layer does not.

## Build

```sh
sdk="$ANDROID_HOME"; cmake="$sdk/cmake/3.22.1/bin"; ndk="$sdk/ndk/27.2.12479018"
"$cmake/cmake" -S extensions/controller-pose-time-layer -B <short build dir> -G Ninja \
    -DCMAKE_MAKE_PROGRAM="$cmake/ninja" \
    -DCMAKE_TOOLCHAIN_FILE="$ndk/build/cmake/android.toolchain.cmake" \
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static \
    -DCMAKE_BUILD_TYPE=Release
"$cmake/cmake" --build <short build dir> --target gxr_controller_pose_time
g++ -std=c++17 -O2 -Wall -Wextra -Werror -fsanitize=address,undefined \
    -Iextensions/controller-pose-time-layer/src extensions/controller-pose-time-layer/tests/native_test.cpp -o pose_time_test
./pose_time_test
```

Copy the library to
`patches/src/main/resources/steamlink/androidxr/libgxr_controller_pose_time.so` and update the
SHA-256 in `ControllerPoseTimePatchTest`.
