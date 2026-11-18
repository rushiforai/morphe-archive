# Zoom projection host implementation plan

**Goal:** Restore Zoom's native car interface in DriveDeck and accept every compatible projection host, then check re-signed startup for PairIP or other signing failures.

**Architecture:** Replace `ZmAutoServiceV3.createHostValidator()` with the bundled allow-all validator and repair the pinned native APK-certificate predicate that otherwise kills a re-signed process. Preserve native account checks, service enablement, meeting/phone templates and audio behavior. Do not change DriveDeck's renderer unless actual template evidence identifies a separate defect.

**Tech stack:** Morphe bytecode patch, Kotlin, dexlib2, real-input JUnit tests, desktop Morphe CLI, Android emulator and passive Frida observation.

**Evidence:** `docs/research/2026-11-06-zoom-projection-host.md`.

## Connected batch

- [x] Inspect the supplied complete split set, original signer, native car service, host allow-list and template branches.
- [x] Add pinned Zoom compatibility, original-input preflight and an exact car-validator replacement.
- [x] Add real-input tests for unrestricted output and rejection of changed native policy without mutation.
- [x] Add bilingual app pages, download references and catalogue/navigation mappings.
- [x] Run grouped repository verification in the owned checkout, build the candidate and apply only the Zoom patch to the complete original split archive.
- [x] Independently inspect the rebuilt output and retain hashes, patch report and signing result.
- [x] Prepare one bounded acceptance session: observe cold re-signed startup, verify original-versus-patched host admission, render Zoom through DriveDeck, exercise available navigation and inspect crashes/signature failures. Establish all required observation before stimuli.
- [x] Restore/stop owned runtime, retain compact evidence and clean owned scratch. Preserve original phone installation and all unrelated primary work.

## Acceptance limits

No release/promotion is authorized. A local candidate is sufficient for review. Account sign-in, real meeting audio, licensed Zoom Phone calling and physical car projection need their own evidence; do not claim them from a build or an unauthenticated empty list.


## Native startup batch

Concrete behavior: let the re-signed Zoom app initialize its native mainboard instead of receiving SIGKILL from its certificate predicate. Keep all projection hosts accepted.

- [x] Decompile the exact native initializer and its certificate predicate offline; retain source-bound REA evidence.
- [x] Pin the original ARM64 loader hash/size and eight-byte preimage; add a scoped resource dependency and real-input preservation/rejection tests.
- [x] Explain the signing compatibility behavior in both app pages and record the native cause in research notes.
- [x] Run affected Android/JVM and documentation gates as one checkpoint; reuse passing checks whose inputs are unchanged.
- [x] Build/sign the complete original split archive once and independently inspect the Java host method, native predicate, and unchanged library bytes.
- [x] Run one eight-minute acceptance session on the reusable private baseline: re-signed cold startup, actual DriveDeck list rendering, Back/reopen and cold restart. Keep Frida attached using process-lifecycle observation; use normal UI and Android logs for acceptance.
- [x] Preserve final evidence and clean owned build/runtime storage. Preserve the phone's original Zoom installation and data.


## Optional car metadata batch

Concrete behavior: preserve successful Zoom screen reopening when the projection host reports unavailable manufacturer/model values. Preserve the original account and tracking flow.

- [x] Retain the real reopen crash and trace the null value through the hardware callback, static setters and protobuf tracking builder.
- [x] Normalize only null values in the two exact original setters to Zoom's own unknown-car labels; preserve non-null field stores.
- [x] Add real-input binding/control-flow/rejection tests and update bilingual app guidance.
- [x] Run the affected patch/JVM and documentation checkpoint, reusing prior unaffected verification evidence.
- [x] Rebuild/sign the complete original split set once, inspect all three Java method changes and the unchanged native startup repair.
- [x] Use the already verified original-signed DriveDeck renderer candidate for one bounded observed session: sign-in message, close/reopen, cold restart/reopen, cleanup.


Final acceptance is recorded in the research note. Native startup, signed-out car rendering, close/reopen and cold restart/reopen passed. Account/call and physical-car paths remain explicitly untested; no release was published.
