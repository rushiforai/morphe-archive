# Vela native Android Auto acceptance

## Current boundary

The unchanged patched Vela 0.5.2621 APK now renders its native map and completes
Search, AA keyboard/results, route preview, Go, native turn-card guidance and
admitted moving GPS at 1280x480. A real native guidance content utterance reached
TTS request success, start and completion while emulator volume was zero and
DHU used SDL dummy audio. These are retained, fully observed cases before a
later global coverage failure. The complete run and the full all-app objective
remain incomplete.

Reconnecting at 800x480 returned the car UI to browsing, without its route/turn
card. That frame predates the later coverage loss. Original-signed route
control55 reproduced the same transition; this case matches native behavior
and does not require a patch fix. Tall-profile, 240dpi, complete
controls/scrolling/rotary/Back and external-warning audio modes remain open.
No source, observer, runner or application policy was changed in these checks.

## Exact inputs and original control

The original APK SHA-256 is
`f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f`.
Its verified publisher certificate SHA-256 is
`29938b4858063e42e677ff95c901cd48248a7f032a3ae85f9b9e5617568b0d36`.
The patched checkpoint02 APK SHA-256 remains
`c9c1954ba23ac20124cef0f80a34c67d526ad739d80f0a0fd9daa03921a99f49`.
Its target extension payload is unchanged through canonical checkpoint28;
reuse the complete passing verification and real-input patch/sign/alignment
receipts instead of rebuilding unchanged source.

All eight ARM64 native libraries match byte-for-byte between original and
patched APKs, including MapLibre SHA-256
`d3a1ab9b9d056d84b93f2aa5f676d20d2d76723952dfcd8bd8d203d6eca6980d`.
This establishes native-library identity, not Java lifecycle equivalence.

Original-signed control53 rendered the actual AA map after the normal precise
foreground-location prompt. Its map frame was captured 54 seconds after car
selection, inside the planned 60-second window. Terminal observation handling
ended 46 seconds late; do not label the whole control a bounded acceptance pass.
The existing Frida CLI retained original Vela native crash/exit attachment;
patch-only Vela Java hooks do not exist in the original. The unchanged
coordinator observed the exercised AA/TTS/other patched processes. There was
no original crash before terminal stop. No original route/GPS/voice acceptance
or single causal patch attribution follows from this short map control.

## Historical encoder crash and software projection

Run31's MapLibre Snapshotter SIGSEGV maps to the original emulator GLES encoder
at relative PC 0x4215c. REA/Ghidra loaded this ELF at 0x100000; the mapped
instruction at 0x14215c is `ldr x8, [x0, #0x30]`. The recorded x0 is zero,
immediately after `GLSharedGroup::getBufferData(unsigned int)`. This identifies
the null buffer-data dereference, not why its record is absent. The encoder
SHA-256 is `cc70972b6f00814a24032bf630f65c52ad34a9ae7229fdf2d4f29efd3168d9b5`;
its retained BuildId matches the crash. Static evidence and the closed Ghidra
snapshot are retained privately. No driver or application binary was edited.

Run52 selected the documented SwiftShader software backend. Actual renderer
identity was ANGLE with SwiftShader/Vulkan. Genuine AA17/DHU connected using
initialized consent but projected only black frames, including after the known
focus refresh. Vela was not selected. Retained EGL_BAD_ATTRIBUTE messages are
diagnostic context, not an isolated cause. This failed projection prerequisite
does not establish a Vela fix or app acceptance. Use the working host backend.
The historical native crash did not recur in the later patched host window;
no causal fix or general non-recurrence is claimed.

## Run54 observation and delivery

The full unchanged observer installed 37 hooks in Vela, including its required
scheduler/speaker callbacks. Vela, TTS and AA hooks were ready before the native
content request. Content ID `vela--1194923203` had a successful 44-character
TTS request, native start at elapsed260783ms and completion at264941ms. Its
separate lead-in is not counted as another content utterance. This proves the
original synthesis/callback path, not heard physical-car audio or external
warning playback.

The final coordinator result records background Waze native shutdown and an
unexpected detach. Its callback reported api_started=false, lease0, wrapper
stopped, activity0 and car-session0. Do not attribute that unmanaged shutdown
to the API-owned expiry contract. All retained Vela map/search/route/GPS/speech
and failed reconnect frames precede the loss; the 800x480 frame precedes it
by about39seconds. Preserve the incomplete overall result. No further stimuli
followed the observed reconnect failure.

Runs52,53,54 restored and verified baseline APKs, audio, debug property,
automotive role and GPS, detached scripts, stopped exact owned servers and
runtimes, removed forwards and owned snapshots, and archived/removed scratch.
CleanupRequired=false. The initialized baseline and original inputs remain.
No physical phone was touched. The private review index contains exact
receipts, native methods/encoder evidence, screenshots and speech correlation.


## Original route/reconnect comparison closed

Control55 used the same original signed input and native precise-location
prompt, searched for the same Lake Mendocino North Ramp destination, started
native guidance at1280x480 and supplied the same fresh4m/s GPS fixes. The
original turn card and route were captured before disconnect. After genuine
DHU disconnect/reconnect at800x480, original Vela returned to browsing with
no guidance card, matching patched54. Do not add route keepalive or screen
restoration code for this matched transition. This does not establish every
possible native lifecycle mode or replace the remaining profile/input checks.

