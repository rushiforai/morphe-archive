# Android XR, transport regression, and host comparison — 2026-09-15

## Current conclusion

**Latest outcome:** `asyncSend=true` did **not** solve the freezes. The subsequent **UDP 8 MiB trial also failed and worsened the freezes** on verified 2.0.23/5002363: 46 decoded gaps/120 s, longest 3.065 s, 300 decoder flushes, with 0 app socket drops throughout the trace. [New live evidence and rollback guidance](UDP-RESULTS-2026-09-15.md) supersede the earlier UDP recommendation below. See the [tried-experiment ledger](TRIED-EXPERIMENTS.md). The paired-archive assessment below remains historical evidence, not proof of a working remedy.

The evidence supports a **new-client transport problem whose severity depends on the host**, rather than an Android XR compositor freeze or an established RTX 5090/14900K hardware fault.

The user confirms the same network, headset location, workload and settings for the 5600X/3080 Ti comparison. Historical logs independently show a large stability difference. The new investigation identifies a relevant version boundary: 2.0.20's legacy UDP transport requests 24 MiB of receive buffering, while the new transport in 2.0.22/2.0.23 requests 1 MiB. Receive-buffer overflow is directly measured on the affected headset. This is a concrete mechanism for different tolerance of packet bursts/receive delays, but it does not prove which host component generates the triggering pattern.

No patch or system configuration was changed in this phase. The receive-buffer candidate remains an experiment, not a confirmed cure.

### Supplied archives incorporated

The user subsequently supplied `SteamLink-working-PC-20260908-204811.zip`, `SteamLink-not-working-PC-20260908-210316.zip` and `Comparison Conclusion.txt` in the parent workspace. Both ZIPs were inspected directly, without extracting or executing their contents. The supplied conclusion was treated as prior analysis to verify, not as instructions to run its suggested tests.

**The conclusion remains consistent with the UDP receive-buffer experiment**, but the paired archives add a concrete host-configuration difference: **`driver_vrlink.asyncSend`**. This must be included in the final diagnosis rather than attributing the PC difference to GPU/CPU models alone.

| Setting evidence | Working PC | Failing PC |
|---|---|---|
| Saved `driver_vrlink.asyncSend` | Explicit `true` | No override |
| Packaged `driver_vrlink.asyncSend` default | `false` | `false` |
| Session startup settings | Explicit `true`, September 3 18:50:13 | No override, September 8 20:10:33 |
| Saved stream width / bandwidth | 1536 / 350 Mbps | 1536 / 350 Mbps |
| Recorded VRLink DLL SHA-256 | Same hash in both archives | Same hash in both archives |

The startup snapshots make this more than a collection-time discrepancy. Under ordinary default resolution the failing configuration selects false, but the archives do not log the driver's actual read or exclude later in-memory changes. Earlier `asyncSend=true` entries in the failing PC's startup log belong to earlier sessions, including September 7 12:42; they must not be assigned to the September 8 failure. This difference qualifies the user's equal-settings recollection without dismissing it: visible width/bitrate settings match, while a less-visible send setting differs.

Do not assume that asynchronous sending is inherently better or that its name proves a particular packet-pacing mechanism. It is now a specific host variable to trace/test independently. A send-path setting and receive-buffer capacity affect different parts of the same delivery chain and can interact. The 3080 Ti working with the newer transport does not disprove a buffer limit: an identical receiver can tolerate one packet arrival/processing pattern and overflow under another. Actual packet timing and the setting's runtime effect remain unmeasured.

The newly supplied failing log independently records **10 cause-000100 encoder resets in approximately 47 s after connection** on September 8, rather than the 17/20-per-120-second windows from other historical captures. The working ZIP reproduces the supplied conclusion's 2 resets in the first 120 s and 0 in 120 s after reconnect. These different windows must stay separate. Reset logs alone do not locate lost packets; today's Android socket counters supply that missing receiver-side evidence.

The supplied conclusion's failing-PC NVIDIA **616.64** refers to earlier captures. The newly supplied failing ZIP records 616.64 in its September 7 compositor session and **610.74 in its September 8 session**; both dates contain the newer-client reset pattern. All 5 identified sessions in that ZIP report 10-bit, so it supplies no independent 8-bit/10-bit comparison. This strengthens the requirement to retain session dates and resolved runtime versions, rather than assign one driver version to the entire archive.

