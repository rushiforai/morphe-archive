# Controller HAL pose layer (2026-10-04)

Source of `libgxr_controller_hal_pose.so` and `extensions/controller-hal-pose.mpe`, installed
by the opt-in patches **Controller tracking from the controller HAL through Shizuku
(experimental)** (2.0.23) and **Controller tracking from the controller HAL through Shizuku,
2.0.20 - 2.0.22 (experimental)**. The two differ only in the angular velocity frame they write
into the library's config block (see "Velocities").

## What it changes

The Galaxy XR runtime hands an application one controller pose per display frame (see the
[extrapolation layer notes](../controller-extrapolation-layer/README.md)). The controller
HAL (`vendor.samsung.hardware.secxrcontroller.ISecXRController/default`) holds more: it
fuses the controller's IMU and answers `getPoseAtTimestamp` (transaction 18) with a pose
predicted for the requested time. The HAL answers a process with shell rights; an
application cannot look it up. So the call is made from a
[Shizuku](https://github.com/RikkaApps/Shizuku) user service:

- The shared [Shizuku bridge](../shizuku-bridge/README.md) binds the user service;
  `java/gxr/pose/PoseBridge` hands its binder to the layer.
- `java/gxr/pose/PoseService` runs in the user service process with shell rights and returns
  the HAL's poses of both controllers for one requested time, one HAL call per controller.
  The HAL also has `getDualPoseAtTimestamp` (transaction 19), but over binder it answers
  with a copy of the last single reply in both poses (checked on tracked controllers); the
  system controller service gets its dual poses through the HAL's message queues.
- `src/controller_hal_pose_layer.cpp` is an OpenXR API layer that wraps `xrLocateSpace` for
  the action spaces of VRLink's controller pose action (`pamir-stream-pose`) and reports the
  HAL's pose and velocities in place of the runtime's. Other spaces and hand tracking are
  not touched.

Without Shizuku, without its permission, or while a controller is not tracked, the runtime's
pose is reported unchanged, which is the stock behaviour. The HAL marks a waved controller
as not tracked for short runs (121 replies in a row were seen); its reply still carries a
pose then, and that pose is reported for up to half a second after the last tracked reply,
because switching to the runtime's pose and back showed as a jump of up to 21 cm. When the
HAL's pose cannot be used any longer, the report slides from the last reported pose to the
runtime's pose over 200 ms (velocities included, the HAL's side counting as still), and back
over 200 ms when the HAL's pose returns. Once the base space is known the HAL's pose is also
reported when the runtime does not call its own pose tracked. The statistics line counts these
cases (`lost: hal= runtime= bridged= faded=`).

## Measurements (Galaxy XR SM-I610, Steam Link 2.0.23/5002363, 2026-10-04)

The HAL, polled from the shell:

| | Result |
|---|---|
| Distinct poses in 1000 polls per second | 840-990, also with the requested time held for 100 ms |
| Pose differs between "now" and "now + 30 ms" | 90-100 % of pairs |
| One call | 0.3-0.6 ms |
| Clock of the requested time | `CLOCK_MONOTONIC`, nanoseconds |

A request with a time from another clock (hundreds of seconds ahead) made the controllers
freeze in the headset even at 90 calls per second. With the monotonic clock about 1200 HAL
calls per second during a stream caused no freezing.

The HAL's pose against the runtime's, from a 78 s recording of both in a stream:

- On still controllers `runtime grip pose = A * HAL pose * B`. `B` is a pitch of 42.25
  degrees about +X with no offset, the same for both hands (residual 0.04 degrees and
  0.03 mm). `A` is the session's base space in the HAL's world, a yaw and an offset; it
  changed when the session restarted.
