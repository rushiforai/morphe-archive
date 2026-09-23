# Observe pipeline telemetry: receiver overflow — 2026-09-15

## Result

Follow-up: the [UDP 8 MiB live trial failed and worsened freezes](UDP-RESULTS-2026-09-15.md), despite 0 receive-buffer drops throughout its trace. This supersedes the proposed UDP experiment below. The findings below describe the preceding unmodified-buffer capture. UDP increase, decoder staging, and `asyncSend=true` are [recorded as unsuccessful](TRIED-EXPERIMENTS.md).

**Steam Link's UDP receive socket drops packets around interrupted decoded-frame delivery.** The finer capture directly attributes 3,793 receive-buffer drops to the app's active socket. A sample interval overlapping a 161.755 ms output gap contains 971 drops; the gap has no decoder-input timeout, codec flush, or queue error. Decoder staging alone cannot prevent this failure mode; the earlier Buffered v1 capture also contains receive-buffer overflows.

At the time of this capture, the proposed next experiment was increasing the active VR transport's requested receive buffer from **1 MiB to 8 MiB**, separately selectable and outside bundles. That experiment has now failed; it is no longer recommended. The initial cause of insufficient draining/bursty arrival and the precise post-flush ownership defect remain unresolved.

## Verified running configuration

- Exact **2.0.23/5002363**, user-installed **Observe + pipeline telemetry**, PID 16099 throughout. Buffering was disabled; staging allocations and copied bytes stayed 0.
- Installed APK SHA-256: `30d3a7ed355fdf68ac1cd0714af478227bf918b9dd8dc6b07b9159390c751608`.
- Configured helper SHA-256: `586adfc485af5caf73b47e493d352695920e324e586ae7041d668dfd66a9be0d`. Exact match to the v2 resource configured as mode 2. Activation logged 18 data hooks and `v2 installed ... mode=observe telemetry=1`.
- First capture: 180 s logs/system samples, 120 s Perfetto, **306,058 GXR2 events**. Follow-up: 75 s logs/system samples, 60 s Perfetto, **136,871 GXR2 events**.
- 400 finer socket samples span 63.168 s. Their nominal 100 ms sleep produces about 158 ms actual cadence. They overlap only the final approximately 18 s of the follow-up trace.

The user's “freeze” reply was recorded at host epoch `1789495273.3171027` (20:01:13.317 CEST). It is an approximate message-receipt marker. Both the 20:01:07 and 20:01:10 output gaps precede it; neither can be uniquely identified as the perceived freeze.

## What the measurements establish

Times in this table are device wall time, UTC+02. Gaps measure decoded-buffer delivery, not physical display presentation.

| Episode | Measured behavior | Interpretation |
|---|---|---|
| 20:00:18.376–20.180 | 1,803.706 ms output gap. FEC retries and audio underflow precede input timeout; 4 input indices held by incomplete frames. Post-flush vendor `Unsupported input buffer` messages despite successful queue API returns; 2 subsequent watchdog faults at about 300 ms. | Delivery/assembly failure consumes input reservations; recovery adds substantial delay. The decoder's 300 ms watchdog is downstream in this episode. |
| 20:01:07.407–07.778 | 370.719 ms output gap. All 4 input indices held by unsubmitted frames for 122–156 ms at the first timeout. | Direct evidence of stock input starvation during incomplete frame assembly. |
| 20:08:14.840–15.206 | 365.602 ms gap. Socket drops increase by 254, then 1,102 in adjacent sample intervals; input timeout and repeated recovery also occur. | Overflow and decoder recovery overlap. The first drop interval contains the timeout, so their initial order is unresolved. |
| 20:08:15.888–16.050 | 161.755 ms gap; 971 socket drops in the overlapping sample interval; no input timeout, flush, or queue error in the gap. | Overflow also occurs independently of the 20 ms decoder-input timeout. |

All 400 finer samples retain the same app UID and socket inode. Every adjacent app-socket drop increment matches the system UDP `RcvbufErrors` increment, totaling **3,793**. This directly identifies the receiving app socket. It does not prove Wi-Fi radio loss. Maximum sampled receive-queue accounting was 1,778,176 bytes; it is neither payload size nor a direct socket-capacity measurement.

The 971-drop interval is **20:08:15.911538–16.064509**, extending approximately 15 ms beyond the output gap. It cannot place all 971 drops inside that gap. Throughout the entire interval, 5 input acquisitions succeed, 3 queues return 0, and no codec flush/stop or recorded fault occurs; maximum input-dequeue duration is 5.045 ms. Thus the absence of the 20 ms input-timeout mechanism also holds across the full drop interval.

The first capture's 10 s system samples show **20,159** receive-buffer errors over 169 s. The earlier failed Buffered v1 capture shows **5,435** over 169 s, including intervals containing its 361 ms and 365 ms gaps. Those earlier counters are system-wide and less precisely attributable. These uncontrolled runs are not an A/B performance comparison.

