# Native warning implementation review

Latest development source/build checkpoint: `c521111`, with all three subsequent review findings corrected, the complete local workflow passing and all three APKs rebuilt. Installed runtime and physical/car acceptance remain incomplete. The original review checkpoint was `d0bc0d1`; earlier artifact records below retain their own identities.

## Product scope

Maps and Vela own trip routing, route selection and turn-by-turn guidance. FM supplies native alerts and existing speed/limit/zone data while its UI remains backgrounded. Receiving-route inspection only checks stale delayed point alerts against an existing native route. The FM average-speed model's `gpsPath` is the camera segment, not a trip route.

## Requirement review

| Requirement | Implemented path reviewed | Remaining boundary |
| --- | --- | --- |
| R1: native capture and meaning | Separate original-DEX contracts and hooks for FM14/FM15; versioned coverage manifest; model/text/language adapters in `NativeWarnings` and `NativeWarningText`. Original native decisions remain upstream of capture. | The same-ID native-repeat and changed-unsaid cases remain final-pass checks. Enum accounting and original ABI guards already have evidence. |
| R2: immediate delivery and priorities | `WarningEndpoint` journals and delivers independently of schema1 heartbeat. `WarningScheduler` orders native authorities and allows P0 preemption. Its passage filter applies to replay or an authority already over one second old; a fresh native announcement does not wait for route geometry. | Final timing/outcome figures must name the final producer artifact. Existing priority and delivery runs remain retained. |
| R3: visible warnings and native speech | Maps uses `MapsWarningSpeaker` and the original guidance coordinator. Vela uses its original guide and supported system/neural paths. Readiness and effective Voice/Tone/Silent modes are distinct; native mute remains authoritative. | Targeted final mode/engine/failure checks and supported car routing remain acceptance items. No new speech/routing engine is required. |
| R4: provider silence and one owner | Existing managed provider lease, original playback suppression and completion handling; authenticated `WarningAudioOwner` leases, nonce/epoch checks and a durable pending grant. Unknown output blocks later grants. | Retain passing BUSY, release, death and restart proofs. Check the remaining source-switch/lifecycle seam in the final pass. |
| R5: honest lifecycle/status | Speaker acceptance is separate from actual start/completion. Failure without positive quiescence remains uncertain. Both consumers expose degraded/owner/mute status; Vela's actual waiting status is captured. | Final-pass output signal and remaining degraded UI cases; physical audibility is not inferred from callbacks. |
| R6: replay, cancellation and expiry | `WarningJournal`, `WarningConnection`, `WarningSession` and `WarningScheduler` preserve sequence/session identity, original authority/deadline, bounded replay and stale-work fencing. Actual started output is not retried speculatively. | Delayed-alert relevance around bends/nearby legs and changed-unsaid payload cancellation remain explicit checks. The expired-state announcement-ID defect is fixed below. |
| R7: existing feed and compatibility | Schema1 remains separate. Legacy control sessions block full ownership, unsupported event capability stays display/legacy compatible, and Waze selection remains independent. Existing route and car-session lifetime signals feed the startup client. | Targeted mixed-version/package and current car-only/session checks; do not claim an undetectable historical broadcast-only client can be revoked. |
| R8: acceptance and delivery | Versioned fixtures, native callback/source-ACK joins, original APK guards, Android builds and the maintained local verification workflow are present. | This requirement is still open. Remaining integrated, timing, authorized phone/car checks, final review and separately approved stable promotion are not replaced by a green build. |

No further missing core implementation block was identified in the reviewed paths. That is not evidence that every unexecuted scenario will pass. A confirmed final-pass failure may require a product correction.

## Confirmed correction

The producer's bounded warning-state cache previously owned its announcement counter. After state expiry, a later accepted native announcement for the same warning/phase could reuse the earlier index and therefore its authority key.

`d0bc0d1` allocates accepted announcement indices independently of expired model state. The counter advances only for a native ANNOUNCE; state updates do not create speech authority. This changes identity bookkeeping, not native relevance, mute decisions or navigation.

The expiry regression failed before the correction. All 172 FM component tests pass afterward. The replacement producer also applies all nine intended FM15 patches through FULL validation and independent emitted-APK checks.

