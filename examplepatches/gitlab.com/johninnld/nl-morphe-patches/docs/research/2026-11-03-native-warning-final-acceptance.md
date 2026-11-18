# Final native-warning acceptance checkpoint

Status: **incomplete**. This checkpoint records one grouped functional session and one affected-group rerun on owned emulator 5590 with the corrected FM15 producer. It does not replace the [R1–R8 design](../superpowers/specs/2026-11-02-flitsmeister-native-warnings-design.md), earlier artifact-specific evidence or physical/car acceptance.

Maps and Vela retain trip routing and guidance. FM supplies alerts and speed/limit/zone data. The tested native zone path is an average-speed camera segment, not FM trip navigation.

## Executed group

The [functional receipt](../../tests/fixtures/navigation-warnings/flitsmeister15-final-functional-verification.json) names every tested authority, source acknowledgement, receiver attempt and artifact. Inputs were:

| Input | SHA-256 |
| --- | --- |
| Corrected FM15 producer APK | `19d40560cb885f868ffeeb936f12a0daa0e7fa666776acf1582e85e63b6c2ecd` |
| Maps APK | `3285d836bfb7caefd361fec42d7ed080017021f885eabf331b02b88287fb8839` |
| Vela APK | `958bd90f477c45d8210f797b34e8649162d4153238419ab2ab7af856cd9edf19` |

The session reused the frozen repeat10 producer probe, receiver-zone05 probes and existing gRPC GPS/runners. Their original source and compiled hashes were checked. No product implementation, test harness or app build changed during the session. The first cold-boot admission attempt refused a still-active Android audio player before candidate installation; the bounded settlement checkpoint admitted the subsequent functional group.

Both receivers completed the first native zone entry and exit. An offline join verifies four source ANNOUNCE authorities against their actual receiving speaker payloads, four STARTED callbacks, four COMPLETED callbacks and four source GRANTED → STARTED → COMPLETED sequences. Every authority has one attempt and one start. Text, language, category, priority, phase, warning identity and announcement index match; native source path entry, exit and candidate restoration were observed.

Both cases then failed the frozen probe's `Native source fix is not fresh` guard at `NativeFmCaptureProbe.java:528` / `Fm15PrivateZoneInput.freshFix`, while beginning the return trajectory. Neither produced a repeated native authority. The original job and both repeat cases remain failed/incomplete; the observed first-pass outputs are partial evidence only. This failure does not establish a product repeat defect or verify the expired-state identity seam.

## One affected-group correction and rerun

The collected traces showed an observation race at the GNSS handoff: the first return request repeats the last coordinate, while real native collector samples arrive approximately two seconds apart. The frozen loop aborted immediately on a stale observation instead of awaiting the original collector outside the main thread.

One private-probe correction classifies only valid-clock moving fixes that are stale or not yet consumed as pending observations. The loop waits outside the main thread for at most five seconds while normal reviewed GNSS requests continue. Every admitted sample still requires a positive, nonfuture timestamp, age at most 2.5 seconds, real motion/quality fields and the original consumed-fix identity. Original binding, job, candidate ownership and native policy checks still abort immediately on failure. The correction writes no native GPS, decision, policy or readiness field. Its sources, precise patch and compiled binding are retained; no product or receiver code changed. The source probe was compiled/signed once as `8536690218240131f3a1ed979573a9e47f990bcf32aef2ea5608af2221ad5ae7`.

In the sole rerun, the Maps wait resolved after 567 ms with an actual 46-ms-old consumed fix; Vela resolved after 562 ms with a 48-ms-old fix. Both then progressed onto the return trajectory. In both, the original FM producer replaced the private candidate set. The unchanged exact-ownership guard aborted with “Native producer replaced candidate set; restoration is refused.” The probe did not overwrite the replacement or manufacture another native announcement. Both repeated first-pass entry/exit outputs completed once again, but no repeat authority was generated or accepted.

This leaves natural-repeat acceptance open at a private-fixture ownership boundary. The polling correction is supported by the observed consumed fixes; neither run establishes a product defect or passing repeat. No further probe edits, rebuilds or reruns followed. The full outer VM rollback restored the task state after the inner candidate restore correctly refused lost ownership.

The local release watcher was active during this functional group. Its timestamps are retained, but this group is not used for timing-percentile acceptance. Native speaker payload/lifecycle joins do not establish acoustic audibility or car routing.

## Smallest remaining groups

