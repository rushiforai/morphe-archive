# Waze in the background keeps stale reports (2026-11-11)

Inputs: patched Waze 5.27.0.1 from the owner's phone (`libwaze.so` SHA-256 `72a28430…`), JADX of
the same APK, and emulator sessions with Waze running as Maps' data source (GPS-only fabrication,
Frida on Waze and Maps). Evidence:
`~/.local/state/nl-morphe-patches/evidence/waze-hazard-scan-20261111/`,
`waze-background-refresh-20261111/` and `waze-insights-feed-20261111/`.

## Symptom

With Waze as Maps' data source, Waze's alert list stopped changing while the car moved. Over about
25 km of A4 no new police, hazard or crash report arrived; average-speed zones (a separate source)
still did. Eight seconds after Waze was brought to the foreground, new reports arrived.

## Cause

1. `com.waze.lb.w()` (Waze's activity manager, "updateBackgroundState") treats Waze as foreground only
   while a Waze activity is started, Waze's own car screen is resumed, or Waze's instrument-cluster car
   session is started and `CONFIG_VALUE_CAR_LIB_INSTRUMENT_CLUSTER_KEEP_APP_IN_FOREGROUND_ENABLED` is on.
   Otherwise it calls `NativeManager.onAppBackground()`.
2. `onAppBackgroundNTV` sets a native "in background" byte; `onAppForegroundNTV` clears it.
3. `SendMessage_MapDisplayed()` reads that byte and, in the background, logs "In background. No
   dimensions to send" instead of telling the realtime server which map area is displayed. The server
   pushes reports for the last displayed area.
4. Even in the foreground, a headless Waze has no displayed area: a probe on the area getter returned
   `[0,0]` after a direct `onAppForeground()` call. Forcing the foreground state alone therefore gives
   one refresh, not reports that follow the car.

Validity is separate: `AlertDescriptor::ValidateAlert` accepts a realtime report only when it lies on
Waze's route ahead (navigation route, or the roaming route in free drive). This patch does not change
that decision.

## Fix

Waze's insights feed (`RealtimeInsightsRepositoryImpl`, `InsightsApiImpl::FetchInsights`) loads
reports by S2 map cells around the car or route, without a map view. It is switched by
`CONFIG_VALUE_INSIGHTS_INFRA_INSIGHTS_API_ENABLED` (native config 1631, read once at startup and
cached); the server leaves it off for this account (`S2 level 10` configured).

Diagnostic with the value kept on and locked (the way `keepWazeConfig` does), Waze in the background:
14 fetches in 4 minutes, all answered (`status 0`, tile present, 29–78 insights per tile), and a new
hazard arrived and was accepted mid-drive. The value was restored afterwards.

"Broadcast navigation data" now keeps the value on behind the Customization switch
`areaReports` ("Reports around you in the background"), on by default. It applies after Waze restarts.

## Acceptance with the patch (emulator, Maps on the car)

Patched Waze built from this change (evidence:
`~/.local/state/nl-morphe-patches/evidence/waze-area-reports-acceptance-20261111/`, input hashes in
`inputs.sha256`). After install the value read on and locked on the first start; Waze was restarted once.
Driving at 160 km/h in the background with Maps on the car:

- 64 insights fetches, all answered (`status 0`), while no Waze map was drawn.
- The realtime alert provider iterated the insights (`GetInsightsApiAlertDescriptors` lambda ≈13 calls/s).
- A new hazard arrived at 17:35:35 mid-drive, Waze accepted and announced it, and Maps showed the
  pill counting down 900 → 149 m and spoke it to completion.
- Bringing Waze to the foreground at the end added no further reports, so the area had few live reports
  at the time; the count of reports is not a comparison with the unpatched baseline.

## Proof captured before the fix

A police report Waze accepted in the background reached Maps on the car as a pill (police icon,
64 m). On an earlier pass Waze announced it and Maps started speaking; Waze withdrew the report two
seconds later and Maps stopped. Maps speaks only reports Waze announces.

## Tooling notes

- A Frida probe on `NativeWarnings.repository` crashed Waze (CheckJNI) because the safety observer
  hooks the same method; probes moved to `AlerterNativeManagerBase.updateAlertersRepositoryJNI`.
- Attaching the safety observer to Maps right after a cold start crashed Maps once
  (`art_quick_invoke_static_stub`); attaching after 30 s was stable.
- Waze ignores a GPS speed of 250 km/h (reports 0), which also affects its roaming route; scan at
  160 km/h or less.
