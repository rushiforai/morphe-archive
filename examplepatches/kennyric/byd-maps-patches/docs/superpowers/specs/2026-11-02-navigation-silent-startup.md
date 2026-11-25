# Silent navigation provider startup

Build the requested ecosystem integration for Waze 5.26.90.901, Flitsmeister 14.17, Maps 26.43.05.1002020710 and Vela 0.5.2621. Opening/resuming a receiving map or selecting an external provider must silently initialize that provider, monitor native engine health and recover stoppages. Never launch a provider Activity as a fallback. Use only emulator devices; do not touch the user phone.

## Architecture and decisions

Add a versioned Binder control API in each provider through its Broadcast navigation data patch. Authenticate every call with the framework caller UID and supported receiver package names, including the explicitly configured receiver package. The API supplies native engine status and an immutable PendingIntent targeting a private location foreground service. Maps/Vela send that provider-created intent while visible, following Android's documented cross-app foreground-service permission path. The private service posts an ongoing notification before invoking the provider's existing initialization path. Flitsmeister uses FlitsmeisterBaseService; Waze uses WazeInitializer on the Application, not merely WazeAppService.

Use shared client code with bounded asynchronous Binder calls, connection-death handling and retry backoff. Maintain the connection while a receiving map is visible or its phone/car navigation is active. Refresh the service lease while needed; release on source change or session end. Stop the integration service after lease expiry, without stopping independently running provider navigation. Native health and observation freshness stay separate. Preserve unknown/stale data handling; never fabricate GPS, limits or road warnings.

## Constraints

First-run provider setup and OS runtime grants remain required. Android restrictions must produce an actionable status without opening UI or a restart storm. Detect absent API/unpatched providers without breaking the existing broadcast feed. Package names are checked against Binder UIDs, never trusted request extras. Custom receiver support uses the existing patch option. Do not lower SDK targets or disable platform service restrictions.

## Alternatives

Selected: provider API plus private foreground-service startup, as requested by the user. Opening/returning from a provider Activity violates silent startup. Periodic broadcasts alone cannot cold-start dynamic listeners. Root/Shizuku are unnecessary dependencies and excluded.

## Verification

Run unit tests for authentication, disabled providers, native readiness versus stale GPS, retry/backoff, source changes, lease expiration and lifecycle cleanup. Build the patch bundle; apply changed provider and consumer patches to all four supplied artifacts. On a dedicated emulator verify cold-start and process-death recovery with native engine evidence, provider activities staying closed, missing permissions and disabled sharing, plus both receiving map apps. Record artifact hashes and bounded runtime evidence. No stable promotion without confirmation under AGENTS.md.

## API-managed audio (user addition)

Keep Waze and Flitsmeister spoken warnings and alert sounds muted throughout an API-managed session so only Maps/Vela announces road alerts. Gate provider audio at its own playback layer while the consumer lease is active; do not change saved sound preferences, device stream volume, or alert/telemetry production. The gate must be active before native initialization and survive process recovery. On lease expiry restore normal provider audio behavior automatically. Verify TTS and sound effects independently, including already-playing/queued audio and the main app remaining audible.

## Car-only startup

A visible native car Session must activate the selected provider even with no phone Activity, no active route and no rendered speed overlay. Observe its guarded native lifecycle; release visibility on STOP/DESTROY while retaining active-route/background navigation behavior. Validate the ordinary cross-app startup path through a foreground emulator car host without instrumentation or a passive probe boosting the provider before startup.
