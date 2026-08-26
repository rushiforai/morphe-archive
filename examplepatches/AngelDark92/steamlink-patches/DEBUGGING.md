# 🔍 Debugging guide

Step-by-step protocol for diagnosing the remaining Galaxy XR issues (stretched
launcher, rejected VR input, handshake crash, slow handshake). Follow this the
next time you have headset + adb access, then share the captured logs so we
can go through them together.

## 0. Prerequisites

1. Enable Developer Options on the Galaxy XR (Settings → About → tap Build
   Number 7x), then enable **USB debugging** (or **Wireless debugging** if
   you don't want a cable in the headset).
2. Confirm the device is visible: `adb devices`.
3. Know the installed package name: `com.valvesoftware.steamlinkvr` (or
   `com.valvesoftware.steamlinkvr.gxr` if the "Change package name" patch's
   default suffix is applied).

## 1. Capture logs around a repro

Always clear the buffer first so you only capture the relevant window:

```powershell
adb logcat -c
adb logcat -v threadtime > repro.log
# ... reproduce the issue on the headset now ...
# Ctrl+C to stop once it crashes / you've seen the behavior
```

Grep the tags that matter for this project (our own log lines all use the
`SteamLinkGXR` tag; stock SDL logging uses `SDL`):

```powershell
Select-String -Path repro.log -Pattern "SteamLinkGXR|SDL |AndroidRuntime|DEBUG|FATAL|libvrlink_scene|OpenXR|xr_runtime"
```

## 2. What to look for, per issue

### Stretched launcher / splash (issue #1)
- After rebuilding with `xrDirectInputFixPatch` applied, look for:
  `SteamLinkGXR: Applied managed-panel surface metrics (direct patch)`
- Also grep the stock SDL size logs to confirm the surface itself isn't
  oversized before our patch even runs:
  `SDL *: Window size: WxH` and `SDL *: Device size: WxH`
  If `Window size` already doesn't match the managed-panel's expected
  ~1280x692-ish aspect, the *window/layout* request itself (the
  `android:defaultWidth`/`defaultHeight` in `AndroidXrCompatibilityPatch.kt`)
  isn't being honored by the compositor — a different bug than the one just
  fixed. Share both size lines.

### VR input not accepted (issue #2)
- Launcher navigation: reaching for/clicking a menu item should log
  `SteamLinkGXR: XR panel select -> PRIMARY_MOUSE down` /
  `... up`. **No such lines at all** while pointing/pinching means the
  Android XR compositor isn't delivering MotionEvents to the app's view at
  all (a config/permission/focus problem upstream of our code, not a bug in
  the patch). Lines that **do** appear but the UI still doesn't react means
  the event reaches SDL but the launcher isn't responding to synthetic mouse
  input the way we expect.
- In-stream / gameplay controller & hand input: there are currently **no**
  `SteamLinkGXR` log lines for this path at all — that logic lives in
  VRLink's native OpenXR binding (`controller_config.json`), not the Java
  layer. Grep for the OpenXR runtime's own logs (tag varies, try
  `OpenXR`, `xr_runtime`, `openxr`) around the moment you enter the stream,
  specifically for `xrSuggestInteractionProfileBindings` failures or
  "unsupported interaction profile" warnings — `controller_config.json` only
  declares bindings for `/interaction_profiles/oculus/touch_controller`,
  which Galaxy XR's runtime almost certainly doesn't advertise. Confirming
  this in the logs tells us exactly which paths to add
  (`/interaction_profiles/ext/hand_interaction_ext` and/or whatever profile
  Android XR reports for a paired Bluetooth controller).

### Crash on connect / during handshake (issue #3)
- Search `repro.log` for `FATAL EXCEPTION` (Java crash — includes a full
  stack trace naming the exact class/method) or `Fatal signal` /
  `backtrace:` (native crash in a `.so`, e.g. `libvrlink_scene.so`, with a
  `pc <offset>` you can map back to the binary-patch offsets already used in
  `PermissionPromptPatch.kt`/`PredictionOffsetPatch.kt`).
- Share ~50 lines centered on that crash marker — the exact exception type,
  message, and top few stack frames (or the native `pc` offset + backtrace)
  is what actually lets us pinpoint the fix; a screenshot of the crash toast
  alone isn't enough.

### Slow handshake (issue #4)
- Capture with `-v threadtime` (already default above) so every line is
  timestamped. Note the wall-clock time you tapped "Connect", then find that
  moment in the log and measure the gap to the first `SteamLink`/`VRLink`
  "connected"/"stream started" style line. Share that whole segment —
  we're looking for a specific blocking call (DNS/mDNS discovery, a fixed
  sleep/timeout, or a retry loop) rather than guessing.

## 3. Sharing results

Paste (or attach) the filtered log segments back into the session, one per
issue if possible, and mention which issue each one corresponds to. That's
enough for a targeted, verifiable fix instead of another guess.
