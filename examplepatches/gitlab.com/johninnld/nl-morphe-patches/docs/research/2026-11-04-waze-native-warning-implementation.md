# Waze native-warning implementation checkpoint

This task extends the existing **Broadcast navigation data** patch into the [reviewed four-app design](../superpowers/specs/2026-11-02-navigation-provider-warnings-design.md), reusing the implemented FM transport, ownership, scheduler and Maps/Vela speakers. It does not replace Maps/Vela navigation with a Waze route. The user's clarified goal is integration parity: recover warnings dropped by the current Waze bridge, without assuming Waze offers warnings that FM lacks. Preserve Waze's native distinctions in the shared protocol; route, ETA and lane-guidance enrichment are outside this implementation batch.

## Recovered design and current base

The expanded design, [Waze research report](2026-11-02-waze-first-class-provider.md) and [model inventory](../waze/native-provider-inventory.json) were recovered from local commit `65a4d8c`. Those three files retain their original contents. Their historical statement that implementation was pending must be read against the current FM implementation.

Implementation starts from `304bbcf66468e517a3a8f48422fe959c154fd21f` on `feat/waze-native-warnings`, in the existing isolated `navigation-startup` worktree. This includes the FM review corrections at `c521111`, whose signed candidate was transferred for user testing. The primary dirty checkout and the frozen, uncommitted Frida work are preserved. No phone or emulator operation has been performed for this Waze task.

## Supplied input: same DEX, different APK envelope

| Input | SHA-256 |
| --- | --- |
| Supplied complete Waze APKM | `62418bf0898ea1cc6c6926a136bb08bedcfcbff31de3bbc357afc6ef579db1d3` |
| Its original base APK | `b1504af4bcbe50325195774a891f50f7189cdef7ad38ee67a2f5b7af00f29e4d` |
| Retained research base APK | `5ab9853c76a3f83a493e1872f232bbbde96ec61245cbca117aa39e176cdfe9c4` |

All ten `classes*.dex` entries match byte-for-byte between the supplied and retained bases. The existing decompiled corpus and method discoveries can therefore be reused. The supplied base declares `com.waze`, version `5.26.90.901`, version code `1030746`, min SDK 29 and target SDK 36. SDK/manifest/resource handling remains variant-specific; equal DEX does not make every APK entry identical.

SDK `apksigner verify` succeeds and the publisher certificate SHA-256 is `03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7`, matching the recovered research. The complete 28-split archive is preserved for eventual Manager-equivalent merging and patching. The extracted base and retained decompiled corpus are reusable inputs for this active task, not per-run build scratch. Exact DEX hashes, archive entries, input and REA receipts are retained under ignored `.analysis/waze-native-warnings/`.

## Existing implementation versus required changes

| Area | Existing behavior | Required extension |
| --- | --- | --- |
| Waze report export | `NavigationBroadcasts.alerts` reduces descriptor types to broad schema-1 kinds, drops native current validation distance, priority/silence and subtype/trait details | A separate native event adapter preserves meaning, presence-qualified fields and source policy without turning repository snapshots into speech |
| Segment insights | The exporter filters to segment type 7 for average-speed zones | Cover every required segment family and correlate linked alerters without duplicate speech |
| Notifications | No event-channel notification capture | Add/remove, native text/car variants and expiry; ADD remains state unless native audible intent or explicitly negotiated advisory policy authorizes speech |
| Waze control service | Startup/health only; no warning endpoint | Reuse the authenticated warning endpoint and durable audio-owner rules, with Waze's own profile and coverage |
| Receivers | FM-specific event negotiation, settings/status attribution and event-audio suppression | Generalize provider profiles/settings and retain source attribution, existing FM preferences and legacy Waze compatibility |
| Speaker/transport core | Implemented and reviewed for FM | Reuse it; do not create another TTS engine, scheduler or startup mechanism |

## Native boundaries re-established

Fresh REA inspection on the supplied base confirms `AlerterNativeManagerBase.h(AlerterId)` dispatches case 9 through the native looper. The matching DEX corpus shows that case invoking `AlerterNativeManager.playSoundNTV(byte[])`. The selector update coroutine calls the selected holder's `i()`, then `alerters.a.m.f(id)` reaches this dispatch. This is a correlated sound-intent candidate; source eligibility, silence and other-family coverage must still be respected. Repository publication and UI `onAlertStartNTV` are different boundaries.

