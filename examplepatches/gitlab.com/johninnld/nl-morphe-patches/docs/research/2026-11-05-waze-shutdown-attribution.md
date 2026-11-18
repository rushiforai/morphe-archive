# Waze shutdown attribution

## Observed failure

Genuine-AA setup run22 started Vela with the API-owned Waze provider before native first-run setup was completed. Waze PID 4870 reached foreground MainActivity, then Android recorded SIGNALED/status 9. The Android log explicitly records ShutdownManager aborting the VM and Waze sending SIGKILL to its own PID. The observer declared coverage failed; no DHU app acceptance followed.

Original APK static evidence maps NativeManager.onNativeLayerShutDown(boolean) to com.waze.ifs.ui.aa.d(). The native-layer callback first marks its engine shut down; aa.d() then stops WazeAppService, removes app tasks and kills the process. Suppressing only the final kill would not restore the stopped engine. The initiating request is still unproven. Both API expiry and original Java/native shutdown paths must remain distinguishable.

## Approved observation scope

The owner explicitly approved two read-only hooks in the existing native-warning-observer.js: NativeManager.shutDown() and onNativeLayerShutDown(boolean). They record the existing bounded Java stack plus API ownership, remaining lease, wrapper state and activity/car-session counts. The shared hook helper still calls the original exactly once and preserves its result/exception. No runner, unrelated hook or application eligibility/result was changed.

Syntax and Frida compilation passed. During run24 both methods appeared in hooks-ready, but the prior shutdown did not recur in the bounded setup observation (about 150 seconds from receiver launch). No caller/ownership payload was emitted because neither shutdown method ran. This is not evidence of a fix and does not close the Waze API-background or car acceptance gates. The run was deliberately ended before native setup/AA admission, restored its baseline and stopped its emulator with cleanupRequired=false.

Run23 used FM as Vela's provider and started Waze normally, but operator setup sequencing attempted Vela onboarding inside the Waze handoff window. It timed out before DHU acceptance. Preserve that as a setup failure, not an application pass or new crash.

Exact retained records are indexed in the private Downloads/Android-Auto-Waze-validation review folder. No physical phone was operated.

## Separate native car setup/login boundary

Run44 retained the normally initialized Waze phone process into genuine AA17,
instead of force-stopping it at the operator handoff. The previous native
“One-time setup” prompt was absent. The car client then displayed “Sign in to
Waze” and “Can't connect to Waze. Check your settings and try again.” No native
route, GPS, speech or profile pass is inferred. Further input stopped; the
session restored its state, detached observation and stopped the owned emulator
with cleanupRequired=false. Frida recorded no coverage loss. No Waze product
code, native credentials or login result was changed.

The original APK's `LoginController$LoginState.getAreCredentialsMissing()`
checks its native login-state variant. `login.s.h()` subscribes to native user
login and install/setup state; missing credentials cause the native install
request in `login.s.g()`. These static contracts explain separate setup/login
states but do not attribute the observed connection error to a patch.

An unmodified runtime control remains required before changing Waze for this
failure. The original 5.26.90.901 base APK verifies under its original signer
SHA-256 `03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7`.
The base contains no native libraries: use the original ARM64 split together
with its matching base, language and density splits, without patching or
re-signing. Exact member hashes, native-screen proof and bounded run outcome
are in the review folder's `waze-stock-control-inputs.json` and
`waze-native-car-login-run44.json`. Keep this login boundary separate from the
earlier native self-shutdown and the already validated provider integration.

## Original signed control 45: incomplete before car selection

Control 45 installed the original signed base, ARM64, English and density
splits without modifying or re-signing them. Its normal phone setup reached
the map and displayed “Using offline maps”. Precise foreground location and
notification permissions were enabled through ordinary Android UI; background
location remained ungranted, matching the earlier patched run.

Before selecting stock Waze in the car launcher, the attached original
process 5371 terminated while backgrounded during AA setup. Android exit info
records SIGNALED/status 9 at 2026-11-05 15:15:55.834. The caller was not traced;
this is not proof of intentional shutdown or a patch-independent explanation
for the earlier car-login error. A later process 7477 was discovered during
setup. Further input stopped when the missing original-process attachment
was detected. No stock car-login, route or speech pass is claimed.

The original process used existing Frida CLI 17.9.11 against server 17.23.3,
without injected-patch hooks. The unchanged observer retained AA/TTS coverage
and reported no coverage loss; the stock application comparison remains
incomplete because its CLI session ended. An initial TTS attach timeout was
preserved separately and resolved with the existing stop-TTS startup step.
No observer, fixture or runner source was changed.

Retained network configuration reports Android's active network validated,
no HTTP proxy and no Waze hosts-file override. This does not establish that
Waze's own backend login works. The original offline-map banner remains an
unattributed observation.

