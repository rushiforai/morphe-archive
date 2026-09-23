# Scope challenge: host stale-pose guard, 2026-09-15

## Conclusion

A guard against stale pose-cycle packets is a plausible **reset-amplification mitigation**, not a demonstrated complete fix for the whole-view freezes. The logs contain both stale-ID-triggered resets and client-requested recovery with no preceding mismatch in the same burst. Disabling all `Cause Mask: 000100` resets would suppress both classes and is unsupported. No host/client code or device state was changed by this analysis.

## Counting method and limits

- Inputs: baseline `host-initial/host-events.csv`, A/B `run-124246/bandwidth-ab/host/ab-events.csv`, both derived from their retained `rolling-driver_vrlink.txt`; device event JSON and existing correlated Perfetto export. Raw paths below are under `build/live-hitch-20260915/`.
- A **reset transaction** starts with the last logged reason immediately preceding a successful `SVLFEC::ReportStreamReset` and ends at the next `Starting encoder reset`. All 77 selected encoder resets have a matching queued request; the reason-to-report delay is <100 ms. Source-line order resolves equal timestamps.
- A **burst** groups consecutive mismatch/reset-counter reason messages separated by no more than 1 second. Its first reason determines the class. This is an explicit grouping convention, not a count of human-observed freezes. Sensitivity at 0.5 and 2 seconds is reported below.
- `stale` means the first mismatch has a negative pose-cycle ID difference; `forward` means positive; `counter` means the first reason is a changed `wgpReset` without an earlier mismatch in this burst. Counter-first does not prove there was never an earlier transport problem.
- Counts from the overlapping baseline, trace, and A/B summaries must not be added indiscriminately. The 4 host windows below are disjoint; their time coverage differs from device capture coverage.

## Successful reset transactions

| Host window | Encoder resets | Stale-ID first | Forward-gap first | Reset-counter first |
|---|---:|---:|---:|---:|
| Baseline 12:44:12.685-12:49:13.060 | 43 | 30 | 0 | 13 |
| Before 400, 12:57:12.105-12:59:12.105 | 16 | 15 | 0 | 1 |
| 150, 12:59:12.105-13:01:12.105 | 11 | 6 | 0 | 5 |
| Restored 400, 13:01:17.105-13:02:14.907 | 7 | 5 | 0 | 2 |

**56 of 77 transactions were initially requested by stale-ID mismatches; 21 were initially requested by changed reset counters.** The 56 are a ceiling on directly targeted logged transactions, not a prediction that 56 resets or freezes disappear: later counter changes, real forward loss, and changed stream state can still require recovery. No transaction was initially queued by a positive mismatch; positive differences appear within stale/back-forward sequences.

In 6 of those 56 stale-led transactions (4 baseline, 2 before400), a counter-change request also arrives before the encoder performs its reset. Preserving valid recovery can therefore retain a reset even after suppressing its initial stale-ID request.

## First trigger per burst

| Window | Bursts at 1 s | Stale first | Forward first | Counter first | Stale-first bursts also containing counter changes |
|---|---:|---:|---:|---:|---:|
| baseline | 32 | 25 | 0 | 7 | 6 |
| before400 | 12 | 12 | 0 | 0 | 2 |
| during150 | 10 | 5 | 0 | 5 | 0 |
| restored400 | 6 | 5 | 0 | 1 | 0 |

At 150 Mbit/s, **5 of 10 bursts are counter-first**, with no preceding pose-ID mismatch within the burst. All 5 align with device `Unable to acquire input buffer` (-1) and `ExperiencedAnUnrecoverableError` events. The 12:59:48.343 burst contains only counter-change reasons; the other 4 develop mismatch messages later. Their observed initial decoder/input recovery requirement is not addressed by an old-pose-ID guard. Their initiating condition still needs investigation; counter preservation must remain functional.

| 150 Mbit/s counter-first trigger (CEST) | Host source line | Nearby device evidence (device log source lines) |
|---|---:|---|
| 12:59:40.304 | 4026 | input -1 at 12740; FEC failure at 12743; queue errors at 12814/12818 |
| 12:59:48.343 | 4048 | input -1 at 15556; FEC failure at 15559 |
| 12:59:52.883 | 4059 | input -1 at 17178; FEC failure at 17181; queue errors at 17268/17271 |
| 12:59:59.328 | 4083 | input -1 at 19439; FEC failure at 19442; queue errors at 19496/19499/19502 |
| 13:00:43.373 | 4161 | input -1 at 34792; FEC failure at 34796 |