Fresh REA inspection also confirms `alerters.b.g.a()` resolves the lazy selector. Its native DI factory registers `alerters.b.a`, the combined collection, state-holder factory and native manager. The selector constructor subscribes to the native collection with a native coroutine scope; the collection subscribes to native repository updates. Existing code uses `kotlinx.coroutines.a.ab.l(Class)` to resolve native DI singletons. These provide a service-safe path to investigate without constructing a Waze Activity. Singleton resolution alone will not be reported as runtime controller readiness.

The native converter reads `AlerterInfo.getSubType()` directly into the UI model after converting its wire type, while separate subtype enum namespaces differ numerically. Preserve raw namespace/value and verify actual interpretation rather than assuming protobuf hazard or blocked-lane enum values encode that untyped field. Known priority, validity, familiar/grouped silence and native source settings must survive managed local mute.

## Batch sequence and retained gates

1. Implement Waze's semantic capture and native controller/lifecycle bindings, with exact original-method guards and complete required-family accounting.
2. Connect its endpoint and generalize both receivers' profiles, settings, attribution and legacy-audio suppression while preserving FM behavior.
3. Complete related product tests alongside each implementation batch, then run grouped static/build/unit checkpoints using the existing verification workflow.
4. Rebuild/sign intended combinations, then perform bounded all-four-pairing acceptance with the required Frida coverage, provider silence and exact cleanup. Current capture, UI-free production, route relevance, speech/output, phone/car and full-scope acceptance remain unproved for this extension.

The existing validation-tooling freeze remains in force. New probes, runners, observers, fixtures or framework changes require explicit named approval. No such tooling was created or changed for this checkpoint, and no runtime claim follows from the static findings above.

## Implemented checkpoint and actual-input patching

`94d6d1382fbbd433e53807c500df958a3c8a1178` connects Waze native descriptors, sound decisions, zone selection/exit, segment state and notification lifecycle to the existing FM warning endpoint. Maps and Vela now select the provider's profile and preferences while retaining their original speakers and navigation. A repository snapshot or notification ADD remains state rather than an announcement. Zone selection and the original UI sound callback correlate to one entry decision in either order.

The next connected batch applies FM's disjoint schema-1 views to Waze: confirmed event clients retain the full display feed; legacy recipients receive speed/limit/active-zone fields with report/approach announcements disabled during exclusive or uncertain output. The independently optional Share alerts bridge clears cached pins and heartbeats while suspended, without changing its saved setting. Endpoint startup begins fenced until the durable output ledger is loaded, preventing a legacy delivery window before uncertainty is known.

The original complete APKM was patched with Morphe Desktop 1.19.1 using FULL DEX compilation and fingerprint validation. All 21 selected patches applied with no failures, including Broadcast navigation data, Share alerts with Maps, Average speed zone bar, Native camera and hazard controls, Speed limit controls, and Speed camera sound at any speed. This is a real split-input patch/rebuild check, not just a patch-library build. The unchanged public Morphe signing identity verifies the bundle; SDK apksigner and zipalign verify the test-signed APK. Nothing was installed on a phone or emulator.

| Retained acceptance input | SHA-256 |
| --- | --- |
| Signed MPP, compatibility/startup-fence batch | `2c13af05a8e04d2be0de6e044139927a5ed68adae96c68199e15337656b12677` |
| Test-signed patched Waze APK | `9860136bfc79e1ab39f58bd4022f0e8e8ded9c3cfcea50c98a24338193ab95f6` |

The local `checkpoint-20261104-c` and `checkpoint-20261104-d` receipts retain exact base/source-file digests, per-module outcomes and quiescent process-group cleanup. Unaffected passing checks from the preceding complete `verify.cjs` checkpoint are reused; the affected FM and Waze tests were rerun after the test-handshake correction. Both build checkouts and all patching scratch are removed. Only compact evidence, the signed bundle and patched APK needed for the pending acceptance session remain.

## Remaining gates