The emulator's package hashes, audio, debug property, automotive role
configuration and GPS were restored to the saved snapshot; all owned
runtimes/server/forwards stopped, the temporary snapshot was removed, and
202,222,776 bytes of extracted input/system-backup scratch were deleted after
compact evidence was archived. CleanupRequired=false. Review
`waze-original-control45.json` and its screenshots/exit-info for the exact
boundary. A matched car-login control is still required: complete AA setup
first, then initialize original Waze immediately before car selection to
avoid consuming its background lifetime on host setup. The broader goal and
all previously accepted provider/Maps evidence remain unchanged.

## Teardown-only correction and normal-startup control

The previous keep-alive injection replaced the result of the shared native
`car_lib.platform.af.b()` AAOS flag. That flag is also consumed by native
login and warm-session handling, so applying the local broadcast switch there
changed policy outside service destruction. The correction leaves the getter
unchanged and wraps only the result of `car_lib.w.b()` in the original
`WazeCarAppService.a(WazeCarAppService)` teardown helper. Its original deferred
shutdown and native shutdown branches remain intact. Version guards reject a
changed helper before mutation; real-APK regression cases also reject applying
the hook to the shared flag. The post-patch APK was inspected to verify both
bindings. This is a correction to hook scope, not a proven attribution of the
earlier car-login failure.

Checkpoint27 built the Android component, applied all 21 selected patches to
Waze 5.26.90.901 in FULL/validate mode, and verified signature and alignment.
Its APK SHA-256 is
`76afc8da7e298b1af1afc8c7c9bef82842bb3bacda5883d37fd07c9cb097d90a`.
Run47 still showed the car connection error when Waze had been started through
the receiver API before normal first-run. Its native shutdown callback had no
API ownership or lease; no Java `NativeManager.shutDown()` entry was observed.
Do not infer the initiating native caller from that callback.

Original signed control46 and corrected patched run50 completed AA setup
before normal Waze first-run, then immediately selected Waze in the car.
Both opened the native car map at 1280x480. Run50 retained Waze PID7063 and all
exercised AA processes under the unchanged Frida observer without coverage
loss. Acceptance ended 102 seconds after Waze normal startup, inside its
180-second window. This closes normal patched native-car-map startup only;
route, GPS, warnings, speech and the API-first sequence remain separate gates.
The different setup order does not isolate one cause of the earlier failures.

Native ARM64 curl on the same rooted VM returned Waze website HTTPS200 with
certificate verification immediately before and during run50. This establishes
current general HTTPS connectivity, not Waze backend authentication or the
network state during every historical failure. YouTube Music's native phone
UI requested sign-in for its streaming catalog; it did not display a network
error in the separately retained app check.

The existing ADB root path provides a verified UID0 Frida server; attempted
Magisk activation failed verification and was reverted. The owned AVD uses a
private image, leaving the shared SDK image unchanged. Run50 restored and
verified package hashes, audio, debug property and automotive role, retained
native curl, stopped owned runtimes and forwards, and archived/removed per-run
scratch with cleanupRequired=false. Exact identities, screenshots, limits and
observer results are in the private review folder's
`waze-normal-startup-run50.json` and `run50-observer-result.json`.


## Native route and aspect-ratio acceptance

Complete canonical local verification passed on committed correction
`9f89c9528fc9424f07973502503d0e08978b2b68` in checkpoint28. Its signed MPP
SHA-256 is `08529234a368500be1f0cd7c785d478659ab47f9e0468cf721ac10c5c39cf8ce`.
All targeted extension payloads and patch DEX are byte-identical to the
checkpoint27 bundle, so the already patched/signed APK was reused. The complete
verifier was not replaced with the smaller Android component gate. Its owned
checkout/process groups were cleaned with cleanupRequired=false.

Run51 then accepted native Waze Search, AA keyboard, real nearby results,
Go now and active native guidance at 1280x480. Actual Android GPS admission
reported about 4.002m/s and the native Waze widget displayed 9mph. The route,
turn card and speed widget remained present after genuine DHU reconnects at
800x480 and 1280x720. One rotary step visibly focused the launcher without
activating it. Full rotary/list scrolling, stop/Back, 240dpi and warning/voice
mode gates remain open; native route audio was not accepted from screenshots.
The final app window retained continuous unchanged Frida coverage and ended
inside its recorded deadline.

Setup failures remain separate: an initial inventory/dependency-order mistake
was recovered before app acceptance, and two pre-input attachment attempts
timed out on cached AA car processes. Read-only OS evidence showed
`do_freezer_trap`, no competing tracer, and normal AA settings/server startup
changed the wait to `futex_wait`. The unchanged observer then attached and
retained all exercised process coverage. No freezer/SELinux policy, observer,
runner, native login result or application readiness flag was changed.

The initialized userdata and named snapshot are now retained with an exact
private manifest and rollback inputs. Cold boot plus normal AA wake is verified;
warm snapshot runtime replay is not accepted. At termination, baseline APKs,
audio, debug property, automotive role, native curl and GPS were independently
verified restored. All owned runtimes/scripts/servers/forwards stopped and
per-run scratch was archived/removed with cleanupRequired=false. The private
review index contains `waze-native-route-run51.json`, nine reviewed captures,
`run51-observer-result.json` and `aa17-initialized-baseline51.json`. No physical
phone was touched and no stable release or main promotion occurred.