The failing ZIP also contains 2.0.20 sessions. One has 6 accepted-video-packet timeout resets near the end of the connection, followed by inactivity, rather than the recurring stale-ID pattern of the 2.0.22 sessions. Thus “2.0.20 works” must not be translated into “every archived 2.0.20 log is reset-free.” The September 8 2.0.22 encoder reinitializations take only 0.179–0.933 ms; the reset storm is not evidence that each encoder reinitialization consumes the observed multi-second video gap.

Integrity: all **28** failing-archive checksum entries match. **30 of 31** working-archive entries match; only the user-completed `SESSION-NOTES.txt` differs, consistent with the supplied conclusion. Both archives record VRLink DLL hash `ee53103329fa5cb5deed70cf5237ee5c5e0582a663593881bc3266cb3b105b46`. The ZIPs contain hash records, not the DLL binaries, so this verifies matching recorded hashes, not a fresh hash of archived DLL bytes. Neither ZIP proves identical APK bytes, actual 3080 Ti encoded dimensions or synchronized headset/socket timing.

Archive SHA-256 and member inventories, checksum checks, exact configuration differences, parsed startup-setting timelines and the failing-session recount are retained under `build/live-hitch-20260915/supplied-pc-archives/`. `Comparison Conclusion.txt` is hashed and preserved unchanged.

## Android XR kept presenting while video stopped advancing

The existing Observe v2 trace contains process-level Android XR tracks that were not included in the initial decoder-focused analysis. During the **1,803.706 ms decoded-output gap**:

- The Steam Link XR client records **162 appFrame events and 162 Display events**.
- SurfaceFlinger records **162 frames**.
- Both recorded client-miss counters and the GPU-fence-miss counter remain **0**.

During the **370.719 ms gap**, there are 33 appFrame events, 34 Display events and 33 SurfaceFlinger frames, again with the inspected miss counters at 0. Across the first 120 s trace, SurfaceFlinger records 10,800 frames and no frame-start interval above 14 ms.

The broader check covers **all 19 decoded gaps above 50 ms across both traces**: XR/SurfaceFlinger frame activity continues through each, and the inspected client/GPU-fence miss samples remain 0. The follow-up trace's 1.927 s gap contains 173 Display events and 174 SurfaceFlinger frames.

Runtime logs do report failure to latch a `Left` layer buffer during both approximately 2 s gaps, but the first such messages appear about 0.56/0.81 s after decoded output stops. That is consistent with downstream lack of fresh layer content. Generic `main` latch warnings also recur during healthy periods, so their count cannot be used as a freeze count.

This places these interruptions in the delivery of fresh video content while the XR presentation pipeline continues. It does not measure physical panel scanout or rule out every runtime defect. Some exposed GPU/M2P counters have negative or uptime-like values; they must not be interpreted as literal GPU execution or motion-to-photon latency.

Fresh read-only dumps also cover SurfaceFlinger, display state, XR service discovery, OpenXR broker/SpaceFlinger package metadata and the perception lifecycle service. Head-tracking/perception clients remain registered. Several XR services return empty dumps; that is an observability limit, not proof of health. The decoded-output trace remains the direct timing evidence.

Retained startup logs identify the AndroidXR runtime, OpenXR API 1.1, and a successful session through the installed runtime manifest after broker lookup fallback. Normal GLES swapchains were created successfully; the existing 2x2 Android Surface trigger patch was also active. A missing optional swapchain extension and a face-tracker permission error occur at initialization, without evidence tying them to the later freeze onsets. These are recorded configuration details, not newly diagnosed causes.

## Android network route and current losses

The live app remains PID 16099. Its connected UDP socket uses port 10400 and the same inode as the previous capture. `ip route get` for the app UID selects **wlan0 directly to the PC on the local subnet**. Connectivity reports a validated Wi-Fi network with `NOT_VPN`; the P2P interface is down and USB is not the stream's network route.