## Receiver reconnect correction

The subsequent source review found that `WarningSession` fenced callbacks only by the startup ticket. Replacing an event endpoint within the same ticket could let the retired connection's later close, owner-revocation, event or snapshot callback affect the replacement scheduler/view. Incompatible event declarations also left the previous connection attached until the startup client completed its asynchronous disconnect.

The session now binds callbacks to the specific connection and serializes the validity check with delivery. Detachment invalidates that identity before retiring transport and cancels old output once. An incompatible event declaration detaches immediately. This preserves the retired transport's terminal/release IPC for outstanding output; it does not erase grants or claim that uncertain audio stopped.

Two regressions in the existing `WarningConnectionTest` exercise real endpoint handshakes, same-ticket replacement and incompatible negotiation, then deliver callbacks retained from the old connection. All 100 shared warning unit tests pass, and both Maps and Vela release Java compilation pass in the same offline checkpoint. No runtime session or validation-tooling change was performed. The rebuilt candidate below includes the correction; installed acceptance is still required.

## Rebuilt development candidate at `02a75d5`

The offline build at `02a75d58388d8df53b49fe0c3f8593aa2ff27f1c` produced a signed MPP with the unchanged Morphe signing identity. Patch tests report 54 tests with nine skips; FM, Maps and Vela component suites report 176, 81 and 90 tests respectively, with no failures. Skips remain explicit and do not close missing acceptance gates.

The same bundle was applied in FULL mode with fingerprint validation to the supplied FM15 split input, pinned Maps APK and pinned Vela APK. Their intended combinations applied exactly nine, four and one patches, with no failed patches. All three APKs retain the existing owned-emulator signer. Package/version declarations and application-file preservation through signing were checked independently. The initial FM comparison counted two empty ZIP directory records removed by the signer; its failure and the exact directory-only difference remain recorded. No application file was added or changed by signing.

| Current development artifact | SHA-256 |
| --- | --- |
| Signed MPP | `f6a7d8f7c544a1d04f869ee70de3c8277aa72694a3c823d4c2567f98bfa4c98a` |
| FM15 APK | `eb86d3b68999524c0a8891e54df92f11a878fb028ea2995adf605f95f54bf7e6` |
| Renamed Maps APK | `a43e6c9fbec636b3fd321041347d4a8451b02ff9a0467786155837d1a2c35694` |
| Vela APK | `6ab4dae4f12a19a3127981e103c82a4edea049679d13a32f0735e133cc9b67be` |

Focused REA inspection of both emitted receiver APKs confirms the per-connection callback identity and synchronized callback delivery in their compiled `WarningSession.prepare` implementations. Static inspection does not prove installed behavior. These artifacts have not been installed or run; no phone was changed. Compact build, patch, signature and decompiler receipts are retained in the ignored `candidate-02a75d5` directory, and the delivery manifest references its canonical files. Per-run build directories, unsigned/aligned duplicates and patcher scratch were removed. Remaining integrated, phone/car, review and release-approval gates stay open.

## Complete local verification at `3d2790b`

On 2026-11-04 the complete `scripts/local-release/verify.cjs` command set passed in a clean checkout of `3d2790bdbdccbf8d261a1200672ddd638be3710d`. It includes history/identity checks, 215 release/publishing tests, 563 Python tests (47 skips), 608 Android tests (14 skips), the patch build/catalogue, Medium bundle/tests, and strict bilingual documentation/site checks. There were no test failures. The documentation checks covered 110 app pages, 95 bilingual page pairs and 191 rendered HTML files with local links and anchors verified.

The verification checkout and all its build/dependency storage were removed after process quiescence; the receipt records `cleanupRequired=false`. Compact logs and test results remain in the ignored `verification-3d2790b` directory and are referenced by the delivery manifest. The product source is unchanged from the signed `02a75d5` candidate; `3d2790b` only records its artifact evidence. This closes the complete local verification gate for that revision, not installed runtime or physical/car acceptance.

## State-only semantic text correction

