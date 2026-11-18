# Native player behavior

The **Player gestures** and **Disable ambient mode** patches are independently
selectable. Both use the existing iOS preference keys and default to native
YouTube behavior. Importing a preference cannot activate an uninstalled patch.

## Tap to seek

`Player > Controls > Tap to seek` uses the native seek-bar touch coordinates and
calls the same update/seek methods as YouTube. On 21.43.523, the fingerprint resolves
`Ljsb.onTouchEvent`, with `Larua.S(I)` and `Larua.T(I)` reached through the intermediate
`Ljrq` superclass. The hook runs after the native touch setup; a separate helper
keeps the original method's register allocation unchanged.

## Double-tap gestures and free zoom

The same **Player gestures** patch also exposes the independent one-finger and
two-finger double-tap switches and **Disable free zoom gesture**. All default off.
The double-tap gate runs before native seek and feedback dispatch in `Larxl.a`;
its boolean argument identifies the native chapter gesture. Native chapter
availability remains controlled by YouTube.

Disabling free zoom preserves pinch-to-fill. Five reads of `Losm.aU` select the
player's existing fill/original path instead of continuous zoom; the underlying
native capability is retained so switching off restores it immediately. The
`Losu` player detector also saves and disables its one-finger quick-scale flag,
then restores the saved value on the next gesture after switching off.

Build 24 passes strict validation with all 25 Afterglow patches, 26 with GmsCore,
and 27 with GmsCore plus official Spoof video streams. Settings checks pass
175/175. The Android 16 emulator verifies:

- With only two-finger seeking disabled, two fingers leave 0:00 unchanged while
  one finger seeks to 0:10. With only ordinary seeking disabled, one finger leaves
  0:10 unchanged while two fingers seek to 0:22.
- Both switches block both gestures. Reset restores both. These are native
  gesture-classification tests; they do not establish a next-chapter destination.
- With free zoom disabled, pinch-out shows **Zoomed to fill**, and pinch-in shows
  **Original**. Switching the preference off restores continuous zoom to **1.8x**.
- One-finger zoom was unavailable in the native baseline. Its saved-flag
  restoration is verified in source, without claiming runtime activation.

Evidence in the directory below includes `gesture-*-21-{before,after}.xml`,
`freezoom-verified-fill-23-live.png`, `freezoom-verified-original-23-live.png` and
`freezoom-restored-decoded-continuous-23-live.png`. Build 24 has the same gesture
code as build 23 and additionally fixes SponsorBlock marker fading.

## Disable ambient mode

`Themes > Effects > Disable ambient mode` filters the native cinematic renderer's
Optional in `Lrir` while preserving its loading state. The old ambient feature
flags no longer exist in this target. When the Afterglow switch is off, the same
Optional is returned unchanged. YouTube's own Ambient mode preference is preserved.
The renderer gate applies when YouTube constructs the renderer state; reopening a
video guarantees that boundary is crossed. Lite Mode's existing policy forces
this gate on without overwriting the stored choice.

## Validation

Candidate `build-17/YTAfterglow-0.1.0-local.mpp` in
`/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`:

- Strict `--validate`: 23/23 standalone; 24/24 with official GmsCore. Both exited 0.
- Settings validation: 97/97 checks, including independent installation, imported
  preferences, resets and Lite Mode behavior.
- Signed APK signature verified and installed on the Android 16 phone emulator.
- Actual UI switch: a tap 75 percent across the paused 19-second test video leaves
  the position unchanged when off and jumps from 0:01 to about 0:15 when enabled.
- With native Ambient mode enabled, the video visibly lights the status bar and
  watch-page background. Afterglow's disable switch removes that lighting while
  the native menu still shows Ambient mode on.
- Switching Afterglow's ambient override off restores the lighting. Turning
  tap-to-seek off again leaves a second 75 percent tap at 0:02. Both Afterglow
  switches and the native ambient preference were restored to their starting
  values. `runtime-player-17.log` has no errors; `crash-player-17.log` is empty.

Evidence includes `tap-enabled-after-17.png`, `ambient-native-paused-17.png`,
`ambient-forced-off-player-17.png` and `ambient-native-preference-preserved-17.xml`.
No physical-device or live/DVR proof is claimed. The full Android port remains in
progress; see `tools/parity.json` for each preference's status.

## Player overlay

The independently selectable **Player overlay** patch exposes nine switches in
`Player > Overlay` when Advanced mode is enabled:

- Hide video title
- Hide Fullscreen button
- Hide More button
- Hide Collapse button
- Hide Subtitles button
- Hide Previous and Next buttons
- Remove dark background
- Disable fullscreen actions
- Hide Watermarks

All default off. Bindings attach at the native controls (`Lolx.E`), captions
(`Loex`), collapse (`Lrud`) and fullscreen (`Loft`) controllers. Hiding moves the
control outside the viewport and removes its accessibility/focus target. Its
native visibility, enabled state, layout and draw callbacks remain unchanged;
the modern fullscreen button requires those callbacks for control fades.
Restoring the setting restores the properties Afterglow changed. Bindings detach
their listeners with the view, and cache preferences until their revision changes.

