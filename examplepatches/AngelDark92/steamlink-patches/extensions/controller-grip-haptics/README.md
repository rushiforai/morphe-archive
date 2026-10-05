# Controller grip haptics (2026-10-04)

Source of `libgxr_haptic_main.so` and `extensions/controller-grip-haptics.mpe`, installed by
the opt-in patch **Controller grip haptics through Shizuku (experimental)**.

## What it changes

A Galaxy XR controller has two vibrators: one at the trigger (`SUB`) and one in the grip
(`MAIN`). The system controller service (`com.sec.android.secxrcontrollerservice`) sends
every OpenXR `XrHapticVibration` to `SUB`, so in Steam Link only the trigger vibrates. No
setting or system property selects the other one.

`MAIN` is reachable through the controller HAL
(`vendor.samsung.hardware.secxrcontroller.ISecXRController/default`, `performHapticFeedback`
= transaction 21, `stopHapticFeedback` = 22), which takes the vibrator as an argument. The
HAL answers a process with shell rights; an application cannot look it up. Tested from
inside Steam Link on 2026-10-04: the service lookup returns nothing, and the runtime does
not offer `XR_FB_haptic_pcm` (`xrCreateInstance` fails with `XR_ERROR_EXTENSION_NOT_PRESENT`).

So the call is made from a [Shizuku](https://github.com/RikkaApps/Shizuku) user service:

- `java/gxr/haptic/HapticProvider` (a `ShizukuProvider`) asks Shizuku for permission when
  Steam Link starts, binds the user service and hands its binder to the layer.
- `java/gxr/haptic/HapticService` runs in the user service process with shell rights and
  relays waveforms, pulses and stops to the HAL.
- `src/controller_grip_haptics_layer.cpp` is an OpenXR API layer that wraps
  `xrApplyHapticFeedback` and `xrStopHapticFeedback`. While the user service is connected it
  sends `XrHapticVibration` to `MAIN` instead of the runtime.

Without Shizuku, without its permission, or when a call fails, the layer passes the
vibration to the runtime unchanged, which is the stock behaviour.

## How a vibration is played

By default the layer generates the vibration itself. The controller plays signed 8-bit
samples at 8000 Hz through `performHapticFeedback` with a non-empty buffer, on the grip
vibrator; tones of 60, 120, 200 and 320 Hz are distinguishable. A generator thread in the
layer sends the samples in short chunks, each continuing the phase of the one before, and a
request only changes what is generated next, as in
[PSVR2Toolkit](https://github.com/BnuuySolutions/PSVR2Toolkit):

- A request plays as a sine. Games ask for frequencies meant for other controllers (Beat
  Saber: 200 Hz), and the grip vibrator feels shrill from about 150 Hz, so the requested
  frequency is halved and capped at 130 Hz.
- Requests without a real frequency are SteamVR dashboard and menu ticks (1 or 20 Hz, about
  20 ms). They play as a short tone of 130, 100 or 60 Hz by sent amplitude, light to strong.
- A vibration that keeps repeating (requests less than 50 ms apart) is held for at least
  60 ms per request, so it plays as one continuous tone, and so do ticks in quick succession.
- Zero-amplitude requests are ignored. Beat Saber sends about 70 of them per second per hand
  while nothing vibrates; treated as a stop they cut every vibration short.
- An OpenXR amplitude `a` is sent as `min + (max - min) * a^gamma`. A plain multiplier strong
  enough for dashboard ticks pushed everything above 0.2 to the ceiling, so weak and strong
  effects felt alike. With the defaults 0.16 maps to 0.44, 0.4 to 0.58 and 1.0 to 0.8.

## Tuning

Set with `adb shell setprop`; the layer re-reads the values twice a second while streaming.
The defaults were picked by feel on a Galaxy XR (SM-I610) with Steam Link 2.0.23/5002363, on
SteamVR dashboard ticks and in Beat Saber.

| Property | Default | Meaning |
|---|---|---|
| `debug.gxr.haptic` | `1` | `0` OpenXR only, `1` grip, `2` grip and trigger |
| `debug.gxr.haptic.pcm` | `1` | `1` generated waveforms, `0` HAL pulses (below) |
| `debug.gxr.haptic.min` | `0.2` | amplitude sent for the weakest request |
| `debug.gxr.haptic.max` | `0.8` | amplitude sent for the strongest request, up to 1.27 |
| `debug.gxr.haptic.gamma` | `0.5` | curve between them; below 1 lifts weak requests, 1 is linear |
| `debug.gxr.haptic.minms` | `10` | shortest vibration in milliseconds, at least 10 |
| `debug.gxr.haptic.streamms` | `60` | how long a repeating request is held |
| `debug.gxr.haptic.chunkms` | `40` | chunk length for one controller; doubled while both vibrate |
| `debug.gxr.haptic.hzscale` | `0.5` | multiplier for the requested frequency |
| `debug.gxr.haptic.maxhz` | `130` | highest tone played |
| `debug.gxr.haptic.hz` | `0` | fixed tone in Hz for everything, `0` = from the request |
| `debug.gxr.haptic.drive` | `1` | above 1 clips the sine towards a square wave |
| `debug.gxr.haptic.click` | `0` | ticks: `0` a tone, `1` one push, `2` push and pull |

Amplitudes are in the HAL's units. The stock service stops at 0.8, but the HAL packs
`amplitude * 100` into a 7-bit field (`kxr_spi_uart::EncodeMotorData`), so 1.27 is the largest
value that does not wrap; pulses at 0.8, 1.0 and 1.27 each felt stronger than the one before.

Logcat tag: `GxrHapticMain`. The first 40 vibrations are logged, and every 5 seconds of
vibration a summary of what was requested: count, amplitude and duration range, frequencies.

## What the controller does with waveforms

Found by sending waveforms by hand from `adb shell` and by reading the HAL
(`xrcontroller.kxr.default.so`):

- A waveform sent while another plays is mixed into it.
- The HAL needs about 14 ms per chunk and handles both controllers in one queue. With 10 ms
  chunks it played 371 of 500 and the tone rattled; 20, 30 and 60 ms chunks all played, and
  20 ms felt clean on one controller. 40 ms is the value used in games.
- Long waveforms are unusable: the controller buffers about a second, after that an upload
  takes as long as the sound and the HAL queues the rest. Ten 1 s waveforms sent 0.5 s apart
  played one after another, the last 3.5 s late.
- The HAL stop (transaction 22) cuts the vibration at once, but only by sending a zero pulse:
  `VcmCancel` aborts the upload and does not empty the controller's waveform buffer. After a
  stop the next waveform uploaded to 0 % and never played. The layer does not send it in
  waveform mode; `xrStopHapticFeedback` just ends the generated sound.
- A tick played as a push of the vibrator in one direction, the way PSVR2Toolkit's generator
  behaves at low frequencies (`debug.gxr.haptic.click 1`), rattles when ticks follow each
  other; as a short tone it does not.
- The headset suspends a controller nobody tracks (`getDeviceStatus`, transaction 15, returns
  3 instead of 2). The user service reads that status, at most every 300 ms, and holds
  waveforms back from a controller that is not connected.

Several times the first waveform after an idle period did not start uploading and the
headset's controller radio rebooted (`OnHmdMcuReboot`); the controllers reconnected by
themselves. The cause is not known. A waveform sent to a suspended controller is the working
guess, hence the status check; a stop that aborted an upload preceded two of the cases. The
radio also rebooted once with no waveform in flight.

## HAL pulses

With `debug.gxr.haptic.pcm 0` the layer sends the HAL's own pulse command instead: vibrator,
duration, a frequency step and an amplitude. The stock service clamps amplitude to 0.1..0.8,
turns the frequency into a step `round(Hz / 50)` clamped to 1..10 and uses a 30 ms minimum
duration; at those values the grip vibrator is barely noticeable, so the same amplitude
curve applies here.

SteamVR can repeat a vibration every frame; in a game the layer saw up to 120 requests per
second for one controller. The stock service drops requests while a pulse is playing. Sent
to the HAL unthrottled they flood the controller link: right after such bursts the
controller's pose status dropped to 0 for about two seconds. In this mode the layer
therefore sends one pulse per controller at a time and drops requests that arrive before it
ends, which is about 16 commands per second per controller for a repeating vibration.

`debug.gxr.haptic.freq` sets the step: `1`..`10` fixes it (3 already feels shrill), `0`
derives it from the OpenXR frequency as the stock service does, and `-1` (default) follows
the request: a real frequency (30 Hz or more) picks step 1 below `debug.gxr.haptic.midhz`
(120), 2 below `debug.gxr.haptic.highhz` (220) and 3 above, otherwise the amplitude sent
picks 3 below 0.15, 2 below 0.65 and 1 above. Those cut points are not measured.

## Bases

The legacy bases (5001712, 5001812, 5001968, 5002244) call the same two OpenXR functions
with the same `/user/hand/left|right` subaction paths, but the patch was run on a headset
only with 5002363.

## Build

Native layer (use a short build directory, the fetched OpenXR-SDK tree is deep):

```powershell
$sdk = "$env:LOCALAPPDATA\Android\Sdk"
$cmake = "$sdk\cmake\3.22.1\bin"
$ndk = "$sdk\ndk\28.2.13676358"
& "$cmake\cmake.exe" -S extensions/controller-grip-haptics -B <short build dir> -G Ninja `
    "-DCMAKE_MAKE_PROGRAM=$cmake\ninja.exe" `
    "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
    -DCMAKE_BUILD_TYPE=Release
& "$cmake\cmake.exe" --build <short build dir> --target gxr_haptic_main
```

Java extension: take `classes.jar` out of the `api`, `provider`, `aidl` and `shared` AARs of
`dev.rikka.shizuku` 13.1.5 (Maven Central, Apache-2.0), then

```powershell
javac --release 8 -cp "<android.jar>;api.jar;provider.jar;aidl.jar;shared.jar" -d classes java/gxr/haptic/*.java
jar cf gxr.jar -C classes gxr
d8 --release --min-api 29 --lib <android.jar> --output <dir> gxr.jar api.jar provider.jar aidl.jar shared.jar
```

Copy `libgxr_haptic_main.so` to `patches/src/main/resources/steamlink/androidxr/` and
`classes.dex` to `patches/src/main/resources/extensions/controller-grip-haptics.mpe`, then
update both SHA-256 values in `ControllerGripHapticsPatchTest`.
