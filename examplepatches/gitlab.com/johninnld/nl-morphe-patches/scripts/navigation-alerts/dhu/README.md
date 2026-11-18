# Android Auto DHU profiles

1280x480 is the primary real-car viewport. DHU supports standard encoded resolutions; use 1280x720 with 240 total vertical margin and native cropmargins=true, yielding a 1280x480 presented viewport. This is native head-unit configuration, not post-processing of screenshots. Verify the requested margins, resulting view bounds and captured image dimensions during acceptance. DriveDeck uses a native 1280x480 surface. Other comparison profiles: 1280x720 and 800x480, each at 160dpi with touch and rotary controls enabled.

## Current availability (2026-11-08)

The old `native_warnings_ui_api34` registration is historical: its directory lacks
the saved configuration/userdata. Do not launch it or claim native51 is available.
The current goal-owned replacement is `nl_morphe_navigation_api34`, port5590,
under `~/.local/state/nl-morphe-patches/emulator-baselines/navigation-api34/`.
Its registration, full AVD disks/overlays, private system-image directory and
`inputs/privapp-native-aa17.xml` are reusable inputs outside the worktree.
Preserve the complete set, not only `system.img` or a registration file.

An inactive DriveDeck disk baseline was independently cloned with its owner's
permission; source hashes remained unchanged. Its logical disk chains were
normalized and compared before use. No initialized-app claim was inferred from
its old metadata. Preflight135 proved root, verified HTTPS and Frida inventory.
Disk normalization then changed the guest state: current network/Frida readiness
must be checked again before source stimuli. Provisioning136 proved root and
the installed package/role state after that change. Original signed AA17 was provisioned through the
recovered system-slot/unregister/reboot procedure, a guest-derived22-permission
allowlist and normal framework projection-role qualification. A normal update
of the same original APK set then succeeded. All four current patched source
APKs were installed and their device bytes verified before stopping the VM.
Private receipts: `.analysis/navigation-baseline-recovery-135` and
`.analysis/navigation-aa17-provision-136`.

Runs140–146 subsequently verified cold-boot persistence of the original AA17
package/role, native AA consent/developer/head-unit setup, current Maps4bd962258729,
and actual Java hooks. Run144 proved native Maps turn-by-turn rendering. Run146
saved FM15 guest onboarding, native precise/always location permission, and Maps’
FM source and reviewed Voice choices. Vela and Waze first-run remain incomplete
in this replacement baseline. All owned runtimes are stopped between sessions.

Run146 delivered only GPS stimuli on a real A4 road trace. Maps received genuine
FM `AVG_SPEED_CHECK` events, displayed current100km/h and partial average99km/h,
estimated20% progress and3.4km remaining; its warning speaker completed with
`started=true` and `quiescent=true`. The current `SDL_AUDIODRIVER=dummy` session
has callback/stream evidence, not retained speech PCM/content. The head-unit
map incorrectly displayed a future A10 maneuver while recorded GPS remained on
the A4. GPS was stopped and evidence retained for offline diagnosis; zone exit,
full driving acceptance and Waze/Vela equivalence remain open. Private receipt:
`.analysis/fm-maps-gps-acceptance-146/receipt.json`; unchanged review images and
provenance are in `~/Downloads/Android-Auto-Functional-Review/FM-Maps-real-drive.md`.

Use the existing cold-boot recipe with the new AVD name, `-writable-system`,
`-no-snapshot`, `-no-window`, `-gpu host`, four cores and4096MB. Verify original
AA17 version179664044, native role, installed APK hashes and private disk paths
before source-app stimuli. Stop it between batches. The unchanged observer was
compiled from its tracked source using cached Java bridge7.0.13; exact source,
compiled artifact and tool hashes are in `observer-compile.json`/`tool-inputs.json`
under the recovery receipt. Process inventory is not Java hook coverage.