Build 18 passes strict `--validate` application: 24/24 standalone, 25/25 with
GmsCore, both exit 0. Settings checks pass 106/106. Its signed APK installed on the
Android 16 emulator. The default controls, all five live hide switches, individual
fullscreen-button restoration, orientation changes, playback fades and Reset to
Defaults were exercised. No restart was needed between hide and restore. The
restored Previous button remains natively disabled, and the other controls keep
their original enabled/clickable states.

Evidence in the same directory: `overlay-default-player-18.png`,
`overlay-live-hidden-18-dismissed.png`, `overlay-fullscreen-faded-18.png`,
`overlay-fullscreen-restored-18.png` and `overlay-portrait-restored-18.xml`.
The remaining overlay options stay hidden and tracked as unfinished. Inline
feed-player and physical-device behavior have not been runtime verified.
The five switches and Advanced mode were restored off after testing.
`runtime-overlay-18.log` has no errors and `crash-overlay-18.log` is empty.

## Fullscreen

The independently selectable **Fullscreen** patch uses the native `Lris.m()` and
`Lris.n()` entry/exit methods. A weak bridge is captured from `NextGenWatchLayout`.
Automatic entry waits 750 milliseconds after content activation, once per local
player/video session. It checks the active video again, requires a foreground
maximized watch player, and leaves minimized players, picture-in-picture, Shorts
and ads alone. Manually leaving fullscreen does not immediately reenter it.

Exit-on-finish acts after the native end-status update. Generation checks cancel
pending work when the player/video changes, including A -> B -> A transitions.
Portrait support filters the native `maintainWatchState` orientation guard while
an existing watch player is fullscreen; it does not force fullscreen entry or
rewrite Android's rotation preference.

Builds 26 and 27 pass strict 26/26 standalone, 27/27 with GmsCore and 28/28 with
GmsCore plus Spoof video streams. The session suite checks 15 cancellation and
once-per-playback cases; build 27 settings checks pass 192/192. Runtime build 26
confirms automatic entry off/on, manual exit without reentry and independent
exit-on-finish: with auto entry off, the same 19-second video remains fullscreen
at completion when exit is off, and returns to portrait when exit is on, including
immediate native autoplay into another video. Build 27 keeps fullscreen through
landscape-to-portrait rotation only when enabled; decoded video retains its aspect
ratio with letterboxing, and the native timeline and fullscreen controls remain
usable. Turning the setting off restores the original rotation behavior.

Evidence: `fullscreen-auto-{off,on}-26.*`, `fullscreen-manual-exit-stays-26.*`,
`fullscreen-default-ended-26-live.png`, `fullscreen-exit-on-ended-26-live.png`
and the timestamped rotation samples in `fullscreen-exit-on-observations-26.json`.
Cold launches select the intended fixture reliably; one reused VIEW intent left
the previous video open and was excluded from the results.

Portrait evidence: `portrait-native-return-27.xml`,
`portrait-enabled-return-27.xml`, `portrait-fullscreen-playing-27.png` and
`portrait-disabled-restored-27.xml`. The emulator acceleration was restored to its
original value. Physical-device, foldable/tablet and casting runtime remain
unverified.

Build 27 also preserves the native Shorts player with all three fullscreen
switches enabled (`fullscreen-excludes-shorts-27.*`). Controls reset restores all
three to off. The isolated Fullscreen + GmsCore + Spoof video streams run writes
a successful three-patch result and valid APK; its wrapper terminated with 143
after saving the output, so `fullscreen-only-27/result-audit.json` records the
separate result/ZIP audit. The three complete all-feature runs exited 0.

Final `runtime-fullscreen-27.log` contains no Afterglow errors;
`crash-fullscreen-27.log` is empty. `fullscreen-final-reset-27.xml` confirms all
visible Controls switches are off; Advanced mode stayed off throughout this batch.

## Additional native overlay surfaces

Title hiding binds the native `player_video_heading` parent in `Lrud`; collapse
and overflow are separate siblings. Background hiding binds the center, top and
bottom control scrims in `Lolx.F` plus `top_bar_background`, leaving ambient
lighting and the native button backgrounds intact. Fullscreen actions use the
`Loks` quick-actions container. These share the reversible visibility binding.

Watermarks have two implementations: the legacy `Locu` branding ImageView and
the modern `featured_channel_watermark_overlay` component. The latter follows
YouTube's component updates, including its per-second playback refresh. Build 28
verifies title, shading and actions independently, and the visible playing
watermark off/on/off. Controls fade normally; the runtime log has no errors and
the crash buffer is empty. Evidence: `overlay-title-{hidden,restored}-28.png`,
`overlay-shading-{hidden,restored}-28.png`, `overlay-actions-{hidden,restored}-28.xml`
and `overlay-watermark-{visible,hidden-playing,restored-playing}-28.png`.