Offline inspection of the retained-repeat trace found a state-only zone message containing `100 km/h on the null` when the private native model had no road name. The report-list path bypassed `NativeWarningText` and preferred a generic native UI subtitle. That separate path also lost a weather hazard title and the actual free-text instruction/language of an early-warning report arriving before speech.

New state entries now use the existing audited model-aware formatter. Existing entries retain their previously captured announcement text and language. State updates remain UPSERT-only with no new announcement authority; native detection, eligibility, routing, mute and deadlines are unchanged. The duplicate generic text helper was removed.

Two regressions added to the existing component tests use its existing weather and early-warning models. All 178 FM component tests pass, including retained-announcement text and native-repeat identity regressions. This source correction is not yet in the signed `02a75d5` candidate. Its rebuild and applicable final verification remain open; the earlier complete workflow result stays bound to `3d2790b`. No new validation tool or runtime session was used for the correction.

## Rebuilt state-message candidate at `9889c38`

The correction is now included in a new signed MPP and FM15 APK from committed `9889c383adf574b6ef9d8309a6e526cb4a0ce218`. Complete `scripts/local-release/verify.cjs` execution passed in a clean checkout: 215 release/publishing tests, 563 Python tests (47 skips), 610 Android tests (14 skips), Medium checks and strict bilingual documentation/site checks. The checkout was removed with `cleanupRequired=false`.

| Updated development artifact | SHA-256 |
| --- | --- |
| Signed MPP | `96c1ecd5ff09ca589b415a4a75eeb21f6340ca4969b2c18f00351150d951c4c4` |
| FM15 APK | `8a7143971b6cd05714bdab128746794aa3b7fd624a866630f4b9b41762209b01` |

Maps, its car bridge and Vela MPEs are byte-identical to the `02a75d5` bundle, and their patch/shared source is unchanged. The signed Maps and Vela APKs recorded above are reused. FM15 applied exactly the nine intended patches in FULL mode with fingerprint validation and no failures. Signing preserves application files. Its native libraries match the existing startup contract: MapLibre is the intentionally restored pinned upstream library, while the other libraries match the original input.

Two collection/check mistakes remain explicit in the ignored receipts: the initial bundle selector included source/documentation bundles after verification had passed, and a blanket original-library comparison incorrectly included the intentional MapLibre replacement. Runtime-bundle collection was recovered without repeating the test suites; all temporary build/scratch storage is cleaned. The updated manifest references canonical files and exact reuse evidence. No emulator or phone was run for this rebuild. Installed runtime, phone/car and final review gates remain open; this is an unpublished development candidate.

## Focused review correction batch

The subsequent read-only source review confirmed three P2 defects. Same-ID native report updates could retain obsolete text; same-connection resync ignored missed CLEAR/revision records for already accepted unsaid audio; preparation was cached even when a cold guide or unavailable engine could not prepare. The preliminary standalone late-grant/CLEAR concern was suppressed because the real connection's serial worker preserves that ordering.

The product corrections now refresh changed model text/instructions and language while retaining native announcement identity, reconcile snapshot cancellation/revisions before scheduling retained authorities, and retry idle preparation at most once per second while a valid warning or preview waits. CLEAR also removes revision-retry intent, so later state cannot rearm a cancelled authority. Unchanged captured announcement text remains intact. The text fingerprint includes formatted model content, covering context-formatted subtitle changes without new free text. Maps replaces a failed TTS initialization while retaining initializing instances and fencing obsolete initialization callbacks; Vela's native initialization guard is unchanged.

The grouped checkpoint passed 186 FM, 82 Maps and 90 Vela component tests and all three release Java compilations. A final retry-bound refinement then passed all 23 scheduler tests and the three release Java compilations; unchanged passing component evidence is retained. The first checkpoint's new test incorrectly compared serialized grant objects by Java reference; its failure is preserved, and the corrected assertion checks protocol identity. Focused read-only re-review found the three original source findings addressed with no concrete residual defect in those changes.

Compact test/review receipts are retained in ignored `review-fixes`; each terminal build's owned outputs were removed after quiescence with `cleanupRequired=false`. No tooling code, probe, runner, observer or framework was changed, and no emulator or phone session ran. This batch is not yet in the signed `9889c38` candidate; complete verification, a rebuilt candidate and remaining installed/physical acceptance are still required.

