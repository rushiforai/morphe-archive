# Vela warnings on the real DriveDeck car surface

## Observed failing car-only path

The owned `emulator-5580` / `native_warnings_api34` run uses the installed DriveDeck 1.0.18 host, package `app.johninnl.drivedeck`, APK SHA-256 `353ee236646f71acffcca4e7560a563b8730cb3a41773bf223514287bdd0d7b4`. The genuine Car preview UI drives the host's `ScreenProjector`, Presentation, SurfaceView and `CarAppConnection`; the probe does not construct a Canvas, surface or car connection. Vela's phone Activity is absent. The native host binds `app.vela/.car.VelaCarAppService` across UID 10203 → 10192; the real warning provider is UID 10204.

The first run exposed Vela's missing location permission. A second run temporarily granted its declared coarse/fine permissions and displayed the actual native Vela map, current-position arrow and controls in the host window. The real native FM callback issued `SpeedCam:probe-vela-car-location-granted` (`SPEED_CAM/SPEED_50`, native text “Speed cam 50”). Vela accepted it after 2 ms, queued it and eventually recorded `SCHEDULER_EXPIRED`; there was no STARTED or successful playback. This is a failing integration result, not car acceptance or a latency distribution.

The read-only native guide witness at both connection readiness and failure records the real saved `voice_engine=com.google.android.tts`, `e=false`, `h=false`, `i=false`, `m=false`, `n=false`, `f=null`, `b=null`, `l=null`, `s=0`, `t=false`. The injected native guide exists but its selected engine has not initialized in this car-only browsing lifecycle. Speech initialization is repaired independently of rendering, through the actual selected native guide and original engine method.

A separate rendering gap is pinned to the original publisher DEX. `Lxv;->a(Lorg/maplibre/android/snapshotter/MapSnapshot;)V` calls `Lcw;->g(Canvas)` only when `(navigating || driveScreen) && SpeedDisplay.on`. The existing compact warning hook inside `g` therefore cannot draw during native browsing or when the speed display is off. The observed browse map has no compact warning layer.

## Frame repair and guards

The new warning hook runs on that original callback's actual Canvas, at the join before `Lcw;->u()Rect`. Replacing the join instruction and reinserting its native call preserves both incoming false-branch labels. Plain insertion would let those branches skip the hook. The complete original callback guard pins 25 registers, 335 instructions, access flags 17 and operand/payload/catch SHA-256 `005a5364b0b0636cef02de4ccdafc8db413745b565e90b800fbb4c0abe9fd3d8`.

Only current native semantic warning text is drawn, under the existing car/category choices. The new layer requires neither a fix nor a speed value. It leaves the existing drive/navigation compact layout in charge when that renderer is already active, and adds no second speed/zone UI. Weak references retain only renderers observed from real callbacks. Semantic arrival, clear and expiry request the original renderer's snapshot method; this updates the real surface without fabricating navigation state or waiting for another GPS sample. Unchanged content does not request another snapshot.

The regression suite checks the native skip branches after DEX assembly, register preservation, every original reference, changed-input/reapplication rejection, browsing/no-GPS drawing, disabled speed display, category/car gates, native paint preservation, host-inset clipping and semantic clear redraw. A successful build or component Canvas test does not establish the repaired real host path; the same displayed-host scenario must pass after rebuilding.

## Evidence and rollback

Local evidence is under `.analysis/native-warning-bindings/vela-car-first/`. `coupled01/` retains the missing-permission failure; `coupled02-location-granted/` retains the real map, service/client binding, active host window, primitive engine witness and original source/receiver output. Source candidate SHA-256 is `816e3f875d271c57b834c7e2f09a76bdcec367384dfe082e46f624bf5c1fd53a`; Vela candidate SHA-256 is `d29fd1a4d4be00848134739c352db296acb0b34e61f851d966bd9b8c122d0c8e`; the engine-audit helper SHA-256 is `9b3d39d598d40af34b37e00014ad8b272c21e7bc80bd5a03044c6d41f4434451`.

`cleanup.json` verifies both host APKs unchanged, both host preference file sets restored exactly, host/Vela runtime permission grants and flags restored exactly, both FM mute leases/firewall fences restored, and all owned FM/Vela/host processes absent. Android's genuine precise-location prompt added flag 524288; the scoped UID-0 PermissionManager restoration cleared only that bit for the exact owned host fine-location permission (525056 → original 768). No global permission reset occurred.

The current results prove the failing real car-only boundary and its diagnosis. Physical head-unit audio routing, speakers, controls and vehicle sensors remain untested; even a repaired DriveDeck preview result is simulator evidence.
