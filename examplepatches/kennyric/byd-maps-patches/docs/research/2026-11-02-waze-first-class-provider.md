# Waze as a first-class warning and road-data provider

Research date: 2026-11-02. Target: `com.waze` 5.26.90.901 (1030746). Retained original base APK SHA-256: `5ab9853c76a3f83a493e1872f232bbbde96ec61245cbca117aa39e176cdfe9c4`.

This evaluates the maximum useful interoperability surface for patched Maps/Vela. It does not claim that every compiled feature produces live data in every region or without a Waze route. No production patch or personal device was changed.

## Conclusions

Waze should be an equal provider of the proposed Warning Events API, with a provider-specific capture adapter, capability profile, coverage manifest and the same delivery, speech, ownership and validation requirements as Flitsmeister. Restricting it to the current common camera/police/hazard list throws away substantial available meaning.

The highest-value additions are native validation distance/time, precise camera/hazard/lane/weather subtypes, native priority and silence rules, segment insights beyond average-speed zones, and actual announcement/lifecycle events. Route traffic, lanes, ETA and toll information are also exposed, but usually describe Waze's route. They require different handling from a portable warning about the road currently being driven.

First-class does not mean identical features. Flitsmeister and Waze expose different native models, local coverage and eligibility. It means neither is reduced to a lesser transport, generic labels, weaker speech integration or a permanently deferred implementation.

## 1. Evidence and confidence levels

The [machine-readable inventory](../waze/native-provider-inventory.json) records 27 inspected native model/interface files, 301 getter/presence signatures, 26 wire alerter enum entries including UNRECOGNIZED, and 96 Java UI-controller subtype entries. The counts describe available API structure, not 96 guaranteed live warnings.

Six critical classes were freshly extracted from the retained original APK: AlerterInfo, AlertValidationResult, NativeAlertDescriptor, InsightPriority, SegmentInsightInfo and the UI-controller Subtype enum. All six JADX runs completed successfully. Other supporting classes came from the retained broader decompilation of the same original. Individual complex decompiled methods contain warnings; conclusions about numeric wire values are based on explicit enums/getters and corroborated conversion paths, not blindly reconstructed control flow.

The retained Waze base also passed `apksigner verify`; its signing certificate SHA-256 is `03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7`. `aapt2 dump badging` confirms com.waze / 5.26.90.901 / 1030746. The inventory records these checks. Signature validity and exact package identity corroborate the retained input; they do not establish live feature behavior.

Evidence levels used below:

- **Existing export:** the current production patch reads and publishes this information.
- **Native exposed:** concrete APK fields or callbacks exist; a new adapter can investigate them.
- **Binding traced:** callers/conversion/state logic were inspected, providing more than a field name.
- **Runtime unproven:** this research did not execute a new live provider-to-receiver warning path.

Local extraction tool/logs: `.analysis/waze-rich-provider-research/`. Getter existence is not evidence of native cadence, freshness, availability, announcement policy or correct consumer presentation.

## 2. Current export versus additional value

