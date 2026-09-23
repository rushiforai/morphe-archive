# UDP 8 MiB live trial: freezes worsened — 2026-09-15

## Decision

**This trial failed. The user reports worse and longer whole-view freezes, and the new trace measures more frequent, longer decoded-video interruptions. Do not recommend this UDP increase again as an untried fix.** Rebuild from the original APK without **UDP receive buffer (experimental)**, retaining the same matching bundle and **Observe + pipeline telemetry** for further diagnosis. Deselecting a patch does not undo an already-patched input APK. No rollback installation was performed during this capture.

No receive-buffer overflow was measured with the larger buffer in this session, but the failure persisted. That narrows the investigation: overflow cannot explain all current freezes. The comparison does not prove that larger buffering itself caused the worsening; packet age and a controlled rollback comparison remain unavailable. Do not infer sustained queue latency merely from queue size.

## Verified installation and capture

- Exact **2.0.23/5002363**, running PID 11090, package UID 10244. Installed scene size 2,292,008 bytes; instruction at `0x1757a8` is `08 10 a0 52` (8 MiB request). Normalizing this instruction reproduces the pinned entire `SVLDataLinkTransferUDP::Restart()` function hash.
- Installed APK SHA-256: `8ede600ca503f701de4bf6b9f6a2e738110a8a773c53a490fa8971d3dc1f4492`. Scene SHA-256: `cbf0478462361237cd07329b84cf32d9119453e8a6ff9f0540bb78ff246c2d90`.
- Helper is byte-for-byte **Observe + pipeline telemetry**, mode 2, staging disabled. SHA-256: `586adfc485af5caf73b47e493d352695920e324e586ae7041d668dfd66a9be0d`. The trace contains 278,650 GXR2 events.
- Host capture: **21:34:46.161–21:37:46.161 CEST**, 180 s; Perfetto configured 120 s, actual trace approximately 119.987 s. Fine socket collector: 1,200 samples spanning 172.948 s, stable app socket identity, overlapping the trace.
- User clarified that “blackout” means **the last image freezes**, not black pixels. No precise user onset marker was received; measured decoded-output gaps are not a count of perceived freezes.
- Passive capture: no app restart, installation, permission changes, live host settings edits, or forced garbage collection. APK verification pull occurred after Perfetto ended. PID remained unchanged.

## Compared with the earlier Observe baseline

| Measurement | Earlier Observe | UDP 8 MiB trial |
|---|---:|---:|
| Trace duration configured | 120 s | 120 s |
| Decoded `queueBuffer` gaps >50 ms | 12 | **46** |
| Longest decoded gap | 1,803.706 ms | **3,065.419 ms** |
| Sum of those gap intervals | 4.032 s | **27.698 s** |
| Gaps >1 s | 1 | **10** |
| Helper codec flush calls | 10 | **300** |
| Input dequeue failures | 4 | **236** |
| Queue API failures | 0 | **8**, all `-10000` |
| Native fault events | 2 | **30**: 22 watchdog, 8 submit-path |
| Host encoder resets /180 s | 29 | **133** |
| Host pending-reset skips /180 s | 44 | **298** |
| App socket drops /fine-counter span | 3,793 /63.168 s | **0 /172.948 s** |

Gap intervals describe missing fresh decoded delivery, not exact physical freeze duration. The runs used the same telemetry mode but were separate sessions with different process/socket identities and counter durations. The prior fine-counter run overlapped only the last approximately 18 s of its separate 60 s trace. Do not compare its raw drop count as though it covered the earlier 120 s baseline.

## What fails inside the longest interruption

Device time **21:36:34.749929–21:36:37.815347 CEST** (host-aligned approximately 21:36:34.531–21:36:37.596):

- **24 input dequeue timeouts and 29 codec flushes** occur inside this 3.065 s gap. At all 24 timeouts, the conservative same-reset-interval ledger has observed all 4 input indices reserved and not successfully submitted. Across the complete trace this occurs at **235/236** input failures. This is observed reservation state; it does not prove the exact internal owner after every missing event.
- Old frame IDs recur across recovery, including repeated reservations/timeouts for 19388–19393. Successful queue calls after resets include IDs 19393, 19391 and 19390. These show reprocessing/backtracking of frame work; they do not establish packet arrival order or justify a blanket frame-ID drop rule across reconnects/resets.
- The decoder keeps polling: **2,188 negative output results**, maximum interval between these polls 27.721 ms. This positively corroborates a video-output starvation/recovery interval rather than inferring it solely from absent trace events.
- 3 native watchdog faults occur approximately 300 ms after successful queue calls that produce no recovered video. NVENC reset configuration itself takes only **0.213–1.124 ms** across the host capture; those numbers do not measure complete stream recovery.
- In this gap's lead-in, FEC retries precede a client input failure at host-aligned **21:36:34.177856**. The host encoder reset at **34.489** follows approximately 311 ms later, beyond the 40 ms clock uncertainty. Recovery was already underway before the longest output gap began. Its nominal window contains 7 host encoder resets (6 definitely inside, 8 possibly inside allowing boundary uncertainty).

