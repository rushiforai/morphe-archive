# Threads 450 runtime audit

Observed 2026-10-09. This report complements the [APK reference](threads-app-reference.md) and [patch authoring guide](patch-authoring.md).

## What this run establishes

The original Meta-signed Threads 450 app installed, opened, and displayed a signed-in feed. The profile's Instagram button exists in this build. Profile recommendations are a separate surface from the home feed. Several useful privacy and recommendation controls already exist in the stock app.

This was an in-place stock update from 449 with an existing account and permission state. It establishes behavior without HushThreads patches. It does not establish fresh-account defaults or first-install permission prompts. No account was created, no post was published, and no suggested person was opened or followed. Settings were inspected without submitting changes.

### Reproducible baseline

| Property | Observed value |
|---|---|
| Package | `com.instagram.barcelona` |
| Version | `450.0.0.51.78`, code `512008342` |
| Installed base SHA-256 | `1881ad1d19a0a758690cd00aea250c4fa81cb13533b6a234639b3232ed5f2092` |
| Signature check | The original split set updated the existing Meta-signed install successfully. The installed base hash matches the inspected original fixture. |
| Android | 16, API 36, Google APIs userdebug image |
| Android build | `BE2A.250530.026.F3`, image build `13894323` |
| Advertised guest ABIs | `x86_64,arm64-v8a` |
| Native bridge | `libndk_translation.so` |
| Display | 1080 by 2400 pixels, light appearance |
| Account | Existing signed-in private profile; identifying details omitted |
| Initial transport | Emulated Wi-Fi, unmetered |
| Captured packet phase | Emulated cellular, metered; Wi-Fi temporarily disabled and restored afterward |
| Power source | Emulator AC simulation, 100% level, fixed synthetic charge counter |

The emulator uses hardware acceleration and ARM64 translation. Timing under host contention is not a phone performance benchmark. A successful launch on this image does not replace a Samsung compatibility check.

## Screen and behavior map

Each row describes a screen reached during this run. Account content, feed posts, recommendations, and advertising history remain in local evidence. The public screenshots contain settings labels without account identifiers.