Fullscreen Share and Save belong to **Player buttons and menus**, independently
of **Player overlay**. Both surfaces use native accessibility IDs and exclude
overflow descendants; their shared icon models cannot identify individual buttons.
Clip retains its dedicated component match.

The two action bars retain reactive Litho component state even when their host
views change. `WatchActionsPatch` discovers the `Lmuj` element conversion,
`Lvnb` component state and `Lvna` native update callback. It remembers the current
input and scoped context only for `video_action_bar.e` and `quick_actions.e`
components. Preference changes replay that conversion and notify its original
subscriber. The native state monitor and disposal checks guard the replay;
context transfers update the retained scope, disposal clears the inputs, and the
extension registry holds weak controller keys. The video stays open at its current
position. This replaces the previous fullscreen presenter reset/dimension bridge.

Build 40 verifies Share-only, Save-only, both hidden and live restoration under
the video and in landscape fullscreen, preserving Like/Dislike, Comments and
overflow where present. Scrolling the watch row away and back preserves the same
behavior. The final playback resumes. Runtime logs contain no Afterglow errors
and the crash buffer is empty. The exact diagnostic-free build 41 passes strict
26/27/28 standalone/GmsCore/streaming application, all exit 0. Its 214 production
inputs and bundle ZIP integrity are verified. Build 41 repeats all 11 live cases
and resumed decoded playback with no errors and an empty crash buffer. Isolated
Player buttons and menus validation also passes 1/1 with exit 0. Defaults are
restored, diagnostic logging is INFO and the app is stopped.

A cold-launch baseline establishes that portrait fullscreen does not offer Share
at the tested width even with both hide switches off. Requiring that unavailable
button to reappear was a test error, not a demonstrated cache bug. The available
Save button hides and restores live there, retaining Like/Dislike/Comments.
The automated under-video checks now require an actual `watch_list` host so a
native fullscreen gesture cannot silently change which surface is being tested.

Evidence under the directory above: `watch-actions-result-40.json`,
`watch-actions-*-40.*`, `runtime-watch-actions-40.log`,
`portrait-baseline-{before-settings,save-hidden,save-restored}-40.*` and
`runtime-portrait-baseline-40.log`. The 46 action-filter and 196 settings checks
also pass. Physical-device, tablet/foldable and casting behavior remain untested.

## Playback end time

The independently selectable **Playback end time** patch adds **Show playback end
time** and **24-hour format** to the advanced `Player > Overlay` page. Both default
off. The clock uses iOS's calculation: round duration and elapsed time separately
to seconds, subtract, then divide by playback speed. Formats are US `h:mm a` and
`HH:mm`, in the device's current timezone. Unknown duration/position is left alone.

The hook binds `time_bar_total_time` in `Lomq.a(View)`. It keeps the native styled
text and adds one suffix, observing native text, playback and preference changes.
Weak view bindings follow attachment; pre-draw notices paused speed changes and
a duration that arrives after the label binds. Main-queue deferral lets native
`Loff.e` finish measuring its temporary text before the clock is appended. Build
42's synchronous watcher had polluted that native minimum-width cache; build 43
fixes it without overriding YouTube's layout properties.

Build 43 passes strict application: 27 Afterglow patches standalone, 28 with
GmsCore, 29 with GmsCore plus Spoof video streams, and one independently selected
Playback end time patch. All wrappers exit 0. The formatter passes 21 checks
including separate rounding, rate fallback, midnight, noon, locale and DST;
settings visibility and independent installation pass 207/207.

The Android 16 emulator verifies both clock formats in portrait/fullscreen,
format-only independence, live disable/reset, native 2x/0.25x selection while
paused, continued playback, fresh long-video duration and transitions from Shorts.
Native Shorts has no appended clock. A cold off baseline and actual Overlay
**Reset to Defaults** have the same 135px total-duration width on the long fixture.
Native speed is restored to 1x, overlay settings to defaults, Advanced mode off
and the app stopped. Both final runtime logs have no errors; crash buffers are
empty. Physical-device, live/DVR and casting behavior are not runtime verified.

Evidence in the directory above: `end-time-result-43.json`,
`end-time-result-43-speed.json`, `end-time-*-43*.png`,
`runtime-end-time-43.log` and `runtime-end-time-speed-43.log`. The bundle has 217
recorded production inputs; delivery provenance is recorded separately.

## Disable snap to chapter

**Player gestures** now includes **Disable snap to chapter** in `Player > Controls`,
default off and independent of **Disable two finger double tap**. It keeps the
original finger position when a scrub ends. Native chapter metadata, the timeline,
and chapter selection remain unchanged.

On 21.43.523, `Ljsb.r()` computes a nearby chapter target using its distance/time
window. The hook resolves the original `Larua.Q` position before native
`Larua.P(J)` commits the seek. Replacing that invoke preserves incoming branch
targets; the original seek and subsequent feedback comparison use the chosen
position. With the switch off the native target passes through unchanged.