The repeated input-reservation and reset loop is now a stronger target than receive-buffer capacity. The first disturbance still needs attribution between host delivery, transport/FEC assembly, and stale work retained during recovery. The previously unsuccessful decoder staging patch and `asyncSend=true` remain unsuccessful; this result is not a reason to reapply either unchanged.

## UDP, Android XR, memory, and host boundaries

- All 1,199 valid adjacent app-socket intervals show **0 drops and 0 global IPv4 RcvbufErrors increments**. The largest sampled receive queue is 2,711,296 accounting bytes, after the 120 s trace but inside the counter capture. This supports enlarged buffering; `ss` netlink permission denial prevented effective `SO_RCVBUF` readback. Queue accounting is not packet age, payload bytes, or exact socket capacity.
- The entire trace is covered by 824 adjacent counter intervals. The longest gap has 23 inside snapshots, receive queue 0–1,140,224 bytes, and no drops. Queue snapshots remain 0 from device time **21:36:35.627524–37.813523**, approximately the final 2.186 s of the gap. This does not support persistent socket backlog through that interval; it cannot exclude packets arriving/draining between reads or stale work already retained above the socket.
- All 46 decoded gaps retain XR display activity and SurfaceFlinger cadence. The longest contains **276 XR display and 276 SurfaceFlinger frames**. Across gaps, maximum display interval is about 11.112 ms, SurfaceFlinger 11.547 ms. The headset compositor did not stop for seconds.
- Unlike the earlier baseline, there are 23 client-miss and 2 GPU-fence-miss samples overall. Only 3 positive client-miss samples overlap 2 decoded gaps; no GPU-fence-miss sample lies inside a gap. Brief XR misses exist, but do not explain these seconds-long video interruptions.
- App PSS **961,882→961,503 KiB**, graphics PSS **803,572→803,472 KiB**. No gross retained-memory growth explains this 3-minute run. This does not exclude a long-duration leak; local meminfo does not enumerate live heap allocation objects.
- Thermal status alternates 2/3 in this run; the prior baseline was already at 3. Current sampled CPU maximum is 1.920 GHz and GPU maximum 788 MHz, higher than prior caps. Worsening cannot simply be assigned to increased thermal restriction from these samples.
- Host samples overlap approximately 60 s: total CPU 2.91–13.47%, GPU 54–69%, CPU0 DPC peak 12.39%, interrupt peak 9.29%. Overall saturation is not observed. Coarse counters do not identify a faulty driver or exclude brief host scheduling/network delays.
- Host reset behavior changes toward reset-counter churn: **430 reset-counter changes, 718 unknown-message retransmits**, and only 1 frame-ID-mismatch message in this 180 s window. Do not treat the earlier negative-frame-ID reset example as the sole current trigger. Console subscription stopped delivering early; the full-window counts use the local `driver_vrlink.txt` snapshot and embedded source timestamps, excluding backlog.

## Remaining targeted work

Follow-up exploration produced a [concrete duplicate-reservation patch proposal and PC-side recovery findings](RECOVERY-PATCH-PROPOSAL-2026-09-15.md). That proposal supersedes the general exploration plan below; its production APK/runtime work remains pending.

Keep the UDP increase out of the next baseline. The next useful instrumentation is at **UDP receive → FEC group/frame lifecycle → reset generation**, recording packet/frame age, creation/discard reasons, and whether callbacks/work belong to the current reset generation. Correlate host send/retransmit events with the same identifiers. Existing decoder telemetry starts too late to distinguish delayed arrival from stale FEC work already retained locally. Any proposed recovery patch must preserve keyframe recovery, frame-ID wrap, reconnects, and input ownership; suppressing resets blindly is not established safe.

## Evidence, reproduction, and cleanup

Local private artifacts: `build/live-hitch-20260915/udp-8m-live/`. Retain the unique trace, raw counters/host log snapshot, installed verification receipt, standard/pipeline exports, episode timelines, clock alignment, host/XR reports, and reproducible analysis scripts while this cause remains unresolved. The installed APK pull is a disposable verification copy once its receipt is preserved. Original APKs and canonical patch resources are unchanged.

`analyze_udp_counters.py` is a new reusable offline parser with explicit UID/inode selection, stable-identity deltas, counter-reset/missing-sample handling, and self-tests. It validated both the 1,200-sample trial and 400-sample historical capture. Use the commands in the diagnostics README to reproduce trace/pipeline exports; `verify_installed.py` and `analyze_episodes.py` in this run preserve exact trial checks.

Trace health reports 216 out-of-order events, 25,922 systrace parse failures, and 4 sequence-packet-loss groups. The trace is not globally lossless. Positive API events, continuous negative output polling, independent host logs and socket counters corroborate the reported failure; avoid conclusions based only on missing events. Fresh bracketed clocks give device-minus-host **0.219144 s**, with a conservative **40 ms** cross-device ordering uncertainty.

All collectors exited. The remote trace was deleted only after its 512,764,729-byte local copy was verified. `adb-cleanup.json` confirms **0 ADB processes and 0 port-5037 listeners at 19:38:35 UTC**. Automatic approval review blocked local deletion of the APK verification copy and 2 reproducible XR extracts (46,676,357 bytes); they remain, with no alternate deletion attempted. See `WORKSPACE_CLEANUP.md` and the run's `cleanup/result.json` for the inventory, rejection reason and retained rollback artifact exceptions.