## Verified three-app candidate at `c521111`

The review correction batch is now included in the signed MPP and all three rebuilt APKs from `c521111fa48a4beb0c06e2c6d7e69233d9923639`. Complete local verification passed in a clean checkout: 215 release/publishing tests, 563 Python tests (47 skips), 620 Android tests (14 skips), Medium checks and strict bilingual documentation/site checks. The source-specific component counts are FM 187, Maps 82 and Vela 90. All failures/errors were zero; skips remain explicit.

| Current development artifact | SHA-256 |
| --- | --- |
| Signed MPP | `a89a3f1bd157a3ebee5d12dcccedaf06e58a51ed817413156ee24b5b336050cc` |
| FM15 APK | `75bf9e7c24b8145a012cdc88990d59095c9cd973b324aa0c646aac8ffadedddb` |
| Renamed Maps APK | `cc7ca78fc08729d5263912d2aaad945f2266d96ad3f71506f472f787fae41e2a` |
| Vela APK | `8c12f91e855e7efed70966bef19dec8388d6c0918de06436814f1787289de55a` |

The same signed bundle applied the exact intended combinations: nine FM15, four Maps and one Vela patches, with FULL bytecode/fingerprint validation and no failed patches. Morphe signing and the existing APK test signer, emitted package/version declarations and unchanged application files through signing were verified. FM native libraries match its existing startup contract. All receivers were rebuilt because the shared scheduler changed.

The verification checkout, dependencies/build outputs, patcher scratch and unsigned/aligned copies were removed; `cleanupRequired=false`. Canonical artifacts, source archive and compact receipts remain under ignored `candidate-c521111`, referenced by the delivery manifest. No tooling changes or emulator/phone session occurred for this build. These APKs have not been installed or run. Earlier runtime results remain tied to their original artifacts; all remaining named runtime, timing/output, phone/car, final evidence-review and stable-promotion gates stay open.

## Earlier delivery artifacts and evidence reuse

These are development validation artifacts built from the working tree containing the identity correction. Their receipt records the build base and dirty fix explicitly. Stable release automation will build from the approved committed head; these files are not a published release.

| Artifact | SHA-256 |
| --- | --- |
| Signed bundle after identity correction | `66abe63b4e27e2bc06b9719f5be65efa96d0fd181b124e6cad53990e1f4b46d1` |
| Replacement FM15 test APK | `19d40560cb885f868ffeeb936f12a0daa0e7fa666776acf1582e85e63b6c2ecd` |
| Existing Maps test APK | `3285d836bfb7caefd361fec42d7ed080017021f885eabf331b02b88287fb8839` |
| Existing Vela test APK | `958bd90f477c45d8210f797b34e8649162d4153238419ab2ab7af856cd9edf19` |

The earlier FM15 runtime corpus names producer `13dc…` and bundle `86728…`. Keep those identities in its records. It remains evidence of its recorded behavior and unchanged component paths; it is not silently relabelled as final-artifact acceptance. The final integrated pass must include the replacement producer's repeat identity seam.

The Maps speaker last changed in `7550659`; the Vela speaker and shared scheduler last changed in `64c000c`. Their existing component and adapter evidence can be reused where the exact source/binding is unchanged. The FM15 producer profile and the startup capability change have their own current evidence. Rebuilding every unchanged adapter for every warning enum is not a design requirement.

## Finish sequence

1. Preserve the verified implementation and recorded zone/recovery results; freeze further harness expansion during implementation review.
2. Use the existing tools for one grouped final integrated pass over the remaining named criteria. Retain passing checks. Investigate a confirmed behavior failure with a focused reproduction before changing code or tooling.
3. Prepare the reviewed source, signed bundle, artifact matrix and bounded limitations for delivery. Complete authorized device/car acceptance and required promotion approval before stable publication.

The existing [acceptance record](2026-11-03-native-warning-acceptance.md) and [design](../superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md) retain the full criteria. This review narrows neither the requested outcome nor the completion decision.