Build 44 passes strict standalone/GmsCore/streaming validation (27/28/29), plus
independent Player gestures isolation (1/1); all wrappers exit 0. Settings checks
pass 216/216 and all 218 recorded production inputs match the bundle.

The Android 16 emulator uses the published chapters of `rfscVS0vtbw` as its
reference. In one paused-video session, native snapping reaches 1:45; enabling
the switch allows 12:51 between chapters; disabling it restores snapping to
15:06. Both switches together and the snap switch alone retain unsnapped
positions. Fullscreen stops at 51:42, 55 seconds from the nearest chapter.
The actual Controls **Reset to Defaults** restores a snap to 1:03:10. Native
gesture timing can select different chapters; checks use the chapter boundary
list rather than assuming every identical ADB swipe must select the same one.

Portrait return and resumed decoded playback pass. Controls defaults are restored,
Advanced mode remains off and the app is stopped. `runtime-chapter-44.log` has no
errors and `crash-chapter-44.log` is empty. Evidence includes
`chapter-result-44.json`, `chapter-reference-times.json`,
`chapter-expanded-description-44.xml` and `chapter-*-44.png`. Physical-device,
Shorts and live/DVR behavior are not runtime verified.

## Autoplay initial readiness

Build 45 completes the initial-paused behavior of `autoplayMode`: 0 Default,
1 Off, 2 Off + hidden. The iOS hook changes `YTPlaybackConfig.setStartPlayback`;
turning off next-video autonav would implement a different behavior.

The native `Laowv.l(Lapad;)` load method identifies bit 2 as `playWhenReady`.
The patch follows its interface getter into the copied `Laozo` configuration and
clears that bit in `Lapac.n` only for Off modes. The original request, other bits,
manual Play/Pause, seek calls and YouTube's saved autonav value are preserved.
`Lnzt.h()` binds the inflated native switch root to the shared attach/pre-draw
visibility policy; it no longer skips controller construction. The binding is
independently gated on Autoplay, so Player overlay need not be selected.

Verification: 242 settings checks; strict standalone/GmsCore/streaming 27/28/29
and isolated Autoplay 1/1, all exit 0. All 218 production inputs match build 45.
The emulator passes 12 basic observations plus three native-next observations:
both Off modes open at 0:00 and remain paused, manual Play works in portrait and
fullscreen, live mode changes preserve the current position, returning to Default
and actual Playback-page reset restore initial playback. Native Next Video opens
a different video at 0:00, then manual Play works without a process restart.
Default-mode Shorts has decoded, advancing video frames. Its accessibility Play
label does not reliably represent its paused state; frame comparison is recorded
separately instead of counting that label assertion as passing.

The native overlay switch is absent in both the baseline and candidate, so its
live hiding/restoration is source-verified, not runtime-proven here. Off-mode Shorts,
live/DVR, casting, ads and physical-device behavior remain untested. Runtime logs
contain no Afterglow errors and crash buffers are empty. Playback defaults are
restored, Advanced mode remains off, and the app is stopped.

## Caption persistence and automatic caption policy

**Captions** includes the two original independent Playback switches, both default
off. Remember caption state records the viewer's native caption preference write,
including its language identifier, and restores it through YouTube's initial
track-selection path. Disable auto captions suppresses only server ON and
ON_RECOMMENDED hints and the muted-device automatic-caption flag. Manual CC
controls and an explicitly remembered ON choice remain available.

On 21.43.523, `Laspd.m` sends the native enabled/language preference to `Laslu`,
then sets the recent-choice bit. Initial loading calls `Laspd.n` directly, so it
does not overwrite the extension's record. `Laspd.j` and its language selector
use the saved choice when requested; their existing track fallback is retained.
The device-caption fallbacks are suppressed for the remembered choice without
changing Android's accessibility settings. `Lasqy.d` supplies the named server
hint enum. Replacing its shared return ensures incoming branches reach the hook.
The old 150ms startup window and delayed CC toggle are removed.

Native preference persistence is feature-gated in the baseline. Diagnostic build
49 confirms manual ON is written while that storage gate is off; forcing the
local gate in build 50 still fails cold-start persistence. The final implementation
stores one Android-private `android_caption_choice` string in Afterglow preferences.
The enabled flag and native language id are atomic, and the targeted notification
leaves unrelated playback listeners alone. Absent/malformed records fall back to
native values. Remembering off or an uninstalled Captions patch leaves native
reads/writes unchanged. Whole-domain preference reset clears the record.

Build 52 passes 316 settings/policy checks, strict standalone/GmsCore/streaming
27/28/29, and Captions-only isolation 1/1, all exit 0. All 218 production inputs
match. The Android 16 emulator completes 20 observations covering remembered ON
and OFF through cold starts, independent caption switches, both together,
portrait/fullscreen, native Next Video, manual choices with remembering off,
actual Playback-page reset and resumed decoded playback. A UI test initially
missed a temporarily hidden control; revealing it and checking the native PAUSED
state allowed the remaining checks to complete without a source change.