- **Coverage is deliberately incomplete:** Waze's profile still advertises `complete=false`. Structural bindings and the successful APK rebuild do not authorize an exclusive first-class voice claim.
- **Native semantics:** verify the per-family status and bound native decisions at runtime. The artifact-backed roadside/safety/crash-history classification, conservative urgency mapping and confirmed managed-output policy are described below. Optional route/ETA/lane-guidance features remain outside this batch under the user's clarified scope.
- **Receiving relevance:** the scheduler now checks fresh point warnings against the receiver's active directed route, including ambiguous/missing context and a changed context at grant reply. Runtime acceptance of those checks remains open.
- **Overlap:** native/OSM events retain separate provenance and explicitly unresolved equivalence when directed-road evidence is absent. No radius-only equivalence or successful duplicate suppression is claimed.
- **Runtime:** establish actual UI-free controller production, warning/message correlation, silent source output, receiver speech outcomes, source switches and phone/car acceptance for the required pairings. The explicitly approved observer adaptation is committed at `3b4ec77`; it now covers the selected Waze producer and Maps/Vela receiver. Its successful attachment and endpoint admission do not establish native capture or playback. The bounded runtime results below supersede the earlier pending observer-approval status.
- **Delivery:** finish review and acceptance before marking coverage complete or promoting a stable release. The retained signed candidate is an engineering acceptance input, not a published release.

## Native family policy and receiving route checks

REA resource decoding on the supplied original base (`ev_ae7a32e7d3ffe7dbc30f55f960da5f719a6942182a228c5a86fd58fa5aed005e`) resolves the formerly unproven family names. `ALERT_TITLE_PERSONAL_SAFETY` is a safety-incident warning, the five SOS titles describe roadside assistance, and `ALERT_TITLE_GUARDIAN_PS_PS` describes crash history. The complete retained resource evidence includes the target digest and decoding limits: smali was skipped, one markup entry was omitted, and the default string table is limited to the first 2,000 of 4,364 entries. These specific resource entries were present; absence elsewhere in that bounded table is not evidence of absence in the APK.

| Pinned native types | Adapter policy |
| --- | --- |
| POLICE, CAMERA | Native enforcement subtype/text, P1 |
| ACCIDENT, HAZARD, CONSTRUCTION, CLOSURE, BLOCKED_LANE, BAD_WEATHER, ANIMAL, SUDDEN_SLOWDOWN | Native road-warning subtype/text, P1 |
| TRAFFIC_JAM, TRAFFIC_INFO | Native traffic subtype/text, P2 |
| PERMANENT_HAZARD, SPEED_LIMIT_DECREASE, GUARDIAN | Native road-feature or crash-history text, P2 |
| PERSONAL_SAFETY | Native reported safety-incident text, P1; no route action exported |
| SOS | Native roadside-assistance subtype/text, P2 |
| DANGER_ZONE and descriptors with ZoneAlertData | Native selected zone phase and message; exit template retains explicit template provenance |
| OTHER, DYNAMIC, UNRECOGNIZED | Native-text fallback with original type/raw subtype, P2; no inferred urgency |
| CHITCHAT, PARKING, PARKED, ECO, REROUTE | Social, personal parking or separate source-route content excluded from road-warning speech |

All audible rows still require native validity, absence of silent activation, current identity correlation and an actual native sound/selection decision. The native priority/preemptive values remain metadata. Waze's card-preemption flag alone does not authorize P0 speech or interruption of receiving navigation guidance. Unknown types without usable native content remain unsupported rather than receiving invented text.

The shared scheduler applies receiver relevance to fresh as well as replayed `point_ahead` events. Both receivers use their original directed route geometry and a genuinely fresh, accurate location fix. Clearly passed/off-route points are rejected; parallel/ambiguous legs, unavailable geometry or stale/missing fixes yield CONTEXT_UNVERIFIED and wait only within the original native announcement window. Nonspatial native warnings and explicit speech previews are exempt from point geometry. A held point cannot block a nonspatial emergency behind it in the queue. Context is checked again after the asynchronous playback grant and before speaker submission; a route change also cancels accepted but unstarted output. These checks neither start Waze navigation nor create later announcement authority.

The resulting four-app engineering candidate uses signed MPP SHA-256 `fa431fd1d01352ebfaeb4b5510250c736f893c940bea74bf0fad9c8057afe4fd`. Actual-input patching applied 21 Waze, nine FM, four Maps and one Vela patch with zero failures. Every APK passed SDK signature and alignment checks. Exact input/output hashes, patch reports and cleanup receipts are retained under `.analysis/waze-native-warnings/checkpoint-20261104-g/`; this is the pending acceptance input, not a published release. Passing evidence from the grouped checkpoint is retained, with only affected failed tests rerun after correcting their test data. Runtime acceptance and the incomplete Waze coverage flag remain unchanged.

