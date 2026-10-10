# Measuring TikTok network and power use

This protocol measures the installed `com.zhiliaoapp.musically` build. A patched installation with patch behavior paused remains a modified, differently signed build. Label it as a paused patched baseline. An official-stock comparison requires an independently identified official build under matched conditions.

The [October 9 physical-device results](runtime-results-2026-10-09.md) apply this method to TikTok 47.1.4 with Hushfeed 0.68.0 paused. Keep those observations separate from the 0.70.0 source review below.

## Identity and reproducibility

Record the app version and version code, APK and signer digests, Android build, active Android user, full package UID, patch version, and pause/settings state. Record the observation interval, screen state, charging state, battery level, temperature, network transport, signal conditions and VPN status. Keep account state and content conditions consistent when comparing runs.

Resolve the package UID for the active Android user. Do not reuse an old UID, confuse an app ID with a full multiuser UID, or attribute every process by its name alone. Include the package's secondary processes. Treat isolated processes and shared system services as separate attribution questions.

Use one verified ADB transport for the physical device. USB and wireless entries may identify the same phone. Replace command placeholders before use.

```text
rtk proxy adb -s <TRANSPORT> shell getprop ro.build.fingerprint
rtk proxy adb -s <TRANSPORT> shell cmd package list packages -U com.zhiliaoapp.musically
rtk proxy adb -s <TRANSPORT> shell dumpsys package com.zhiliaoapp.musically
rtk proxy adb -s <TRANSPORT> shell perfetto --query
```

## Observation phases

Use a bounded diagnostic recording with consecutive foreground, background and screen-off phases. In the foreground phase, document the exact interaction pattern and content type. For background observation, leave the app through ordinary navigation while keeping the display on. Then turn the display off and leave the phone still. Record unexpected notifications, playback or other interruptions.

Mark each phase after verifying its starting state and end it before the next transition. Exclude transitions from phase totals. Do not force-stop the app, clear its data, force Doze, reset statistics or change battery restrictions to create an apparently quiet baseline.