Original Vela retained the existing CLI native crash/exit attachment throughout;
AA/TTS and other exercised targets used the unchanged coordinator without
coverage loss. The unrelated background Waze process was intentionally stopped
with the existing expected-stop marker before standalone Vela route stimuli.
No provider/API warning session was selected or stopped by that operation.
The control ended inside its four-minute app window and eight-minute overall
limit. Exact installed hashes, state/GPS restoration, runtime stop and scratch
cleanup passed. Private `vela-original-route-reconnect55.json` and paired
screenshots preserve the comparison.

GitLab main advanced to v1.43.2 at
`0bf19c7d2c6e86988d2e5d3d84f4b06edd04395e`; merge
`17d395c6191c01739515071d2047de188cb4f295` preserves the feature history.
The navigation target source is unchanged from the previous main cohort.
Complete canonical verification29 passed on the merge, including new upstream
modules, and its owned build workspace was cleaned. All five navigation
extension payloads are byte-identical to checkpoint28, preserving existing APK
and scoped runtime evidence. Signed engineering MPP SHA-256:
`81882de2ae4f1289f96042743dadc39858396cb8e3b56d9f393d0de911588fe6`.
No stable release or main promotion occurred.

## Reviewed parked warning output on genuine AA

Run60 used source `2110052642f4087bc0cc277d245015d6a3f92bfa`, the unchanged
Vela checkpoint02 APK and corrected checkpoint31 Waze APK SHA-256
`5df09acb5c6f9ab91a85852b0e4b194204bbcacba08d78b143764e00dbffe6ac`.
The existing observer bundle SHA-256 remained
`68a4923351db81aa71e9e40f9ffd4c27f1dcfe4a7e81d8eb8c49baaa384d8120`.
Vela, Waze, AA and TTS hooks were established before their respective inputs.
No observer, probe, runner, application result or eligibility rule changed.

Vela's normal phone onboarding and Navigation settings were operated through
their UI. The selected source was De-Waze; Voice was selected, the existing
category choices confirmed and Spoken road warnings enabled. Native car
selection displayed Vela's map and normal controls at 1280x480. Parked preview
actions used the product's explicit synthetic-preview confirmation dialog.
They do not establish real detection or on-route alert delivery.

The Voice preview obtained a playback grant and submitted a 67-character
content request to Android TTS with result0. Content ID
`vela-warning-e2af3acb-99fb-47e6-894f-c48a1371f096` started at elapsed345237ms
and completed at349739ms; the separate lead-in is not another content request.
The speaker and scheduler reported COMPLETED and quiescent. The subsequent
Tone preview also completed and became quiescent without another TTS request.
After selecting Silent, the preview remained USER_MUTED with no new speaker
or TTS calls before the later observation failure. Timing includes tracing
overhead. Emulator media volume0 and DHU dummy audio kept the test inaudible.

The enclosing run remains incomplete. Before on-route controlled warning,
card or cancellation acceptance, Waze entered its original JNI-originated
`onNativeLayerShutDown(false)` callback. At that callback api_started=false,
lease_remaining_ms=8735, wrapper_state=running, activity_count=0 and
car_session_count=0. No Java `NativeManager.shutDown()` hook fired.
Android records SIGNALED/status9, without an available native crash trace.
This excludes the API-owned lease-expiry shutdown path; it does not identify
the native shutdown initiator. Earlier DHU startup displayed Waze before Vela;
the ownership contract deliberately relinquishes API ownership on a visible
native car session. Do not suppress native shutdown or change takeover policy
on the basis of this result. Isolate future API-only acceptance from that
initial native Waze car session using the existing selection/stop procedure.

All preview cases above precede the unexpected Waze detach. Further UI/GPS
stimuli stopped when coverage loss was observed. Baseline APK hashes, audio,
debug property, projection role, GPS and native curl were verified restored;
the owned observer, server, DHU and VM terminated inside the overall deadline.
Workspace quiescence passed, compact evidence was archived and per-run scratch
removed with cleanupRequired=false. No physical phone was touched.

The private review folder contains `vela-warning-preview60.json`,
`run60-qualified-events.json`, `run60-observer-result.json` and the run60
screenshots. Voice/Tone/Silent parked preview proof does not close the remaining
on-route warning, card, cancellation, profile, DPI or input acceptance gates.


## Stable release boundary requested by the owner

The owner explicitly requested a stable main release upgrade before completing
all remaining acceptance cases. Native Maps/Vela/Waze navigation improvements
and provider lifecycle corrections are releasable with the documented warning
limitations; this does not turn incomplete acceptance into a pass.

Run61 stopped before app inputs because existing Frida observation timed out on
a cached TTS process in do_freezer_trap, TracerPid0. Run62 stopped that idle
process before unchanged spawn observation; normal Vela initialization then
started TTS with hooks installed. No freezer policy, observer or runner changed.

Run62 selected Vela in AA before a fresh API-only Waze start. The initial native
Waze process was intentionally stopped with the existing expected-stop marker,
which was removed before the new source started. Vela's real North Boat Ramp
route, turn card and fresh GPS remained visible at1280x480. The existing native
controlled POLICE input produced UPSERT and native_sound_intent ANNOUNCE; both
reached Vela's scheduler. No external warning card or playback was accepted.
Empty-language SPEAKER_UNAVAILABLE observations alone do not identify the cause:
the scheduler also holds spatially unverified candidates. Native route/context
analysis remains open. Do not initialize speech through a preview, change
eligibility, or describe this result as a completed warning-audio fix.

Both attempts restored the baseline, stopped all owned runtimes and archived
compact evidence before scratch cleanup. CleanupRequired=false. The private
review receipts are tts-preparation61.json and vela-native-warning-route62.json;
run62-native-police-delivery.json proves source-to-receiver delivery separately
from playback. The owner's product-impact issue report follows publication.
