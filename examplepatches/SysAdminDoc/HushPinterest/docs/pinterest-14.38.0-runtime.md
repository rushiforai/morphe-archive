# Pinterest 14.38.0 runtime observations

All four emulator measurement phases are complete. Network traffic, background activity and software resource use were measured. Physical battery drain was not measured.

Measured on October 9, 2026. This chapter adds observed network and operating-system activity to the [factory audit](pinterest-14.38.0-audit.md), [advertising analysis](pinterest-14.38.0-ads.md) and [privacy analysis](pinterest-14.38.0-privacy.md).

The [public runtime data](pinterest-14.38.0-runtime-data.json) contains the exact phase values, original APK hash and source-summary hashes for later comparisons.

## What was measured

The app was the original, signed Pinterest 14.38.0 APK, version code 14388010, with no Hush patches applied. The account was already signed in. App data and cached content were retained. A cold launch means the process was stopped and launched again. It does not mean a new account, cleared cache or first install.

The network run used an Android 13/API 33 emulator with 1,536 MB of guest memory and two virtual CPU cores. The guest was instrumented through its existing root-capable development image so packet capture could see the app's active network interface. Pinterest itself was not repacked. No TLS interception certificate was installed, and application traffic was not decrypted.

The emulator ran headlessly with host audio disabled. Available host memory was constrained. Capture overhead and emulation affect CPU behavior, so this run should not be treated as a physical-phone speed or battery benchmark.

Three measurements were collected independently.

| Measurement | What it establishes | Main limits |
| --- | --- | --- |
| Guest packet capture, correlated with socket UID snapshots | Traffic on observed socket tuples and visible TLS service names | Polling misses short sockets. TLS and QUIC payloads remain encrypted. |
| Android BPF per-UID traffic counters | Cumulative received and transmitted bytes charged to the primary app UID | Counter snapshots have their own time interval. Isolated processes can use another UID. |
| Process CPU counters and Android activity statistics | CPU time, media timers, jobs and recorded wake activity | Software activity is not a physical battery drain measurement. |

Raw captures, socket addresses and account material stay local. Public results contain aggregates and sanitized service names.

## Why the earlier capture was inconclusive

The emulator console's Ethernet capture produced only a few background protocol packets. The active guest network used `wlan0`, so that capture did not provide useful app traffic. Its empty application results must not be treated as evidence that Pinterest did not connect or transmit.

The replacement capture ran inside the guest with `tcpdump -i any`. Its Linux cooked v2 framing included traffic on the active interface. A short validation capture contained 1,599 packets and 1,216,652 captured bytes, including visible TLS ClientHellos. That established that the replacement collection path could see real application traffic.

The preliminary validation used only one socket snapshot with a broad correlation window. The controlled results below use device timestamps and a 3-second correlation window. Preliminary hostname observations are not mixed into the controlled service-host table.

The final capture used tcpdump 4.99.1 with libpcap 1.9.1. It contained 10,122 packets and 8,517,141 captured link bytes over a 1,628.485-second packet span. The capture tool reported 10,132 packets received by its filter and zero kernel drops. The offline reader found no truncated packet records. The filter count and stored-packet count are separate counters. Zero reported kernel drops does not remove the socket-attribution or encrypted-transport limits below.

Of the captured packets, 10,101 were on `wlan0`, seven on `eth0`, four on `dummy0` and ten on loopback. An offline comparison found no identical IP frames crossing interfaces within 10 milliseconds. That check reduces one duplication concern for this run but does not prove that every possible duplicate would be detected.

## Collection procedure

1. Confirm the original APK and package identity. Preserve the signed-in account and saved emulator baseline.
2. Record the emulator's device time, uptime and initial state. Use device time for packet phases and socket observations.
3. Start one guest capture across interfaces. Retain complete packet headers so the offline parser can handle TCP segmentation.
4. Record the primary app UID's cumulative `mAppUidStatsMap` counters, process CPU ticks, app battery statistics, jobs, alarms, services and power state at phase boundaries.
5. Stop the Pinterest process without clearing its data. Launch it and collect a cold-launch phase with socket polling about once per second.
6. Browse the home feed for about 3 minutes, performing six swipes. Poll sockets about every 2 seconds. Avoid ad destinations, people suggestions and account-changing actions.
7. Press Home and leave the app in the background with the screen on for about 10 minutes. Poll sockets about every 10 seconds.
8. Turn the screen off for a further 10 minutes. Take boundary snapshots but no socket polls during the interval, reducing measurement interference.
9. Stop the capture cleanly. Record capture-drop statistics, final app counters and final device state. Restore temporary measurement settings.
10. Analyze the finalized capture offline. Keep packet windows and counter windows separate, retain unknown ownership, and compare the results with a later run of the same app version and workload.