| Required group | Current disposition |
| --- | --- |
| Same-ID original native repeat after producer-state expiry; changed unsaid revision | Expiry regression and component revision tests pass. Natural repeat remains unproved at the private candidate-ownership boundary above; changed-unsaid source-to-speaker acceptance remains open. Direct calls to native speech methods do not replace the original repeat decision. |
| Delayed point on an existing receiver route: bend, passed point, nearby/ambiguous legs | Existing straight passed/valid/expired replay, native route inventory, route-binding and scheduler tests remain valid in their recorded scopes. The coupled original-route delayed-warning cases remain open. No new route engine or fabricated route is required. |
| Receiver modes and failure/status | Retain Vela's system/neural/tone/mute-cap adapter evidence, Maps' supported tone/voice/mute/readiness evidence and current component tests. Targeted actual-source mode/failure and honest degraded-status seams remain open; no enum-by-mode Cartesian suite is required. |
| Source selection, screen-off/phone-absent/car-only lifetime and mixed versions | Retain passing BUSY/release/death/provider-restart results, existing car-host evidence and protocol/startup/Waze tests with their original identities. Current integrated source-switch/lifetime/compatibility seams remain open. A local car preview does not establish physical projection/audio routing. |
| Final artifact timing and output | Retain prior warm corpora and PCM/playback evidence under their original artifact identities. Final producer timing disposition and the remaining output-signal gate remain open. This functional group adds no percentile claim. |
| Authorized phone/car acceptance and delivery | Physical phone, Bluetooth/music ducking and supported actual car setups remain open. This unit has no authorization to mutate the phone or shared emulators. Final review/delivery and separately approved stable promotion remain separate. |

Earlier successful coverage, priority, native guidance, moving lead, zone and recovery results remain useful evidence of unchanged paths. Their older producer identities are unchanged in the records. The corrected producer's passing 172 FM component tests and nine FULL patch applications are not relabelled as passing runtime repeat acceptance.

## Cleanup

Both outer rollbacks verified the original three APKs, preference bytes/ownership/modes, permission grants/flags, window settings and firewall rules, and restored the original emulator launch arguments. Owned helpers and snapshots were removed; emulator 5590 was stopped. First-group candidate restores passed. Rerun candidate restores refused lost ownership as described above; the outer VM snapshots restored all task state. Receiver quiescence/preference restores passed throughout. Both outer receipts have `cleanup_required=false`, with no cleanup errors.

Only compact receipts and two local evidence archives remain for this unit: the original 202,145-byte archive (`15643bb563ab70dabefd2f7902bbc1a550585349e2dcb7881acfe0f3b667561c`) and the 234,721-byte rerun archive (`524e5d1294572b40747bff2a64948b2a8cf7167dbd739c97ae5c88d48cee3321`). Raw job folders, temporary runner/source copies and duplicate APKs were removed. Original inputs, active compiled probes and earlier evidence were preserved. The primary checkout was not modified.

## Subsequent mode/output checkpoint

Updated 2026-11-04. The [mode/output receipt](../../tests/fixtures/navigation-warnings/flitsmeister15-mode-output-verification.json) names the same final producer and receiver APKs. Maps Voice, Tone and Silent pass independent source-authority, payload, attempt, lifecycle and source-ACK joins. Voice has tagged non-silent PCM with a separate native warmup excluded. Tone completes once; Silent has zero starts and an explicit USER_MUTED outcome. Both compact UI cases preserve native text; provider mute, quiescence and preference restoration pass.

Vela Voice and Tone now pass through the original map UI with native text, actual output callbacks and source ACKs; both retained screenshots were visually inspected. The original setup had reached neither the map surface nor its widget. The setup now waits for a reviewed foreground surface and may close only the exact observed Digital Wellbeing ANR dialog once inside the owned recovery snapshot. Other failures and ambiguous focus remain errors. Offline admission negatives cover those boundaries.

Vela Silent also has a passing native functional witness: zero starts, USER_MUTED, native text, and a shown/attached widget with positive geometry. The probe had previously exited on the immediate mute outcome before a draw; it now waits within the original deadline and requires the real screenshot/draw witness. Its containing job remains failed in the original receipt because the source cleanup validator rejected an Android netd Wi-Fi-to-Ethernet transition. Independent re-audit of the captured IPv4/IPv6 tables proves the task UID fence was removed; only exact observed interface idle-timer bookkeeping changed. The corrected validator retains negative checks for unknown interfaces/timers, changed targets, UID fences and leaked task chains. The outer VM rollback is exact. Silent's screenshot was created in the guest but the old host ordering skipped export on source failure; the attached/shown/text/geometry witness remains. Future positive frames are exported before later source checks, without changing failure outcomes.

