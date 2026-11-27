# Native Gboard Local AI entry and screen context implementation plan

> **For agentic workers:** Use superpowers:executing-plans for inline implementation. Owner batching and frozen validation-tooling rules take precedence.

**Goal:** Retain the original Writing Tools and Scan Text access points and run their requested work through the selected shared Gemma backend, including user-invoked conversation context for replies.

**Architecture:** Keep native access-point identity/order/icon/theme and the original seven-action Writing Tools backend adapter. Intercept one native camera shutter capture for local image OCR; show selectable text using native OCR styles and Insert. Obtain screen context through one Android-consented MediaProjection capture, stop projection immediately, extract text locally and pass context plus explicit saved style preferences to the existing reply task. No host protocol/model/runtime change is required.

**Tech stack:** Existing Java/Kotlin extension and typed 18.8 bytecode adapters; Android API26+, PixelCopy, MediaProjection, existing shared host SDK.

**Spec:** Owner corrections on 24 November 2026 to the approved shared-local-model-host design: retain original buttons; no duplicate Local AI entry; Scan Text must use Gemma when selected; My Style/replies must be able to use what is visible in Slack/WhatsApp. Preserve the approved native keyboard theme.

## Global constraints

- No root, Accessibility-service dependency or silent screen monitoring. Android confirms each screen capture; one virtual display per permission token and a short mediaProjection foreground service.
- Preserve Google backends and bundled OCR when Local AI/shared OCR is not selected. Keep Parakeet recognition unchanged.
- Use only the current visible screenshot and explicit user-authored style preferences; do not attribute all conversation messages to the user, learn ambient typing history or log recognised content.
- Keep input text, selection and editor identity stable across picker/capture handoffs; reject private/password editors, unknown changed connections and stale results. Apply/Insert remains an explicit action.
- Build/check in disposable copies, retain compact evidence and clean owned scratch. Do not alter fixtures, runners or validation frameworks.

## Review focus

1. Original disabled/empty-draft Writing Tools entry must use actual shared readiness while preserving native suppression and protected editors.
2. Capture must stop and free projection, surfaces, image readers and bitmaps on every exit.
3. A chooser/capture must never transfer context or insert text into a different app or changed draft.
4. Native OCR has no Gemma word boxes: present selectable recognised text, never invent image-space bounding boxes.
5. A slow or cancelled image request must keep the keyboard responsive, show progress and discard its eventual result.

## Task 1: Native entry and camera/image OCR

**Files:** `SharedNativeWritingEntry.java`, `SharedCameraOcr.java`, `SharedImageInputActivity.java`, `EditorSnapshot.java`, `GboardSharedToolsContribution.java`, OCR settings/text resources and shared model bytecode/manifest/runtime-ABI files.

- [x] Trace original 18.8 `aadv.b`, `ppq.l`, `psi.u`, `twm.e/h/b/j` and the `tvy` shutter listener; preserve original bodies in separate wrapper frames.
- [x] Implement native jarvis availability and remove the duplicate shared_local_tools catalog entry.
- [x] Route explicit camera snapshots and selected images to shared OCR when Local AI or the OCR override is selected; retain bundled fallback otherwise.
- [x] Add native-styled selectable text and original Insert action; retain retry/back and avoid fabricated geometry.
- [x] Add product tests for readiness/privacy, range insertion and explicit editor handoff boundaries.
- [x] Grouped Android build/tests/lint passed in disposable batch46; source snapshot `c89b7d8a` and cleanup retained.
- [x] Final immutable review `2bf0eb1301cc` built/signed and passed original arm64/arm32 emission with validation in batch48; intended wrapper/capture classes and host pins checked.
- [ ] Bounded phone camera/image recognition, selection/Insert/Undo, theme and cancellation acceptance.

## Task 2: Screen-context replies/My Style

**Files:** `SharedScreenCaptureActivity.java` with private `CaptureService`, `SharedScreenContext.java`, native entry/open hook, extra-action routing, shared text request and manifest.

