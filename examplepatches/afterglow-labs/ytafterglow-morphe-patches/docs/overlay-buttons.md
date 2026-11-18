# Overlay buttons

The independent Overlay buttons tweak adds the standard player's mute, lock and
Afterglow Settings buttons. Mute and Lock default to ON and retain the existing
advanced Player > Overlay settings and translations. Download, Premium controls
and the eye modes remain pending and are not exposed by this batch.

The horizontal row follows the active iOS host: 44dp hit targets, a 26dp neutral
circle and 16dp white glyphs, trailing 14dp and 54dp below the player top. Only its
buttons consume touches. Its lifecycle follows the persistent native player root,
with its row in the native custom-view container above the lock UI;
muted previews, minimized players, PiP, ads and Shorts do not expose these actions.

On YouTube 21.43.523 the activity's Locy coordinator owns the Laske watch facade
and Larol lock entity. Laske.am/aE/aJ read, mute and unmute through native actions
for both player architectures. The legacy path reaches Lastx.aV, its native
volume computation and MediaPlayer/ExoPlayer volume. The unrelated skip-silence
setter is not involved. The iOS router stores YouMuteKeepMuted; its older
Overlay/YouMute setter override is outside the current Makefile source graph.
This port preserves the stored value and follows the actual native mute state.

Lock requests native fullscreen, then publishes the locked native state. Its
bounded request belongs to one activity controller and video; changing video,
backgrounding, disabling the button or timing out cancels it. Native lock states,
temporary suspension and unlock UI remain authoritative. The utility row can
also request native unlock. No transparent gesture blocker is installed.

Build97's lazy controls binder initially delayed attachment until the first tap,
and its row sat below native lock input. Build99 corrects both. Actual application
mixer gains, lock/unlock, live settings and page reset pass, but a subsequent
video switch exposed an existing WatchActions monitor inversion. Its ANR trace
shows the component callback waiting for the native owner while layout holds the
owner and waits for the callback. Build100 defers recording and preserves current
native context at subscription/transfer. All 17 thread regression checks pass;
the original code fails the deterministic lock-order test.

Build100 passes strict selections 29/30/31/1/3, all 260 production input hashes,
21 request-policy checks and 441 settings checks. 31 full and 21 independent
observations are reviewed (1 limited). Native mixer gain, lock/unlock through
both controls, cold OFF persistence, ownership, live settings and actual resets
pass. Warm unavailable-to-playable navigation and native Share/Save refresh pass
after the threading correction. The third warm intent did not change videos;
its evidence is limited to response and continued motion. The test variable
collision, raw log encoding correction and independent preroll timing remain
documented with original files. Actual content passes after native ad skipping.

Defaults and the exact full APK are restored and stopped. Final app, extension,
crash and ANR logs are clean. Physical devices, casting and alternate player
architecture runtime remain untested. The emulator has audio output disabled;
actual mixer gain is verified but audible hardware output is not.

Evidence: execution-100.json, overlay-buttons-audit-100.json and delivery-100.json
under port-completion-20261113. The full port remains incomplete.