Language verification selects Arabic in the native menu and retains that selection
through a cold start. The English-only fixed video `6IegDENuxU4` falls back to
English and renders captions over decoded playback; returning to `rfscVS0vtbw`
restores Arabic, proving fallback did not overwrite the saved preference. A native
Next recommendation first stalled at 0:00 after media HTTP 413. That failed load
is recorded separately and is not counted as caption fallback proof. Native
English/OFF and Playback defaults are restored, Advanced mode is off and the app
is stopped. Runtime logs have no Afterglow errors; crash buffers are empty. Evidence: `captions-result-52.json`, `qa-captions-52.log`,
`qa-captions-52-resume.log`, `runtime-captions-52.log`, `crash-captions-52.log`
and corresponding XML/PNG captures. Server-hint/muted-auto policy is source and
unit verified; no forced server-hint runtime fixture is claimed. Physical-device,
Shorts captions, live/DVR, ads and casting behavior are not runtime verified.

## Remember loop mode

**Remember loop mode** is independently selectable and exposes the original
Playback switch, default off. The native watch menu supplies its own Loop video
control. After a new video activates, restoration waits three seconds, matching
iOS. Explicit changes made after that restoration are saved. Remembering off
leaves native playback behavior and manual controls available.

On YouTube 21.43.523, `Lobh` owns the watch loop menu. Its `Laskj` provider returns
`Lasjv`; `Lasjs.k(int)` delegates through the native active-player guard to
`Lasij.q(int)`. The bridge calls that original route, retaining native loop events
and menu updates. Native watch ON is 2 and OFF is 0. Android playlist mode 1 is
retained as a native mode; cross-platform interpretation of imported iOS internal
loop enum values has not been runtime verified.

Five explicit action sites are hooked: one in `Loaj.a`, two native commands in
`Liyk.b`, and two button actions in `Lqlo.onClick`. The shared setter also receives
automatic resets from `Lrbp` and `Laypg`; those resets are deliberately excluded
from recording. The native lifecycle host is captured at `onStart` entry, before
its receiver register is reused. The injected recording call preserves incoming
branches to each original setter invocation.

Weak references and a video/director generation guard cancel stale callbacks
when players change or close. Startup changes cannot overwrite the saved mode,
and a restored activation does not reschedule after a manual choice. Ads and
Shorts are excluded. Delayed actions recheck the setting and active context.

Build 53 passes 26 session-race tests and 323 settings checks. Strict standalone,
GmsCore, streaming and loop-only selection pass 28/29/30/1, all exit 0. All 222
production inputs match. The first APK signing attempt stalled on a host-side
parallel-read ENOMEM; a preserved retry using ActiveProcessorCount=4 signs and
verifies successfully, and emulator installation passes. The native emulator matrix verifies saved ON/OFF through cold starts, fullscreen,
and disabled-recording preservation. The 19-second `jNQXAC9IVRw` fixture repeats
from an estimated 18.444s to 1.875s, then advances through 9.025s with unchanged
metadata and decoded frames. Opening `6IegDENuxU4` in the same process retains
Loop On. With Autoplay Off, loop restoration leaves the video paused at 0:00.
Manual Play advances to 0:07 and retains Loop On. Actual Playback-page reset
restores native Loop Off and normal initial playback; resumed decoded playback
passes. All 22 main observations and the repeat run complete without Afterglow
errors or crash entries. Playback defaults are restored, Advanced mode remains
off and the app is stopped. Evidence: `loop-result-53.json`,
`loop-repeat-result-53.json`, `qa-loop-53.log`, `qa-loop-followup-53.log`,
`qa-loop-repeat-53.log`, runtime/crash logs and corresponding XML/PNG captures.
Physical-device, Shorts, live/DVR, ads, casting and playlist-mode behavior remain
unverified.

## Native Music button and paid-promotion labels

Build 54 adds the Music button to Player overlay and completes the native label
bindings for Remove ads' independent Hide Paid Promotion cards switch. The two
actual inflated TouchImageView binders in Lojg.h/l preserve the native ViewStub
listener; paid-label TextViews bind in Lomq.a and Ljwx.L. Both use the existing
weak, live visibility binding, preserving native fades/layout and restoration.
The separate paid_content_overlay Litho filter remains independently gated.

Strict standalone/GmsCore/streaming 28/29/30 and isolated Player overlay/Remove
ads 1/1 pass, all wrappers exit 0. All 223 production input hashes match and ZIP
integrity passes; 328 settings checks cover independent feature ownership.

Android 16 completes seven recorded observations: both real switches, native
portrait/fullscreen controls, decoded music/default playback and actual Overlay
and Privacy resets. Defaults are restored, Advanced mode is off and the app is
stopped. Runtime logs have no Afterglow errors; the crash buffer is empty.