The saved Maps input is now `f56b82ff6f78`. Run152 confirmed the original Search
callback and clean settled host keyboard/RECENTS list. Run153 confirmed genuine
host-owned current/next direction and route-ETA cards at1280x480, with a native
metric speed/limit pair. It also retained a duplicate native zoom widget; its
fix remains a runtime gate. Preview ownership, dock reflow and the remaining
sizes/inputs are unaccepted. The speed/warning host-widget extension remains
unimplemented. Reuse the settled search and card-model proof, without claiming
the full UI or provider goal passed. Private receipts and raw frames are in
`.analysis/maps-host-click-diagnostic-152` and
`.analysis/maps-host-guidance-acceptance-153`.

Run162 subsequently captured the actual host-owned preview on `12d2601c4da5`.
Its native card wrapper and repeated ETA captions remain a layout failure pending
the connected correction. For exact-state screenshots, separate the touch and
capture, wait externally for the recorded native page and host-area transition,
then send the screenshot command by itself. In161, a fixed delay captured the
old search screen just before that transition; the next frame was already in
guidance. Neither frame proved that the intermediate preview was absent. Keep
the prepared finite deadline; do not consume the preview window on investigation.

Run164 subsequently proved the clean host preview, but the attempted Details
tap was not an accepted callback test. Run165 traced `tap300362` to the native
map Surface at `(220,352)`, not the Details delegate. Use the recorded callback
boundary or visibly focused rotary input when accepting that action; do not
change native eligibility in response to an ambiguous coordinate. Its awake
guidance frame also shows two zoom pairs, so the earlier single-pair frame does
not close duplicate-control acceptance. Measured and unmeasured copies of the
same native IDs are retained in the private165 trace.

The owner also authorized normal phone checks without Frida. Phone app updates
must still use its existing Morphe signer/data; the engineering APK cache is for
the owned emulator. The latest commit-derived MPP is in Mac Downloads; its copy/install on the
phone and phone DHU acceptance remain open. Do not infer
phone delivery from a Mac artifact or an older phone bundle.

