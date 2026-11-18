# Native warning privacy and resource review

This closes the offline privacy/resource review for the implementation at `748d155`; it does not close R1–R8 runtime acceptance. The reviewed shared production files are unchanged from the complete local verification checkpoint `9bf1b05`. Its Android tests remain applicable to these files; the later producer announcement-counter correction has its separate 172-test checkpoint.

## Reviewed boundaries

| Boundary | Current implementation and evidence |
| --- | --- |
| Local transport and receiver restriction | `NativeWarnings.init` resolves the calling UID's installed packages through `StartupProtocol.allowed` and the configured receiver package. `WarningEndpoint.onTransact` authorizes the UID before descriptor discovery or Bundle decoding. Registrations and playback requests retain UID, consumer nonce, session and epoch checks. The startup service independently applies the same configured restriction. Runtime mixed-version/restriction acceptance remains a separate gate. |
| Production diagnostics | `WarningDiagnostics` retains at most 512 immutable process-local records: identities, coarse type/category, clocks, mode and outcome stage. It stores no message, coordinates, account, destination, audio or file capture. Private instrumentation separately observes synthetic payloads/PCM; these captures are not production logging. |
| Durable uncertainty | `AtomicPlaybackStore.encode` writes only boot/session/consumer/owner identities, the opaque event key, attempt identities, UID/epoch/revision, mode, outcome and started flag. It writes no warning text, native warning ID or location. Records are bounded to 4,096 bytes, strings to 128 bytes; load verifies checksum/version/trailing bytes. |
| Storage and worker isolation | The production ledger uses the provider's no-backup directory, a single held lock, mode 0600, no-follow temporary creation, file sync, atomic rename and directory sync. Store operations reject the main thread. A commit error retains the uncertainty fence rather than assuming the write never happened. |
| Bounded ingress and callbacks | `WarningEndpoint` has four fixed callback slots and a 128-entry actor queue. Native capture enqueues work; ledger/callback operations run on workers. Rejected work yields a fault/status rather than unbounded replacement workers. Existing endpoint tests cover unauthorized callers, callback/worker failure and resource bounds. |
| Bounded events and scheduling | Codec limits remain 24 KiB/event, eight events/128 KiB per batch. The journal retains at most 128 events and 128 warnings. The scheduler bounds pending work at 16, handled identities at 128 and attempts at two, with original announcement deadlines. The owner bounds attempts at 128 and retains unresolved output uncertainty. Existing codec/journal/scheduler/owner tests cover overflow, expiry, duplicate and obsolete-work behavior. |

Relevant production files are in `support/navigation-alerts/src/main/java/nl/johninnl/navigation/alerts/`, with caller restriction supplied by `extensions/flitsmeister/src/main/java/nl/johninnl/flitsmeister/NativeWarnings.java`. Existing regression classes include `WarningDiagnosticsTest`, `AtomicPlaybackStoreTest`, `WarningEndpointTest`, `WarningCodecTest`, `WarningConnectionTest`, `WarningSchedulerTest` and `WarningSchedulerRecoveryTest`.

## Development bundle inspection

The [artifact-bound receipt](../../tests/fixtures/navigation-warnings/flitsmeister15-privacy-resource-verification.json) names the reviewed source hashes and signed development MPP. Its 1,001 ZIP entries contain no private analysis directories, probe APKs, evidence archives or test keystore paths. The FM, Maps, Maps-car and Vela MPEs are raw DEX files; none contains the private `nl/johninnl/warningprobe` descriptor prefix. This is a precise packaging check, not a claim that arbitrary diagnostics can never be added later. Final approved release bytes need the same exclusion check.

No production change was needed for this review. Existing authenticated IPC, privacy/resource tests and their exact scopes are retained. The [final acceptance checkpoint](2026-11-03-native-warning-final-acceptance.md) continues to list repeat, route, mode/failure/lifecycle/compatibility, timing and authorized physical/car gates separately.