The official music video and sponsored-video baseline fixtures do not expose the
target native controls, even with Remove ads disabled for the paid-label check.
A preroll Sponsored badge is not the paid-content label. These two target visual
hide/restore behaviors are **source verified, not runtime verified**. Physical
devices remain untested. Evidence: native-badges-result-54.json,
native-badges-baseline-53.json, paid-ltt-baseline-53.json, runtime/crash logs,
strict result.json files and corresponding XML/PNG captures in the evidence root.

## Classic video quality

Video quality also exposes Classic video quality, default off. The legacy native
selector preserves availability checks and explicit Advanced requests. Modern
server-driven quality sheets are identified from their own adapter item; a
mounted Advanced row opens the native resolution list only after its own command
contains available formats. The first rendered row contains an empty model, so
clicking on the first draw produces an empty list. A native reactive rebind
populates the action. The guard checks that actual data, then rechecks the sheet,
attachment and setting before invoking the native callback outside drawing.

There is no fixed startup delay or global menu flag. Native selection, callbacks
and unrelated menus remain under YouTube's control. Native click listeners are
observed on ComponentHost and cleared by its original unbind call. The command
is read through fingerprinted native bridges; no reflection or diagnostic
logging remains. Unrecognized data leaves the ordinary quick menu available.

Build 64 passes strict standalone/GmsCore/streaming 28/29/30 and quality-only 1
plus quality/GmsCore/streaming 3, all wrapper exits 0. The 3707 parser checks
include real empty/populated native commands and every truncated prefix; 336
settings checks pass. All 225 production inputs match the built bundle.

The Android 16 watch-page matrix verifies direct populated resolution lists,
manual 360p/720p/480p selection, fullscreen, live ON/OFF, the unrelated playback
speed menu, and actual Playback page reset. OFF restores the four-choice quick
menu while retaining the viewer's selected quality. Cold reset returns Auto.
Native 360p playback and explicit Play/Pause checks at 720p/480p pass.

Shorts ON opens its native five-resolution list; OFF restores the three native
quality modes. Its quality label and selected state stay Auto/1080p after both
a specific resolution with Classic ON and native Data saver with Classic OFF,
including a paused comparison. Selection persistence is therefore not proven
for this fixture. Decoded Shorts playback remains working. No Afterglow errors
or crashes occur in either matrix; the switch ends OFF.

The initial automation attempt missed the gear after controls faded. A later
watch transition stalled after a toggle-based playback test; the corrected
explicit Play/Pause followup and a separate native 360p baseline pass. Both
failed attempts are preserved, and no cause is inferred solely from that timing.
Evidence is in classic-quality-result-64.json, classic-quality-shorts-result-64.json,
the native playback comparisons, corresponding XML/PNG captures and runtime/crash
logs. Physical devices, live/DVR, casting and ads remain untested.

An independent installation containing only Video quality plus official GmsCore
and stream support passes cold open, dismissal/reopen, live OFF and decoded
playback on the 19-second watch fixture. The native 240p/144p list appears directly;
OFF restores all four quick choices. Its settings contain only Wi-Fi, cellular
quality and Classic. The full configuration is restored afterwards. The earlier
long-video attempt stalled in a native preroll; another attempt clicked the ad's
More options button. Those failures are retained, and the helper now selects the
player gear by its resource ID. See classic-quality-isolated-result-64.json.

## Hide HUD messages

`Player > Overlay > Hide HUD messages` belongs to the independently selectable
**Player overlay** tweak and defaults off. The primary native message dispatcher
`Lkgx.g` takes its existing skip-display branch, preserving native completion and
dismissal callbacks. The five snackbar/mealbar constructor families and the
ID-scoped `root_pill_container` also bind to the reversible visibility controller.
The neighboring watch footer is untouched. Lite Mode's existing policy forces
this key without overwriting the stored choice; that override is unit verified,
while full Lite Mode runtime remains unfinished.

Build 65 passes strict 28/29/30 standalone/GmsCore/streaming and isolated overlay
1, all exit 0; 347 settings checks and 226 production inputs pass. Android 16
provides a visible baseline through Share > Copy link: the native confirmation
hides with the switch on and returns off. The Android clipboard preview remains
available. Live portrait/fullscreen restoration, cold start, actual Overlay reset
and decoded playback pass. No Afterglow errors or crash entries are present;
defaults and Advanced off are restored, and the app is stopped.

Evidence: `hud-result-65.json`, `hud-copy-{on,restored}-1-65.png`,
`hud-copy-fullscreen-{on,restored}-1-65.png`, `hud-copy-page-reset-1-65.png`,
`runtime-hud-65.log`, `crash-hud-65.log`. All native constructor paths pass source
and strict validation, but not every message class was individually triggered.
Physical-device, live/DVR and casting behavior remain unverified.

