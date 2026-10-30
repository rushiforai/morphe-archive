# Diagnostics and performance boundaries

## Meaning of the records

Path: core → `TranslationAudit` / `TranslationRuntime` → `CaptionApplication` → `TokenCostAudit` / `CaptionDiagnosticsWriter` → archive/snapshot/report/export. These components observe decisions; they do not authorize requests or display.

| Field | Meaning |
| --- | --- |
| reason | Actual API/transport/protocol failure, not a retry-policy decision inferred from wording |
| HTTP_CONFIG | Legacy accounting bucket including 429/5xx/filter errors; it does not imply configuration=true or terminal |
| REBUILD_FAILURE_DECISION | Applied Session/parent-block state, terminal/filter flags, configuration, failure delay and actual parent/provider retry gates at that moment |
| logical requests/batches | A translate operation; ordinary block and subrepair can be distinct operations |
| attempts | An admitted HTTP attempt, not proof that a server received/processed/billed it |
| response/quality/cache | Separate counts; HTTP 200 or a zero review score does not certify semantic completeness |

Retry coordinates use the process monotonic clock. Old exports/missing records/truncation cannot be reconstructed into a complete account. Keep failure reason, accounting and scheduling separate when diagnosing a stall.

## Writer, archive and snapshots

Playback/animation callers enqueue credential references; decryption, redaction and appends run on the writer. Each record uses its captured credential scope. At most two credential snapshots are retained; unavailable keys use the existing pattern redactor and an explicit unavailable indication.

The writer has separate ordinary/decision lanes, each bounded at 512; repeated merge keys can coalesce. Drain batches are bounded at 64 records/60000 characters and the decision tail at 12000 characters. The archive queue is 4096; per-channel storage rotates at 32 × 256 KiB and 24h. Overflow and truncation are reported; even decision records can be lost. These bounds describe components, not a universal bound on every source-work queue.

Clear uses epochs so old queued diagnostics do not reappear as new data. Asynchronous UI snapshots check panel/epoch/profile/language ownership. Export may wait for background barriers; playback paths do not call that export barrier.

## Runtime provenance

`ui`, `engine`, `build` identify the addon. `core_source`, pinned commit, `core_adaptation=local` and `core_provenance` describe source history. `official=unknown; official_source=runtime_unverified`, matching patcher fields and `composition=unverified` remain honest on a phone even after a desktop composition passed. build_expected_official/patcher are expectations, not runtime measurements.

Old static official=1.45.0/build=n30 markers remain literally in historical logs. Parsers accept missing fields and unknown. Presentation revisions are internal markers, not device/compatibility certificates. Diagnostics can contain source text/provider responses/video IDs despite credential redaction; inspect before sharing.

## Mechanism evidence and what it cannot prove

Active regressions include `AnimationDiagnosticsTest`, `M6aFailureDiagnosticsTest`, `M6aHotPathMechanismTest`, `CaptionLongDiagnosticsTest`, `DiagnosticsLazyRowTest`, `N37SnapshotBindingTest`, `M7bDiagnosticProvenanceTest`, `CaptionAnimationIdleTest` and `CaptionNoLayoutContractTest`.

Controlled tests protect deferred credential/IO work, one strict settings credential resolution per request snapshot, stable-layout/page reuse, bounded diagnostics and lifecycle draining. Strict settings can still read credentials on the startup caller thread. Source-cache writers are not universally hard-capacity queues. Background daemon existence is not itself a leak.

JVM timings, synthetic token timestamps, advanced Robolectric frames and package size do not certify OEM frame time, memory/power, hardware Keystore/IO tails, physical audio synchronization, model quality or provider billing. Use bounded real-device observation for a changed player path; do not create another synthetic performance program without a specific regression or budget.