- In motion the runtime's pose trailed the HAL's pose for "now" by about 35 ms (regression
  on the HAL's velocities, R2 0.86). Which of the two is closer to the hand was judged by
  feel only, not against an external reference.
- At rest the HAL's pose is as quiet as the runtime's (0.04 mm, 0.02 degrees RMS); in motion
  it carries two to three times more high-frequency content (those were the zigzag replies
  described under "Request time"; after that fix the raw pose was preferred).

## How the pose is produced

- **Base space.** `A` is learned from the runtime's own pose while the controller is nearly
  still (below 0.02 m/s and 0.1 rad/s; looser limits until it is first found), as a slow
  running average. Eight consecutive still samples more than 3 cm or 0.05 rad away replace
  it at once, which follows a recenter or a new session.
- **Reads.** A thread of the layer reads the HAL 360 times per second while VRLink is
  locating the controllers, which is VRLink's own rate (four requests per display frame);
  VRLink gets the latest read. A steady thread keeps the read spacing even, where
  VRLink's requests come in bursts. With the rate set to 1000, 912-936 reads per second
  were reached in a stream, but the pose looked no smoother in the headset, so the default
  is 360. Each request is for
  "now" plus half a read period, the read's own duration and `debug.gxr.halpose.ahead`.
  The statistics line reports the mean and the longest read and the latest wake-up of the
  thread (`read=`, `late=`). Raising the thread's priority to nice -19 changed neither over
  a minute each way (reads 356-358 per second, mean read 0.95 ms, longest 5-11 ms), so the
  thread keeps the default priority.
- **Request time.** The HAL computes a pose only for a time later than the latest one anybody
  has asked it for; a request for an earlier time gets a copy of an older reply. The system's
  controller service asks once per display frame for that frame's display time, so requests
  for "now" mostly received the system's per-frame answers, hopping between two neighbouring
  frames. Polled from the shell during a stream on a controller waved at about 1.1 m/s
  (2026-10-05), requests for "now" went backwards along the hand's path in 26 % of the steps
  at 100 requests per second, 35 % at 300 and 43 % at 1000, off by -20 to +25 ms; requests
  for now + 30 ms, made in the same run, went backwards in 0.1 % and were off by -1.1 to
  +0.7 ms. So the HAL is asked `debug.gxr.halpose.lead` ahead and the reply is stepped back
  to the wanted time along its own linear and angular velocity. Read on the PC from SteamVR
  as an application gets them (2026-10-05, 30 s of waving each): driver updates going
  backwards along the path 28 % before and 0.1-0.5 % after; a frame's position off a smooth
  path through its neighbours 6.1 mm before (17 mm for every tenth frame) and 1.7-2.0 mm
  after (5 mm). While the layer reads, the
  system's own requests are the earlier ones, so the runtime's pose is the one that repeats.

- **No smoothing.** The pose and the velocities are reported raw. A speed-adaptive low-pass
  on both, a low-pass on the velocities used for the step back and a fade-in of that step
  with speed were each tried on the headset and taken out again (2026-10-05): with the report
  20 ms ahead the step back is 10 ms, and the raw pose was preferred. At rest the HAL's own
  pose moves by at most 0.8 mm between replies.

- **Velocities.** The HAL's linear and angular velocity from the same read replace the
  runtime's. Against the motion of the HAL's own poses in the recording, the linear one is in
  the HAL's world axes (5 degrees off the positions' displacement, 26-31 degrees if read as
  local to the controller) and the angular one is in the controller's axes (5 degrees, 21-25
  degrees if read as a world vector). They are reported the way VRLink's receiver reads
  them: the linear one turned into the base space, the angular one turned by the grip pitch
  and left local to the grip pose (VRLink 2.0.23; the older bases below). The runtime forwards the same values unconverted and a
  frame behind, which is what the
  [velocity frame layer](../controller-velocity-frame-layer/README.md) corrects by fixed
  angles. The HAL's speeds read 13-17 % lower than the displacement of its own predicted
  poses; they are passed on unscaled, as the runtime does. The raw IMU samples themselves reach
  only the system's single reader.

- **Angular velocity frame per base.** Local to the grip pose is what VRLink 2.0.23 reads.
  VRLink 2.0.20 hands the angular velocity to SteamVR as a base-space vector, as OpenXR
  defines it. Measured on 2.0.20/5001712 on 2026-10-06 against the poses SteamVR handed to
  applications: reported local, SteamVR's angular velocity was 48-62 degrees off the
  controller's rotation, and VRLink's lever arm for the offset grip point (about 10 cm) skewed
  the linear velocity, so thrown objects left low; rotated into the base space by the
  reported pose it came within 3-13 degrees. The frame is a field of a config block in the
  library, written by the patch (`GXRHALCFG0000001`, then version `1` at +16 and
  `angularWorld` at +20: `0` local, `1` base space); the bundled library carries `0`.