The snapshot uses 6 GHz Wi-Fi at 6295 MHz, RSSI -16 dBm, with an active MLO link. Advertised PHY rates are not measured streaming throughput. Inspection of available network-tag logs from approximately 19:58:20 to 20:22:17 found no explicit disconnect, authentication rejection or roaming-start event; capability updates report no network reassignment. Missing radio/AP telemetry means brief retransmissions or bursts are not excluded.

Over the approximately **70.3 s** between the fresh socket snapshots, the same app socket increases from **123,392 to 133,984 drops: +10,592**. System UDP receive-buffer errors increase by exactly the same amount; the difference between total UDP input errors and buffer errors stays constant. This reproduces the app-socket overflow observation independently of the earlier fine trace. It is not a new precisely marked freeze capture.

### Thermal state is a possible contributor

Android reports thermal status **3**, defined as severe throttling in the [PowerManager API](https://developer.android.com/reference/android/os/PowerManager#THERMAL_STATUS_SEVERE). The fresh AP sensor reads 73.3 C. Reported CPU policy maxima are 1.6512 GHz, with a 1.5168 GHz minimum maximum-limit value during the preceding 5 minutes. An earlier snapshot had a 1.92 GHz maximum for policy 2.

Thermal status 3 was already present throughout the earlier capture, so it does not by itself identify the onset of individual freezes. Reduced headroom could still make synchronous receive/FEC processing less tolerant of bursts. There is no matched cooler-headset comparison here, and no thermal controls were changed.

## Version boundary: buffering and transport architecture

The comparison uses the actual decoded scene libraries for exact **2.0.20/5001712**, **2.0.22/5002322** and **2.0.23/5002363**. Older compatibility has not been altered.

| Path | Receive-buffer request | Relevant behavior |
|---|---:|---|
| 2.0.20 legacy `SVLDataLinkUDP` | 24 MiB | Receive and downstream packet handling already run synchronously. |
| 2.0.22/2.0.23 `SVLDataLinkTransferUDP` through `SVLDataLinkUber` | 1 MiB | Adds the newer transport/reconstruction path and serialized handling before the next receive. |
| Legacy path retained in newer libraries | 24 MiB | Its existence does not establish it is selected for the affected session. |

The newer root selects the Uber path through a launch-option flag. The working 3080 Ti archive also explicitly uses `SVLDataLinkTransferUDP`, so selecting that transport alone is insufficient to cause the severe symptoms.

Requests are not effective-capacity measurements. The current headset's ordinary receive-buffer request limit is 16 MiB; effective buffering for the historical 24 MiB request was not measured. Do not claim a 24-fold measured capacity reduction.

The decoder's **20 ms input wait, 1 ms output wait and 300 ms stuck watchdog** exist in both generations. Synchronous receive processing also predates the regression. Those mechanisms can amplify failures, but are not individually new explanations for the version boundary. The exact native audit records additional FEC/timestamp/recovery changes; none has yet been proven to initiate these freezes.

After normalizing relocated addresses, the 5001712→5002322 `AcquireEncodedDataBuffer`, `MediaThread` and `Flush` instruction sequences match. `Submit`/`BIsStuck` change timestamp representation and the watchdog's signed comparison, retaining the 300,000 us threshold. This is static evidence against a newly shortened decoder wait; it does not prove equivalence of the surrounding transport and FEC state machines.

## Host evidence and remaining alternatives

Historical source archives show 17 and 20 ongoing resets in affected RTX 5090 comparison windows, versus 0 ongoing resets with 2.0.20 after excluding its genuine startup allocation reset. The 3080 Ti archive has 2 resets in its first 120 s and 0 in 120 s after reconnect, with 11 over a later approximately 66-minute session. This supports the user's much smoother experience without calling the archive error-free.

Both versions used actual 1536x6144 encoded surfaces in the historical 5090 comparison. The other-PC archive proves the same reported target width, but not actual encoded surface dimensions. Driver versions and capture dates differ; retain those distinctions rather than treating every saved session as one controlled benchmark.

The current affected PC routes Steam Link through a **Realtek PCIe 5GbE adapter negotiated at 2.5 Gbit/s**. Its driver is 1126.26.50.2025; UDP segmentation/checksum offload, interrupt moderation and energy-saving options are enabled. These are concrete variables for a host-specific timing investigation, not diagnosed faulty settings. In particular, an enabled offload capability does not prove this application uses it. [Microsoft's USO documentation](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/udp-segmentation-offload-uso-) describes segmentation of large UDP sends; it does not establish that USO causes this stream's bursts.

A read-only Windows System-log check from 19:58:20 through 20:24:49 found no matching WHEA, display/NVIDIA, NIC/NDIS/TCPIP or processor-power warning/error/critical events. This supplies no evidence of a CPU hardware fault, GPU reset or NIC link failure in that window. It cannot exclude short driver scheduling stalls, packet batching, encoder pacing or application-level congestion. Historical affected runs without the wrapper still reset, so the current NVENC hook is not necessary for the original problem.

A separate 60 s host performance sample records GPU utilization of 54–73% and total CPU utilization of approximately 7–43%. **Logical CPU 0 reaches 26.21% DPC time and 23.13% interrupt time** in sampled intervals. DPCs are deferred driver work. These are meaningful host scheduling leads despite low overall CPU utilization, but sampled percentages do not identify a driver or measure a single uninterrupted stall. Encoder session mean latency is 1.269–1.912 ms; session averages do not rule out individual delayed frames. This sample was taken after the Android trace windows, so it cannot establish temporal causation for their marked gaps.

Both CPU 0 peaks occur in the same approximately 1 s sample beginning **20:26:20.906 CEST**. The following GPU sample reports 60% GPU utilization and 23% encoder utilization. A separate low encoder-FPS sample occurs around 20:26:10; it must not be presented as simultaneous with the DPC peak. The host console subscription had already ended, so this run cannot join those samples to exact reset events.

## Next discriminating work

1. Keep the separately selectable **1→8 MiB receive-buffer experiment** on exact 2.0.22/5002322 and 2.0.23/5002363, default-off and outside bundles. Test with the same Observe telemetry and socket counters. Fewer drops and fewer/shorter decoded-output gaps would support buffer tolerance as a material contributor. Persistent gaps with zero drops would point further toward recovery/assembly or upstream delivery.
2. Keep `asyncSend=true` recorded as **already tried and insufficient**, following the user's subsequent report. The archive difference remains historical evidence, not a reason to repeat the same proposed fix. Hold host settings constant during the UDP experiment; any future send-path comparison needs a distinct measurement question and must acknowledge the previous result.
3. Compare the same instrumented APK on the 3080 Ti PC, preserving negotiated dimensions, actual bitrate, codec and headset thermal state. The existing host collector can gather that PC's NIC/driver configuration without changing settings.
4. If needed, measure packet arrival/drain intervals and host encode/send timing. Present traces locate receiver overflow but do not distinguish host microbursts from AP delivery bursts or receiver processing delays. Host packet/ETW capture was unavailable without elevated access in the prior attempt; this run did not retry it through another privilege path.
5. Keep post-flush input ownership as a separate audit. Vendor input rejection and occasional queue errors prolong some outages after the initial delivery disturbance.

Do not combine NIC toggles, driver replacement, bitrate changes and APK changes into one comparison. No claim currently singles out the Intel CPU or NVIDIA GPU as the cause.

## Evidence and lifecycle

Current local root: `build/live-hitch-20260915/xr-host-comparison/`:

- `android-live/`: exact command receipts, all-buffer logcat, route/UID lookup, socket snapshots, Wi-Fi/connectivity, XR service/package dumps and thermal state.
- `android-saved/`: reproducible Android XR queries against the existing Observe traces.
- `native/`: exact-base transport/decoder comparison and disassembly evidence.
- `host/`: current host snapshots and recovered historical comparison with source provenance.
- `adb-cleanup.json`: 0 ADB processes and listeners at **18:23:46 UTC**.

These are private, ignored diagnostic artifacts. Existing traces were reused; no additional Perfetto trace, APK derivative, compiler output or bundle was created. Preserve the new snapshots and compact reports while the investigation remains unresolved. Earlier failed experiments remain recorded in [the telemetry history](TELEMETRY-2026-09-15.md); the previous receiver diagnosis and candidate offsets remain in [Observe results](OBSERVE-RESULTS-2026-09-15.md).
