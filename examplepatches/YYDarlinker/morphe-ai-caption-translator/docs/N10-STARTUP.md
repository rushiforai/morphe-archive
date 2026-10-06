# N10 startup: where the silent interval went

The frozen 1.3.5 trace (`caption-diagnostics-1.3.5-20260929-155802.txt`) starts a translated session at 1790668000288. `SOURCE_FETCH` follows 15 ms later, `SOURCE_OK` at 1790668011065, and `REBUILD_SOURCE_READY` at 1790668012429. The first preparing status was presented at 1790668000335; measured from it, source readiness took 12,094 ms and first body content took 29,640 ms. The first request chose block 1 at playback position 11,420 ms, after block 0's 7,040 ms end. Block 1 then failed twice with `semantic_anchor_leak`, so its missing content through 28.9 s is a separate quality failure, not additional startup work.

The older 2026-09-27 trace recorded `SOURCE_CACHE_HIT`, then source readiness about 782 ms later (about 815 ms from activation). It measures a warm source path and does not contradict the new cold fetch.

| Candidate for the +1.6–+10.9 s quiet interval | Frozen/static evidence | New trace needed? |
| --- | --- | --- |
| Source connection, TLS/redirect, or response headers wait | `SOURCE_FETCH`→`SOURCE_OK` spans 10,762 ms; `RawCaptionSource.fetch()` synchronously calls `getResponseCode()` | Yes: `connection_open_*` and `response_headers_*` |
| Slow caption response body | Same 10,762 ms span includes the read loop | Yes: `response_body_*` |
| 401/403 cookie refresh and retry, or JSON3 format retry | Both are possible in `RawCaptionSource`; the old trace does not record them | Yes: `auth_retry`, `cookies_end`, `format_retry` |
| Local cache lookup, parsing, or cache write | All occur before `SOURCE_OK`; the frozen trace proves a cache miss, not their individual durations | Yes: `cache_lookup_*`, `parse_end`, `cache_write_end` |
| Track-list or ownership delay before source fetch | Applied translated track is logged 43 ms before `SOURCE_FETCH`; little of this particular wait can be here | Yes to learn whether an earlier track-list prewarm window exists: `NATIVE_TRACK_LIST_READY` and applied-track timestamps |
| Planner work after source fetch | Explicitly measured: rebuild 156 ms, reference 1 ms, planner 1,115 ms, cache 16 ms | Already measured; `engine_ready` now brackets the full phase |

The one-shot source prewarm starts only for a single signed foreground source and current or remembered translated-ON intent. It creates an invisible session and makes no translation request. This can overlap cold source fetch with player setup when the list arrives before selection; the new list/ownership timestamps will establish whether it does on device. The stronger deterministic improvement is to show the current time-bounded `[原文 / Original]` cue immediately after source parsing, before rebuild/planning and before any API request. In the frozen timeline the equivalent point is `SOURCE_OK` at +10,730 ms from the first status; this is an eligibility floor, not a measured new display time. Expired first blocks are skipped by the current-position scheduler and now record `skipped_due_to_late_ready` when the engine becomes ready.

`scoreboard/results/n10-startup.json` mirrors these two frozen startup metrics and the unverified source-cue eligibility floor. No live request or new device trace was used.