| Step | Route and observed controls | Patching implications and limits |
|---|---|---|
| 1 | Stock launch retained the account and loaded home-feed posts and images. A loading skeleton appeared first, followed by content. | Initial placeholders are not evidence of a broken feed. Capture a settled screen before judging rendering. No first-login claim. |
| 2 | Bottom navigation exposed Feed, Messages, Create, Activity, and Profile. Search appeared in the top area. | Do not assume older navigation layouts. Search is not one of the five bottom tabs in this account's layout. |
| 3 | Profile displayed Insights, Search, Instagram, and Settings in its header. Its content tabs were Threads, Replies, Media, and Reposts. | Confirms the visible control requested in [issue #7](https://github.com/SysAdminDoc/HushThreads/issues/7). A hide-Instagram patch can target this header while preserving account settings. |
| 4 | A horizontal Suggested for you carousel appeared above the profile's content tabs, with Follow and dismiss controls. | The home-feed merge hook doesn't cover this profile component. `Hide suggested users` now reaches it in source: the profile screen finds no list to draw the carousel from, and the profile view model leaves its suggestions row out. A patched device still has to show the carousel gone on your own profile and someone else's, with the rest of the profile intact. No recommendation was tapped. |
| 5 | Settings contained Accounts Center, teen supervision, invitations, Notifications, Saved, Liked, Archive, Privacy, Content preferences, Account status, Community Notes, cross-profile sharing, More settings, Help, a Meta support entry, and About. | Preserve stock settings entry points when inserting HushThreads settings. Some rows are server-delivered. See [settings screenshot](../assets/audit/threads-450/settings.png). |
| 6 | Content preferences offered Muted, Hidden Words, Hide like and share counts, Dear algo requests, Sensitive content, Political content, and Translations. | Some requested customizations already have stock controls. Prefer a shortcut where it meets the need. See [content preferences](../assets/audit/threads-450/content-preferences.png). |
| 7 | Dear algo requests opened a page titled Your algo. It had an empty state, a New algo request action, and a private-request explanation. | The settings row and destination use different names. Match the route and semantic content rather than one display string. |
| 8 | The new request sheet offered a text input and a duration selector. Durations were 7 days, 3 days, and 1 day. Seven days was initially selected in this unsubmitted sheet. | A convenience patch could expose the existing control. The audit did not submit a request or measure ranking effects. See [duration choices](../assets/audit/threads-450/algo-duration.png). |
| 9 | Privacy exposed Private profile, Tags and mentions, Online status, Messages, Restricted profiles, Blocked profiles, Profiles you follow, cross-app post suggestions, Private likes, and a route to other Instagram privacy settings. | Separate Threads-local controls from settings shared through Instagram. See [privacy](../assets/audit/threads-450/privacy.png). |
| 10 | Suggesting posts on other apps showed Instagram and Facebook switches. Both were disabled on the private profile, with an explanation that private posts would not be suggested on other apps. | Disabled controls can reflect account state. Do not treat this as a missing feature or force a control enabled without preserving the server restriction. |
| 11 | Notifications offered Pause all and categories for Threads and replies, followers, custom feeds, From Threads, messages, live chats, and email. | Notification filtering has its own settings surface. Removing cards from the feed does not stop promotional or recommendation notifications. |
| 12 | From Threads separated Suggested threads, Reminders, Product announcements, Follow suggestions, and Trending, each with On and Off choices. It also linked Android notification settings. | These were enabled in the inspected existing account, not proven fresh-install defaults. A shortcut or quiet preset could reuse these controls. The page says its choices affect accounts signed in on the device. See [recommendation notifications](../assets/audit/threads-450/recommendation-notifications.png). |
| 13 | More settings contained Time management, Media quality, Accessibility, Fediverse sharing, Language, Website permissions, and Podcasts. Fediverse sharing was disabled for this account. | Keep account eligibility separate from client capability. See [more settings](../assets/audit/threads-450/more-settings.png). |
| 14 | Media quality exposed Upload highest quality. Its explanation concerned uploads and network-dependent quality. | This is distinct from HushThreads' full-size image retrieval patch. Do not describe that patch as replacing the stock upload setting. See [media quality](../assets/audit/threads-450/media-quality.png). |
| 15 | Accessibility offered Show alt text for other people's photos and videos when descriptions are available. | A useful discoverability shortcut already exists. The switch's presence does not prove that all media has accurate alt text. See [accessibility](../assets/audit/threads-450/accessibility.png). |
| 16 | Website permissions opened Apps and Websites, with Active, Expired, and Removed tabs. The current account had no active authorized integrations. | This is an authorization-management page, not an in-app browser cookie or site-permission panel. See [website permissions](../assets/audit/threads-450/website-permissions.png). |
| 17 | Accounts Center opened inside the app and included profiles, security, connected experiences, information and permissions, Ad preferences, and account management. | Keep this shared account UI reachable. Do not replace it with a local patch setting that implies a server preference changed. |
| 18 | Ad preferences had Customize ads and Manage info tabs. Customize ads showed previous ad activity, saved ads, and advertisers. | This proves an advertising-history UI was reachable. It does not prove those historical ads were delivered by Threads rather than another linked Meta app. Identifying advertising history is not published. |
| 19 | Manage info exposed profile/category targeting, Activity from other businesses, audience-based advertising, ads in other apps, and ads about Meta. | These are separate controls with different purposes. Do not conflate audience membership, business activity, and the Android advertising ID. See [ad controls](../assets/audit/threads-450/ad-controls.png). |
| 20 | Activity from other businesses offered allowing or disallowing use for relevant content. The screen warned that businesses may still send activity and that other uses and exceptions remain. | A local analytics blocker and this account preference have different coverage. Opening the page did not change or confirm a preference. |
| 21 | The top-left home control opened a Communities drawer. It showed suggested communities and an Other feeds section containing Following, Trending now, Your algo, Saved, Liked, and Ghost posts. | The control is broader than a For You/Following selector. Avoid replacing it with a two-choice switch that hides stock destinations. Community suggestions have a separate surface. No community was joined. |
| 22 | Following opened an empty state asking the account to follow more profiles. | This run establishes the route and empty state, not pagination, ordering, or ad spacing in a populated Following feed. No account was followed to fill it. |
| 23 | Search opened community/topic chips, Trending now with an AI-summary explanation, and a Follow suggestions carousel. | Search contains recommendation and summary surfaces outside the home-feed merge. A quiet-search option would need separate anchors. No query, suggested person, or trending result was opened. |
| 24 | Create opened New thread, saved-draft access, a community/topic selector, media, GIF, sticker and music actions, and Add to thread. More tools listed Text, Quote, Poll, and Location. | Treat composer tools as independent features. Location in this menu does not explain every location access elsewhere. The composer stayed empty and was canceled without posting or saving a draft. |
| 25 | Composer Post options offered who can reply and quote, review/approve replies, and cross-app sharing. Reply choices included followers, followed profiles, and mentioned profiles. | These choices reflect a private account. Preserve audience and review rules when adding convenience controls. No selection was changed. |
| 26 | Activity exposed All, Requests, Conversations, and Mentions. Its list included Suggested thread and Follow suggestion entries alongside account notices. | Feed filtering does not establish activity-list or push-notification coverage. Historical account notices can disagree with current settings because they describe earlier events. No list entry was opened. |
| 27 | Messages exposed Inbox, Requests, inbox filters, and an empty-state invitation with Message and Ask Meta AI actions. | Confirms a visible Meta AI entry in this account's inbox. Removing that invitation is different from changing message delivery or muting an account. No conversation or message action was opened. |
| 28 | An ordinary feed post's More options sheet contained Copy link, Save, Interested, Not interested, Mute, Restrict, Community Notes, Block, and Report. | Stock already offers bookmark Save and Block in this menu. HushThreads media-download rows must remain distinct from bookmarking. Do not justify a block shortcut by claiming profile navigation is required. No action was selected. |
| 29 | A post's Share sheet showed recipient suggestions and Instagram story, More, Link, SMS, and Instagram message destinations. | This is a separate recipient-recommendation surface. Removing incoming share targets from the manifest does not remove these outgoing destinations. The sheet was dismissed without selecting a recipient or sending anything. |

### UX and accessibility notes

The app consistently used large rows and standard back navigation in the inspected settings. The profile header's Instagram and Settings controls had useful accessibility descriptions in the UI hierarchy. The feed's post actions also exposed descriptions for likes, replies, reposts, and sharing.

Helper text is often pale gray on white. That deserves a contrast check before copying the style into extension UI. Screenshots alone do not establish a WCAG result. TalkBack traversal, large text, contrast ratios, switch announcement, and touch-target behavior were not measured in this pass.

The inspected stock build used both Compose-style settings and shared account panels with different headings and spacing. New patch settings should preserve navigation and readable labels across both. A resource name or a screen title alone is a weak anchor when the same feature has different labels at its entry and destination.

Switching back to Feed from another bottom tab retained Search's nested route in this run. Back returned from Search to the feed. A navigation patch should test each tab's existing back stack, rather than assuming every Feed tap opens the root timeline. Intermediate captures sometimes contained both outgoing and incoming screen nodes during transitions; use a settled screen and screenshot before choosing an anchor from a hierarchy dump.

## Network observations

### Collection and attribution

At each phase boundary, the audit forced Android's network accounting to poll, then took a separate full UID snapshot. Receive and transmit counters were selected for the exact Threads UID in the UID stats section, with `tag=0x0`. Historical buckets were summed and subtracted between snapshots. The report does not add UID-tag totals, prorate a historical bucket, or count every emulator packet as Threads traffic.

`DEFAULT` is Android's background network accounting set. `FOREGROUND` is the foreground set. A mixed phase can increment both, so both are retained. Network accounting state and the experiment's screen state are related but not identical. Negative differences would invalidate the interval rather than being silently changed to zero.

The emulator's legacy `-tcpdump` capture initially covered its virtual Ethernet backend, not the active virtual Wi-Fi backend. Its small initial capture was rejected as evidence of feed traffic. The audit then used a separate, explicitly labeled emulated-cellular phase. Packet growth after that transition confirms the capture covers the tested transport. The earlier Wi-Fi UID counters remain valid independently of that packet capture.

Packet metadata can reveal destinations, DNS, and unencrypted TLS ClientHello server names when present. It does not expose encrypted request bodies, feed JSON, cookies, or ad event payloads. DNS and TLS results are emulator-wide. Other installed apps and Android services can use the same Meta infrastructure. A destination alone cannot prove an advertising, analytics, or tracking purpose.

### Permission use observed during the survey

Android app-ops recorded recent successful fine-location access, Wi-Fi scan access, and phone-state access while Threads was being inspected. At the snapshot taken around 20:47 UTC, these accesses were about 58 seconds old. The same snapshot showed a recent wake-lock operation. These are runtime access records for the Threads package, not just manifest declarations.

Contacts access in that snapshot was several days old, so it is not attributed to this run. Microphone and camera being allowed by policy is not evidence that they were used. The account already had several runtime permissions granted before the audit. This run does not establish whether a clean installation would request them or when its prompts would appear.

The access records do not reveal coordinates, contact contents, phone information, or a transmission destination. A permission-specific patch should first verify the feature that triggered the access and then check behavior with permission denied on a disposable profile.

### Measured traffic by phase

Times below are UTC on 2026-10-09. Durations use actual boundary times, not the intended timer length. Byte totals are decimal bytes. A receive or send count does not classify content as an ad, analytics, or media.

| Phase | Boundary times | Elapsed | Threads received | Threads sent | Accounting set |
|---|---|---:|---:|---:|---|
| Wi-Fi screen survey | 20:41:44.649 to 20:44:54.764 | 190.114 seconds | 2,192,589 bytes, 2,265 packets | 277,252 bytes, 675 packets | Foreground |
| Emulated cellular feed browsing | 20:50:53.254 to 20:54:32.524 | 219.271 seconds | 21,605,232 bytes, 17,675 packets | 265,815 bytes, 887 packets | Foreground |
| Home, display on, cellular | 20:54:34.145 to 20:59:36.419 | 302.274 seconds | 41,575 bytes, 143 packets | 36,290 bytes, 145 packets | Background |
| Same Home interval, foreground carryover | Same interval | Same interval | 2,716 bytes, 5 packets | 1,120 bytes, 4 packets | Foreground |
| Home, sleep-command interval, cellular | 20:59:37.351 to 21:09:39.057 | 601.705 seconds | 50,718 bytes, 121 packets | 27,092 bytes, 97 packets | Background |

The cellular interval includes transport settling before approximately three minutes of browsing. It contains 11 upward swipes, with screenshots and UI dumps between swipes. No person, post action, or advertising link was tapped. That observation workload adds some overhead and is documented rather than treated as passive reading.

The 11 captured feed hierarchies contained no `Sponsored` or `Paid partnership` label. The final screenshot showed video/media cards and an automatically translated post. This is a limited observation of the inspected views, not proof that Meta delivered no ad objects or that this account never receives ads. The audit has not decrypted feed responses or directly observed a sponsored-card request.

The legacy packet capture's timestamps were approximately five hours ahead of the host while Android's UTC clock agreed with the host within about two seconds. Independent header parsing confirmed that the offset was in the capture records. No silent clock correction was applied. Packet metadata is reported for the capture as a whole; phase traffic totals come from Android's separately timestamped UID snapshots.

### Destinations actually visible in the capture

These names were parsed from packets, rather than copied from APK strings. They describe emulator-wide traffic. An Android UID counter proves Threads exchanged bytes, but cannot bind a particular hostname to that UID without additional socket or request evidence.

| Name or family | Observed metadata | What can be concluded |
|---|---|---|
| `graph.facebook.com` | DNS and TLS ClientHello server name | A TLS ClientHello requested this hostname. This alone does not prove a completed connection, identify `/logging_client_events`, or show analytics delivery. |
| `i.instagram.com`, `graph.instagram.com` and their fallback variants | DNS questions | These names were resolved or requested. DNS alone does not prove a successful application request. |
| `test-gateway.instagram.com` | DNS and TLS ClientHello server name | The name was used in a TLS handshake. Its `test` prefix is not evidence that the account used a test environment. |
| `z-m-gateway.facebook.com` | DNS and TLS ClientHello server name | Gateway traffic is visible, but the encrypted protocol and individual events were not decoded. |
| `*.cdninstagram.com` | DNS questions and answers, TLS ClientHello server names | CDN-named destinations were visible. Media was on screen, but individual files were not correlated with transfers. |
| `*.xy.fbcdn.net`, `*.xz.fbcdn.net` | DNS; one visible TLS server name | Names contained a unique label, which is omitted here. Their function and identifier lifetime remain untraced. Do not publish full unique labels in telemetry reports. |
| Google connectivity, messaging, and service domains | DNS and TLS metadata | These destinations can belong to Android services or other apps. Hostnames alone do not identify their sender. The capture has no per-app isolation. |

Shared IPs, TLS session resumption, QUIC, encrypted DNS, and encrypted ClientHello can make host attribution incomplete. The metadata parser did not decrypt TLS or QUIC. A missing hostname is not proof of no contact. Do not turn this list into a hostname blocklist for normal app use.

The closed capture contained 23,444,662 bytes and 20,716 complete packet records. Parsing found 75 DNS questions across 19 distinct names and 14 TLS ClientHellos across 10 names, with no incomplete records or parse failures. The parser skipped non-address DNS answers, non-IP frames, unsupported IP protocols, and TCP streams whose captured bytes did not begin with a TLS handshake. These counts describe the captured transport, not total app requests. They include the later navigation survey after Wi-Fi was restored, when the legacy backend again lacked full active-transport coverage.

## Background and battery method

The foreground phase browses the feed without social actions. The display-on background phase presses Home and leaves the process alive. The display-off phase requests sleep after Home, then checks the actual power state. Neither phase force-stops Threads. A force-stopped control is a different experiment and must be labeled separately.

Boundary evidence includes package identity, per-UID traffic, process and thread listings, services, jobs, alarms, idle state, app-ops, CPU diagnostics, and battery service readings. Registered jobs, services, and alarms show eligibility or presence. They do not prove execution during the interval. CPU diagnostics cover their own sampling windows and are not automatically an integrated energy measurement.

No global battery history was reset. No simulated `battery unplug` command was used. The emulator reported AC power, 100% charge, and a synthetic charge counter. Those values cannot measure physical battery consumption. An emulator screen-off interval also does not establish natural Doze while the guest reports charging.

Physical battery work must use real power disconnection, verified wireless control, and actual charge-counter readings. A charge-counter decrease divided by 1,000 yields whole-device mAh, when the device supplies a valid counter. It is not Threads-only consumption. Per-UID power attribution is a model, and a short run cannot establish battery-life savings. Keep device model, app version, signer, active patch state, charging state, brightness, transport, and observation length with every result.

### Background activity actually observed

During the five-minute Home/display-on interval, Threads received 44,291 bytes and sent 37,410 bytes across both accounting sets. Most appeared in the background set. Going Home therefore did not stop all network activity. This result does not identify whether those bytes carried push keepalives, delayed media, analytics, or another request type.

The exact Threads push process, `com.instagram.barcelona:fbns`, had 53 threads at both boundaries. A co-installed app's similarly named push process was excluded. The main process had 167 threads at the start and 159 at the end, with a separate one-thread child also present. A count can fall while individual threads are replaced, so these totals alone do not prove stable thread identities.

At the later snapshots, all 53 push threads were sleeping at that instant. Named families included four `SystemDNS` threads, one `MNSEventLoop`, one `FbnsBroadcastSe`, one `GatewayClientDi`, one `RetryHandlerThr`, three `Lacrima_schedul`, and single `Lacrima_sender_`, `Lacrima_single_`, and `LacrimaSigquitN` threads. Android truncates some thread names. Sleeping state is a snapshot, not proof that a thread did no work between captures.

The start snapshot held attached `TaskLifeDetectingService` and `InappFbnsService` records with `startRequested=true` and no foreground starts. By the end, the remaining `InappFbnsService` record was detached (`app=null`) and its foreground-start eligibility was denied. A service record's presence is not proof of an executing service. The scheduled WorkManager job remained unready with an unmet timing delay. The cumulative `action_batch_upload` alarm count stayed at one wakeup, so this interval showed no new wakeup in that counter.

#### Display-off interval and process replacement

The ten-minute interval began immediately after a sleep command. Its first idle snapshot still reported the screen on while the transition was in progress. A later power snapshot at about 21:04:17 UTC confirmed `mWakefulness=Asleep`, and the final idle snapshot confirmed the screen off. The guest remained charging with deep and light idle states both `ACTIVE`. This is a sleep-command interval with confirmed later screen-off state, not a measured ten minutes of natural Doze.

Threads received another 50,718 bytes and sent 27,092 bytes, all in background cellular accounting. Foreground and Wi-Fi counters did not increase. At 21:07:05.761 UTC, Android's exit record reports stopping the original main process for `FREEZER / FREEZER BINDER TRANSACTION`, with the description `Sync transaction while in frozen state`. A replacement main process had 107 threads by the final boundary. This is not evidence of a low-memory kill, an application crash, or a continuous process whose thread count merely fell.

The push process retained its identity and 53 threads. All were sleeping in the final snapshot, with unchanged displayed cumulative thread CPU fields. That field's display resolution cannot exclude small amounts of work. Its detached service record remained. The upload-alarm wakeup count still did not increase.

WorkManager history did show intervening scheduler activity. Two jobs started and stopped; one was canceled while waiting for a service bind, and another was canceled after a recorded 333-millisecond scheduler duration. The first record held 8.973 seconds of scheduler duration. A new job was unready at the final boundary. These durations measure job lifecycle accounting, not CPU time, and do not prove the intended worker or upload completed. Looking only at the final unready job would miss this activity.

App-ops also recorded a newer successful phone-state access around 21:07:14 UTC. Successful fine-location and Wi-Fi-scan timestamps did not advance between Home and the end. New coarse/fine-location rejection times appeared around the same time as the phone-state access. These are denied location attempts, not successful background location reads. The records do not identify returned values or show whether anything was transmitted.

The final wake-lock record showed a 29.638-second duration with its last start around 20:54:41 UTC, shortly after Home. This records a wake-lock operation, not the energy it cost. The emulator's charging state still prevents physical battery attribution.

#### CPU sampling limits

The display-on end snapshot's CPU report covered 20:54:21.757 to 20:59:21.827 UTC, beginning about 12 seconds before the Home boundary. It reported 4.8% for the Threads main process over that mixed window. This is not a pure five-minute background average.

The final CPU report covered only 21:08:46.734 to 21:09:21.864 UTC, a 35.130-second window within the sleep-command interval. It contained no Threads main-process or push-process row. An absent row must not be reported as zero CPU for the full interval. The whole-emulator total was 0.6% over that short sample, which cannot be assigned to Threads or converted into app battery use.

### Physical phone comparison while charging

A Samsung Galaxy S25 Ultra running Android 16/API 36, build `BP4A.251205.006.S938BXXUACZF1`, provided a separate hardware observation. It already held re-signed Threads `449.0.0.54.82` with HushThreads `0.0.11` active. Its account and installation were preserved. These measurements must not be presented as stock 450 results or as evidence for the 0.0.12 FBNS fix.

Network accounting identified unmetered Wi-Fi. Observed enabled switches were Hide ads, Hide suggested users, Keep feed position on return, Tap to play videos, Remove tracking from shared links, Open links in browser, and Stop analytics uploads. The no-time-limit choice was off. The analytics coverage display reported PIGEON, DEFAULT, and MQTT with no missing family. Other feature choices were not recorded. Actual brightness and adaptive-brightness state were not recorded, so this is not a reproducible display-energy comparison. The device, app version, patch state, network, and feed workload differ from the stock emulator; their totals cannot establish patch savings.

| Phase | Actual duration | Threads received / sent | Whole-device charge counter | Temperature |
|---|---:|---:|---:|---:|
| Feed scrolling, 20:56:38.468 to 20:57:41.319 UTC | 62.85 seconds | 1,102,636 / 24,577 bytes | 3,675,000 to 3,679,900 microamp-hours | 91.94 to 91.40°F |
| Home, display on, 20:57:43.799 to 21:01:47.190 UTC | 243.39 seconds | 18,288 / 10,111 bytes | 3,679,900 to 3,709,300 microamp-hours | 91.40 to 89.42°F |
| Home, display off, 21:04:04.962 to 21:09:08.661 UTC | 303.70 seconds | 0 / 0 bytes | 3,724,000 to 3,758,300 microamp-hours | 88.88 to 87.62°F |

The first interval's network accounting boundaries span 62.99 seconds, slightly longer than its battery boundaries. Foreground traffic stayed in the foreground accounting set, and the Home interval's traffic was entirely in the background set. The push process held 70 threads across both intervals. Main-process counts changed from 139 to 153 during browsing and from 155 to 144 during the Home interval.

In the first two intervals, USB power remained connected and the reported level stayed at 75%. The charge counter increased by 4.9 mAh and 29.4 mAh respectively. Those are net charging changes across the whole phone. Charger delivery, battery charging losses, display use, radio activity, and other apps prevent converting them into Threads consumption. Temperature fell during both intervals. These are actual battery-service observations, but they establish neither discharge rate nor battery savings. The temporary screen timeout was restored afterward.

The later display-off interval had a 303.81-second network boundary span. Its UID counters showed no receive or transmit increment. The charge level stayed at 76%, and the counter rose by 34.3 mAh. USB power remained connected at every 30-second sample. Main and push process counts stayed at 145 and 71 threads respectively. Both service snapshots contained no active Threads service record and one registered job. Samsung reported `mWakefulness=Dozing`, which is a display/power state and does not prove Android deep-idle residency. The screen was awakened afterward, and the original display timeout remained intact.

#### Startup failure found during hardware preparation

Two earlier launches with the 0.0.11 runtime temporarily paused produced a `BIND APPLICATION ANR`. The captured main thread waited for a synchronized-map lock held by a worker blocked in Android KeyStore's `getKeyEntry` call. That trace supports a KeyStore-related startup stall. It does not establish FBNS thread exhaustion, and it is not a stock 450 failure.

A later launch recovered without clearing data, replacing keys, or reinstalling. The original HushThreads active state was restored and verified before the measured intervals. Future startup reports should collect the main-thread wait and lock-owner stack before attributing every ANR to the previously reported push-thread problem.

### Repeating the observation

Use a leased device with a verified identity. Keep the original APK and split hashes with the results. Preserve account data and signing keys. Treat a runtime Pause as a re-signed comparison because manifest changes and compiled hooks can remain.

At each boundary, save outputs locally with a UTC timestamp and a phase name:

```text
adb -s <serial> shell pm list packages -U com.instagram.barcelona
adb -s <serial> shell dumpsys netstats --poll
adb -s <serial> shell dumpsys netstats --full --uid
adb -s <serial> shell dumpsys batterystats --charged com.instagram.barcelona
adb -s <serial> shell dumpsys battery
adb -s <serial> shell dumpsys activity services com.instagram.barcelona
adb -s <serial> shell dumpsys jobscheduler
adb -s <serial> shell dumpsys alarm
adb -s <serial> shell dumpsys deviceidle
adb -s <serial> shell cmd appops get com.instagram.barcelona
adb -s <serial> shell ps -A -o UID,PID,PPID,NAME
adb -s <serial> shell ps -A -T -o UID,PID,TID,S,TIME+,CMD
```

Confirm the poll command reports `Forced poll`. Keep polling and dumping separate. Android's network service returns immediately after the poll operation. Parse only the package's numeric UID in the UID stats history, with `tag=0x0`. Keep transport and accounting set separate, and retain all historical buckets at both boundaries. Reject conflicting duplicates or negative deltas.

On the inspected Toybox build, `NAME` is the process command-line name and `CMD` is the thread name from `/proc/TID/stat`. A `NAME` column repeated for every thread cannot identify SystemDNS or FbnsBroadcastSender families. Kernel thread names can be truncated. Select the Threads `:fbns` PID first so that a co-installed Instagram `:fbns` process is not counted accidentally.

The foreground script used upward swipes with a pause between them. A consistent comparison should use the same account, app version, feed choice, media mix, scroll count, brightness, and network conditions. Repeat trials because live feeds and server experiments vary. Record notifications and other workload that can contaminate whole-device power readings.

For a natural idle run, physically remove external power, press Home, turn the display off, and leave the phone stationary. Check the reported idle state afterward. Do not label screen-off time as Doze without that evidence. Restore temporary Wi-Fi, display timeout, brightness, and patch settings before releasing the device.

## Highest-value follow-ups

| Priority | Opportunity | Required proof before implementation |
|---|---|---|
| High | Hide the profile Instagram button | The button is confirmed in stock 450, and `Hide the Instagram button` now hooks the header's own flag for it in source. A patched device still has to show that only this control disappears. |
| High | Extend suggestion filtering to the profile carousel | `Hide suggested users` now hooks both profile surfaces in source: the profile screen's own null check on the carousel's list, and the view model's check before it adds the suggestions row. Search, Activity and feed suggestions are left alone. A patched device still has to show the carousel gone on your own profile and someone else's, stock again with the switch off or HushThreads paused, and ordinary profile content intact. |
| High | Map recommendation surfaces outside the feed | Search, Activity, Communities, and the outgoing share sheet exposed distinct suggestions. A single feed-model hook does not establish coverage of these components. |
| High | Audit uploads beyond the three analytics address families | Correlate a specific event producer with its uploader. Encrypted traffic volume and shared hostnames cannot prove payload coverage. |
| High | Keep FBNS signer regression checks in every stock/re-signed comparison | Same app version and device conditions, repeated foreground/background transitions, separate process/thread family counts. A runtime Pause does not restore the original signer. |
| Medium | Add shortcuts to stock recommendation and privacy controls | Verify stable destinations for notification categories, content preferences, and business-activity choices. Preserve server-owned state. |
| Medium | Make media settings clearer | Distinguish download image size, upload quality, video autoplay, and data transport. Check media actually decoded or transferred before claiming savings. |
| Medium | Expose the existing Your algo page more clearly | Match account availability and route behavior. Do not promise a client patch can dictate server ranking. |
| Medium | Offer a quieter Search or Messages entry screen | Trending summaries and an Ask Meta AI inbox action were observed. First check native controls, then anchor only the remaining visible component. |
| Medium | Review permissions using observed accesses | Separate permission grant, actual access, and upload. Test location-denied and phone-state-denied behavior without broad manifest removal. |

Unobserved paths remain explicit. This run is not a complete fresh-install, login/recovery, messaging, fediverse, publication, or accessibility certification. Destructive account actions and social actions are not required to locate client patch boundaries.

## Measurement references

- [Android emulator packet capture and acceleration](https://developer.android.com/studio/run/emulator-commandline)
- [Modern emulator radio capture](https://developer.android.com/studio/run/emulator-networking-advanced)
- [Emulator backend wiring for legacy capture and virtual Wi-Fi](https://android.googlesource.com/platform/external/qemu/+/emu-master-dev/android-qemu2-glue/main.cpp)
- [Network statistics accounting definitions](https://android.googlesource.com/platform/frameworks/base/+/aae54869262a15102e14493255a00ec317b8068d/core/java/android/net/NetworkStats.java)
- [Network statistics polling and dump implementation](https://android.googlesource.com/platform/packages/modules/Connectivity/+/311feaff8b4a66b0c8a7bc5ed72f916d666c683e/service-t/src/com/android/server/net/NetworkStatsService.java)
- [Android physical battery collection workflow](https://developer.android.com/topic/performance/power/setup-battery-historian)
- [BatteryManager units and properties](https://developer.android.com/reference/android/os/BatteryManager)
- [Android Doze conditions](https://developer.android.com/training/monitoring-device-state/doze-standby)