| Data | Current patch | Additional value and proposed consumer treatment |
| --- | --- | --- |
| Speed and road limit | Exported from LocationSensorListener, normalized units and independent freshness | Keep as first-class per-field observations and overspeed inputs; no fabricated zero |
| Camera/police/incident list | Native descriptors normalized into a few broad kinds; title/position/trigger retained | Preserve original type, subtype, trait, description, validation and lifecycle; distinct useful speech |
| Native current warning distance | Current adapter exports -1 for the native repository | `AlertValidationResult.hasDistanceMeters/getDistanceMeters` exposes an optional native distance; use with its own observation time and validation |
| Native time to alert | Dropped | `hasTimeToAlertSec/getTimeToAlertSec`; useful timing context after semantics/cadence validation; never treat an absent getter default of zero as “announce now” |
| Native priority | Dropped | `InsightPriority.value/preemptive`; preserve raw values and normalize within a Waze policy adapter |
| Native validity | Dropped by current report adapter | `getIsValid`, approaching validation, required distance-in-range; prevent warnings from a merely listed invalid candidate |
| Silent activation | Dropped | Experiment/Familiar/Grouped reasons; preserve source intent and explain suppressed outcomes rather than announcing every candidate |
| Average-speed zones | APPROACHING/WITHIN and partial observed average exported | Add native zone before/in/after state and native entry/exit announcements without confusing a map camera with an active measured zone |
| Other segment insights | Filtered out: exporter selects type 7 only | Traffic, speed bumps, dangerous curves, HOV/carpool/bus lanes, enforcement zones and school zones, with approach/within distance and optional remaining duration |
| Notification insights | Not exported | Title/body, car variants, priority, timeout and removal; current Feature enum includes cyclists. Establish whether the native event is visual-only or audible before generating speech |
| Flock/OSM cameras | Optional layers export geometric ahead distance/trigger; layers start off | Retain provenance and exact OSM camera category; never equate a static mapped camera with a live enforcement event |
| Route traffic/events | Not exported | Native severity, start/end, geometry, duration, jams, partial-lane closure; useful route-specific advisory if related to the main app's route |
| Current road segment | Not exported | Native tile/line/node endpoints and direction can support source road-context/freshness diagnostics; IDs are not portable across map providers |
| ETA, route, lanes and tolls | Not exported | Potential comparison or route-agreement features; unsafe to substitute directly for the main app's turn instructions or ETA |
| Native report actions | Not exposed to receivers | There/not-there/dismiss and similar native actions can be evaluated as explicit user actions; never auto-report merely because the car passed a point |

Native distance is distinct from `triggerDistanceMeters`. The first can say “250 metres to the warning”; the second can say “start warning at 600 metres.” Neither a title containing “600 m” nor the trigger threshold is a substitute for a fresh measured/validated distance.

## 3. Rich warning families

The original APK contains meaningful camera subtypes: speed, red light, combined red-light-and-speed, HOV/bus/carpool, phone use, seat belt, following distance, stop sign, noise, railway and dummy/unknown. A dummy camera must not become a statement that active speed enforcement exists. Police has visible, hidden and mobile-camera distinctions. The current adapter turns the mobile-camera police subtype into generic police.

Hazards distinguish object, pothole, vehicle stopped on the road versus shoulder, road kill, missing sign, oil, construction, broken traffic lights and emergency vehicle. Traits can further identify people around a shoulder vehicle, proximity to the lane or poor marking. Blocked lane has left, center and right. Weather distinctions include fog, rain/snow, flood, freezing rain, ice, wind-related severe events and other weather categories in the native model. Do not announce a severe-weather type unless the native source actually provides it.

Permanent road features include speed bump/topes, toll booth, dangerous curve, fork/merge/intersection, school zone, left/right lane ending, raised/highway crossing, left/right/both shoulder ending and narrow bridge. Waze also exposes sudden slowdown, danger zones and speed-limit-decrease families.

These are potentially useful in Maps/Vela as recognizable messages such as a specific lane closure or an upcoming lower speed limit, provided native eligibility and local relevance are retained. A speed-limit-decrease warning is not the same field as the current road limit: announce a future limit only when a native message/model supplies it; do not derive the new value from an unrelated current-limit snapshot.