If `android.log` is advertised and produces marker events, capture only a fresh exact `HushfeedAudit_<RUN_ID>` tag from the MAIN log buffer. Emit one marker at each boundary. Log timestamps mark those writes, not the exact display or activity transition. Require complete, ordered marker pairs. If unavailable, use separately bounded phase recordings and disclose boundary uncertainty. The official documentation limits this log source to userdebug builds, so production-device support must be established rather than assumed. [Android log tracing](https://perfetto.dev/docs/data-sources/android-log)

```text
rtk proxy adb -s <TRANSPORT> shell log -p i -t <RUN_TAG> phase.begin.background
rtk proxy adb -s <TRANSPORT> shell log -p i -t <RUN_TAG> phase.end.background
```

### Trace duration during suspend

Check the installed Perfetto version before choosing configuration fields. In the [upstream v51.2 schema](https://github.com/google/perfetto/blob/v51.2/protos/perfetto/config/trace_config.proto#L127-L141), `duration_ms` normally counts active system time and excludes suspend. A five-minute trace can last much longer than five minutes on the wall clock.

For a version that supports it, request a duration that includes suspend:

```text
duration_ms: 300000
prefer_suspend_clock_for_duration: true
```

This asks Linux or Android to use `CLOCK_BOOTTIME` instead of `CLOCK_MONOTONIC`. Inspect the recorded clock snapshots and actual counter endpoints afterward. The requested duration and a host timeout don't establish the captured interval, and waiting for child processes can delay a host timeout result.

If the phone changes screen, app or charging state during capture, retain the trace as a mixed-state diagnostic. Don't label the full interval as a clean phase. Gaps during suspend and an unchanged service discard counter don't establish complete sampling or zero data loss.

## Network activity and attribution

Use `android.network_packets` when available, together with package metadata. Filter packet events by the verified socket UID and phase timestamps. Preserve interface, direction and transport when aggregating. This attributes observed socket traffic to the UID. It does not identify the purpose or plaintext contents of encrypted traffic.

In the `android_network_packets` table, `packet_length` is the total bytes represented by an event, including an aggregate event. Sum `packet_length` for bytes and `packet_count` for packets. Do not multiply them. Report aggregates that cross a phase boundary separately instead of assigning their bytes proportionally without evidence. [Packet schema](https://github.com/google/perfetto/blob/v57.2/src/trace_processor/perfetto_sql/stdlib/android/network_packets.sql)

Cross-check packet totals against before/after UID network-accounting snapshots. Where the device supports it, request an accounting poll before each snapshot. Polling refreshes counters without resetting them. Match the network identity, UID, foreground/background set and tag dimensions. Do not add tagged subsets to UID totals or combine VPN and underlying-interface observations without checking for double counting. Historical buckets may update later than packet events. [Android traffic accounting](https://source.android.com/docs/core/data/ebpf-traffic-monitor)

```text
rtk proxy adb -s <TRANSPORT> shell dumpsys netstats --help
rtk proxy adb -s <TRANSPORT> shell dumpsys netstats --poll
rtk proxy adb -s <TRANSPORT> shell dumpsys netstats detail
```

An API attempt is a call or queued request recorded by instrumentation. It can be blocked, cached, cancelled or retried without an observed transfer. Conversely, bytes can come from native networking or shared services outside the observed API. Report attempts, observed packet bytes and UID-accounted bytes separately. Neither an attempted call nor an outbound packet proves that a server accepted an application request. Domain or IP matches alone do not establish advertising or telemetry behavior.

Interface counters, including `/proc/net/dev`, cannot establish per-app traffic. A device-wide packet capture also needs independent UID attribution. Prefer existing system accounting over adding a VPN or proxy that changes the network path and energy use.

### Destination metadata

When UID packet tracing cannot expose destinations, a separate app-filtered PCAPdroid capture can add packet evidence. Verify the selected package, capture mode, active VPN and output format before recording. Keep TLS decryption off. Installing a certificate or decrypting account traffic isn't needed to count transfers or inspect visible connection metadata. [PCAPdroid capture API](https://github.com/emanuele-f/PCAPdroid/blob/master/docs/app_api.md)

Use a short diagnostic interval for this capture. A local VPN changes the packet path and consumes power, so end capture and verify the VPN is gone before a quiet battery interval. An existing VPN is part of the environment to record, not something to replace without understanding its purpose. Root capture is an alternative only when the device already has authorized root access.

Visible DNS answers and TLS ClientHello server names can help associate a connection with a host. Name caching, encrypted DNS, QUIC and encrypted ClientHello can hide that association. Record unnamed connections too. An IP may serve several hostnames, and a hostname may serve several app features. Don't label every upload as tracking or every media host as an ad server.

Distinguish captured IP bytes, transport payload bytes and OS-accounted bytes. They count different layers. Retransmissions and both directions must have an explicit counting policy. State the packet parser's supported link types, truncation counts and unparsed protocol counts. A parser that returns successfully can still have incomplete coverage.

### Counter acceptance

For UID accounting, compare matching history buckets rather than subtracting two grand totals blindly. A reset or vanished history can be hidden by growth elsewhere. Reject an interval when an original bucket decreases or disappears, or when duplicate histories disagree. A reset followed by enough new traffic to exceed the old value can remain undetectable with two snapshots alone.

Use tag-zero totals from the UID section. Tagged statistics are subsets, so adding them would count some traffic twice. Preserve Android's `DEFAULT` and `FOREGROUND` sets, but don't treat those labels as proof of the visible screen state. Record the actual activity and display state separately.

## Background execution

Compare matched snapshots of scheduler state, alarms, services and battery statistics. Separate pending jobs and alarms from actual executions and delivered wakeups. A registered background component is evidence of capability or scheduling, not proof that it ran in the observation interval.

```text
rtk proxy adb -s <TRANSPORT> shell dumpsys jobscheduler
rtk proxy adb -s <TRANSPORT> shell dumpsys alarm
rtk proxy adb -s <TRANSPORT> shell dumpsys power
rtk proxy adb -s <TRANSPORT> shell dumpsys activity services com.zhiliaoapp.musically
rtk proxy adb -s <TRANSPORT> shell dumpsys batterystats --charged com.zhiliaoapp.musically
```

Report measured CPU time, job execution, wakeup-alarm delivery and partial-wakelock duration separately. `dumpsys power` is a snapshot of currently held locks and can miss brief acquisitions. Batterystats contains accumulated observations. Subtract only matching counters from the same accounting epoch. Many counters depend on the device genuinely running on battery. [Android diagnostics](https://developer.android.com/tools/dumpsys)

Use sampled process runtime counters for a low-overhead CPU estimate. State that short-lived processes and unsampled boundaries can be missed. If needed, use a separate short scheduler trace to sum CPU execution across all processes belonging to the UID. CPU seconds can exceed elapsed seconds when several cores run concurrently. Newer per-UID CPU or app-wakelock sources are optional and require device capability checks.

## Physical battery observation

Measure battery drain in a separate quiet interval with USB physically disconnected and no wired or wireless charger. Using wireless ADB while leaving USB attached does not satisfy this condition. Do not simulate disconnection with `dumpsys battery unplug`. USB data can prevent normal suspend even when charging is disabled. [Perfetto power guidance](https://perfetto.dev/docs/data-sources/battery-counters)

Use endpoint snapshots around a sufficiently long quiet interval, such as 30 to 60 minutes. Avoid continuous ADB polling, screenshots, log streaming or detailed scheduler tracing during it. Record the true charging state and interruptions. Compare repeated intervals with matched conditions before estimating an incremental app cost. Confirm continuity with accumulated screen-on, interactive and on-battery timers. Two screen-off snapshots cannot exclude a wake between them. Report a mixed interval when those timers show intervening screen activity, even if the collection runner sent no commands.

```text
rtk proxy adb -s <TRANSPORT> shell dumpsys battery
rtk proxy adb -s <TRANSPORT> shell dumpsys thermalservice
```

Where supported, calculate net discharged charge as `(starting charge in microampere-hours - ending charge in microampere-hours) / 1000`, yielding mAh. Preserve the actual sample timestamps and counter resolution. BatteryManager current is positive for charging and negative for discharge. Validate raw manufacturer counter units and signs independently. BatteryManager energy uses nWh. Perfetto battery energy uses micro-watt-hours. [BatteryManager units](https://developer.android.com/reference/android/os/BatteryManager), [Perfetto trace units](https://perfetto.dev/docs/reference/trace-packet-proto)

Charge, current and battery energy describe the whole phone. Hardware rail readings describe their documented subsystems. Per-app battery figures are attributed estimates unless their measurement source establishes otherwise. Do not present whole-phone drain as TikTok's measured energy or interpret charging current as app consumption. Missing, constant or coarse counters remain limitations. Battery percentage alone is insufficient for short intervals.

### Comparing a patch

One short observation can show that traffic or background work occurred. It cannot establish a typical daily cost or a patch's battery saving. Repeat baseline and changed conditions in alternating order, with matched playback, brightness, refresh rate, network signal and thermal state. Report each run and the spread, including runs that don't support the expected result.

Record the applied static patches and both saved and effective runtime settings. Restart consistently for settings that take effect at process startup. A lower-quality stream, a paused video or a feed with fewer loaded items changes the workload. Label those changes instead of attributing the difference solely to a privacy hook. Separate a functional result, such as a covered request being blocked, from its measured traffic or energy effect.

## Coverage and privacy

Preserve the capture configuration, measurement boundaries, analyzer version and raw result hashes. Inspect source startup, actual event coverage and trace-loss statistics before calculating rates. Check overwrite, discard and overrun counters even when their severity is informational. An empty table can mean unsupported collection, failed startup or no events. It is not sufficient evidence of zero activity. [Trace loss guidance](https://perfetto.dev/docs/concepts/buffers)

Keep raw captures private. They can contain device and network identifiers, package inventories, account-related text or other apps' activity. Capture only the data needed for the question, filter marker logging at collection, and publish only the target app's relevant aggregates and redacted evidence. Do not publish credentials, device identifiers, private content, complete packet payloads or unrelated application records.

## Interpreting results against Hushfeed source

This map describes Hushfeed 0.70.0 targeting TikTok 47.1.4, reviewed on 2026-10-09. Match the installed build and selected patches before using it to explain a measurement. Source capabilities are separate from observed behavior.

### Pause, saved settings, and baseline labels

Pause is resolved once per process at startup. A normal runtime Boolean hook then reads false, while its saved choice remains intact. The switch UI and settings backup read the saved choice. The verification probe's `get`/`dump` reads the effective value, so a paused dump cannot recover the original choices. Non-Boolean settings use their defined paused values. See [Pause initialization][pause], [effective versus saved values][setting], [Boolean paused value][boolean], [switch display][toggle], and [probe value reader][probe].

Diagnostics, settings access, app lock, and certain internal state and download preferences remain available during Pause. Static changes already written into the APK remain. Label such a phase **patched APK, runtime paused**, with a separate inventory of static patches. It is not an authentic factory APK baseline. A same-key, metadata-adjusted stock-code APK would also retain a different signing identity from the factory APK and would need separate artifact and rollback validation. See [shared exceptions][base], [TikTok exceptions][exceptions], and [static-patch documentation][readme].

Use **Back up settings** before changing choices and **Restore settings** afterward. A backup contains saved settings and Feature Gate Lab rules, but excludes Pause, safe mode, and the active timed logging capture. Record those states separately. Restore has its own Undo entry. The source UI also offers **Build details** and **Export diagnostic report**. These are source capabilities, not evidence that a particular installed build includes them. See [backup actions][backupui], [backup contents][backup], [excluded state][base], [build details][builddetails], and [diagnostic export][diagnostics].

### Literal endpoints and hosts in this source

These strings identify code paths or classification rules. They are not a list of destinations observed on a phone and do not by themselves establish what a captured connection contains.

| Literal | Source meaning | Interpretation limit |
|---|---|---|
| `/aweme/v1/aweme/stats/` | Single and batched video-view reports guarded by Stop recording watch history. Ghost mode separately guards story reports. [Watch-history patch][watchpatch], [Ghost mode][ghoststats] | Shared path. Its presence alone cannot distinguish a normal video view, story view, or batch. It is not proof of a generic analytics leak. |
| `app_alert_check` | Path fragment in the telemetry patch's activation-check explanation. The guard returns success. Device registration is a separate path left intact. [Sender guards][senders], [fingerprint explanation][activationfingerprint] | No full host or URL is specified there. Do not invent a log hostname from this fragment. |
| `ss_app_log`, `applog_forward` | AppLog fingerprint/protocol markers. The blocked priority uploader receives a success-shaped response with `message=success` and `magic_tag=ss_app_log`. [Fingerprints][telemetryfingerprint], [response][telemetryruntime] | Markers are not DNS names or HTTP paths. AppLog collector, queue and sender guards are more specific evidence than a guessed domain label. |
| `/aweme/v1/aweme/post/` | Comment describing a profile-post feed response handled by the feed filter. [Feed filter][profilefeed] | Content loading, not sufficient evidence of telemetry. |
| `/aweme/v1/user/block/` | TikTok block-user API described by the block-author service. [Block-author service][blockapi] | A user-directed account action. Do not invoke it to produce audit traffic. |
| `/aweme/v1/commit/dislike/item/` | Annotation path matched for the user's Not interested action. [Not-interested patch][dislike] | Intentional feedback traffic, not sufficient evidence of background tracking. |
| `inapp.tiktokv.com`, `inapp-va.tiktokv.com`, `oec-api.tiktokv.com`, `feedback.tiktokv.com`, `www.tiktok.com` | Browser privacy guard comments give examples of first-party Activity center, LIVE appeals, Shop orders, feedback, and account pages. [Allowlist context][browserhosts] | The comment explicitly discusses 47.0.3. These examples are not verified current 47.1.4 destinations or an analytics blocklist. |
| `tiktok.com`, `tiktokv.com`, `tiktokv.us`, `tiktokv.eu`, `pipopayment.com`, `pipopayment.us` | Domain suffix allowlist for TikTok and payment-processor pages that retain native WebView bridges. [Allowlist][browserhosts] | A trust rule for a WebView bridge, not a network allow/deny rule. A suffix match cannot classify purpose. |

The diagnostic request report labels hosts heuristically: the first label, with digits removed, becomes log (`log*` or containing `applog`), monitoring (`mon*`), API (`api*`), messages (`im*`), LIVE (`webcast*`), or other. It reduces the host to a domain using a simple suffix heuristic, not a public suffix database. Its source example `tiktokv.com api` is a bucket label, not an observed request. [Bucketing logic][buckets]

### Runtime settings and plausible effects to measure

All Boolean choices in this table default off in the examined source. Saved choices on the installed app remain unknown. These are mechanisms and hypotheses, not measured savings. Except for explicitly lifecycle-specific controls, the guards are not restricted to foreground or background execution. [Privacy keys][privacysettings]

| UI control / key | What the source changes | Phase and power interpretation |
|---|---|---|
| Stop analytics and tracking / `disable_analytics` | Guards AppLog events and flushes, AppsFlyer initialization/events/location, Firebase current-screen reporting, MonitorCrash events, and Npth initialization. AppLog queued-pack, forwarding, activation and priority senders have separate guards. Before extension context exists, the runtime guard permits the call. [Telemetry patch][telemetrypatch], [runtime guard][telemetryruntime] | Plausible reduction in collector work and covered sends in either app state. It does not cover every network client, remove device registration, or prove all telemetry stopped. Returning success to covered uploaders is intended to avoid queue retries. |
| Ghost mode / `ghost_mode`, Hide online status / `ghost_hide_online_status` | Guards selected viewing/read signals. Story stats are classified by story type/flag. Online-status blocking requires both switches. Lazy network calls are skipped through their send chain. [Ghost checks][ghoststats], [send-chain handling][ghostcalls] | Primarily changes interaction reporting. A local blocked-call counter establishes interception only, not the server's viewer list, account visibility, or battery benefit. [Diagnostic limitation][ghoststatus] |
| Stop recording watch history / `stop_watch_history` | Suppresses regular video-view request/queue creation and batched flushes, including a flush reached on feed pause. [Watch-history patch][watchpatch] | Can affect foreground viewing and the transition out of the feed. Also changes view counting/recommendation input. It does not delete reports already received by the server. |
| Block motion sensors / `block_motion_sensors` | Refuses covered new registrations for accelerometer, gyroscope, magnetic field, rotation vector, linear acceleration and gravity. Other types pass through. [Governor][sensors] | Plausible reduction in callbacks/work if the app requests those sensors. It does not unregister listeners already active. Restart consistently before comparing. The class name “ResourceBatteryGovernor” does not establish a measured battery improvement. |
| Stop TikTok's speed tests / `stop_benchmark_runs` | Disables `com.benchmark.collection.service.ByteBenchService`, which runs in `:bm`. Off/Pause resets it to the manifest default when the main activity opens. [Benchmark handling][benchmarks] | Relevant only when a benchmark would run. An existing process is not killed. Component state persists across app restarts and updates, so confirm restoration before a baseline or replacement APK that lacks this hook. Historical memory figures in comments are not measurements from this run. |
| Block location / `block_location` | Returns no last-known location and suppresses covered LocationManager update requests. [Location governor][location] | May avoid covered location callbacks. Does not hide IP/SIM-derived location or prove coverage of every location client. No quantified power claim. |
| Contact / installed-app / clipboard / advertising-ID blocks | Runtime device-data access guards. Separate settings from telemetry. [Privacy keys][privacysettings] | Less exposed data does not imply fewer connections or lower radio use. A report can still be sent with missing or altered fields. |
| Keep playing in the background / `background_play` | Allows the current video to continue when leaving the app or turning off the screen. Requires restart. [Playback UI][backgroundplay] | Direct workload confounder for background phases. Record it and use the same playback state/content across comparisons. |
| Don’t start first video / `pause_first_video`, Keep a paused video paused / `keep_paused_on_return`, Stop search results playing on their own / `stop_search_autoplay` | Controls when playback begins/resumes. The first-video choice applies to launcher starts, not every deep link. [Lifecycle keys][playbackstates], [search UI][searchplay] | Can reduce actual decoding/downloading by preventing playback. Compare equal actions and elapsed playback, not just equal screen time. |
| Video playback quality / `playback_quality`, On mobile data / `playback_quality_metered`, Play SDR / `play_sdr`, Prefer H.264 / `prefer_h264` | Selects available quality, SDR or codec alternatives. Selection falls back when alternatives are absent. [Quality UI][quality] | Quality can change data volume. Codec/HDR changes can change decoder/display work in either direction depending on offered streams and hardware. Source does not establish battery savings. |
| Keep the screen's refresh rate / `uncap_refresh_rate` | Stops TikTok lowering the requested refresh rate to the video's frame rate. [Refresh UI][refresh] | May preserve smoother scrolling while increasing display workload. Record the actual display mode. Do not count this as an energy-saving switch. |

### Static patches that survive Pause

These optional patches default unselected in the examined source. A runtime settings backup does not establish which were applied.

| Patch | Exact intervention | Limit for interpretation |
|---|---|---|
| Limit background traffic | Forces `PreloadStrategyConfig.isEnableBufferPreload()` false. Optional `skipPushSetup` returns from push initialization. That option defaults false. [Patch][preload] | Despite the title, the preload gate is not restricted to OS background state. It may alter foreground buffering and start latency too. Push suppression affects notifications, including messages. |
| Drop the animated image cache | Selects Fresco's keep-last-frame strategy and disables ahead-of-time animated frame preparation. [Patch][cache] | Applies to animated images such as stickers/GIFs, not all video caching or downloads. Memory and CPU effects need observation with animated content. |
| Skip update checks | Returns from two updater tasks, including the boot-triggered task. [Patch][updates] | Does not remove every potential update prompt or disable Play Store updates. |
| Stop on-device AI profiling | Returns no Pitaya plugin and prevents real/lite engine start paths. [Patch][ai] | Removes covered startup/processing opportunities, not proof of remote profiling prevention or a particular power saving. |
| Block P2P video relay | Removes `libavmdlp2pv2.so` and `libp2plivevdp.so` for arm64-v8a and armeabi-v7a using verified resource profiles. [Patch][p2p] | Prevents use of these bundled relay libraries. Does not prove relaying was enabled in the comparison run, or identify all upload traffic as relay traffic. |

Other static changes, including asset removal, screen-capture/login fixes, and signing/version metadata, must be listed from the actual artifact if present. Storage reduction is not equivalent to reduced runtime memory or battery use.

### Measurement boundaries

- **API REQUESTS** counts attempts in TikTok's `SsHttpCall.getResponseWithInterceptorChain`, outgoing body lengths when known, and unknown lengths. Video/image downloads and other SDK clients are excluded. It is not a success counter, transport-byte counter, or complete network inventory. Counters start with the process and still run in Pause when the optional patch is present. [Counter implementation][network]
- Detailed log-host paths require effective debug logging. Saved `morphe_debug=false` can still mean logging is active during a timed capture. The logging UI warns of slowdown. Match both persistent and timed logging across phases. Diagnostic controls survive Pause. [Debug effective value][base], [logging UI][diagnostics]
- UID netstats can support byte deltas for the intended TikTok UID. It cannot assign endpoints or intent. A separate packet capture can add visible DNS/SNI and IP evidence. Encrypted payloads, QUIC/ECH, name caching, VPN overhead and capture gaps limit interpretation. The Perfetto packet table used above does not expose IP addresses, DNS or SNI. Neither packet bytes nor request counts alone measure energy.
- Strongest comparisons record the installed build/static inventory, saved and effective settings, process restart, lifecycle state, playback/brightness/refresh conditions, capture coverage and elapsed duration. Report observed bytes, processes or power separately from the mechanism proposed to explain them. This source reference establishes no measured result or causal power claim.

[pause]: ../extensions/shared/library/src/main/java/app/morphe/extension/shared/settings/HushfeedPause.java#L32
[setting]: ../extensions/shared/library/src/main/java/app/morphe/extension/shared/settings/Setting.java#L455
[boolean]: ../extensions/shared/library/src/main/java/app/morphe/extension/shared/settings/BooleanSetting.java#L77
[toggle]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/TogglePreference.java#L57
[probe]: ../tools/verification-probe/src/app/hushfeed/verification/Probe.java#L3526
[base]: ../extensions/shared/library/src/main/java/app/morphe/extension/shared/settings/BaseSettings.java#L27
[exceptions]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/Settings.java#L954
[readme]: ../README.md#L166
[backupui]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/SettingsBackupPreference.java#L103
[backup]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/SettingsBackup.java#L129
[builddetails]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/BuildDetailsPreference.java#L28
[diagnostics]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/categories/DebugPreferenceCategory.java#L49
[watchpatch]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/privacy/WatchHistoryPatch.kt#L34
[ghoststats]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/ghostmode/GhostMode.java#L134
[ghoststatus]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/ghostmode/GhostMode.java#L79
[ghostcalls]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/interaction/ghostmode/GhostModeCallSites.kt#L43
[senders]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/telemetry/DisableTelemetryPatch.kt#L172
[telemetryfingerprint]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/telemetry/Fingerprints.kt#L213
[activationfingerprint]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/telemetry/Fingerprints.kt#L253
[telemetryruntime]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/telemetry/DisableTelemetryPatch.java#L15
[profilefeed]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/feedfilter/FeedItemsFilter.java#L356
[blockapi]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/blockauthor/BlockAuthorService.java#L30
[dislike]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/interaction/notinterested/NotInterestedPatch.kt#L48
[browserhosts]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/BrowserPrivacyGuard.java#L50
[buckets]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/NetworkRequests.java#L123
[privacysettings]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/Settings.java#L769
[telemetrypatch]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/telemetry/DisableTelemetryPatch.kt#L88
[sensors]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/ResourceBatteryGovernor.java#L26
[benchmarks]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/BenchmarkRuns.java#L17
[location]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/LocationGovernor.java#L18
[backgroundplay]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/categories/PlaybackPreferenceCategory.java#L195
[playbackstates]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/Settings.java#L507
[searchplay]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java#L158
[quality]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/categories/PlaybackPreferenceCategory.java#L253
[refresh]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/settings/preference/categories/ExtensionPreferenceCategory.java#L271
[preload]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/optimizer/OptimizerBytecodePatches.kt#L90
[cache]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/optimizer/OptimizerBytecodePatches.kt#L120
[updates]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/optimizer/OptimizerBytecodePatches.kt#L165
[ai]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/privacy/AiProfilingGovernorPatch.kt#L12
[p2p]: ../patches/src/main/kotlin/app/morphe/patches/tiktok/misc/optimizer/ResourceOptimizerPatches.kt#L18
[network]: ../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/privacy/NetworkRequests.java#L23