- [x] Add private normal Android capture consent and a one-shot mediaProjection foreground service with callback/timeout cleanup.
- [x] Restore only the original editor after the explicit handoff; show native-themed progress and Cancel while reading the screenshot locally.
- [x] Route empty-draft native Writing Tools and AI Reply/My Style actions through captured conversation context. Use the current draft as reply intention and saved style preferences when provided; do not claim automatic learning from all visible messages.
- [x] Reuse the existing native preview/Apply/Undo path and operation-local styles.
- [x] Add product tests for image bounds, conversation/style separation and handoff identity/staleness.
- [x] Fresh whole-delta review completed; its critical/important findings were fixed together. Final affected tests and lint passed in batch48; other unchanged Android aggregate evidence reused from batch46.
- [ ] Bounded Slack/WhatsApp or owner-approved test-chat acceptance: consent, capture teardown, missing/secure context, empty/current draft, cancellation, stale app/selection, Apply/Undo.

## Delivery boundary

The owner selected **Continue offline for now** after ADB disconnected. Do not attempt phone interaction again until it is available/authorized. Source/check success is not runtime acceptance. Keep all earlier passing native Proofread/translation/style evidence for unchanged paths, and identify these newly changed routes as pending phone validation. No main promotion or production publication is authorized.

## Final review fixes and rulings

The fresh whole-delta reviewer identified six important/critical issues; the connected fix pass addresses them before the grouped checkpoint:

- Require the original live InputConnection and EditorInfo, immutable editor metadata, exact text/selection and composing bounds across handoff. Matching resource IDs/names or empty drafts never identify a conversation. Replacement connections fail closed, including View.NO_ID; real-device compatibility remains unproved.
- Keep the validated editor snapshot through asynchronous native activation and recheck immediately before preparing/reading/submitting. Never adopt whichever editor happens to be current later.
- Show the actual captured image and require **Read this screen** before image inference. Ruling: Android's normal capture chooser does not attest that the chosen source is the original chat; explicit confirmation of the actual image supplies source intent — costs an extra confirmation, avoids silently labelling another app's pixels as that conversation.
- Bind every picker callback, bitmap, timeout and editor to one request object. Keep the pending ticket until delayed delivery and discard stale results; clear failed launches.
- Close display/reader/projection independently, retain both readers until resize/surface swap succeeds and clear failed capture launches. Product checks cover exception-continuing cleanup and retry after launch failure.
- Normalize reversed OCR selection endpoints; invalid ranges insert nothing. Product checks cover reversed, collapsed, absent and invalid ranges.

No second review dispatch or per-edit build loop is used; the affected checks run together. Native capture/cleanup, same-editor restoration, OCR quality and reply quality still require phone acceptance after the owner reconnects it.

Grouped checkpoint: the complete affected Android aggregate, patch tests/list generation and Gboard lint passed in batch46 with terminal exit0 and owned scratch removed. Additional request-lifetime regression coverage and the matching delayed-capture ownership guard are included in the final review-artifact checkpoint; do not relabel the phone gates as passed.

Version-contract correction before immutable emission: 18.8 `aadv.b(I)` stores an integer state, so the unrelated older split-keyboard field mapping is not reused. The shared override now runs at `ppq.l`'s exact `j:I` assignment, deriving receiver/state registers from that typed write. It retains native `p/h/e` editor/privacy policy and substitutes shared readiness for Google's model provisioning requirement. Both original ABIs must resolve these exact fields and wrappers before delivery.

Ruling: commit the complete reviewed build input to derive a unique review identity, then run the final build/affected checks and original-APK emissions before pushing that feature head. An unsuccessful review build is not delivered or promoted.

Final offline review identity: source `2bf0eb1301ccdae73e0a6715f88d4fbf382f2b39`, version `1.105.0+review.2bf0eb1301cc`, MPP SHA-256 `f32cf6e131a14ea4aa814b04cb8724578b7384be878dff9ab8576535168ea822`. Build/affected tests/lint, signature and both original ABI validations passed with compact receipts and cleanup. This artifact is not installed on the phone. Camera/Gemma quality, native entry visibility, consent return, selectable insertion/undo and Slack/WhatsApp replies remain unaccepted. Strict handoff intentionally rejects a replaced input connection; actual Android chooser/capture compatibility must be established on the device.

## Phone checkpoint and connected repair, 24 November 2026

The reconnected phone accepted review `2bf0eb1301cc` through Morphe/Shizuku with the existing clone and signing certificate. The actual installed DEX contains the new native-entry, camera and capture wrappers. The original Writing Tools button is enabled, opens the original themed surface and returns the expected Proofread result. Scan Text opens the native camera and Android image picker, but choosing the owner screenshot returns to normal typing without the OCR result. Acceptance stopped at that first unexpected product failure; screen-context replies were not exercised. Manager's temporarily disabled Expert mode was restored.