Android uses eBPF to support network traffic accounting. The counter analysis here reads the cumulative per-UID map rather than trying to subtract coarse historical time buckets. See the [Android eBPF traffic monitoring documentation](https://source.android.com/docs/core/data/ebpf-traffic-monitor).

### Packet ownership rules

A packet is correlated to Pinterest only when its protocol and both socket endpoints exactly match a socket observed under the primary app UID within 3 seconds before or after that packet. This is a temporal correlation. It is not kernel tagging of every captured packet.

Unknown packets remain unknown. A Pinterest-looking domain, a shared CDN address or the fact that Pinterest is on screen cannot establish ownership. Conflicting UID observations are kept in an ambiguous bucket.

The 10-second background polling interval deliberately leaves gaps larger than the 3-second correlation window. Screen-off packets generally lack interior socket observations. Those periods still have independent per-UID counter measurements, but their host attribution is necessarily less complete.

The visible TLS table is stricter than a DNS inventory. It contains only ClientHellos whose exact socket tuples match the primary app UID. DNS requests often belong to the system resolver, so a lookup alone is not assigned to Pinterest. Hostnames belonging to unrelated apps are omitted.

### Isolated process coverage

Android can assign a separate UID to an isolated process. The foreground-start and background-start battery snapshots contain an isolated UID mapping to Pinterest. That proves the mapping at those observations. It does not establish ownership for that UID throughout the whole run.

The primary measurements therefore do not automatically add isolated-UID traffic. This is a coverage limit, not evidence that the isolated process did no work. A future capture can extend attribution with a timestamped process and isolated-UID lifecycle record.

### Exact time intervals

Packet totals are bounded by explicit phase start and end times. Counter snapshots are sequential collections that take several seconds. Their differences include collection overhead around the phase.

| Completed phase | Exact packet window | Counter snapshot interval | User activity |
| --- | ---: | ---: | --- |
| Cold launch | 32.00 seconds | 41.75 seconds | Launch and settle on the signed-in home feed |
| Foreground browsing | 181.00 seconds | 186.09 seconds | Six home-feed swipes |
| Background, screen on | 601.00 seconds | 605.36 seconds | Home pressed, app left running |
| Background, screen off | 601.00 seconds | 606.08 seconds | Screen off, no interior socket polling |

Do not divide a counter delta by the packet duration or compare the totals as though they covered identical intervals.

## Observed network activity

### Primary UID counters

The following byte deltas come from Android's cumulative per-UID BPF map. They are separate from the packet-derived totals that follow.

| Phase | Received bytes | Transmitted bytes | Received packets | Transmitted packets |
| --- | ---: | ---: | ---: | ---: |
| Cold launch | 2,448,174 | 147,923 | 2,184 | 943 |
| Foreground browsing | 4,205,367 | 83,982 | 3,507 | 621 |
| Background, screen on | 3,720 | 3,552 | 66 | 61 |
| Background, screen off | 1,229 | 1,490 | 23 | 23 |

These are observations from one account and feed state. Content, cache warmth, experiments and ad delivery can change the results. They are a baseline to compare against, not a universal Pinterest data-use rate.

### Packet capture with conservative UID correlation

| Phase | Primary-UID-correlated packets | Primary-UID-correlated IP bytes | Unknown packets | Unknown IP bytes |
| --- | ---: | ---: | ---: | ---: |
| Cold launch | 3,033 | 2,574,185 | 127 | 29,251 |
| Foreground browsing | 4,110 | 4,287,338 | 16 | 1,780 |
| Background, screen on | 65 | 3,632 | 135 | 25,876 |
| Background, screen off | 0 | 0 | 152 | 26,565 |

The unknown columns contain traffic from the whole guest that could not be assigned under the stated rule. They must not be added to the Pinterest totals. Other-UID-correlated traffic is also excluded from those totals.

The screen-off row does not mean Pinterest had no network activity. No captured packet in that interval had a matching socket observation close enough to satisfy the rule. The independent primary-UID counters still increased by 1,229 received and 1,490 transmitted bytes. The difference is a useful demonstration of why missing packet attribution cannot be reported as zero app traffic.

IP bytes include packet headers, acknowledgments and retransmissions at the capture point. Capturing across interfaces can duplicate some traffic. These totals are not unique downloaded content bytes, physical radio bytes or a cellular billing estimate.

UDP traffic on port 443 was substantial. It accounted for 1,725,445 of the primary-correlated IP bytes during cold launch and 4,244,181 during foreground browsing. That is about 67% and 99% respectively. During screen-on background activity, 2,737 of the 3,632 primary-correlated bytes used UDP port 443, about 75%. No meaningful primary-correlated UDP share can be computed for the screen-off interval because its attributed denominator is zero. The parser counts these packets but does not decode QUIC. It cannot name their destinations from an absent TCP ClientHello or determine what was sent inside them.

### Visible service names from the controlled capture

Every entry below is a visible TLS ClientHello correlated to the primary app UID during the cold-launch phase. Counts refer to observed ClientHellos, not API calls, ad impressions or uploaded events.

| Sanitized service name | ClientHellos | What the observation supports |
| --- | ---: | --- |
| `api.pinterest.com` | 2 | Pinterest initiated TLS connections naming its API service. The encrypted request paths and fields are unknown. |
| `trk.pinterest.com` | 2 | Pinterest initiated TLS connections naming this service. Static tracking code makes it a useful comparison target, but SNI alone does not identify the encrypted payload. |
| `i.pinimg.com` | 1 | A TLS connection named this Pinterest media host. The capture did not classify individual content items. |
| `s.pinimg.com` | 1 | A TLS connection named this Pinterest asset host. |
| `v1.pinimg.com` | 1 | A TLS connection named this Pinterest media host. This is not proof that all video bytes used this connection. |
| `[sdk-prefix].inapps.appsflyersdk.com` | 1 | An AppsFlyer service connection was observed. The configurable SDK hostname prefix is withheld. Event contents were not decrypted. |
| `[sdk-prefix].launches.appsflyersdk.com` | 1 | An AppsFlyer launch-service connection was observed. The name does not reveal which launch fields were sent. |
| `www.gstatic.com` | 1 | A TLS connection named this Google static-content service. The requested resource and purpose remain unknown. |

The controlled capture also contains one primary-UID-correlated ClientHello grouped to `recaptcha.net`. Its exact service label was not included in the parser's provider allowlist and is withheld. No new target-correlated TLS ClientHello was observed in the foreground-browse or either background phase. Existing connections, UDP traffic and limited socket coverage prevent interpreting that as an absence of requests.

There are 11 target-correlated ClientHellos in the cold-launch window. The eight table rows account for ten. The withheld `recaptcha.net` service accounts for the remaining one.

## CPU, media and scheduled work

These values come from the completed counter snapshot intervals, not the shorter packet windows.

| Signal | Cold-launch counter interval | Foreground-browse counter interval | Background, screen on | Background, screen off |
| --- | ---: | ---: | ---: | ---: |
| Main-process CPU time | 6.00 seconds | 20.21 seconds | 0.32 seconds | 0.52 seconds |
| App battery-statistics CPU time | 6.027 seconds | 20.211 seconds | 0.312 seconds | 0.311 seconds |
| Recorded video activity | 5.410 seconds | 94.722 seconds | 0 added seconds | 0 added seconds |
| Recorded audio activity | 0.234 seconds | 29.726 seconds | 0 added seconds | 0 added seconds |
| WorkManager job timer increase | 1.990 seconds across 2 recorded executions | 0 seconds, 0 added executions | 0 seconds, 0 added executions | 0.064 seconds across 1 boundary-transition execution |

The screen-off job delta belongs to the sequential counter interval. JobScheduler history in the starting snapshot already showed that job starting and stopping before the explicit 601-second packet phase. It ran during the transition and collection boundary, so it is not evidence of a job executing during the quiet screen-off phase. The ending battery snapshot also recorded 25 milliseconds of blamed partial wake time and 74 milliseconds of actual partial wake time for that job. Those entries have the same timing limitation.

The main-process measure subtracts user and kernel CPU ticks from `/proc` with the device's recorded clock-tick rate. Processes that start and exit between boundaries cannot be fully represented by that subtraction. Isolated processes without matching process dumps are excluded from this measure.

The app battery-statistics CPU values use Android's app-associated accounting and can include CPU attributed from mapped isolated processes. The primary-UID-only rule in this report applies to the BPF network counters and packet correlation. It does not mean that the separate framework CPU figure is a direct primary-UID-only process counter.

The media timers show Android-recorded video and audio activity. They do not establish that every interval was audible or visible to the user. The emulator had host audio disabled, and the activity counters do not distinguish sponsored from organic media.

Two app WorkManager jobs were registered at the end of foreground browsing. Registered work is not the same as executing work. The completed foreground interval added no WorkManager execution time in the collected app statistics.

At the background-start snapshot, those jobs required connectivity and a minimum delay. Their remaining delays were about 22 hours 49 minutes and 8 hours 2 minutes. Neither required charging, a non-low battery or device-idle state, and neither had a deadline. Both were not ready. The app's active and pending job queues were empty at that observation.

The earlier startup job history recorded two runs lasting 1.897 seconds and 0.092 seconds. That agrees closely with the 1.990-second combined WorkManager timer increase, allowing for reporting precision. The service name alone does not identify either worker's business purpose. These observations cannot establish that either job uploads analytics, fetches ads or performs another specific task.

A bound WebView sandbox service record showed no foreground-service starts. No Pinterest-named alarm entry was found in the collected alarm snapshot. Those are narrow observations. They do not prove that the app has no background work or can never arrange an alarm through another system component.

### Recorded worker scheduling metadata

A read-only query of the app's WorkManager database selected only worker class and scheduling columns. It did not read worker input or output data. The selected columns were `worker_class_name`, `state`, `interval_duration`, `initial_delay`, `run_attempt_count`, `required_network_type`, `requires_charging`, `requires_device_idle`, `requires_battery_not_low` and `requires_storage_not_low`.

| Worker class | Rows | Raw state | Interval, ms | Initial delay, ms | Run attempts | Raw network type |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| `com.pinterest.experiment.ExperimentsRefreshWorker` | 1 | 0 | 86,400,000 | 33,183,000 | 0 | 1 |
| `com.pinterest.engage.GoogleEngageWorker` | 1 | 0 | 86,400,000 | 0 | 0 | 1 |
| `com.pinterest.security.PlayIntegrityVerificationWorker` | 1 | 2 | 0 | 300,000 | 1 | 1 |
| `com.pinterest.engage.GoogleEngageWorker` | 1 | 2 | 0 | 0 | 1 | 1 |
| `com.pinterest.pushnotification.PushTokenRegistrationRxWorker` | 1 | 2 | 0 | 0 | 1 | 1 |
| `com.pinterest.typeahead.ClientCacheWorker` | 1 | 2 | 0 | 8,000 | 1 | 1 |
| `com.pinterest.hairball.receiver.LogDeviceScreenStateWorker` | 3 | 2 | 0 | 0 | 1 per row | 0 |

All returned rows had zero in the four charging, idle, battery-not-low and storage-not-low columns. The two nonzero interval values represent 24 hours in the recorded duration field. Database initial delay is a configured duration. It is not the same as the remaining time shown by JobScheduler at a later snapshot.

The numeric state and network-type values are preserved as observed. Current upstream AndroidX maps state 0 to `ENQUEUED`, state 2 to `SUCCEEDED`, network type 0 to `NOT_REQUIRED` and type 1 to `CONNECTED`. That provides an interpretation, but the converter was not pinned to this APK's bundled WorkManager version. See the [AndroidX WorkTypeConverters source](https://raw.githubusercontent.com/androidx/androidx/androidx-main/work/work-runtime/src/main/java/androidx/work/impl/model/WorkTypeConverters.kt).

Class names provide useful trace targets for patch maintenance, but they do not establish encrypted payload contents or prove which worker produced a particular packet. The three screen-state rows and the 64-millisecond transition job increase are not joined by a verified work identifier here.

### Memory boundary observations

The main Pinterest process retained the same process identity and start tick value through foreground browsing and the screen-on background interval. These are snapshots of its memory accounting at boundaries.

| Boundary | Total PSS, KB | Total RSS, KB | Java heap PSS, KB | Native heap PSS, KB | Code PSS, KB |
| --- | ---: | ---: | ---: | ---: | ---: |
| Foreground start | 232,488 | 326,132 | 39,996 | 37,772 | 113,288 |
| Foreground end | 247,702 | 333,580 | 38,660 | 76,448 | 92,616 |
| Background screen-on start | 222,798 | 309,104 | 30,996 | 61,000 | 91,256 |
| Background screen-on end | 211,643 | 299,256 | 26,384 | 61,424 | 85,768 |

PSS apportions shared pages across processes. RSS includes resident pages without that proportional attribution. Their changes are not interchangeable with Java allocations or retained objects. Native heap PSS increased during browsing while code PSS decreased. Total PSS then decreased across the background snapshots.

These four observations do not establish peak usage or a memory leak. A later collection or reclamation can change the totals, and isolated-process memory is separate. The printed graphics value was zero, but that field cannot establish that the app performed no GPU work or consumed no graphics-related memory elsewhere.

### Background findings

During the completed screen-on background counter interval, the primary app UID received 3,720 bytes and transmitted 3,552 bytes. The main process accumulated 0.32 seconds of CPU time. The app statistics recorded no added audio, video or WorkManager execution time. Pinterest therefore retained some network activity during this interval, though these counters do not identify its purpose.

The main process remained present. Its cached-state timer increased by 605.112 seconds. That is time recorded in a process state, not 605 seconds of CPU execution. The recorded CPU increase was much smaller.

During the screen-off counter interval, the primary app UID received 1,229 bytes and transmitted 1,490 bytes. The main process accumulated 0.52 seconds of CPU time, while the separately sampled app battery statistics increased by 0.311 seconds. The two accounting sources are not interchangeable. No additional audio or video activity was recorded. WorkManager activity increased by 64 milliseconds and one execution across the counter snapshots, but job history places that execution in the starting transition, before the quiet packet phase.

The same main process survived both background phases. The short transition job is evidence of an executed job, not just a registration. Its worker class and purpose were not established. There is no basis here to attribute residual quiet-interval traffic to that job, experiment refresh, engagement or screen-state workers.

Do not describe a screen-off interval as deep sleep or Doze without the recorded power and idle state. An emulator may remain awake even while its screen is off. Socket polling is reduced here, but the packet capture process and boundary diagnostics still contribute measurement overhead.

At screen-on background start, another installed app owned the sole active long partial wake lock in the system power snapshot. Pinterest did not own that entry. Device-idle and light-idle states were both active, forced idle was off, and the inactive timeout was 30 minutes. This starting observation does not describe the whole interval.

At the screen-off start boundary, Android reported the display asleep and screen-on false. Device-idle and light-idle had moved to inactive, while the other app's partial wake lock remained present. Inactive is not deep idle. These checks establish the intended screen-off condition without proving that the whole device suspended.

At the ending boundary, the display was still asleep, screen-on was false and forced idle was off. Light idle had reached `IDLE`, while the deeper idle state remained `INACTIVE`. The other app's long partial wake lock was still present. The run therefore observed entry into light idle at a boundary, but it did not establish deep Doze or sustained system suspend.

## Battery measurements

### What the emulator can establish

The emulator run provides CPU time, network bytes, media activity and scheduled-work observations. Its battery percentage and charge counter are synthetic. Simulating an unplugged state enables useful software accounting but does not create a real battery or measure consumed charge.

No emulator percentage change, modeled mAh estimate or CPU timer in this chapter should be presented as physical battery drain or expected phone battery life. Android's own guidance distinguishes activity timelines from the amount of battery consumed. See [Batterystats and Battery Historian](https://developer.android.com/topic/performance/power/setup-battery-historian).

### Physical-device result

No physical battery-drain result is available yet. The prepared Galaxy S22 remained connected to USB power, so it had not completed a battery-powered discharge interval. It also had an existing modified Pinterest 14.38.0 install. A measurement of that installation must be labeled separately and cannot stand in for the original-app emulator baseline.

No battery-powered phone interval was completed for this report. Physical charge use, energy consumption and phone battery-life impact remain unmeasured.

Record the actual phone model and OS build, original app version, network type, charging state, display brightness and starting temperature. Keep the signed-in account and content state intact. Measure a comparable foreground workload and a quiet background interval while the phone is drawing power from its battery. Record charge-counter or supported power-rail data alongside CPU, network and wake activity.

Use at least a control interval to show device background consumption. State whether charge readings are coarse, unavailable or influenced by USB charging. Do not convert a short percentage change into hours of battery life. Repeated controlled comparisons are needed before claiming that a patch saves a specific amount of energy.

Perfetto documents battery counters and device-dependent power-rail sources. Availability must be checked on the actual phone. A source existing in the tracing interface does not mean the hardware exposes calibrated readings for every component. See [Perfetto power data sources](https://perfetto.dev/docs/data-sources/battery-counters).

## Patch opportunities supported by the measurements

| Opportunity | Current evidence | What a patch comparison needs to demonstrate |
| --- | --- | --- |
| Verify the existing analytics controls against real startup traffic | Original-app startup produced primary-correlated Pinterest `trk` and AppsFlyer service connections | Repeat cold launch with the same account and app version. Compare service connections, primary-UID bytes and startup behavior. Encrypted request contents remain unknown unless separately instrumented. |
| Reduce unwanted media autoplay and prefetch | The foreground interval recorded 94.722 seconds of video activity and about 4.29 million primary-correlated IP bytes | Compare equivalent feed states with autoplay/prefetch changes. Separate organic from sponsored media before assigning savings to ad filtering. |
| Check whether hiding ads prevents work or only hides views | Original browsing produced substantial network and media activity | Compare data and decoder activity before and after each targeted patch. A visually absent ad does not prove that its fetch or measurement never occurred. |
| Review SDK initialization separately from visible UI | AppsFlyer service connections occurred during cold launch | Confirm that disabling startup work removes the intended path while preserving sign-in, feed loading and lifecycle behavior. Recheck after upstream updates. |
| Examine the small residual background network activity before changing job policy | Screen-on background activity added 7,272 primary-UID bytes and no WorkManager execution time. The screen-off counter interval added 2,719 bytes. Its 64-millisecond job ran at the starting transition | Join worker identities to execution timestamps and requests. These results do not establish a job executing in the quiet screen-off phase or justify broadly disabling background work. |
| Review individual periodic and screen-state workers | Scheduling metadata names experiment refresh, Google engagement and device screen-state workers | Trace each class's work and version fingerprint. Preserve push registration, integrity checks and useful cache work unless a specific change has been exercised. |
| Improve measurement coverage for isolated processes and QUIC | The app had an isolated UID mapping, and most foreground-correlated packet bytes used UDP port 443 | Add time-valid process mapping and a transport-aware trace. Keep primary-UID counters as a separate reproducible baseline. |

The current evidence supports targeted comparisons. It does not establish the payload of any encrypted request, the number of ads delivered, a count of tracking events, or a battery saving from an unmeasured patch.

## Repeating the comparison

Use the saved signed-in baseline and the same original APK version. Record the cache state and exact phase durations. Keep screen settings, host resource limits and network conditions consistent. Preserve the native app's privacy and autoplay settings in the record.

For each patch configuration, repeat the original workload and retain an unpatched comparison run. Report individual repetitions and variation rather than publishing only the best result. Feed content and server experiments can differ even on the same account, so matching a query or saved content set is preferable to assuming two home feeds are identical.

Retain sanitized phase summaries in the repository. Keep raw packet captures and account-bearing diagnostics local. Save the capture tool version, parser version and the exact correlation window so future updates can reproduce the interpretation.

## Evidence and remaining limits

The results come from finalized `network-summary.json`, `runtime-summary.json`, the boundary memory snapshots and the restricted scheduling-metadata query. The [public runtime data](pinterest-14.38.0-runtime-data.json) preserves the four phase results and hashes of the two source summaries. Packets outside the four phase windows are excluded from the phase tables even though they remain part of the whole-capture packet count.

The offline parser's fabricated checks cover Linux cooked v2 framing, reordered TLS prefixes, exact socket ownership, expiration of the correlation window, exclusion of isolated UIDs, public hostname filtering and opaque-label redaction. Passing those checks validates those parsing cases. It does not validate every possible packet format or recover encrypted traffic.

Collection ended cleanly. The temporary simulated battery state was reset, elevated ADB access was removed and the emulator was stopped. The saved signed-in snapshot was retained, and the device lease was released. No physical battery-drain result is implied by that cleanup or by the emulator measurements.