For phone GPS replay, DHU's documented `location lat long accuracy altitude speed
bearing` command accepts speed in metres per second: 100 km/h is
27.777778 m/s. The profile must enable `location` under `[sensors]` or updates
are ignored. Sending a sensor command is not proof that either receiver or the
FM/Waze producer has accepted that fix. Verify native provider location/speed
before the bounded drive; only GPS may be simulated. Do not inject warnings or
substitute the head unit's separate vehicle-speed sensor for a genuine provider
GPS speed. See the [official DHU sensor guide](https://developer.android.com/training/cars/testing/dhu#sensors).

Runs169–171 installed the complete current1665 cohort (Maps26.44, Vela0.5.2621,
FM15 and De-Waze5.27.0.1) and verified all four installed APK hashes after a
cold boot. Normal guest/onboarding, precise location, system voice, FM/Waze
background location and Vela metric selection are saved. The authoritative
input paths and per-app remaining setup are in the baseline's
`inputs/acceptance-inputs.json`. Arm FM's spawn observer before launching either
receiver, including before selecting FM in settings: selection itself can start
its managed provider. Run171's unobserved initial FM startup is not acceptance.

Run172 at800x480 found that the visible native Search pill sends its tap to
`ProjectionRenderer.click(200,140)` and does not open Search. Read-only173
identified a compact ID-less native Search owner inside CardView; the named-ID
adapter did not export it. Preserve this failed evidence and verify the connected
Search handoff correction before a driving session. Run175 then proved the
host Search export/callback, but its initial ID-less native owner was replaced
by the named native Search view before the click. The captured physical-view
token was correctly rejected. Keep native-handler revocation; a host command
must resolve the current eligible owner for its logical role inside the same
authenticated car session. Verify that correction before driving. No1280x480
reflow, rotary, Start/Details or current-cohort genuine-feed acceptance is
implied by setup.

Runs177/178 then exercised the7dcb5e9 role-dispatch build.177 reached the
replacement native listener without exception, but Search did not open.178
waited for the named Search owner and proved a cached eligible owner could be
fully detached before the next layout callback; the strict guard rejected it.
Refresh native control discovery against the current owned tree at command
dispatch. Preserve both failed receipts; they do not prove Search or driving
acceptance. The producer/receiver observers remained attached throughout.

Run183 then read the actual Vela `op3.k` result: a non-loading native
RoutePreviewNavigationTemplate with three rows, selection delegate and Go/click
delegate. The actual AA preview subsequently rendered all three routes and Go.
Normal head-unit Go entered genuine stationary A4 guidance with a foreground
NavigationService; native guidance TTS returned0 and its matching utterance
started/completed. Normal emulator-phone End returned to landing. The dashboard
reflowed Vela's pane/actions/map beside its stock media panel. No app code changed
between181 and183; retain181's blank panel and do not claim its intermittence is
fixed.183 is not moving-GPS, FM-warning/zone or recorded-speech-content proof.

Reuse the saved guest/metric/provider setup and normal AA launcher. At the wide
profile, SDK PNGs are1280x720 with the480px viewport between120px margins; keep
them unchanged. In the prepared console recipe, Vela's recent Meester Visserplein
row uses `tap 270 139`, and its selected route's Go uses `tap 125 202`. Wait for the
actual returned non-loading route template and visible rows/Go before capture;
wait for the genuine guidance transition after Go instead of accepting an early
preview frame. The prior repeated row/Go misses are not navigation failures by
themselves. Native phone End was at126,2228 in183's matching inspected layout;
re-read the layout before reusing a phone coordinate.

The late Maps input in183 did not reach its bound-model gate. Preserve180's
actual native click-delegate proof; do not replace it with the alternate wide
Surface hit (`tap 1074 174` became994,164). The next missing fact is the actual
host ActionBinder/session/input boundary before another native-action fix.

The remaining sections retain the prior setup and UI recipe as historical
recovery information. Preserve surviving inputs and exported evidence; do not
assume missing private manifests or scripts can be reused.

## Responsive indicators and camera evidence (204–206)

The DriveDeck-only custom-widget proposal is superseded. Original AA owns
standard cards/actions; custom speed, warning and average indicators must respond
to its surface callbacks. See `docs/contracts/car-navigation-widgets-v1.md`.

Build204/source4c571859f182adds Maps native-speed-card safe-area placement and
pre-draw warning alignment, uniform constrained pill measurement and Vela host-DPI
speed scaling. Canonical verification, original Maps/Vela guarded patching,
installed hashes and all19icon byte checks passed. In205, originalAA17/DHU1280x480
rendered a genuine FM panel with average82km/h, approximately3% progress and4.1km
remaining, aligned above the existing current/limit100/100badge. One genuine
warning attempt completed with started/quiescent true. This is voice-API evidence,
not recorded speech-content proof. No phone was used.

205also reproduced the map-camera mismatch: white future-step arrow onA10 while
actual GPS remainedA4. GPS stopped as the next tool action after the failed frame,
and its finalizer/native Android confirmed speed0 after67points. Remaining DPI,
Vela-new-layout and size/control gates were not exercised after that failure.
Actual images/notes: `~/Downloads/Android-Auto-Functional-Review/Responsive-HUD-205.md`.

206normally installed the32original signed Maps26.44splits in a private COW copy,
then followed the blue current-position arrow onA4through the first70GPSpoints.
Normal End returned to browsing. Stock used a phone navigation URI;205used the car
recent/Start flow. Do not erase this control difference or claim final cause from
the comparison alone. The canonical patched AVD was restored with every retained
critical hash unchanged. One unregistered stock reference is retained under
`~/.local/state/nl-morphe-patches/emulator-baseline-staged/stock-camera-206/` for the
remaining matching-start control if needed; its provenance records installation,
saved state, pending coldboot verification and exact retirement policy.

Offline original-DEX inspection then established that the current speech-recovery
call `bmon.u(ycx)` sets camera mode `INSPECT_STEP` before its voice branch. The
voice-only recovery correction is tracked in
`docs/superpowers/plans/2026-11-08-maps-voice-only-resume.md`; it still needs rendered
runtime acceptance. Preserve original camera behavior for deliberate user step
inspection and preserve native eligibility/queue behavior for recovery.

210subsequently completed the entire288point A4 trace with the corrected
c1a8a90eee91input. Native100km/h/bearing and installed/coldboot byte identity
were verified. The actual current-position arrow remained blue onA4through zone
progress and clear; the read-only probe recorded one voice-only recovery and no
step-inspection call. Real panels showed average99/approximately40%/2.5km, then
100/73%/1.1km; the final panel cleared and speed0rendered. This matched patched
before/after car-Start scenario and native recovery trace closes the camera bug
more directly than the earlier differing stock URI start. Do not rerun the full
passing drive unless a relevant product change invalidates it.

The end warning completed, but entry speech was interrupted after another
Maps-process focus request. Native source8PCM16was retained losslessly and five
real WAV excerpts exported. End remained unaccepted after visible top-X input;
Vela/DPI/other sizes were deferred. Actual images/audio and precise limits are in
`~/Downloads/Android-Auto-Functional-Review/Voice-Recovery-210.md`. All owned
runtimes/forwards/server/header and guest PCM storage were cleaned.

209was a setup failure, not a Maps regression: a package-level AA watcher caught
projection and duplicated the explicit projection PID's framework hooks. Attach
AA safety observers only to enumerated actual PIDs. Verify each hooks-ready
process name, actual current PID and uniqueness before further attachments or
accepted stimuli. Pending/new host processes are setup until covered. Independent
camera/PCM probes observe different methods and do not duplicate base hooks.

Use an explicit quiet-mode lifetime for Frida CLI clients and unbuffered stdout
redirection to retain `send` messages. `-q` alone exits after load, and `-o` alone
did not capture these records in205. Verify hooks-ready from retained output
before stimuli. Retire and verify each old handle terminal before arming another
observer for the same process; a live watcher must never be duplicated.

## Current genuine Vela/FM drive evidence (185)

Reuse185 rather than rerunning the full A4 drive for reassurance. Normal Vela UI
confirmed FMVoice/recommended categories and enabled spoken warnings and current
car speed; car details were already enabled. The baseline now retains these
choices. Three FM health indicators were green. Initial audio-unavailable status
before the native navigation engine was not overridden.

On originalAA17/DHU1280x480, the existing287-point A4 trace produced genuine
zone states: average98/~20%/3.4km, then99/~62%/1.6km, followed by the source's
zone-end warning and a cleared average panel. Current speed and limit both100
rendered during the drive, and Vela kept following the actual A4 GPS position.
The native GPS velocity was27.779976m/s. The semantic trace contains175UPSERTs,
one ANNOUNCE at index1, a CLEAR and one ANNOUNCE at index2. Two distinct warning
attempts started and finishedCOMPLETED/quiescent; no duplicate finish for either
key was observed. This is natural provider/receiver evidence, not injected UI.

185does not accept heading-specific relevance: the NMEA console preflight left
native speed/course unchanged, and the reused geo-fix transport retained its
actual bearing0. Preserve that limitation and the successful visual/voice-API
proof. No fabricated heading, average, warning, readiness or grant was used.

The final emulator-phone End query returned no target before teardown. No End
click was sent;185navigation stopped through terminal force-stop.183normalEnd
proof remains available. On next launch, inspect current navigation state before
starting a new route. The GPS replay ended/restored speed0 at06:08:11UTC;
terminal teardown finished8.4s beyond its planned deadline. Reserve more cleanup
time rather than assuming an immediate phone UI transition at the stop boundary.

## Native audio capture candidate

185supersedes the following static candidate: no SDLdisk raw file was produced.
The exact SDK playback callback callsPa_OpenDefaultStream/Pa_StartStream, so
SDLdummy/disk settings do not establish capture or muting of itsPortAudio path.
Do not repeat speech sessions relying on that assumption. No Mac/physical-phone
volume/default-device settings were changed, but head-unit audio content remains
unaccepted. Original Android warningTTS/result/callback evidence remains valid.

The native SDK data boundary isAudioCallback::dataAvailableCallback(int,uint64,
byte*,size_t), preferred address0x100004c2c in hash4e42c054….
Its callback instance stores codec at0x2c, channels at0x30 and sample rate at0x34.
The inspected playback is16-bit. A goal-required read-only probe is staged in
`.analysis/dhu-audio-boundary-186`; it preserves original methods and buffers.
The separate no-phone/no-speech sandboxed native dry-run failed before spawn,
so neither that probe nor the proposed silent host environment is accepted.
Retain the static evidence and verify the host setup before another speech run.

The shipped ARM64 DHU (`4e42c054167d6a09a6cff04bba0b62d88898d39e866f241e7393750d2e23c163`)
contains SDL's `SDL_DISKAUDIOFILE` and `SDL_DISKAUDIOFILEIN` strings. A retained
REA query is in `.analysis/dhu-native-capabilities-115/strings.json`. This is
static capability evidence, not an accepted capture session.

SDL's existing disk audio backend can write output PCM to a file instead of a
speaker. For a future owned DHU session, evaluate the process-scoped settings
`SDL_AUDIODRIVER=disk` and `SDL_DISKAUDIOFILE=<owned-job>/dhu-audio.raw`; leave
the driver's pacing override unset. No observer or runner change is needed.
The [SDL implementation](https://github.com/libsdl-org/SDL/blob/SDL2/src/audio/disk/SDL_diskaudio.c)
documents the raw output and file selection; that current upstream source is
not proof of the SDK binary's exact SDL revision.

Before accepting evidence, confirm that the DHU selected the backend, retain
the negotiated PCM format and determine which output stream owns each file.
Correlate captured speech content with genuine navigation warnings and native
callbacks/logs. A nonempty raw file alone does not prove warning speech, and
this capture setup does not establish production end-to-end audio latency.

## Historical VM root and connectivity tools

These findings belong to the removed runtime and its writable overlays. The
retained private base image alone does not prove `/system/bin/curl`, AA17 or an
initialized app state is present. Current tool inputs and evidence are described
above; do not replace fresh hook/readiness checks with these historical results.

The owner authorized rootAVD/avdroot and native curl setup on 2026-11-05.
The registered `native_warnings_ui_api34` AVD now uses the private image at
`.tools/android-root-tools/navigation-api34-image/`; its original config is
retained in the private tooling receipt. Another AVD uses the shared API-34
SDK image, which must remain untouched.

The verified working root path is `adb -s emulator-5590 root`, followed by
`wait-for-device`. Native `/system/bin/curl` survives a cold boot. It comes
from curl-flashable-android commit
`e5d4c9282777540e3ec6f7c42eee87c62c670b42`, ARM64 binary SHA-256
`c78079c0239f0a6c44aa7e9180f97d4c3d175495d1ccf565a8854abd15f68b60`.
The local avdroot v0.1.1 executable is retained under `.tools/android-root-tools/`.
Magisk did not verify after its cold boot; the private ramdisk was restored
and the added manager/environment removed. Do not claim Magisk root is active.

Native curl returned certificate-verified HTTPS responses for Google (204),
Waze's website (200) and YouTube Music's website (200). These prove general
guest HTTPS access, not app API authentication, per-app policy or playback.
YouTube Music's native UI showed its sign-in requirement during the follow-up
diagnostic. Keep Waze's car-login error unattributed until its own failure is
isolated. Do not disable TLS verification to obtain a successful check.

Frida server 17.23.3 was verified running as UID 0; CLI 17.9.11 attached to
YouTube Music with the existing generic observer hooks. Keep the existing
explicit server/forward lifecycle, unload scripts and stop the server at the
end of a session. No new hooks or observers were added for this setup.

Receipts and rollback inputs are in the ignored
`.analysis/android-auto-acceptance/rooted-tooling-setup/` directory. Preserve
the configured private image and tool inputs when cleaning completed jobs.
A genuine-AA initialized baseline is now retained and verified as described
below. Full all-app acceptance remains incomplete.


## Historical initialized native AA baseline

This section describes the removed native51 runtime. It is recovery evidence,
not a claim that its old userdata, snapshot or compiled artifacts remain present.

The owned AVD retains original AA17 plus its matching splits, native automotive
role, accepted consent/developer settings, and the exact signed engineering
Maps/Waze/Vela/FM APKs. The private manifest is
`.analysis/android-auto-acceptance/reusable-aa17-native51/manifest.json`.
Original system-stub rollback bytes and the guest-derived permission allowlist
are retained beside it. Preserve the configured private image, current AVD
userdata and named `aa17_initialized_native51` snapshot during job cleanup.

The verified reuse path is a **cold boot retaining initialized userdata** with
`-no-snapshot`, followed by the normal AA wake below. Consent and Waze first-run
did not recur; native Waze Search/keyboard/results, route and admitted GPS
worked, and guidance survived DHU reconnects at 1280x480, 800x480 and 1280x720.
Run51's private review receipt records exact hashes, scope and cleanup. This
is not a full voice, mode, DPI, rotary or all-app acceptance claim.

Warm snapshot reload verified APK hashes/settings, but its first Frida attach
failed. Do not label warm runtime replay accepted. A cold boot also exposed
an AA car process waiting in `do_freezer_trap`: root alone does not thaw a
cached Android process. Before starting the existing observer, use ordinary
AA lifecycle entry points, then establish all required hooks before app test
stimuli:

```bash
adb -s emulator-5590 shell am start -W -a com.google.android.projection.gearhead.SETTINGS -p com.google.android.projection.gearhead
adb -s emulator-5590 shell am start-foreground-service -n com.google.android.projection.gearhead/.companion.DeveloperHeadUnitNetworkService
```

The observed wait changed to `futex_wait`; unchanged Frida observation then
attached successfully and retained coverage through native routing and both
reconnects. Do not force-stop AA again between this wake and attachment. Do not
disable the cached-app freezer globally, change SELinux, override native app
results or expand observers to work around startup. The existing observer
accepts only 240, 300 or 900 seconds; retain a separate overall stop deadline.
`-no-window` can select `qemu-system-aarch64-headless`, so verify the owned
AVD/serial and actual QEMU PID instead of assuming the non-headless executable.

At a terminal boundary, detach observation, stop the exact owned server,
remove forwards and token-scoped scratch, restore the initialized baseline's
APKs/settings/GPS and stop the VM. Preserve failed attachment receipts; only
the later fully covered app window supplies accepted behavior. No physical
phone was touched.

## Native Maps compact Search handoff

Runs190/191 use the unchanged feab48a Maps APK, original AA17 and SDK DHU at
800x480, with stationary GPS on the Netherlands A4. A first map tap can wake
auto-hidden host controls. The immediate wake/action sequence (250ms between
the two known targets) reached `ActionBinder`, the current native `rkp` model
and `rhe.G()`. A13-second gap instead produced another Surface hit. Do not
classify a Surface hit as a native Search action failure.

The actual failed Search chose `rhe.C()==true`, invoked `qng.c` with the
original `google.maps:?act=51`, and requested private `ICarRegionController`
overlay closure. Our facade acknowledged that request, but the native queued
central-display intent never ran. This is separate from action ownership or
an empty native bound model. Static method evidence and original-results
runtime receipts are retained under private runs190/191.

Static tracing also proves that the URI handler calls `rhe.G()` again; merely
forwarding it without a real region expansion would loop. The client patch
therefore selects Maps' existing local editor branch for the recorded current
CAL window. That native scene-construction branch is retained unchanged; no
native mode result is forged. Unowned contexts keep the original host path,
and scoped retired windows return without navigating a replacement. The
correction was rebuilt from the original APK and exercised in run193.

Run193 verified the exact installed829277c APK and actual800x480 Search,
touch-keyboard input `amsterdam`, genuine results, route preview, Route
details/Back, rotary Start and normal host End. Its unchanged SDK frames and
provenance are in the private `Maps-Search-fixed-193` review folder. Preserve
these passing gates; native guidance speech/PCM and driving are not accepted
by this stationary session. A planned result-scroll input landed after the
asynchronous preview transition, so scrolling is not claimed.

The actual guidance frame also exposed native white map controls underneath
the host's black strip near the speed badge. Their persistence was not timed.
The run stopped after retaining that finding and normal End;1280x480
Search/reconnect, lower Details scrolling and the new APK's next-coldboot byte
check remain open. Diagnose the actual native widget owners offline before
another connected implementation batch. No physical phone was touched, and
all owned runtime/build outputs were stopped and cleaned.

Run195 identified the duplicate guidance column precisely: the native
`zoom_widget_view` was already invisible. The visible reset/+/- controls were
three ID-less TextViews created by `Shapes.attachTiles`; the phone navigation
window picker had selected the real car decor. The fix records projected
decors weakly at the existing `carSurface` boundary, removes any old phone
column on that decor, and excludes it from phone picking/direct attachment.
It preserves phone settings and held zoom state, and keeps retired car
windows excluded after surface loss. New guidance/wide acceptance is required;
do not claim that suppressing the native zoom widget fixed this separate path.

Run197 verified the exact installed12cd912 APK, native Search/keyboard and
guidance at1280x480, with the legacy phone column absent while the host's
controls were awake. These close the wide UI gates only. Its real FM
AVG_SPEED_CHECK warning appeared, and the first corresponding Maps TTS
utterance returned0, started, finished and completed/quiesced natively.
Head-unit audio remains unaccepted: the private read-only PCM probe saw no
source8 sinks in AA's `:projection` process; other AA processes were observed
with the existing crash/lifecycle observer but not this PCM probe.

The existing A4 trace was replayed through the installed emulator's native
GPS API, with100km/h and47.7degree bearing verified in Android GPS. The
packaged `GpsState` proto labels speed as metres/second, but this emulator
converted it as knots:27.7778 input produced14.291254m/s;53.99568 produced
27.779976m/s. Preserve the failed and calibrated preflights; calibrate against
the actual receiver rather than trusting that comment on another SDK build.
The GPS operation used existing curl/SDK RPCs; no maintained replay runner or
framework changed, and its private bearer-header file was removed afterward.

The Maps viewport still moved to an A10 future maneuver while GPS was on A4.
The failed frame was captured at point44, but operator analysis delayed the
replay interrupt until point185. This is an incomplete failed drive, not
acceptance. A recovery command then used the earlier point44; all later
states, including a second TTS utterance, are excluded from continuous-drive
proof. Follow the stop-first rule in AGENTS before analysing another failed
drive frame. Compare the same-version stock Maps behavior before changing
camera policy. The End request remained unconfirmed at the capture; FM was
still running after disconnect, so native End/lease shutdown stay open.
All owned runtime resources were stopped and cleaned; no phone was touched.

## Historical single Vela design frame

The one-frame design gate described here was subsequently closed by the owner's
complete run92 approval. Retain this recipe for evidence provenance; do not
repeat the gallery or seek the same approval again.

The owner replaced the19-type design gallery with one Vela generic-pill approval frame. Maps' camera frame80 is already approved. Reuse the Vela engineering APK and initialized native onboarding retained by run84; preserve the older native51 snapshot and rollback APKs. Run84 proves real Vela map/route-preview rendering, not an approved pill or active-guidance acceptance. Verify the retained APK and prefs before claiming a new reusable baseline.

Use the **compiled** observer `.analysis/android-auto-acceptance/quiet-observer/observer.bundle.js`, SHA256 `68a4923351db81aa71e9e40f9ffd4c27f1dcfe4a7e81d8eb8c49baaa384d8120`. The raw ESM source is not a loadable replacement. Stop cached TTS before observation and use the normal AA wake/per-process freezer handling documented above. Require sufficient free disk before boot; run83 encountered an unresponsive guest and a subsequent restore boot was refused with1.3GB free. Completed-job obsolete APKs were audited and removed while keeping native51 and current rollback/input artifacts.

DHU touch coordinates exclude the120px top video margin, while raw screenshots include it. Launcher is `tap 40 435`; native Vela icon in the recorded grid is `tap 540 388`. Allow transitions to settle before taking a separate screenshot. Vela's A5 recent row is `tap 300 138`; the first route's Go is `tap 125 200` (not320). Run84 completed Vela's native welcome/Google choice/system-voice setup. Retain that state rather than repeating onboarding for every picture. Enable the native car speed-display setting for a review that includes the normal speed/limit badge.

Use only the existing archived FM input helper and one camera case for the owner-authorized artificial design event. Configure the receiver after onboarding, ensure both producer/receiver hooks are ready, emit a fresh event, wait for receiver delivery plus1.2s, then capture. Withhold a design claim if distance has expired or the card is absent. Preserve the raw DHU frame; do not compose the UI or describe artificial input as natural provider proof.