- **Velocities for the pose's time.** A reply is asked for `lead` ahead and its pose is
  stepped back, but its velocities belong to the time asked for. Reported as they were, they
  ran about 30 ms ahead of the reported positions: in forward throws on 2.0.20/5001712 the
  linear velocity aimed 7.4 degrees below the motion of the reported positions on the headset.
  So the velocities of the latest 64 reads (about 180 ms) are kept by the time each was asked
  for, and the reported pose gets the ones for its own time, interpolated between the two
  reads around it; reads more than 20 ms apart are not interpolated between, and without them
  the read's own velocities go out. In the same throws that gave 1.4 degrees below the motion
  and speeds within 6 % of it, with 2.2 % of the moving poses stepping backwards. Asking the
  HAL only 5 ms ahead also matched the velocities (1.7 degrees), but 26 % of the moving poses
  stepped backwards.

- **Rest.** The HAL's own pose steps on a controller held still, more in poses the cameras
  see badly: between two reports its position moved by 0.5-5 mm and its rotation by
  0.05-0.68 degrees, at full reported confidence (the runtime's pose stepped by 0.7-4.4 mm).
  The reported pose stepped by at most 0.33 mm and 0.13 degrees. Making the pose cutoffs
  follow the smoothed velocities instead of each sample's speed was tried against the
  remaining jitter and made no visible difference in the headset, so it was dropped.
  Without Shizuku, on the runtime's pose, the controllers jitter in
  the same poses just as much, so the jitter comes from the tracking itself.

The [extrapolation layer](../controller-extrapolation-layer/README.md) keeps its own filter
for the runtime's pose, and the velocity frame layer rotates the runtime's velocities; both
stand down while this layer supplies the pose and the velocities.

## Properties

`debug.gxr.halpose`, `.velocity`, `.angular`, `.pitch` and `.hz` are read when Steam Link starts;
`.ahead`, `.lead` and `.velocity_sync` are re-read every second while streaming. Logcat tag:
`GxrHalPose` (a statistics line every 5 s; `velocity synced=` counts the poses that got the
velocities for their own time).

| Property | Default | Meaning |
|---|---|---|
| `debug.gxr.halpose` | on | `0` reports the runtime's pose unchanged |
| `debug.gxr.halpose.velocity` | on | `0` leaves the runtime's velocities in place |
| `debug.gxr.halpose.hz` | 360 | HAL reads per second by the layer's thread; `0` reads only when VRLink asks |
| `debug.gxr.halpose.ahead` | 2 | Time the reported pose is for, milliseconds after now |
| `debug.gxr.halpose.lead` | 30 | How far ahead of now the HAL is asked, milliseconds; the reply is stepped back to the time above |
| `debug.gxr.halpose.pitch` | 42.25 | Pitch of the grip pose against the HAL's pose, degrees |
| `debug.gxr.halpose.velocity_sync` | 1 | `0` reports each read's own velocities instead of those for the pose's time |
| `debug.gxr.halpose.angular` | from the patch | `local` or `world`: frame of the reported angular velocity |

The 2 ms were chosen by feel on the headset (20 and 5 were tried the same day).

## Limits

- Run on 2.0.23/5002363 and 2.0.20/5001712. 5001812, 5001968 and 5002244 create the same
  pose action and get the 2.0.20 angular frame, but were not run.
- The velocities for the pose's time were measured on 2.0.20/5001712 only; on 2.0.23 they
  are on by default as well, but its throws were not measured with them.
- The stock controller service reads the HAL 90 times per second; this layer adds two HAL
  calls per read, about 720 per second, on top.

## Build

Native layer (use a short build directory, the fetched OpenXR-SDK tree is deep):

```powershell
$sdk = "$env:LOCALAPPDATA\Android\Sdk"
$cmake = "$sdk\cmake\3.22.1\bin"
$ndk = "$sdk\ndk\28.2.13676358"
& "$cmake\cmake.exe" -S extensions/controller-hal-pose -B <short build dir> -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$cmake\ninja.exe" `
    "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
& "$cmake\cmake.exe" --build <short build dir> --target gxr_controller_hal_pose
```

Java extension (the Shizuku API itself is in the Shizuku bridge's extension):

```powershell
javac --release 8 -cp "<android.jar>" -d classes java/gxr/pose/*.java
jar cf gxr.jar -C classes gxr
d8 --release --min-api 29 --lib <android.jar> --output <dir> gxr.jar
```

Copy `libgxr_controller_hal_pose.so` to `patches/src/main/resources/steamlink/androidxr/` and
`classes.dex` to `patches/src/main/resources/extensions/controller-hal-pose.mpe`, then
update both SHA-256 values in `ControllerHalPosePatchTest`.
