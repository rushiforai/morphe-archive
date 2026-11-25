# Native warning bindings implementation plan

> **For agentic workers:** Use `superpowers:executing-plans` inline. Track evidence and remaining work here; the user has requested continued implementation of the reviewed design.

**Goal:** Establish artifact-backed native warning capture and coordinated speech bindings before implementing the three-app warning protocol.

**Architecture:** Keep the existing startup and schema-1 feed. Bind native semantic decisions upstream of provider audio suppression, then deliver events through an authenticated optional Binder endpoint to a shared scheduler and app-specific speakers.

**Tech Stack:** Java, Kotlin/Morphe bytecode patches, Android Binder/TTS, Python contract tests, original DEX artifacts.

**Spec:** [Native warnings design](../specs/2026-11-02-flitsmeister-native-warnings-design.md).

## Global constraints

- Target FM 14.17/1287, Maps 26.43.05.1002020710/1068844719 and Vela 0.5.2621.
- Preserve STARTUP_V1, schema 1, provider silence, stored source/output choices and Waze behavior.
- Native detection/category eligibility remains authoritative; provider-local audio preferences cannot suppress eligible exported warnings.
- No voice rollout before native guidance, mute, cancellation and phone/car routing pass real-artifact acceptance.
- Keep uncertain output fenced across process death; enqueueing is never playback completion.
- Follow johninnl-only identity checks. No generated versions/catalogs or stable promotion.

## Review focus

- Repeated identical text must retain separate attempt identity without swallowing legitimate repeats.
- A native callback fired just before source/off must be fenced before it can start audio.
- A provider-local sound preference must not disable transport; a warning-feature category preference must remain effective.
- Guidance cancellation must cancel pending playback as well as current audio; never replay old turn text afterward.
- A valid declaration alone does not prove an instruction-safe insertion point, native semantics or runtime behavior.

## Task 1: Freeze native contracts and resolve binding feasibility

**Files:** `scripts/navigation-alerts/`, `tests/test_navigation_warning_bindings.py`, `tests/fixtures/navigation-warnings/`, `docs/research/2026-11-02-native-warning-bindings.md`.

**Consumes:** supplied original artifacts, design sections 5, 10 and 13; exact Vela source tag `v0.5.2621` as a reference only.
**Produces:** repeatable method/enum inventory, frozen method signatures/flags/registers/instruction hashes/semantic references, predicate map, candidate insertion points and explicit runtime proof gaps.

- [x] Write and run negative tests for altered bodies/ABI, missing enum categories, and unsupported coverage being misreported as complete.
- [x] Implement artifact inspection and strict contract comparison; rerun tests.
- [ ] Inventory every FM BaseReportType/IncidentType/EarlyWarningTypeEnum/SpeedCamType value and both early-warning buses. Audit VOICE_ONLY bypass.
- [ ] Classify every predicate following `s6i.l/b` against actual preference keys and model semantics, including both booleans and service-vehicle coroutine gates.
- [ ] Bind Maps guidance enqueue/start/finish/cancel and native mute states; bind Vela queue/system-TTS/neural playback/stop/error paths. Record safe register/control-flow locations.
- [ ] Run private original-artifact probes to establish safe guidance interruption and accurate per-attempt playback outcomes, including denied focus and stale queued work.
- [ ] Run `python3 -m unittest discover -s tests`; preserve precise evidence and unresolved gates; commit after required identity verification.

## Subsequent work packages (retain full scope)

Refine exact interfaces after Task 1 has resolved native API findings. These packages are pending, not replaced by the discovery tooling.