Vela Voice's tagged PCM assertion, sample counts and hash are retained. The raw `.pcm` clip was mistakenly omitted by the archive suffix selection; it is no longer retained. A quiet output capture remains necessary for exportable raw audio evidence. Future evidence archives include `.pcm` as well as WAV.

The first timing corpus was interrupted when the user reported audible camera repetitions. All warning/TTS processes stopped; the remaining repetitions were cancelled. No completed final-artifact timing corpus or percentile is claimed. Do not restart audible repetition tests. Any resumed timing work must keep host playback inaudible, preserve honest Android engine/callback/PCM checks, record its audio environment, and restore the test state. Disabling the emulator's entire audio subsystem is not silently equivalent to proving native output.

All containing sessions retain their original failures and scopes. Their outer VM restores, helper/snapshot removal and final runtime shutdown pass; raw job folders and duplicate APKs are removed after compact archive verification. A separate audited cleanup removed 23 byte-identical historical copies and 44 superseded generated APKs, reclaiming about 11.7 GB. It preserves 71 validation receipts, original/current inputs, retained canonical artifacts, source, the primary checkout and AVD data.

The [privacy/resource review](2026-11-03-native-warning-privacy-resources.md) records unchanged production bounds, authenticated local IPC, opaque-only durable uncertainty and exclusion of private captures/probes from the signed development bundle. The full objective remains incomplete: repeat/revision, coupled route relevance, remaining mode/failure/lifecycle/compatibility seams, timing/output and authorized physical/car gates remain separate.

## Frida-controlled bounded diagnosis

The [Frida diagnosis receipt](../../tests/fixtures/navigation-warnings/flitsmeister15-frida-diagnosis-verification.json) records the subsequent quiet, six-warning prepared ordinary and urgent cases. Source, receiving Maps and TTS processes were attached; required source/receiver hooks passed the barrier before the first native authority. Both prepared cases completed all six measured warnings, including sequence16. The source and receiving callbacks, TTS returns/start/done, guidance state, cancellation paths and crash/detach observations were retained with original results/exceptions intact.

No cancellation, guidance refusal, focus loss, exception or crash occurred in those prepared cases. The denied-permission control also reached six native completions, although its containing trace session retained an end-of-stimuli classification failure. Consequently the original saved07 interruption/NOT_STARTED cause remains unproved. These observations justify neither a production playback fix nor a latency claim: Frida and logging alter timing, and the bounded runs do not replace longer-session acceptance.

The validation runner now prepares and restores receiving permissions, cancels promptly when the source fails, preserves partial data and uses explicit trace-ready/lost and successful-source terminal markers. Mandatory attached observation is recorded in `AGENTS.md` on main/dev and the primary checkout. All final diagnostic resources were removed: scripts/sessions, paused-spawn control, tracing server/forward, helpers, remote storage and snapshot. App/settings/audio/launch state was restored, with exact filter equality and independently changed netd interface rules preserved. The emulator is stopped; cleanup_required=false. No phone action was taken. Full R1–R8 acceptance remains incomplete.

## Offline native-repeat input repair

The [retained-input checkpoint](../../tests/fixtures/navigation-warnings/flitsmeister15-retained-repeat-input-verification.json) records a fixture-level mismatch found in the original15 APK. `pef.g` is generated output: heading/geohash changes drive the original refresh coroutine and replace its candidate set. The rectangle return trajectory therefore invalidated repeat11's downstream insertion. The failed trace did not record replacement contents, so empty, foreign or evolved candidates remain unknown; the original ownership guard is retained.

The original provider appends the existing cached BaseReportDataManager `y81.d` list to regenerated candidates. Its own TestManager writes that retained input. A separate private repeat API now admits one fresh private-ID original zone model at this boundary, preserves all prior entries and identities, and restores only the still-owned list with reference CAS. It never initializes/swaps the manager, calls TestManager/refresh/sound, or changes native policy, history, GPS, readiness, grants or outcomes. If Android's private CAS capability is unavailable, admission fails before writing. Ordinary zone09 remains on its original path.

The connected frozen adapter selects a separate retained-repeat mode, waits for required Frida coverage, uses genuine eastbound-to-northbound GNSS changes for original refresh, and requires the original generated fixture ID/model before measurement. Its existing repeat trajectory, native authority/expiry/index and receiver outcome guards remain. Java ownership/CAS guards and compilation pass, but neither Android CAS availability nor natural-repeat runtime is proved. Vela-specific observation and receiver readiness remain required before a paired run. No emulator or phone action occurred during this repair batch, and original saved07's cancellation cause remains unproved.