## Native most-replayed graph

`Hide most replayed graph` belongs to Seek bar and defaults off. A constructor
fingerprint anchored by `heat_wave_background_color` identifies HeatMarkerView;
only its `onDraw(Canvas)` call is gated. The native metadata, graph visibility
controller, seeking and chapter preview remain available, so switching OFF
restores the graph without rebuilding its model.

Build 71 verifies portrait and fullscreen ON/OFF, cold ON, the actual Seek Bar
reset and decoded playback, plus independent Seek bar settings and OFF/ON/OFF
seeking. Six strict selections pass (28/29/30/1/1/3), with 365 settings checks.
The shared SeekBarTheme dependency now includes Afterglow settings for isolated
Seek bar and Glow; this does not add app-wide resource color replacements.
Physical-device, live/DVR, Shorts and casting behavior remain untested.

## Persistent native progress

`Persistent progress bar` is independently owned by Seek bar and defaults OFF.
The `timed_markers_width` constructor identifies the native track. Its final
`onDraw` fraction read, center-position read and marker-layout read are overridden
only while enabled. Signature, field type, receiver and expected read counts are
checked before patching. The first duration guard and the native input/animation
controller are unchanged.

Build 72 verifies the fullscreen segmented track stays visible while controls
hide and disappears normally again when OFF. Portrait already shows a collapsed
indicator; no recoloring or expansion is required. Pause, cold startup, reset,
independent Seek bar install and decoded playback pass (nine full and five isolated
observations). Six strict selections and 382 settings checks pass. Experimental
whole-view alpha overriding and all diagnostics are removed. Physical devices,
live/DVR, Shorts and casting remain untested.

## Shorts header controls

Search, Camera, More and Lens belong to the independent Shorts layout tweak and
default OFF. They appear under Advanced mode → Shorts → Layout & Buttons.
Native header images are classified using renderer enum names, covering all
corresponding iOS Search/Camera icon families present in Android 21.43.523. The
Lens hook binds only the dedicated paused-state container.

The modern toolbar stays mounted while settings is open. Its Search image has
the exact `top_bar_conditional_button_image_yt_delhi_search_24dp` identifier;
More has `id.reel_more_button`. Classification is restricted to conditional
buttons under `top_bar.e`; toolbar parents and the paused Mute toggle are kept.
The patch carries a role through the native builder's view-tag map. Mount binds
the view to live preferences; unmount restores native translation, focus and
accessibility before recycling. The registration map holds weak keys and values.
No translated labels, forced toolbar rebuild or global view traversal is needed.

Build 78 passes strict 28/29/30/1/3, 57 identity and 394 settings checks. Runtime
includes 11 full observations on 77 and 6 isolated plus 4 final full observations
on 78. Search/More hide and restore live, native commands still open, Home Search
and paused Mute stay available, and actual reset and decoded playback pass. The
two changed files between 77 and 78 only broaden native icon classification.
Camera/Lens visual behavior, physical devices and alternate server layouts remain
unverified; native source and patch targets are confirmed. Full port unfinished.

## Shorts progress

Enable progress bar belongs to the independent Shorts tweak and defaults OFF.
Android 21.43.523 uses a separate activity-root InlineTimeBarWrapper. The patch
changes only two reads of its native controller's immutable display model:
known disabled and pause-only modes become the existing always-visible mode.
OFF, unspecified/unknown modes and absent models retain native behavior.

The native controller still owns panel suppression, pause state, active-player
checks, animations, interactivity and seeking. A live setting/import/reset/Lite
change refreshes only an attached Shorts content controller; it calls the native
normal policy, then the paused policy if the native pause flag is set. The shared
activity-root wrapper alone is not treated as proof that Shorts is open.

Build 80 has 416 settings checks and strict 28/29/30/1/3. Ten full and six isolated
runtime observations verify native seeking, progress/playback, pause/resume,
settings, cold ON, Home, Shorts-tab reuse and reset. Diagnostic79 showed the
fixtures already use always-visible mode, so no new visual difference is claimed.
Other native display policies are source/policy verified. Temporary logging is
removed; physical devices and alternate/absent native models remain untested.

## Shorts fullscreen

Pinch to Fullscreen belongs to the independent Shorts tweak and defaults OFF.
The patch enables the native pinch capability only when requested; OFF preserves
the original capability. YouTube still recognizes the gesture, applies its scale
thresholds and renders Clear Screen. Its own Exit Clear Screen remains available.

An accepted pinch binds the actual player and clear-mode controller through weak
references. Pinch-out hides the native bottom container, calls the navigation
controller's hide path, and suppresses the Shorts fragment's replacement bottom
margin. Both native height notifications and browse insets are updated. Pinch-in
restores the native layout; the extension does not stretch the video or invent a
fixed bar height. On the emulator, the player gains the existing 126-pixel tab area.