2. Shared event codec/Binder discovery, authenticated bounded delivery/replay, durable grant ledger and ownership/outcomes. Test size/type/clock bounds, caller mismatch, death/hung workers, gaps/overflow, expiry/uncertainty and Waze compatibility.
3. FM model adapters, canonical native announcements, state/repeat/clear, audited templates, full enum coverage and conditional compatibility broadcast masking. Test original native entry points with provider silence.
4. Shared receiver scheduler, semantic phone/car UI, settings/migration/status, source lifecycle, duplicate suppression and independent Flock features. Test two urgent warnings, stationary emergency, source changes, passage and stale replay.
5. Maps coordinated TTS and Vela native adapters with unique attempts, actual callbacks, focus/mute/priority/cancellation and phone/car lifetimes. Test both Vela engines and all Maps package variants.
6. Apply/rebuild/sign/install all intended patch combinations in owned isolated emulator; capture source-to-output timing and signal evidence; controlled physical/car acceptance; bilingual docs; reviewed PR and CI. Stable promotion requires separate user authorization.

## Execution record

- Initial state: clean linked worktree `docs/flitsmeister-native-warnings-design` at `3e2038f`. Primary checkout contains unrelated work and is not an implementation target.
- No knowledge-graph index or graph reference document exists in this worktree.
- Previous design turn produced the reviewed specification and a local commit: progress. Implementation starts with the mandatory native binding work package.
- Vela working checkout is newer than the target APK. Use `git show v0.5.2621:...` for source reference and original DEX for authority.
- Static contracts freeze 31 FM, 26 Maps and 37 Vela methods. The FM manifest accounts for 159 enum members and 12 known state/capture entry points. Required roots are frozen separately in the original-artifact contract so deleting an unsupported manifest row cannot turn the completion gate green.
- Binding findings are in [the evidence report](../../research/2026-11-02-native-warning-bindings.md). Local sound gates, verified bypasses, async cancellation and real playback boundaries require guarded hooks and private runtime spikes before broad integration. No application code has changed in this prerequisite.
- Fresh APKM comparison found the earlier FM cache had different manifest/resources. All seven DEX entries match; new contracts use the freshly extracted original `17f622c8...`.
- Eight verifier tests passed after observed red/green cycles. Original-artifact contract comparison passed for all three inspected apps; the incomplete-support gate failed as intended. Full-suite and review results are recorded with the prerequisite commit.
- Final prerequisite validation: Python suite 434 tests, 45 skips, zero failures; Markdown links passed (303 files, 1,395 links at this shared-worktree snapshot). Independent review found and then confirmed the fix for missing entry-point coverage; no remaining important prerequisite findings. Runtime playback/capture acceptance is still pending.
- Owned emulator `native_warnings_api34` / `emulator-5580` was created for private native capture/speech spikes. The existing `emulator-5570` belongs to another FM task and was not repurposed. No personal device was modified.
- [Runtime spikes](../../research/2026-11-02-native-warning-runtime-spikes.md) now demonstrate original Maps media lifecycle and real manager pending/active cancellation, original Vela speech-after-stop/mute races, and a selective private system-TTS closure fence. The candidate blocks tagged pending warnings while retaining untagged synthetic speech and balancing native focus ownership.
- The private candidate is not a production patch. Native FM capture, Maps final-dispatch/chained-player hold/current-route regeneration, Vela active/system/neural/tone outcomes, denied focus, ownership/replay and complete end-to-end acceptance remain open. Continue these feasibility gates before claiming work package 1 complete or rolling out voice.
- Runtime prerequisite validation: original and private-candidate emulator runs collected in target app UIDs with installed target/probe hashes verified; exact three-method candidate edits and asset preservation checked; Python suite 439 tests, 45 skips, zero failures; Markdown links passed (302 files, 1,400 links). Independent review identified exact-emulator and stale-report issues; both fixes passed observed red/green regressions and reviewer recheck. The owned writable-system emulator remains available on port 5580 for subsequent native probes.
- Shared event codec/journal and durable ownership/grant policy are implemented and independently reviewed under the [contract/transport plan](2026-11-02-warning-contract-transport.md). Its Tasks 1–3 are complete; authenticated Binder delivery and native producer/consumer integration remain pending. This progress does not close the remaining native binding or phone/car acceptance gates above.