Official [road-feature documentation](https://support.google.com/waze/answer/14964557?hl=en) supports the value of features such as bumps, curves, school zones and lane endings, and explicitly ties availability to known/map-editor-provided data. Official [camera documentation](https://support.google.com/waze/answer/15758855?hl=en) describes several specific enforcement types. Those product pages do not prove our pinned APK produces every category on a specific road.

## 4. Enum namespaces must remain separate

Do not share integer mapping tables across native message families. Examples found in this APK:

- AlerterType wire SPEED_LIMIT_DECREASE is 23; the UI-controller type and RtAlertItem.Type use 22. RtAlertItem.Type 23 is TURN_CLOSURE.
- Wire HazardSubType EMERGENCY_VEHICLE is 13; the UI-controller HAZARD_TYPE_EMERGENCY_VEHICLE is 28.
- Wire BlockedLaneSubType LEFT is 4 and RIGHT is 3; the UI-controller blocked-lane LEFT is 1 and RIGHT is 3.
- EventOnRoute.AlertSubType has yet another namespace, with e.g. HAZARD_ON_ROAD_OBJECT 12.

Use `(provider, source_model_namespace, native_type, native_subtype)` to select a verified conversion. Preserve raw source values alongside canonical semantic names. The Waze conversion helpers and native model fixtures must establish mappings; matching an integer from a different enum is a real misclassification risk.

In particular, the presence of the nested protobuf HazardSubType/BlockedLaneSubType enums does not prove those numberings encode every `AlerterInfo.subType` value. The inspected AlerterInfo converter reads `getSubType()` into the UI model as a numeric value. Establish each actual field's encoding at its native producer/consumer boundary; do not automatically remap 13 to 28 merely because both enum names say emergency vehicle.

## 5. Native announcement lifecycle and background viability

`AlerterNativeManager.b(NativeAlertRepositoryUpdate)` receives the native repository. It is a data update, not an instruction to speak every descriptor.

Traced path:

1. `com.waze.alerters.a.s.emit` converts descriptors, including trigger, priority, zone state and abort-on-removal.
2. `com.waze.alerters.a.x` maintains per-ID state holders. `q` consults native validation and range/approach conditions.
3. `com.waze.alerters.b.e` selects eligible alerts, compares priority/preemption, applies close-distance capping and handles silent activation. Its update coroutine `b.j` calls the selected holder's `i()` when the selected identity changes.
4. `q.i()` calls `a.m.f(id)`, which dispatches `AlerterNativeManagerBase.h(id)` to `playSoundNTV(id)` through `com.waze.a.ab` case 9.
5. `q.k()` and zone holders separately report presentation/start and timeout/end. `onAlertStartNTV` is therefore not automatically synonymous with the sound request; do not select a hook just because its name contains Start.

The proposed canonical regular Waze ANNOUNCE boundary is the validated, correlated `playSound` request, not the raw repository or a provider-owned UI card appearing. Other families, such as zone exit and notification insights, have separate audited boundaries and must avoid duplicate announcements for the same underlying warning.

The selection provider is lazy: `com.waze.alerters.b.g.a()` creates its selector. Its dependencies are registered in the native DI module. Running the native engine alone does not prove that selection flows, notification handlers and semantic capture are subscribed during a UI-free session. The Waze provider patch must initialize/observe the existing service-safe singleton flow while leased, with no Activity/CarContext creation and no fake UI-presentation acknowledgements.

This is an explicit implementation feasibility/release gate. If a warning family needs a visible source screen today, the work is to provide an equivalent native background subscription or native callback binding and prove it. Do not quietly advertise that family as ready based only on its enum being compiled.

## 6. Text, sound and source policy

Waze's AlerterInfo already provides title, title-with-distance, description and distance string. Prefer meaningful native content with its language and observation context. Its sound system also has TTS/download/cache/play callbacks, file playback and URL voice assets. Those callbacks can contain route instructions, personal prompts or fragmented/prerecorded audio. Forwarding every TTS string would contaminate the receiving navigator with Waze's separate route.

Use native alerter ID and verified causal context for any exact spoken-text correlation. If correlation cannot be established, a reviewed subtype-specific template/native descriptor message is safer than attaching an unrelated TTS request. Preserve meaning and provenance; do not claim identical Waze voice recordings.

Source category enablement, native invalidity, familiar/grouped silence and a provider-local audio mute are different decisions. The managed mute gate must suppress local playback without destroying semantic production. It must not remove native validation or silently turn an intentionally visual-only feature into a spoken warning. Waze's speed-camera-sound-at-any-speed patch and speed-limit-drop controls can change native policy; expose that provenance and test those combinations.

NotificationInsights exposes a cyclist feature with separate text/car variants and native shown/dismissed events. An ADD notification supports UPSERT; it does not by itself establish ANNOUNCE. Do not send fake native shown/click callbacks when Maps/Vela displays a different UI.

## 7. Emergency vehicles are not identical across providers

Waze has an emergency-vehicle hazard subtype and official documentation describing partner/map-based nearby emergency-vehicle alerts. Its help page currently says the feature is not supported in native Android Auto/AAOS/CarPlay. See [Waze emergency vehicles](https://support.google.com/waze/answer/14716475?hl=en).

This does not prove a live “ambulance approaching from behind” feed equivalent to Flitsmeister. Preserve source type, movement/relationship evidence and uncertainty. A static/partner-reported emergency vehicle must not be promoted into an FM-style moving-vehicle instruction. A patched phone-source-to-Vela-car bridge might render a received phone event, but actual native availability in that background/host mode is unproven and needs its own test. Do not claim that a renderer patch creates missing source data.

## 8. Route-derived data: valuable, but contextual

`NavigationInfoNativeManagerBase` exposes callbacks for current/next segment and instruction, navigation state, route/geometry, ETA, lanes, tolls, traffic, enforcement zones and routing IDs. NavigationRoute contains geometry, events, segments, total time/length, required permits and waypoints. EventOnRoute contains event subtype, geometry/positions, duration, severity, partial-lane closure and native identifiers. TrafficZoneUpdate contains jam sections, percent in traffic and total time.

These can enrich a route-comparison/route-context tier. They must carry a source route generation/identity and availability prerequisites. A Waze “on route” flag only means on Waze's route. A Waze ETA or lane recommendation cannot replace Maps/Vela's merely because both apps have the same destination. Recalculation/deviation must invalidate any prior agreement.

The existing silent startup deliberately does not start a Waze route. Do not silently start one just to fill rich-data fields: that adds routing/network activity, may send a destination to Waze and creates guidance conflicts. Evaluate destination/route synchronization as a separate explicit user feature. First-class portable warnings must work in the tested route-less native mode where supported.

Recommended value split:

| Tier | Value | Policy |
| --- | --- | --- |
| A: core portable warnings | Native camera/hazard/emergency meaning, distance/eligibility, announce timing, road-feature/zone messages | Required first-class adapter work; validate background availability per family |
| B: contextual enrichment | Route traffic/severity, segment context, lanes, tolls, ETA comparison | Expose capability/prerequisites; read-only source attribution and route-agreement gates; never override main guidance automatically |
| C: user actions | Dismiss local card, confirm there/not-there, request route refresh in the main navigator | Separate opt-in/action capability; explicit user gesture and live native identity; no automatic public reporting or Waze reroute applied to the main app |
| Excluded transfer | Account/reporter names, comments/photos, social pings, ads, saved places, personal destination prompts and voice-asset files | Not required for road-warning interoperability; minimize data rather than copying every native getter |

RtAlertItem includes useful distance/on-route/timestamp/title fields but also reporter names, images, comments and user-specific state. Its optional on-demand route list is not a substitute for the validated active alerter repository. Its list getter being present does not establish subscription cadence or route-less coverage.

## 9. First-class architecture consequences

The canonical design must cover four app patches: Waze provider, FM provider, Maps consumer, Vela consumer. Both providers negotiate the same Warning Events interface, playback grants, bounded recovery, capability readiness and conservative silent-provider failure policy.

Extend the model to carry provider identity and native namespace, warning policy/availability mode, native validation/priority metadata, announcement provenance, and optional source route generation. Namespaced identities prevent Waze and FM IDs from colliding. Source switching must revoke and quiesce the old source's output before claiming the new one.

Capabilities describe supported capture separately from enabled/native-available content: e.g. ready route-less, requires Waze route, native-invalid, host-filtered, category disabled, or unproven. “No current reports” cannot be interpreted as “unsupported”; “engine running” cannot mean “all native warning controllers ready.” Required capture/semantic coverage must be tested for both providers before a first-class release.

Do not silently fuse providers in the first release. Either provider can be selected as primary with the same receiving speech/UI. Preserve the other provider's identity and capability profile; do not borrow one provider's speed to time another's warning. A future explicitly enabled supplemental mode needs field ownership, cross-source deduplication, authority and conflicting-report policy. Two navigation apps announcing different providers concurrently are a separate audio-coordination problem; per-provider ownership alone cannot promise device-wide silence from the other app.

The maximum-value combined mode is primary-plus-supplemental warnings in a single receiving app. Keep primary speed/limit authority and every zone average source-specific, while accepting independently relevant secondary hazards into the same scheduler. A secondary emergency may outrank a primary camera advisory. Resolve duplicate cameras using type/geometry/direction/lifetime evidence; preserve disagreement instead of averaging limits or trusting a primary label as ground truth. Claim each provider separately, retain their own grants/outcomes, and degrade secondary coverage honestly if that provider is busy/unavailable. Additional background resource use and any route synchronization need opt-in. This evaluated extension preserves Waze's additional value without making unsafe all-field fusion the default.

## 10. Patch recommendations

| App/patch | Role |
| --- | --- |
| Waze Broadcast navigation data | Extend with rich descriptors, validated native distances/priority/silence, all relevant native warning/segment/notification families, background controller readiness and the same Warning Events API |
| Included Waze Stay awake in the background | Keep the existing route-less engine lifetime; readiness must not depend on speedometer/zone overlay or visible Waze screen |
| Optional Native camera and hazard controls | User-selected native category controls; capture must preserve subtype/enablement rather than merely changing configuration flags |
| Optional Speed limit controls | Preserve native speed-drop message/threshold, and distinguish forthcoming limit from current road-limit field |
| Optional Speed camera sound at any speed | Document/test its policy effect; not a substitute for producing semantic events |
| Optional Flock cameras / Speed camera alerts | Additional OSM source provenance and ahead gating; preserve exact camera type and user switches |
| FM Broadcast navigation data | Equal peer source API and native coverage; retain FM-specific early-warning advantages |
| Maps Waze alerts / Vela External speed controls | Provider-neutral decoding/scheduler/speaker, rich subtype UI, correct selected-source/capability handling and no duplicated old heuristic announcement |

Native module symbols, exact instruction contracts, callback identities and safe threading must be verified against the pinned APK before patch edits. Existing optional source patches may expose native functionality, but they do not create unknown road data or prove availability in a new host mode.

## 11. Verification needed to turn value into a shipped integration

New structural checks should verify presence bits, enum namespaces and exact field meaning against real native classes. In particular test wire 23 versus UI 22, emergency hazard 13 versus UI 28, and blocked-lane direction mappings. Exercise native valid=false, absent distance/time, familiar/grouped silence, preemption and descriptor removal; do not equate positive thresholds with observed distance.

Then drive real Waze repository/selection/segment/notification callbacks in its actual background process and observe the event API, not a hand-crafted receiving packet. Prove that the lazy controllers run with no Activity/CarContext, and that file/TTS/URL sounds remain suppressed while event generation continues. Correlate sound-request identity and message content.

Run all four pairings (Waze/FM → Maps/Vela), phone and car-only, without source routes and with differing/equivalent source routes where relevant. Cover school zones, speed-limit drops, specific camera types, lane closure, weather/object/stationary vehicle, cyclist notification, zone entry/exit, native repeat/clear, two rapid dangers, owner failure, source switch and host-specific emergency availability. Measure source decision, receiver acceptance, audio start/end and pass/clear separately.

The initial schema already tested speed/zone callbacks; that is not acceptance of these new Waze families. This evaluation establishes concrete opportunities and architectural requirements, with explicit remaining runtime proofs. It does not claim the richer integration is already implemented.