These device rows are from `run-124246/bandwidth-ab/logcat-live.txt`. The measured A/B device-minus-host clock offset is 0.518390 s (endpoint estimates 0.511160 and 0.525621 s). Input-error timestamps nominally precede the corresponding host counter log by 29-36 ms; this is within cross-device timing uncertainty, so it supports association, not strict ordering. Baseline alignment uses its separate 0.452093 s offset and +/-60 ms bound.

## Decoder gaps challenge a complete-fix claim

The 90-second baseline Perfetto contains 9 output gaps >50 ms. In 7 gap intervals, the nearby initial host request is stale-ID-led; those gaps begin roughly 86-232 ms before the first host mismatch (some following reset starts are just beyond the output interval). The guard runs after the interruption has already started. It can potentially reduce recovery amplification, but it cannot retrospectively remove the initial delivery stall.

- **12:46:59.521-12:47:01.510: 1,988.761 ms.** There are 3 counter-led reset starts within the nominal gap and 1 at 12:47:01.540, within the 60 ms alignment uncertainty of its end, alongside 18 same-device FEC log entries and 7 flushes. A prior stale-ID burst at 12:46:58.808 is within the 1-second burst grouping, so these records do not establish the 2-second event is independent of that prior stale reset. They do show that genuine client recovery is entangled with it.
- **12:47:30.554-12:47:30.933: 378.807 ms.** First nearby host reason is a counter change at 12:47:30.640, with 14 same-device FEC log entries and 7 flushes. This burst remains counter-first even with a 2-second grouping threshold. It is a strong residual-failure target beyond stale-packet rejection.
- Clock uncertainty and trace-health losses still apply. These are decoded-buffer activity gaps, not directly measured panel freezes. The A/B capture has no Perfetto decoder-gap measurements.

## Strongest test target

1. Replay the exact stale/back-forward sequence without changing the reset counter. Verify that rejecting stale same-epoch pose packets preserves the last accepted ID, avoids synthetic positive jumps, and does not trigger reset amplification. Handle sequence wrap and session changes explicitly.
2. Replay a counter-first incident from the 150 Mbit/s window, including a legitimate changed reset counter. It must still request recovery. A guard that drops this request is unsafe even if its reset count looks better.
3. Compare the unchanged-payload baseline with the guarded host in the same session/scene conditions, recording user freeze timestamps, decoded-output gap durations, recovery completion, and client error bursts. Treat lower reset counts alone as insufficient. The 378.807 ms counter-first gap and the 5 counter-first low-bandwidth incidents are the strongest tests of whether a proposal fixes more than the amplification mechanism.

## Grouping sensitivity

| Window | Quiet gap (s) | Bursts | Stale first | Forward first | Counter first |
|---|---:|---:|---:|---:|---:|
| baseline | 0.5 | 37 | 29 | 0 | 8 |
| baseline | 1 | 32 | 25 | 0 | 7 |
| baseline | 2 | 28 | 23 | 0 | 5 |
| before400 | 0.5 | 13 | 13 | 0 | 0 |
| before400 | 1 | 12 | 12 | 0 | 0 |
| before400 | 2 | 11 | 11 | 0 | 0 |
| during150 | 0.5 | 10 | 5 | 0 | 5 |
| during150 | 1 | 10 | 5 | 0 | 5 |
| during150 | 2 | 10 | 5 | 0 | 5 |
| restored400 | 0.5 | 6 | 5 | 0 | 1 |
| restored400 | 1 | 6 | 5 | 0 | 1 |
| restored400 | 2 | 6 | 5 | 0 | 1 |

## Per-burst classification audit (1-second rule)

Times are host CEST. Source line refers to the corresponding raw `rolling-driver_vrlink.txt`. `Counter too` marks additional reset-counter messages within that burst; it does not prove an independent root cause.

