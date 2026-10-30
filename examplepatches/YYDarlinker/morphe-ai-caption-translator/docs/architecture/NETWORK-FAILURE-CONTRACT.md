# Network attempts, waiting and failure

## Actual paths

- Source: `RawCaptionSource` → `SourceLoadFlights` / `SourceRecoveryPolicy` / `NetworkDeadline`. It fetches YouTube captions with bounded formats/candidates and optional same-language timing reference.
- Provider: `RebuildApi.translate` → `TranslationSourceAccess.send` / `NetworkDeadline`. It constructs chat-completion requests, consumes SSE/non-streaming replies and handles bounded negotiation/fallback.
- Scheduling: `RebuildController` with `RebuildWorkSet` owns admission, current-job checks, retry gates, repair/slow retry, filtering and terminal state. Diagnostics do not decide retries.
- Output: `RebuildProtocol`, `RebuildReview`, salvage and page planning validate source binding and displayability. HTTP 200 is not proof of a complete translation.

## Failure scope

| Input | Current decision |
| --- | --- |
| Provider 401/403/404 | Configuration failure; in-memory block for endpoint/model/key and terminal Session. No batch/POST for a blocked combination. Reset or a changed combination permits a new attempt |
| 400/422 inspection rejection or finish_reason=content_filter | Parent block filtering. Ordinary 403 containing similar text remains http_403, not this policy |
| Stream rejection | At most one non-streaming fallback for the call. Optional-parameter negotiation is a separate bounded resend; together they can cause three HTTP attempts for one logical call |
| Provider 429/5xx | Non-configuration failure; monotonic parent retryAt and providerRetry gates. A shorter late failure cannot shorten an established later wait |
| Structure/validation failure | Existing usable plan survives; no source-text fallback. Partial plans retain explicit holes and may use bounded repair |
| Intentional cancellation | No new attempts. An already admitted/sent transport and server billing are separate facts |
| Source timeout/IO | Classified by `SourceRecoveryPolicy`; 408/425/429/5xx retryable, SSL not retryable, cancellation not retryable. The source-loader's bounded same-language fallback is separate from outer retryability |

Retry-After accepts numeric seconds and HTTP dates; arithmetic saturates instead of overflowing. Elapsed scheduling coordinates are not UTC timestamps. Transport classification checks intentional cancellation, fired deadline, timeout phase, then network IO. A remaining duration of zero alone does not prove the timer fired.

## Budgets and ownership

Focus concurrency is 2 and prefetch concurrency is 2. Ordinary block attempts, semantic/session repairs, slow retries, hole repair and page repair have separate counters. Preserve their existing admission points: a logical translate call, dispatched block job, sent body and physical HTTP attempt are different units.

Current controller limits include three slow retries, four page repairs per block and six session repairs; semantic attempts are bounded separately. Hole repair uses the parent's waiting/filter/terminal gates and a shared slow-retry allowance. A page range is deduplicated within generation; a seek can change generation. These are not an account-wide request or spending cap.

Every new provider HTTP attempt calls `RequestControl.tryBeginAttempt`. A RETIRED sent transport may finish reading but cannot start a negotiation/fallback POST. Stale results also need current job/generation and publication/display authority. Credentials/profile changes invalidate live request identity even when compatible translated cache entries are reusable.

The source protocol's large-quote coverage check preserves original declared coverage; source rebinding cannot claim a large unmentioned tail. At most the existing four compact source characters may be recovered by this correction. Structural completeness still cannot certify every semantic meaning. The source-coverage-v2 translated-cache namespace prevents old expanded-ID results from being restored under the new policy.

## Evidence and limits

Active tests include `NetworkFailureContractTest`, `SourceHttpFailureContractTest`, `RetryAfterContractTest`, `AttemptAdmissionTest`, `RepairAdmissionTest`, `D7CoverageRegressionTest` and `D7CachePolicyTest`. Local HTTP fixtures verify received requests and real controller paths; they do not contact a paid provider.

Legacy HTTP_CONFIG accounting includes several non-configuration errors. Read the actual failure-decision fields rather than inferring terminal/retry behavior from that bucket. See [diagnostics](DIAGNOSTICS-PERFORMANCE-CONTRACT.md).

Not certified: all real providers/TLS/timeouts, server receipt/billing after cancellation, every parallel negotiation/host sequence or global spending guarantees. Current package and phone status belong in [state](../PROJECT-STATE.md).