The RX/FEC thread has no long continuous scheduling delay in the overflow-only episode: maximum runnable wait **2.188 ms**, maximum sleeping interval **3.856 ms**. Repeated short waits and packet bursts can still overflow a queue. Current telemetry does not expose every receive syscall or lock wait, so it cannot distinguish those mechanisms fully.

### Recovery is another contributor

The first 120 s trace has 10,440 queue API returns, all successful. Hardware subsequently rejects some post-flush inputs; API acceptance is not successful decoding. The follow-up 60 s trace additionally contains **2 queue errors -10000**. One sequence appears to reuse input indices after a flush without a new acquisition for each queued frame. This warrants a separate stock ownership/reset audit; it does not yet prove the exact invalid-index condition.

Host console reconstruction identifies **29 encoder resets** during the first 180 s device window: 15 led by stale pose IDs and 14 by counter changes. All have cause mask `000100`; encoder reinitialization itself takes at most **1.107 ms**, while some requests wait 271–300 ms before execution. Device-minus-host clock offset is bracketed at 0.313059–0.390212 s, with additional console timing uncertainty. No host restart/crash occurred during this run.

There is no new evidence establishing a memory leak as the cause. Neither finite captures nor the transport finding excludes all memory defects. The previously diagnosed `vrmonitor.exe` crash remains a separate incident; see the telemetry history.

## Exact next patch candidate

`SVLDataLinkTransferUDP::Restart()` requests **1 MiB SO_RCVBUF** for the VR UDP socket bound starting at port 10400, before starting its receive thread. Its synchronous path is `recvfrom → OnReceive → AcceptFromTransferer → FEC → decoder`; downstream work and contention can delay the next receive. A separate legacy socket requests 24 MiB and is not this mutation target.

| Exact base | File size | Instruction file offset = VA | Original → candidate bytes |
|---|---:|---:|---|
| 2.0.22 / 5002322 | 2,283,400 | `0x1745a8` | `08 02 a0 52` → `08 10 a0 52` |
| 2.0.23 / 5002363 | 2,292,008 | `0x1757a8` | `08 02 a0 52` → `08 10 a0 52` |

These encode `mov w8,#0x100000` → `mov w8,#0x800000`. Pristine `libvrlink_scene.so` hashes:

- 5002322: `e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f`.
- 5002363: `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`.

The headset reports `rmem_max=16777216` (16 MiB). Linux doubles ordinary SO_RCVBUF requests for accounting; see [socket(7)](https://www.man7.org/linux/man-pages/man7/socket.7.html). Effective capacity was **not read back**: `ss` netlink access was denied, and the native path only logs setsockopt failure. No kernel settings were changed.

A future implementation must retain exact build/size/code guards, permit supported bundle mutations, validate only the intended instruction changes, and test idempotence and both bundle orders on pristine APKs. Keep it default-off and separate from bundles. Live acceptance must show the requested capacity was accepted, fewer app-socket drops and fewer/shorter output gaps under comparable conditions, without increased sustained latency. Larger buffering cannot compensate indefinitely for a stalled consumer.

## Evidence, tools, and cleanup

Local evidence root: `build/live-hitch-20260915/observe-telemetry-v2/` (ignored; raw logs contain private session details):

- `installed-validation.json`, `capture/`, `trace-analysis/REPORT.md`: installed mode, first trace, input reservations, UDP sample deltas.
- `socket-counters/{counters.txt,result.json}`, `socket-analysis/REPORT.md`: finer socket attribution, timing exports and reproducible parsing/scheduling queries.
- `native-fault-map/`, `socket-native-map/`: fault caller mapping and exact native socket guards/callers.
- `host/{REPORT.md,events.csv,transactions.json,clock-alignment.json}`: merged console subscriptions and clock bounds.
- `adb-cleanup.json`: **0 ADB processes and 0 listening ADB sockets**, verified 2026-09-15 18:09:49 UTC.

The reusable [UDP collector](capture_udp_counters.py) reads counters only; the owning session must stop ADB after all collectors finish. Run its `--help` for arguments. Start it alongside a bounded `capture_live.py` trace with `--keep-adb`, using a new output directory. Compare deltas only while socket identity remains stable. [Host collector](capture_host_console.ps1) subscribes to the local console without sending configuration commands.

Trace health reports 31,369 systrace parse failures and 7 sequence-loss groups in the first trace, and 15,418 parse failures and 1 sequence-loss group in the follow-up. These are not globally lossless captures; the origin of every failure is not established. Ftrace CPU overruns and ring overwrite counters are 0. Positive API events, continued negative output polls, vendor logs and matching socket-counter deltas corroborate the reported episodes. Instrumentation overhead has not been measured against an otherwise identical uninstrumented run.

No APK/native patch, bundle, settings, installation, or restart was changed in this capture phase. Collectors finished; remote trace files were removed. Current raw evidence and the installed verification APK remain intentionally retained while diagnosis is unresolved; no new compiler outputs were created. Earlier cleanup and the deferred review-test EXE/PDB are recorded in [WORKSPACE_CLEANUP.md](../../WORKSPACE_CLEANUP.md).