Tab visibility and overlay visibility are separate. Pinch-in and taps show the
native overlay, then schedule a three-second idle hide. A native hold that opens
the options sheet keeps that sheet intact through the panel guard. Tapping
while fullscreen keeps the tabs hidden. The existing touch dispatcher retains
control of event consumption, play/pause, scrolling and native hold behavior.
Idle work requires the same attached, visible and focused player plus the native
engagement-panel eligibility guard. Pointer activity, reset, OFF and detachment
cancel pending work.

YouTube resets clear mode when a new reel's observers mount. While the same
player remains eligible, the extension reapplies the chosen overlay state on
the main queue and retains the independent tab state. Leaving that player
releases ownership. Live preference/import/reset changes restore native state.

Build 85 passes 427 settings checks and strict 28/29/30/1/3 selections. Eight
focused, nineteen full and thirteen independent-install observations are visually
reviewed. They verify fullscreen and idle continuity, native play/pause, native
exit, comments/options guards, live OFF, Home, actual reset and advancing decoded
frames. The original isolated hold assertion incorrectly expected idle clear mode
instead of the native options sheet; retained evidence and bounded completion
cover that correction without a production change. All final app/extension/crash
logs are clean. The native capability was already ON in the baseline; enabling an
OFF capability is policy/source verified. Physical devices and alternate server
layouts remain untested.

## Shorts-only mode

Shorts-only mode belongs to the independent Shorts tweak and defaults OFF. Its
existing confirmation and translations are retained. Cold startup uses YouTube's
native Shorts action. Live enable foregrounds the main activity, waits for its
focused frame, then uses the exact native `Lrun.z("FEshorts", true)` tab command
used by YouTube's startup handler. Tabs remain available while entry is pending.

Tab hiding is independent of pinch fullscreen. The native Shorts touch dispatcher
observes exactly two pointers held within touch slop for 500ms. Movement, pointer
loss/cancel and an inactive, detached or unfocused player prevent the escape.
The accepted hold writes the mode OFF, shows the existing localized toast, clears
pinch ownership, and restores tabs after one second. Re-enabling cancels that
restoration. Native event consumption, play/pause and the one-finger options sheet
remain intact. Native Back handlers close panels first; an unhandled Back remains
inside Shorts while this mode is enabled.

Build87 passes all strict 28/29/30/1/3 combinations and 427 settings checks.
Runtime live/cold entry, native Back and panel handling, rejected short/moving/
single-pointer holds, timed escape with pinch OFF/ON, preserved pinch preference,
Home after OFF, confirmation cancellation and page reset pass. Known fixed clips
play advancing frames. A metadata-gated run verifies two successive native feed
changes with sustained drags while tabs remain hidden.

Earlier short injected swipes retained the same clip. Diagnostic88 shows complete
native list delivery without a blocked-list flag, layout interruption or Back
call during those gestures; a sustained ON swipe advances. No production change
was made for that investigation. All traces are removed from release source,
which again matches the 243 build87 inputs. Failed assertions are retained in the
external evidence directory. Some recommended clips buffered, so their captures
prove routing/layout only; the fixed clips and confirmed feed changes separately
prove decoded motion. A further confirmed clip change retains pinch Clear Screen
and hidden tabs. Thirty-eight full and thirteen independent-install observations
are reviewed; independent routing, Back, escape, native Home and actual page reset
pass. Interrupted escape/reset captures were completed in bounded continuations
with original evidence retained. All final logs have no app/extension crashes or
errors. Physical devices and alternate layouts remain untested.

Build87 log qualification: the earlier full run contains two SIGSEGV crashes in
the emulator goldfish VP9 decoder service (UID 1013), with no target-app crash.
The relationship to this feature change is not established. Later native-feed,
pinch-feed and independent runs have empty crash buffers; raw tombstones remain
in crash-shorts-progress-87-only.log and the execution audit.


## Native Shorts player layer

Hide built-in player layer is an advanced, default-OFF setting owned by Shorts
layout and buttons. It masks Lmpo.Y()'s final native visibility argument for
reel_player_overlay_container; the native S/o state remains unchanged. Weak
controller bindings refresh attached views through that same native method when
the preference, Lite Mode or reset changes. Detached controllers are pruned.

The native action rail and footer hide while decoded video and parent touch
dispatch remain available. Separate header, bottom navigation and thin progress
are preserved. Native Clear Screen retains its own control over header and exit
visibility. Turning the setting OFF restores the current native state.

Build89 passes 427 settings checks, strict 28/29/30/1/3 selections and 245 source
hashes. Sixteen full and ten independent emulator observations are visually
reviewed, including live restoration, pause/resume, cold ON, actual reset and
decoded motion. Full tests verify Shorts-only escape and pinch while hidden.
An initial fullscreen-retention assertion was corrected by a settings round-trip
with this setting already OFF and unchanged; no production correction was made.
Failed/interrupted attempts remain in execution-89.json. Final app/extension/crash
logs are clean. Physical devices and alternate server layouts remain untested.