| Window | First trigger | Class | Initial ID difference | Host source line | Encoder resets | Counter too |
|---|---|---|---:|---:|---:|---|
| baseline | 12:44:18.554 | stale | -13 | 2013 | 1 | yes |
| baseline | 12:44:31.534 | stale | -11 | 2030 | 1 | no |
| baseline | 12:44:42.609 | stale | -13 | 2044 | 1 | no |
| baseline | 12:44:51.611 | counter | - | 2063 | 1 | yes |
| baseline | 12:44:55.632 | stale | -17 | 2091 | 1 | no |
| baseline | 12:45:01.554 | stale | -13 | 2111 | 1 | no |
| baseline | 12:45:10.514 | stale | -6 | 2134 | 1 | no |
| baseline | 12:45:12.516 | stale | -9 | 2152 | 3 | yes |
| baseline | 12:45:30.597 | stale | -11 | 2181 | 2 | no |
| baseline | 12:45:36.697 | stale | -26 | 2209 | 1 | no |
| baseline | 12:45:50.630 | stale | -14 | 2224 | 1 | no |
| baseline | 12:45:51.722 | stale | -22 | 2236 | 1 | no |
| baseline | 12:46:05.597 | counter | - | 2258 | 1 | yes |
| baseline | 12:46:11.596 | stale | -9 | 2280 | 1 | yes |
| baseline | 12:46:24.576 | stale | -13 | 2298 | 1 | no |
| baseline | 12:46:34.581 | stale | -6 | 2314 | 1 | no |
| baseline | 12:46:41.524 | counter | - | 2321 | 2 | yes |
| baseline | 12:46:58.808 | stale | -24 | 2362 | 3 | yes |
| baseline | 12:47:01.199 | counter | - | 2411 | 2 | yes |
| baseline | 12:47:19.679 | stale | -10 | 2432 | 1 | no |
| baseline | 12:47:23.689 | stale | -10 | 2442 | 1 | no |
| baseline | 12:47:26.754 | stale | -18 | 2452 | 3 | no |
| baseline | 12:47:30.640 | counter | - | 2487 | 1 | yes |
| baseline | 12:47:55.765 | stale | -16 | 2530 | 1 | no |
| baseline | 12:48:06.817 | stale | -19 | 2552 | 1 | no |
| baseline | 12:48:27.785 | stale | -13 | 2585 | 1 | no |
| baseline | 12:48:29.656 | stale | -13 | 2597 | 1 | no |
| baseline | 12:48:50.841 | stale | -17 | 2608 | 1 | yes |
| baseline | 12:48:53.574 | counter | - | 2626 | 2 | yes |
| baseline | 12:48:55.133 | counter | - | 2657 | 2 | yes |
| baseline | 12:49:05.723 | stale | -18 | 2672 | 1 | yes |
| baseline | 12:49:09.676 | stale | -13 | 2692 | 1 | no |
| before400 | 12:57:15.350 | stale | -19 | 3825 | 1 | no |
| before400 | 12:57:31.299 | stale | -15 | 3833 | 1 | no |
| before400 | 12:57:32.384 | stale | -24 | 3846 | 1 | no |
| before400 | 12:57:39.250 | stale | -12 | 3857 | 2 | no |
| before400 | 12:57:47.363 | stale | -20 | 3880 | 1 | no |
| before400 | 12:58:03.261 | stale | -9 | 3892 | 1 | no |
| before400 | 12:58:05.868 | stale | -8 | 3900 | 1 | no |
| before400 | 12:58:12.986 | stale | -20 | 3908 | 1 | no |
| before400 | 12:58:25.978 | stale | -17 | 3922 | 1 | no |
| before400 | 12:58:31.389 | stale | -18 | 3934 | 1 | no |
| before400 | 12:58:51.401 | stale | -19 | 3954 | 3 | yes |
| before400 | 12:59:07.344 | stale | -13 | 3991 | 2 | yes |
| during150 | 12:59:40.304 | counter | - | 4026 | 1 | yes |
| during150 | 12:59:48.343 | counter | - | 4048 | 1 | yes |
| during150 | 12:59:52.883 | counter | - | 4059 | 1 | yes |
| during150 | 12:59:59.328 | counter | - | 4083 | 1 | yes |
| during150 | 13:00:08.326 | stale | -6 | 4104 | 2 | no |
| during150 | 13:00:20.973 | stale | -13 | 4127 | 1 | no |
| during150 | 13:00:37.998 | stale | -13 | 4142 | 1 | no |
| during150 | 13:00:40.955 | stale | -10 | 4152 | 1 | no |
| during150 | 13:00:43.373 | counter | - | 4161 | 1 | yes |
| during150 | 13:00:48.921 | stale | -7 | 4178 | 1 | no |
| restored400 | 13:01:23.399 | counter | - | 4191 | 2 | yes |
| restored400 | 13:01:31.552 | stale | -19 | 4225 | 1 | no |
| restored400 | 13:01:40.583 | stale | -20 | 4238 | 1 | no |
| restored400 | 13:01:59.431 | stale | -6 | 4249 | 1 | no |
| restored400 | 13:02:08.619 | stale | -18 | 4259 | 1 | no |
| restored400 | 13:02:11.486 | stale | -10 | 4266 | 1 | no |

Machine-readable classifications and exact reason/reset rows: `build/live-hitch-20260915/proposal-event-attribution.json`. This is offline attribution of retained evidence, not a successful intervention or a predicted number of avoided freezes.
