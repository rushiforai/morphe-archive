# Android Auto navigation HUD placement

Status: responsive client integration in progress; original Android Auto acceptance remains required. DriveDeck is not a dependency or a substitute acceptance target.

## Platform ownership

Directions, ETA, destination/search/preview panels and sidebar buttons use the public Car App Library models. Android Auto measures, positions and adapts those controls. Maps supplies genuine data and original callbacks. Vela retains its native template implementation.

The pinned CAL1.8.0-rc01 / Car App API8 model has no arbitrary custom speedometer or warning-pill slot. The approved custom speed, warning and average-zone indicators therefore remain app-rendered inside the map surface. They must follow Android Auto's standard `SurfaceCallback` geometry, rather than depend on a private DriveDeck service. Responsive app drawing and a host-rendered template widget are different mechanisms; label them accurately.

Use `onVisibleAreaChanged` for the current unobscured rectangle and `onStableAreaChanged` for persistent reservations. Rectangles are in surface pixels. Copy them, clip to the actual surface and keep visible/stable ownership distinct. An explicitly empty visible area means unknown; do not revive a historical stable rectangle as proof that an overlay is safe. Before a visible callback is received, a known stable area can provide the initial reservation. On geometry/DPI replacement, discard old-area coordinates and wait for the new host callbacks.

Public references:

- [SurfaceCallback](https://developer.android.com/reference/androidx/car/app/SurfaceCallback)
- [Navigation templates](https://developer.android.com/training/cars/apps/navigation#access-navigation-templates)
- Local blueprint: `Android Auto Architecture 2026-11-04/Evidence/android-auto-rendering-20261104/blueprint/navigation/navigation-layout-blueprint.md`.

## App responsibilities

- Maps keeps the existing native speed/limit card; never add a duplicate or translate its watermark/container. Its dedicated card stays within the current host rectangle and restores native transforms/alpha on detach. Preserve native animation changes and do not accumulate movement on successive frames.
- Maps warning/average placement follows both host-area changes and native layout/pre-draw changes without requiring another GPS/provider packet. Align with the drawn speed-card edge and retain the approved icon, regular typography and right-column distance bar.
- Vela uses host density consistently for its clean speed pair and separate warning/average pills. Preserve its current visible/stable callback fields and existing native template/card behavior.
- Scale a constrained warning stack uniformly; do not independently crop its measured width and height. Withhold an unreadably small or unknown-area custom indicator rather than overlap AA controls.
- Surface loss, pause, teardown and replacement remove this session's additions and restore native view properties. No old model or transform may leak into a replacement window.
- Use genuine FM/Waze identity, phase, distance, average, progress, remaining-distance and expiry under `navigation-indicators-v1.md`. Layout never refreshes observation clocks or gains speech authority. Only GPS may be fabricated for final drive evidence.
- Retain native attribution and phone UI. Host-owned actions remain reachable through their standard strips/list overflow, including Back and focus return.

## Required acceptance evidence

Reuse passing Search/route-preview and approved generic design evidence unless relevant changes invalidate it. The following runtime gates remain open for this placement batch:

1. On original AA17 plus Google's DHU at1280x480, open/close available host overlays during Maps and Vela navigation; custom speed/warning/average panels follow reported reservations and remain aligned, without duplicate controls or a blanket bottom obstruction.
2. Exercise800x480 and1280x720, plus a different DPI, with touch/rotary/Back and surface replacement. Confirm actual controls are reachable; static rectangle tests are not proof of host input behavior.
3. Use real FM/Waze warning and average-zone data with GPS-only movement. Capture genuine unchanged frames showing current speed/limit, warning distance, zone entry/progress/remaining/exit and clear. Keep speech/PCM and lifecycle gates distinct from visual proof.
4. Record exact source/APK/AA/DHU identities, native visible/stable rectangles and any withheld/unknown state. Preserve original callback results and retain required Frida coverage. Stop GPS immediately after an unexpected drive failure, then diagnose offline.

DriveDeck-specific host extensions are outside this implementation path. A contract, build, unit test or old-renderer screenshot does not close original Android Auto acceptance.