The cached native startup trace also shows `com.waze.ls` launching `com.waze.ci` case 15 in its Application-owned coroutine scope; that case resolves `alerters.b.o` and calls its suspending `f()` collector. The collector filters zone descriptors using native validity before producing entry/exit holders. This supports reusing the original headless initialization path rather than creating another zone subscription. It is static evidence, and does not prove that the collector is running in an exercised process.

## Confirmed output ownership and native audio boundary

The user explicitly selected **“Use Maps/Vela output choices, as with FM”** for managed Waze sessions. The receiving map's reviewed categories and Voice/Tone/Silent choice therefore own managed output. Waze's local per-camera sound switches, below-speed-limit restriction and playback routing remain relevant to Waze's own output. Source warning enablement, native validity, familiar/grouped silence, identity correlation and receiver relevance remain separate eligibility requirements. This decision does not turn visual notification ADD events into announcement authorities.

The supplied ARM64 split contains `libwaze.so`, SHA-256 `631dfe829cdc4d20c30ca7881ccb449b8c66292b95226d8458b7a8ca6523831a`. Its exported `Java_com_waze_alerters_AlerterNativeManager_playSoundNTV` is at `0x2bc4860` (52 bytes). Decoded dynamic relocations and the native vtable identify the `AlertsServiceImpl` target at `0x2cdaa40`, which reaches audio dispatch at `0x2cd60b0`. That dispatch calls a per-descriptor audio predicate before file/TTS/fallback handling; its rejected branch logs that sound is disabled. Camera dispatch reaches native config IDs 502–512, 680 and 686, including the named below-limit sound flag. These downstream playback gates are why the confirmed managed-output contract captures the validated Java sound request upstream of local Waze playback.

The initial Ghidra request was canceled because that provider requires whole-program auto-analysis before serving a symbol query. Its database/resources were closed; no partial analysis result was treated as evidence. Focused GNU/LLVM ELF, relocation and disassembly tools supplied the retained native trace instead. The static symbol table is stripped, while the dynamic JNI exports and RTTI remain available. Android's [packed-relocation reader](https://android.googlesource.com/platform/bionic/+/master/linker/linker_reloc_iterators.h) documents the relocation encoding interpreted by LLVM. The trace and function-byte receipts are under `.analysis/waze-native-warnings/native-policy/`; nothing in this pass executed the native library or exercised an Android app.

## Per-family readiness status

Waze's optional startup STATUS metadata now separates alerters, zones, portable segments, source-route context, visual notifications and patch-owned OSM input. Each row distinguishes the guarded capture binding, integration enablement, controller resolution/observed native decisions, current state and actual observation clocks. Native category enablement and host filtering remain explicitly `unobserved` where the adapter has no authoritative value. Empty data is `no_current_state`, not evidence that a family is unsupported. Reading STATUS does not refresh any observation clock.

The receiving session retains a defensive copy of bounded primitive family metadata. Older providers may omit it; malformed optional metadata is discarded without weakening the actual warning handshake. Family metadata cannot set the capture-complete flag or grant audio. Source changes and connection loss clear it. Native notifications retain `visual_only` output, and source-route context retains its route prerequisite. The overall Waze profile remains incomplete pending its required capture/runtime acceptance.

The normative [Waze coverage contract](../waze/native-warning-coverage.json) now pins all 126 guarded native method contracts, 26 wire types, 96 scoped UI subtypes, family treatments and the confirmed receiving-output policy. `WazeWarningTypes.MANIFEST_DIGEST` hashes that contract rather than the historical structural inventory. Required capabilities explicitly include receiver-owned output, enforcement-zone meaning, roadside/safety/crash-history semantics and fresh receiving-route relevance. An older experimental receiver missing those semantics cannot obtain complete-warning audio ownership. The existing native-binding component tests compare the contract and advertised digest with the actual guarded cohort; the document is product negotiation data, not a new validation framework.

The status batch also prevents an unsupported blank native message after cache expiry from leaving a partial record that could crash a later callback or status read. Linked segment state is staged until the whole update has passed parsing and duplicate checks. Neither correction creates announcement authority from state.

Headless initialization also prepares the existing warning controllers when Waze's suspending initializer completes. The immediate return can precede native readiness, so relying only on preparation immediately after `initialize()` could miss that transition. This uses the existing completion callback and native singleton paths; no new timer, startup mechanism or UI acknowledgement is introduced.

