# Caption ownership and lifecycle

This describes current source. Package/review status belongs in [PROJECT-STATE](../PROJECT-STATE.md); dated investigations are recoverable through [history](../history/README.md).

## Owners and permissions

| Fact | Owner and actual boundary |
| --- | --- |
| Native CC and target | `NativeCaptionBridge` / `CaptionNativeProjection` observe YouTube's committed selection and video owner. Track catalogues, prefetch and request URLs cannot invent a target. Explicit OFF wins over forced/default tracks |
| User AI choice | `CaptionSessionIntent` stores ai_enabled/revision; `DeepSeekConfig` stores enabled. `onUserSwitched` writes both. They are different stores, not a transaction |
| Legacy intent backfill | `onUserActivated` may backfill Intent only while Config.enabled is true. Native CC/language cannot enable a Config-disabled engine |
| Application selection | `CaptionSessionReconciler` combines video/owner epoch/intent revision/selection revision. `displayAllowed` checks Config/CC/Shorts; `apply` additionally checks Intent. These gates are not identical |
| Player eligibility | `CaptionPlayerAuthority` and `CaptionSurface` own Activity/video/player/Shorts evidence. Engine stop does not close the player owner |
| Ready callback | One coalesced main-thread task, checked against slot identity/generation/video/owner; it reads the current selection when run. No permanent retry polling |
| Work and reply preparation | `RebuildController` owns active Session/Job and final authorization. `RebuildWorkSet` owns slots/admission/accounting under the Session monitor. `RebuildReplyPreparation` prepares results without publication authority |
| Source preparation | `RebuildSourcePreparation` gets source/config facts, request control, live URL reader and diagnostics; no Session, View or publication authority |
| Visible output | Core guards plus `CaptionOverlay` command/render epoch/owner/CC/geometry checks. An active engine or accepted plan does not prove a TextView was painted |

AI OFF stops core and returns native painting to YouTube without altering native CC/language. AI ON with CC UNKNOWN/OFF waits/stops; it cannot overwrite explicit OFF. A valid current native selection may activate translation or source-only display. Source-only uses no model requests. COMPACT/transitions/Shorts exit revoke display; restoring geometry/owner does not itself grant translation authority.

## Identities cannot be merged casually

| Identity | What invalidates it / what it protects |
| --- | --- |
| player ownerEpoch | Owner/video/close changes; stale host observation, ready callback and geometry work |
| native selection revision | Selection facts or new video; application reconciliation and final current-selection check |
| intent revision | User switch/backfill; application key and late action check |
| ready generation + task slot | Cancellation/replacement; an old posted callback cannot restart a new owner |
| Session identity + generation | Active replacement, stop, seek, retirement; source/cache reply, jobs and render guards |
| render revision/submission + UI epochs | Queued text/page/position work; rechecked before and after UI delivery |
| publicationEpoch | Replacement/stop; asynchronous clear cannot restart an unrelated new session |
| Publication mode/permit | OPEN alone admits a new permit; revoke stops admission, admitted old writes may finish in their original scope |
| Prepared ordinal | Older prepared cache output cannot replace a newer committed result |

Normal stop/video invalidation uses STOPPED and cancellation. Direct scope replacement may use RETIRED: an already sent transport can finish reading, but `tryBeginAttempt` must reject a new negotiation/fallback POST after retirement. Language reconciliation often deactivates first, so not every switch follows the same retirement path.

Provider work, reply validation, preparation/fsync and physical commit run outside the Session lifecycle lock. Before reserve and before visible application the controller rechecks current job/generation/plan. Reserve/revoke are ordered by Publication's monitor. A permit admitted before revoke can finish its original disk write; it cannot update the replacement session's display.

`clearCache` stops first, drains admitted work in the background, clears translation/source cache, then posts restart only if publicationEpoch still matches and no new active session exists. Queue rejection/background failure yields safe feedback. It is not immediate synchronous success. See [cache](CACHE-FAILURE-CONTRACT.md).

## Verification and limits

Representative active regressions: `NativeLanguageAuthorityTest`, `ShortsCaptionAuthorityTest`, `CaptionSessionReconcilerTest`, `ReintegratedApplicationTest`, `PublicationLifecycleTest`, `AttemptAdmissionTest`, `RepairAdmissionTest`, `D1SourcePreparationTest`, `S2DisplayPlanningTest`, `CaptionLayerOverlayTest`.

Host/main-thread events, Session synchronization and UI invalidation are separate mechanisms. JVM fixtures do not prove every host callback thread or arbitrary cross-object interleaving. Shared source-flight cancellation, late source-cache put and multi-store intent/config limits remain as documented; do not simplify them into a claim of universal atomicity.