Offline diagnosis: Android's picker hides the OCR keyboard and the native `twm.h` cleanup clears its peer. Requesting the IME again restores normal typing; no OCR bind occurs, so the pending bitmap cannot be consumed. Restore the original OCR keyboard through the same `aars.a(new agoq(nyr.g))` transition used by stock `OcrCaptureExtension`, only after the unchanged original live editor returns. Keep the strict connection/editor/text/selection/composing checks. Dispatch once, wait for the native bind, and expire/recycle failed handoffs. Preflight all reflected transition descriptors against both original ABIs.

This connected batch also pins companion review 104 (`2fc544a95227bcdafcfd6949337577093dea04c8`), containing the owner-supplied Gemma icon, clearer native Material status/switch labels and bundled offline developer WebView. The signed host build, existing signer, unchanged native libraries and public immutable downloads are verified. These UI changes do not claim new inference quality or close existing acceptance gates.

Checkpoint: signed immutable MPP build, patch/Gboard unit checks and Gboard lint, then both original ABI emissions/validation. Reuse unrelated passing evidence. One bounded subsequent phone session covers native Scan Text picker return/selectable insertion, host icon/status/developer-guide navigation and screen context only if preceding checks succeed.

Repair review `0a27628a4f19` is built/signed, with MPP SHA-256 `d4cf75fc56ae29f2a7790fe3cdbbfe4d611ef6235a1181f36c9b3c5db98614c7`; all grouped affected checks and both original ABI emissions/validation passed. Artifact collection initially found multiple MPP outputs; collection was corrected to the canonical versioned filename, retaining the passing checks. Disposable workspaces were removed. Source is pushed on the feature branch; the phone still has `2bf0eb1301cc`.

Companion104 is now installed with exact published bytes and the unchanged signer. Its actual Gemma icon and clearer status display were observed. Loading is memory-admission-paused with about 3.1 GB available RAM; the existing guard remains intact and unrelated apps were left running. Documentation navigation was interrupted by an unrelated received-files UI and further screen input stopped. Await phone availability and memory headroom before accepting the pending OCR repair or screen-context flow. No production promotion is implied.

## Reconnected active clone diagnostic and connected feedback batch

The owner disabled the old keyboard; use the current `com.neerdael.spotify` clone and preserve its existing package, data, signer and saved selections. Its actual APK hash is `ae5a34030499127942d4d7ca1b0fbe306670025818ed9e76efa3c00df4c1b15d`, still review2bf. Session25 confirms the settings image picker opens and the native Scan Text camera opens. Tapping native Choose an image is rejected before picker launch because the host is memory-paused, with a truncated/misleading enable-images toast. The diagnostic ended before offline work; rotation was restored. No other apps were stopped.

Remove the inference-readiness gate from opening the native image chooser and capturing a frame. Keep the same private-editor/snapshot checks. The worker still verifies the provider, enabled state, readiness and OCR capability before encoding/submitting an image. Show the actual failure in the existing native themed OCR surface with a Model setup action; do not mislabel memory pressure as disabled vision or insert text on failure. Include the already-built native picker-return transition repair in this next review. Product checks cover an unready model still launching image selection, private editor rejection, and distinct recovery messages. Pair this with the host's bounded memory-pause recovery/Retry loading fix, preserving all memory limits.

Build and validate the connected changes once, pin the new signed companion, then perform one bounded acceptance session on the active clone. Reuse unrelated passing checks. Native OCR quality, actual insertion/undo and cross-activity privacy gates remain open until exercised.

Owner language decision: keep a 38-language baseline and allow other languages with an explicit experimental/quality caveat. No hard language admission gate or silent fallback is introduced. Add a visible Language coverage entry and quality notice in Local AI settings; normalize language regions/scripts and Norwegian/legacy aliases for baseline classification. Do not call the baseline verified. Google's Gemini Code Assist prompt list is distinct from ML Kit's task-specific language lists (proofreading currently documents seven); neither validates our Gemma prompts. Parakeet, OCR scripts, existing Google backend policy and private-editor guards remain independent. Include the exact baseline/alias/immutability product checks in this batch.

## Shared speech extension (owner selected, 25 November 2026)