An independent read-only source review found and verified two corrections. Urgent preemption now chooses an enabled, relevant candidate separately from the queue entry awaiting filtering/rejection; an earlier off-route P0 cannot hide a valid nonspatial emergency, and a filtered P0 cannot interrupt wanted ordinary speech. Voice preparation likewise follows an audible candidate, while rejected entries can be retired during unrelated playback. Removing a correlated segment now retires its enrichment without clearing or rearming the underlying alerter, extending its observation clock or inventing announcement authority. The follow-up source review found no introduced issue in this correction; runtime acceptance remains open.

## Approved observer and headless readiness acceptance

The observer-only checkpoint `3b4ec77931f63f2c4726e7e9e27fcdf03f74cc8f` preserves original method results and exceptions, selects the source and receiver explicitly, requires their matching hooks and stops on lost coverage. The focused seven-test observer suite, complete Python suite (570 tests, 45 skipped) and Frida 17.23.3 compilation passed. No new runner or probe was added.

The current product acceptance input is the four-app bundle built from `ea605a5192b77a14c20c6ee1f3cb9d2780da02af`, signed MPP SHA-256 `df611faba35edfba5397ea7ff08d9e31a0070903f6ca5c3f8aa364f45e62f0a3`. The preceding artifact tables describe historical checkpoints and must not be used as the current input selection.

Following explicit approval, one further 60.041-second quiet session used this candidate and the unchanged compiled observer on owned `emulator-5590` / `native_warnings_ui_api34`. Maps started Waze through the existing control and engine services without a Waze Activity. Both processes had their required hooks installed. Native engine readiness was observed true 29 times after six starting observations; observer coverage remained intact and no crash was reported. This closes the native-engine startup uncertainty for this exercised pairing, with Frida attached. It does not establish warning-controller production or a performance latency result.

No repository, native sound, zone, segment or notification warning callback arrived during that session. The debug bridge self-test currently omits native validation fields, so it cannot prove valid selector-to-announcement behavior. Positive native capture, silent-source audio behavior, receiving speech and the remaining pairing/phone/car gates therefore remain open. Waze still advertises `complete=false`; it has not been released as a complete voice provider. The optional visual-only notification policy is unchanged.

Compact receipts and compressed traces are retained under ignored `.analysis/waze-native-warnings/observer-acceptance-20261104/` and `.analysis/waze-native-warnings/headless-60s-20261104/`. The initial installation admission failure occurred before application launch and was restored before the successful attachment session. Each completed session restored the original app installation state and emulator media volume (5), removed its snapshot/server/forward/scratch and stopped the owned emulator. The phone was not operated. No approval for further validation-tool changes is inferred from these results.

## Native capture and lifecycle gate passed

The source checkpoint `7d4d482d396bec4afa44bab1a3c1dc0145ee04e4` completed the bounded, Frida-attached capture batch against the actual patched APKM. Maps received exactly six native announcements: police, camera, hazard, zone entry, zone exit and a later police occurrence. The repeated repository update added no announcement; invalid input remained state. All nine native segment types and notification add/remove also traversed their original callbacks. Instrumented source-emission to receiver-delivery observations were 43–62 ms, within the existing native announcement windows; this is functional evidence under tracing, not an uninstrumented performance benchmark or live-road availability claim.

The native zone-phase publisher is captured independently of its UI queue insertion result. Expired tracked zone IDs are reconciled only after real native exit/removal, on the main looper, with authoritative current-state rechecking. Started source Activities and a live source car service protect native UI consumers. No native shown/start/timeout acknowledgement is generated. This prevents a retained headless zone card from blocking later ordinary warning selection. UUID-less sound requests retain full event identity through unique provider/unique-ID correlation; ambiguous requests and conflicting UUIDs fail closed.

The resulting contract pins 130 original methods plus queue/selector field and interface ABI. Complete local verification passed with 694 Android tests and 571 Python tests; all four APKs passed actual-input patching, signing and alignment checks. The canonical signed MPP for this source checkpoint has SHA-256 `e471171658ddd32651e89f78dfbd33dc77abf8a2829a2548a922010cef6dbde0`. Both the runtime and build workspaces completed owned-process and storage cleanup; the original emulator apps, media volume and debug property were restored. Compact runtime receipts are retained under ignored `.analysis/waze-native-warnings/native-selection-p/`.

The verified capture profile may now enable audio negotiation only when the complete pinned native cohort is actually bound. This enables the next engineering playback candidate; it does not mark receiver playback, navigation coordination, remaining mode/lifecycle/compatibility or physical phone/car acceptance complete. No stable release has been published. Historical incomplete-profile statements and artifact tables above describe their respective earlier checkpoints.