The owner chose Binder-only speech sharing, with user-selectable Parakeet, Nemotron Streaming and Whisper Tiny in Local Model Host. Preserve Parakeet TDT v3 and Ultra as two profiles. Do not add Redux, Whisper Base or Medium in this batch. Host-side model downloads/readiness replace Gboard's model/runtime download controls. Gboard keeps its native microphone, listening callbacks, Silero endpointer, insertion/spacing and Voice edit routing. Native ownership moves to the host; old Gboard model files are preserved but no longer loaded. Shared speech has independent readiness from Gemma, supports speech-only operation and never silently sends selected local dictation to Google during a pause. The old patch name remains stable for saved Morphe selections; visible settings say Local AI voice typing.

- [x] Add additive speech Binder/Java SDK in host and matching Gboard SDK copy.
- [x] Route microphone decoding and Silero probability to host; move administration to host; include provider visibility/installer for the speech-only patch.
- [x] Add a readiness check independent of Gemma status and truthful model-specific capability notices.
- [ ] Grouped repository verifier/lint and original 18.8 ABI emissions, including a Parakeet-only emission.
- [ ] Signed host/APK and immutable MPP payload inspection/public review delivery.
- [ ] Actual speech/interim/final/cancel/native microphone acceptance; per-UID stream isolation and host Stop/memory checks.

Known parity gap: the shared LiteRT adapters do not implement the old sherpa acoustic dictionary-bias/redecode mechanism. Preserve saved dictionaries and report unsupported bias; do not present them as tested or silently rewrite transcript names with Gemma. Whisper's supplied bundle is currently English-prefixed. The provider-side source/design/contract is in local-model-host `docs/superpowers/specs/2026-11-24-shared-speech.md`.

Phone gate remains open: the active custom-package Gboard disappeared after session 28 without an assistant uninstall command; cause unresolved. No installation/runtime claims follow from Morphe's Installed label. Screen input remains paused pending ownership/removal clarification. Host 105 remains the last verified installed provider; the new source has not been accepted on the phone.

Host review 106 is built, signed with the existing provider identity, and anonymously verified in the GitLab review registry at source `60eb04e02639f3978dae5ab2fac20aaec19e0395`. APK SHA-256 `6de2d2d2f2d7c896b85d4677aa590d7bf6ebaeac97dca5d313f39d9d39a12b41`. Host unit/lint gates passed; all packaged arm64 native PT_LOAD alignments are 16 KiB and the previous Gemma native libraries are byte-identical. Client SDK AAR is packaged without engines/native libraries. Native speech acceptance remains pending. This Gboard source pins that exact provider review.

The native Standard/Rambler selector keeps its honest Standard label: Standard uses the shared local recognizer only when the explicit Gboard client switch is on, and otherwise remains Google Standard. The client switch cannot first be enabled before host speech is ready; selected-local failures remain local errors. This avoids labeling Google Standard as Local AI before setup, while preserving explicit Rambler/Google choices.

## Host review follow-up, 25 November 2026

Host review 106 is now installed and its installed APK hash was verified. E4B is visibly eligible on the OnePlus 15. Session 29 stopped before model download when the speech selector clipped the Whisper Tiny description; the phone controls and rotation were restored. Host-side review fixes multiline model rows, guarded model switching/memory admission and bounded PCM input. The matching SDK adds an independent close/cancel executor and makes cancellation before audio submission end the stream instead of skipping sequence numbers. This client copy also stops waiting when the host is disabled and interrupts cancelled microphone setup. These are a connected source batch; repeat grouped checks before the next bounded acceptance window. No actual speech transcription has been accepted yet.

Provider review 108 is now installed and published, source `cb76c04dfbb91c4056f90e09053abc48cdee14f0`, APK SHA-256 `2ac35eb85fa3620f20fe13277eb4ec1090032b3381f9552ad424b2a5d68b301e`. Session 31 accepted all four visible speech choices, existing Parakeet TDT v3 native Ready, Whisper Tiny download/native Ready with Gemma off, and switching back to TDT v3 Ready. Actual microphone transcripts and cross-client cancellation remain open. Phone touch input is paused after the surface unexpectedly moved to DriveDeck; the final text-setting restoration still needs verification. The source update pins review108 and synchronizes SDK control/cancellation fixes. The DriveDeck engineering handover is published with that provider review and included in its offline developer guide.
