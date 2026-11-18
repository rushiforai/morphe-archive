# Android port execution ledger

## Session Ledger Checkpoint — 2026-11-13

- Current user intent: finish the Android port, continuing autonomously through the remaining implementation and validation. Do not stop at another batch summary or ask the user to restart the work.
- Target: YouTube 21.43.523; standalone Afterglow patch bundle alongside official GmsCore support. iOS source is the behavior specification.
- Verified starting state: clean `main`, origin `afterglow-labs/ytafterglow-morphe-patches`, commit `9e10493a90caa0235b7ad93a2a4eb5119df59da1` pushed.
- Existing proof: native solid themes, 30 presets, light/dark foundation, restart and reset; 359 JVM checks; strict standalone and GmsCore application; Android 16 emulator.
- Outstanding scope: tracked by `tools/parity.json` (139 todo at start), including Theme Studio editor/library/transfer, native gradients, typography/glow, player/seek-bar controls, tabs, SponsorBlock, Control Center, downloads and other destinations.
- Next action: complete the semantic theme document, durable custom library and editor using the iOS file format; then connect native rendering and continue the parity list.
- Constraints: preserve defaults, gate each feature on its installed named tweak, fail open; use strict `--validate` patch testing. Put build/runtime evidence on C:. Commit and push directly to main. No physical device is required for emulator validation.

## Implementation checkpoint

- Added `ThemeDocument`, bounded JSON codec, semantic-record reconciliation and atomic saved-library operations. Theme engine: 400 checks pass. Existing settings visibility: 67 checks pass.
- Theme Studio now opens a draft editor with all 20 roles, contrast values, foundation, gradient, glow and typography; duplicate, rename, delete, import/export flows are wired. File import supports JSON and XML plist. Cancellation does not change active settings.
- Added native view attachment, gradient transparency/host background, semantic text-span colors and typography hooks. Copied the 43 existing bundled iOS font files into patch resources (16.7 MB). Android system counterparts are used for Apple system-only families; this is not exact Apple font fidelity.
- Build 02 compiled and passed all 20 selected patches with GmsCore (`combined-02`). Verified 37 text span constructors and 14 StaticLayout builder calls. Signed APK installed successfully on emulator-5600.
- Emulator UI proof so far: preset Duplicate & Edit; rename draft to QA Theme; background color changes to #172336 with preview/contrast updates. Save/restart/library and native gradient verification are in progress.
- Build 03 failed strict validation: Shorts resolves its color across two branches outside the initial search window. Fixed register-lifetime tracing; build 04 and build 05 each pass all 22 selected patches with GmsCore.
- Custom theme save/restart/persistence verified: QA Theme, #172336 background, custom identity retained in My Themes. JSON exported through SAF and parsed on the host with gradient, typography and glow fields intact.
- Gradient test exposed a launch crash in MediaRouteButton: Android contrast calculation rejects translucent theme backgrounds. Resource backgrounds now stay opaque (with compositing for translucent user colors); transparency is restricted to page views and Litho drawables. Build 05 launches with an empty crash log. Remaining opaque containers were identified from the actual UI tree and handled in build 07; native gradient visibility is still being checked.
- Build 06 adds verified native seek-bar geometry access, track glow, custom PNG scrubber, and 200ms transitions. Typed color/image pickers replace the placeholders. Build 07 adds page-container clearing and settings typography. Combined strict runs are in progress. Current installed emulator build is 05.
- 433 JVM theme/motion/glow checks and 67 visibility checks pass. Added a regression check for the opaque resource/transparent drawing boundary. New controls are tracked as partial while runtime coverage is checked; internal color/image keys now have an explicit implementation map validated by check_tweaks.
- Evidence root: `/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`. AVD YTAG_Glow_Check is running on port 5600. The connected physical device has not been touched.
- All changes after 9e10493 are uncommitted. Continue runtime gradient/font/glow/player and file import checks, finish native role coverage, then update documentation, commit/push verified work and continue the remaining parity list. Do not report the full port finished.

## Session Ledger Checkpoint — 2026-11-14

- Latest user steering was conversational ("it made me laugh"); Android work continues under existing authorization. No permission or batch-selection question is pending.
- Build 09 passed all 22 selected patches with GmsCore. Installed and verified native feed gradient, imported Share Tech Mono on tabs/settings, native tab glow, theme import/restart, and video playback. Feed titles still used YouTube's own font registry; added a verified Laszn font-return adapter for styled text.
- Replaced banded concentric seek glow with cached radial/linear falloff and preserved native paint alpha. Native icon overlays now follow visibility, ancestor alpha, selection, and animated drawable changes.
- Build 11 passes strict --validate both standalone (21 patches) and with GmsCore (22). Both verifier processes exited 0. Its signed APK installed on emulator-5600; final runtime checks are active.
- 438 theme checks and 67 settings checks pass. Custom image picker saved a 64x32 PNG; the size picker is set to 100 percent for runtime inspection. Draft typography preview is the only source change after build 11.
- Font provenance verified against the current iOS spec checkout: 43 byte-identical files, 16,650,840 bytes; docs/font-assets.json records hashes and source commit.
- Next: verify registry fonts and smooth player glow, build the final preview fix, confirm cancel/rename/delete and reset, update current docs/parity evidence, commit/push and deliver the uniquely named .mpp. Full port still includes the remaining parity list; no claim of full completion.

## Final theme validation checkpoint

- Build 12 passes strict application: 21/21 standalone and 22/22 with GmsCore. 438 theme checks and 83 visibility checks pass.
- Runtime proof includes native fonts in feed/watch/comments/settings, full custom scrubber above track bloom, seeking and portrait/fullscreen controls. JSON and XML theme imports, export, draft discard, rename, delete, typography/seek reset and system color reset all passed. The normal YouTube settings entry works; the three saved QA themes survive reset.
- The crash buffer is empty, but the detailed YTAfterglow log exposed repeated nonfatal software-canvas errors from a fullscreen video thumbnail (YouTube's bitmap-backed Lvpn drawable). Do not publish build 12 as error-free. Glow/tint selection is now restricted to verified player icon resource IDs; bitmap artwork is skipped. Unsupported drawables are remembered weakly so a failed mask is not retried every frame, and failed allocations are recycled.
- Build 14 contains that correction (build 13 was intermediate). Next: strict validate build 14, install, repeat the fullscreen trigger and inspect the correct YTAfterglow log tag, then commit/push and deliver.
- After delivery, continue the unfinished player features and remaining parity list under the existing authorization. The complete Android port is still unfinished.

- Build 14 passed both strict runs (21 standalone, 22 with GmsCore), verified its signature and installed successfully. The fullscreen thumbnail trigger was repeated with QA Glow Mono active; glow still renders, the video thumbnail keeps its native pixels, runtime-fullscreen-14.log has no errors and crash-fullscreen-14.log is empty.
- Final theme candidate: build-14/YTAfterglow-0.1.0-local.mpp, 8,480,998 bytes, SHA-256 6a3d114e3281790836fafd3a4b819e708b89a39626d49a3f2257393364ab756a. Build input hashes are recorded in source-build-14.json under the evidence root.
- Ready to commit/push this validated theme checkpoint and create its delivery copy; the next active work is the remaining player/seek/ambient functionality.

- Build 14 eliminated the hardware-bitmap errors, but its screenshot exposed an overbroad bitmap exclusion that also removed glow from the verified fullscreen button. Build 15 keeps verified player icon IDs eligible, while excluding anonymous artwork. Both strict build-15 runs now pass (21/21 and 22/22); final signing/install/fullscreen checks are in progress.

- Build 15 is the validated theme delivery candidate: 8,481,002 bytes, SHA-256 4dea9bc06062fdb2985cbcc691d12db21c549444b1ca3836a7bad234a52fc3c8. Both strict runs exited 0, signature verification and installation passed, and all 187 recorded build inputs still match source. The fullscreen retest restores the verified bitmap icon's glow, leaves the thumbnail unchanged, and has no YTAfterglow errors or crashes. Screenshots/logs are fullscreen-controls-15.png, runtime-fullscreen-15.log and crash-fullscreen-15.log.

## Player behavior continuation

- Theme checkpoint committed and pushed to main as 0bdf544ce191713f639ede4636570c242b2753ce; remote main verified. Delivery: /mnt/c/Users/Corey/ytag-scratch/android/deliveries/YTAfterglow_Android_20261114T065902Z_yt21.43.523_0bdf544c.mpp. Matching .sha256 and .manifest.json include all 187 verified source input hashes.
- Emulator build 15 has been restored to default typography and colors. The saved QA library remains.
- Added next native boundaries: tap-to-seek delegates to verified Larua.S(I)/T(I) after Ljsb touch setup; disabling ambient mode empties only Lrir's cinematic renderer Optional and preserves loading state. Both settings remain todo/partial until strict and runtime verification.

- Build 16 failed a conservative seek-bar parent guard: the actual inheritance is Ljsb -> Ljrq -> Larua. Build 17 validates the independently fingerprinted bar instead of assuming a direct parent. Strict runs now pass 23/23 standalone and 24/24 with GmsCore, both exit 0.
- The signed build 17 installed and passed real UI toggles: tap-to-seek off leaves 0:01 unchanged, on seeks to about 0:15, and off again leaves 0:02 unchanged. Ambient lighting disappears with Afterglow enabled and returns with it disabled; the native Ambient preference stays on throughout the comparison. Both Afterglow switches and native ambient setting were restored off afterward.
- 97 settings checks pass, including isolated install/import/reset/Lite Mode gates. Runtime log has no YTAfterglow errors; crash buffer is empty. Parity is now 58 done / 4 n/a / 137 todo. No physical-device or live/DVR validation is claimed.
- Next: commit/push and deliver build 17; then implement the native player overlay visibility controls. The full port remains active.

## Player overlay continuation

- Build 17 committed/pushed as 8900a897437b8d1db18a721a3b277b91a2a0cf60; verified remote main. Delivered YTAfterglow_Android_20261114T071721Z_yt21.43.523_8900a897.mpp (8,493,985 bytes, SHA-256 a89af6c0edf6e909b661b272a62c671609f08703bb8a83505d229053e7d3c38a), with manifest and 190 input hashes checked against committed blobs.
- Added independently selectable Player overlay: captions, previous/next, fullscreen, collapse and overflow visibility. Verified native boundaries are Lolx.E (controls), Loex (captions), Lrud (collapse), Loft (fullscreen). Draw callbacks and native visibility remain intact; reversible offscreen positioning follows the requirement of the modern fullscreen control. Bindings follow attachment and preference revisions.
- Build 18 passes strict validation: 24/24 standalone and 25/25 with GmsCore. Settings checks pass 106/106. Candidate is signed/installing for portrait/fullscreen and live hide/restore tests. These five preferences remain partial until runtime checks finish; no physical device has been touched.
- Build 18 runtime is now verified: all five switches hide existing controls without restarting; restoring only Fullscreen brings back that control alone. Portrait/fullscreen transitions retain the other hides. Playback controls still fade out and return when paused. Reset restores all controls, including the native disabled Previous button. The five keys are done (63 done / 4 n/a / 132 todo). Runtime log has no errors and crash log is empty; Advanced mode and the five switches were restored off. Ready to commit/push and deliver, then continue the remaining port.

## SponsorBlock continuation

- Player overlay committed/pushed as 1701caacc81e35ced39caff89fe67ab360d34fae. Delivery: YTAfterglow_Android_20261114T073021Z_yt21.43.523_1701caac.mpp, 8,501,075 bytes, SHA-256 f552bd09f374fa437b3febf3e01ab0406bf44aa778852a2fae79733b21cadafa; 192 build inputs verified against the commit.
- Implemented the iOS SponsorBlock client, category defaults, generation-checked session, once-per-session skip/undo, overlapping marker layout, native timeline drawing and four-second Undo notice. Ljsb implements the native Shorts timeline interface Ljsq as well as the watch bar; the shared geometry hook covers both. Runtime verification is still required.
- 87 SponsorBlock policy checks, 151 settings checks and 438 theme checks pass. Build 19 compiles; strict standalone and combined GmsCore runs are active. All 21 SponsorBlock keys remain partial until runtime validation. The physical device remains untouched.

- Build 20 adds immediate active-video generation changes so A -> B -> A between ticks cannot retain the old session. Strict runs pass 25/25 standalone, 26/26 GmsCore and 27/27 GmsCore plus official Spoof video streams. Build 19 also passed the isolated SponsorBlock+GmsCore selection.
- Runtime watch/fullscreen skip, Undo, independent marker/category controls and reset passed. Native Shorts requests initially failed with HTTP 413; official Spoof video streams resolves that playback boundary. The unchanged build 20 then passed a real Shorts intro skip, blue marker and Undo to 0:00. Disabling only Shorts suppresses its client/marker/skip while watch sponsors continue skipping.
- All 21 SponsorBlock keys are done: 84 done / 4 n/a / 111 todo. 87 policy, 151 settings and 438 theme checks pass. Final logs have no YTAfterglow errors and an empty crash buffer; defaults restored. Next: commit/push and deliver this checkpoint, then continue the remaining player/gesture and other parity work. The full port remains active.


## Double-tap gesture continuation

- SponsorBlock committed/pushed as 33875d427c05f454a4cbf87cf5e593d5aa5d3499; remote main verified. Delivery: YTAfterglow_Android_20261114T081642Z_yt21.43.523_33875d42.mpp, 8,515,575 bytes, SHA-256 01e4e045554f2babea1c5da772a442b2df75da532b6c3ea4e39a850fcc37454a, with 202 committed build inputs verified.
- The emulator retains sponsor-streaming-test-20.apk (official GmsCore and Spoof video streams plus all Afterglow patches), all SponsorBlock defaults restored, app force-stopped. Continue using official streaming compatibility for runtime checks; physical device untouched.
- Next native boundary is Larxl.a(MotionEvent, View, boolean): constructs Larxo and dispatches gesture seeking and feedback. The boolean distinguishes chapter double taps. Added independent noDoubleTapToSeek and noTwoFingerSnapToChapter gates before dispatch, preserving native behavior when off. Both keys stay partial pending strict/runtime validation. Free zoom must retain pinch-to-fill per current iOS code; do not implement it by suppressing all pinch gestures.

- Build 21 passed strict standalone/GmsCore/streaming selections (25/26/27). The paused-video gesture matrix confirms independent one-finger and two-finger gates, both-on suppression and reset. Capture logs also contain a UIAutomator registration collision from an interrupted host test; the app did not crash. The test helper now serializes navigation and leaves every settings activity before returning to playback.
- Build 23 adds the verified native free-zoom capability (Losm.aU, five reads) and reversible quick-scale suppression while retaining pinch-to-fill. All three strict runs passed; 175 settings checks pass. Runtime free-zoom checks are in progress on gesture-test-23.apk.
- Baseline zoom testing exposed SponsorBlock markers persisting after the native bar hid. Build 24 adds animated track bounds (Ljsb.aa) and the native animated paint alpha (Ljsb.c.j) to the bridge, so markers follow native fading without depending on scrubber presence (important for Shorts). Strict/runtime fade and Shorts rechecks pending.

- Build 24 is verified: strict standalone/GmsCore/streaming runs passed 25/26/27, all exited 0. The Android 16 emulator preserves pinch-to-fill (Zoomed to fill / Original), and disabling the setting restores continuous 1.8x zoom. One-finger quick-scale was unavailable in the baseline; only its saved-flag restoration is source-verified. Both double-tap classification switches independently block their gesture; reset restores both.
- The marker correction passes fullscreen fade/return and thin Shorts timeline tests. Final runtime-gestures-24.log has no errors; crash-gestures-24.log is empty. Controls and Advanced mode are restored off. 175 settings, 438 theme and 87 SponsorBlock checks pass; 205 production build inputs match the candidate. Parity: 87 done / 4 n/a / 108 todo.
- Ready to commit/push and deliver build 24, then continue fullscreen entry/exit and the remaining port. No physical device was used; full-port completion is not claimed.

## Fullscreen continuation

- Gesture checkpoint committed/pushed to main as daa3c05040f491af17c628ba6b06ddbfcae4ece6; remote verified. Delivery: YTAfterglow_Android_20261114T085956Z_yt21.43.523_daa3c050.mpp, 8,530,429 bytes, SHA-256 b2f63e0c51eefa49cd7007213ed9cfbfaa4a8a32ffbc38ebaf2eb91cd4d68f44; 205 input hashes verified against the commit.
- Added native fullscreen bridge discovery and delayed once-per-playback entry/finish exit. 15 session-race checks and 190 settings checks pass. Portrait orientation remains hidden until implemented. Build 25 failed on a newer Morphe API import; build 26 adapts it to the local patcher 2.1 member API. Runtime and strict verification remain pending.
- Build 26 passes strict 26/27/28 selections, signs and installs. Actual UI: automatic entry off remains portrait; on enters fullscreen, and manual exit stays portrait through resume. Added a native portrait rotation guard for build 27 (Lkri.e reads Lkrj.h, maintainWatchState); it preserves an existing fullscreen player without forcing entry or changing Android orientation settings. Build 27 strict runs and remaining end/rotation checks are active.
- Build 27 completes all three fullscreen controls. Sensor rotation off/on/off verifies native exit versus retained portrait fullscreen; resumed decoded video is correctly letterboxed. All switches enabled leave Shorts in its native player. The three all-feature strict runs pass 26/27/28 and exit 0; settings 192/192 and session races 15/15 pass. The isolated three-patch run writes success and a valid APK, but its wrapper exits 143 after saving; a separate result/ZIP audit passes and records that distinction.
- Final controls reset is verified, acceleration restored, Advanced mode remains off, runtime-fullscreen-27.log has no errors and crash-fullscreen-27.log is empty. All 210 build inputs match. Parity: 90 done / 4 n/a / 105 todo, 26 named patches. Next: commit/push/deliver this checkpoint, then continue native overlay title/background/actions/watermark and the remaining full port.

## Native overlay continuation

- Fullscreen checkpoint committed/pushed as a77f955b3ec7b92e59b5869537771711bb0dbfaf. Delivery: YTAfterglow_Android_20261114T092401Z_yt21.43.523_a77f955b.mpp, 8,542,360 bytes, SHA-256 6b1b90022485080ab0a2636ffbb6da11ec4073bb3edfb0236ca3bb3f6a18da42; all 210 production inputs verified against committed blobs.
- Build 28 adds title-parent binding (Lrud), three control scrims (Lolx.F), top-bar background, quick-actions container (Loks), legacy watermark (Locu), and modern featured_channel_watermark_overlay filtering. Android 16 verifies independent title/shading/actions hides and restoration, playing watermark hide/restore, retained controls and fading. runtime-overlay-28.log has no errors; crash-overlay-28.log is empty.
- The actual component trace identifies quick_actions.eml with id.video.share.button and id.video.add_to.button. Build 29 extends the existing Player buttons and menus filter to these fullscreen controls, gated only by the two corresponding preferences. All three strict build-29 runs pass 26/27/28 with exit 0. Isolated Player overlay validation and final combined runtime checks are in progress. Settings checks pass 196/196; 211 production input hashes recorded. No physical device used; full port remains active.
- Build 29 runtime exposed two action-filter boundaries: cached native layouts survive a settings round trip, and fullscreen buttons share a model containing their siblings' icons. Restrict fullscreen matches to native accessibility IDs, exclude overflow descendants, and refresh through the native presenter reset/model setter plus its last measured dimensions. Build 30 contains that correction; 42 action-filter regression checks and 196 settings checks pass. Strict validation and live restoration are pending. The build-29 isolated wrapper exited 143 after writing the APK but before result.json; it is incomplete, not a passing isolated check.
- Build 30 passes strict 26/27/28 runs and both standalone one-patch isolation runs (Player overlay and Player buttons and menus), all exit 0. Android 16 verifies live fullscreen Share-only, Save-only, both hidden, and both restored in the same paused video, preserving Like/Dislike/Comments/overflow. The new overlay switches also pass combined fullscreen/portrait hide and playing fade checks; reset is finishing.
- Under-video cross-check found the existing icon fallback also hides neighboring buttons because their model contains Share/Save icons. Build 31 removes that ambiguous fallback and keeps native accessibility IDs plus the dedicated Clip component. All 46 regression checks pass, 214 input hashes recorded. Build-31 strict runs are active. Keep Share/Save partial until under-video behavior and cached restoration are resolved; four overlay keys are done, so parity is 94 done / 4 n/a / 101 todo. Full-port work continues.
- Build 30 combined overlay reset finished: all nine visible switches are off, native fullscreen/portrait controls return, playing watermark returns, and Advanced mode is off. runtime-overlay-30.log/crash-overlay-30.log include a UIAutomator CLI Bad file descriptor crash (PID 7885), not the YouTube process (PID 7621); Afterglow reports no errors. Preserve that distinction and collect fresh final-build logs after retaining this evidence.
- Build 31 strict standalone/GmsCore/streaming runs pass 26/27/28 and exit 0. All 214 production hashes match the candidate; ZIP integrity passes. The signed final APK independently hides under-video Share/Save after reopening without affecting Like/Dislike or the neighboring action. The live under-video matrix still reproduces the cached-layout limitation (`under-actions-live-31.json`), so those two keys remain partial. Live fullscreen Share hide/restore passes again. Final playing screenshot shows restored native watermark and faded controls; runtime-overlay-31.log has no errors, crash-overlay-31.log is empty, defaults are restored, Litho logging is INFO and the app is stopped. Continue under-video refresh and the full port after committing this checkpoint.
- Overlay checkpoint committed/pushed as 5ded0a9ab5617a1a077262d1d6ef9921122c70be; remote verified. Delivery: YTAfterglow_Android_20261114T100950Z_yt21.43.523_5ded0a9a.mpp, 8,552,119 bytes, SHA-256 a1b3977b61c72435ef2bf0b1d71b7778cd7972afd82a92481072f0b6f9341ba4. All 214 inputs match committed blobs.
- Under-video refresh investigation: native Latqv has explicit unbind/rebind and Latqo lazy-conversion cache disposal. Build 32 needed a method-helper parameter overload; build 33 rejected an ambiguous resource-layout fingerprint. Build 34 resolves the exact native methods and passes strict 26/27/28 runs, all exit 0, but the emulator's live Share hide still fails and no action-row binding is registered. Its crash buffer is empty. Build 35 adds temporary, debug-only root-render tracing to establish whether the native bind route or encoded template matching differs in the active layout. This diagnostic build is not a delivery; Share/Save stay partial.

- Builds 35–37 isolate the stale watch row to reactive Litho components (`Lvkx`/`Lvnb`), rather than `Latqv` presenters. Build 38 replays each affected component through the original `Lmuj` conversion and `Lvna` state callback; native disposal clears its retained input and a weak registry tracks changed masks. Live under-video Share-only, Save-only, both hidden and reset pass on the same paused video. Landscape fullscreen hide/reset also passes. A scroll gesture unexpectedly enters portrait fullscreen; the old view-bound fullscreen bridge fails Share restoration there. The erroneous rebound assertion did not prove under-video recycling; the QA helper now requires `watch_list` and scrolls within its bounds. Crash buffer empty and no Afterglow errors.
- Build 39 removes watch diagnostics and guards context transfer/retention with native disposal checks. Streaming strict validation exits 0; standalone prints PASS before wrapper exit 143, and combined also exits 143, so neither is counted as a clean final run. Build 40 tests the same reactive refresh for both native action identifiers, with the former fullscreen presenter dependency disabled; diagnostic fullscreen binding logs remain temporary. No new parity completion is claimed until orientation, row recycling and final restoration are verified.

- Correction from a cold-launch baseline: portrait fullscreen never offered Share at this width, with both hide switches off and before any settings round trip. The build-38/40 portrait Share restoration assertions tested an unavailable native control, not a demonstrated cache failure. The available Save button hides/restores correctly. `qa-portrait-baseline-40.log` records the baseline and independent toggle; its runtime log has no errors and crash buffer is empty.
- Build 40 completes all 11 recorded live cases: four under-video states, four landscape fullscreen states, portrait return, row recycling/hide and final reset. Playback resumes, defaults restore and the app stops; no runtime errors or crash entries. The same reactive bridge supports both action identifiers, so build 41 removes the former fullscreen presenter hook and diagnostic logging. It passes strict 26/27/28 runs with clean exit 0, 214 source inputs match, and ZIP integrity passes. Final build-41 runtime and standalone one-patch isolation are running. Parity is 96 done / 4 n/a / 99 todo; full-port work continues.
- Build 41 final verification is complete: all 11 live cases and resumed decoded playback pass; runtime-watch-actions-41.log has no errors and crash-watch-actions-41.log is empty. Share/Save are restored off, diagnostic properties are INFO and the app is stopped. Standalone one-patch isolation passes 1/1 with exit 0. Bundle: 8,559,572 bytes, SHA-256 b9cb64135c7b61d6bddc5d7ea4e6c212568ad84ce1a6e2faf98bd608f8b02a49. Commit/push/deliver this checkpoint, then continue playback end time and the remaining full port.

## Playback end time continuation

- Action-row checkpoint committed/pushed to main as 9cf78d24ed7ad2c06aa10935507ecb0c013b2b8a; remote verified. Delivery: YTAfterglow_Android_20261114T111145Z_yt21.43.523_9cf78d24.mpp, 8,559,572 bytes, SHA-256 b9cb64135c7b61d6bddc5d7ea4e6c212568ad84ce1a6e2faf98bd608f8b02a49. All 214 input paths and hashes match the committed tree.
- Next: independent Playback end time patch using videoEndTime and 24hrFormat. iOS YTAfterglow.x rounds duration and elapsed seconds before dividing remaining time by playback rate, then appends a US-locale clock string. Android 21.43.523 binds time_bar_total_time (0x7f0b16e3) in Lomq.a(View); the existing VideoState bridge supplies time, duration and rate. No new source behavior has been claimed verified yet.
- Added the independently selectable end-time patch. It binds the native total-duration TextView in Lomq.a(View), preserves styled text, strips only its previous suffix on native updates, and observes settings/video changes with weak view retention. Paused speed and late duration changes are checked at pre-draw. The formatter passes 21 clock/rate/rounding/DST checks; settings pass 207/207. Build 42 has 217 recorded production inputs and is undergoing strict validation; both preference keys remain partial pending runtime checks.
- Build 42 strict runs pass 27/27 standalone, 28/28 with GmsCore, 29/29 with GmsCore plus Spoof video streams, and 1/1 Playback end time isolation; all wrappers exit 0. All 217 production hashes match and ZIP integrity passes. Its eight-case runtime matrix verifies default/off, format-only independence, both clock formats in portrait/fullscreen and live restoration of native label widths. Screenshots were inspected; runtime-end-time-42.log has no errors and crash-end-time-42.log is empty. Native speed and new-video checks are next.
- The fresh long-video check found a native width-cache interaction: after page reset the total-time label stayed 252px wide, versus 135px on a cold off baseline. Loff.e sets a temporary duration string, measures it and caches minimumWidth; the synchronous TextWatcher appended our suffix before that measurement. Defer the append to the main queue after the native update returns. Build 42 is not a delivery; build 43 will repeat strict/runtime checks and compare long-video reset width with the native baseline. Native 2x/0.25x, new-video duration and Shorts exclusion did pass in build 42, with no runtime errors or crashes.

- Build 43 completes the deferred text fix. Strict standalone/GmsCore/streaming/isolation pass 27/28/29/1, all exit 0; 21 clock and 207 settings checks pass. Final runtime verifies both clock formats, paused native 2x/0.25x, long-video loading, Shorts exclusion and page reset. The long-video minimum-width regression now resets to the cold native baseline (135px). Runtime logs have no errors and crash buffers are empty; native speed 1x, overlay defaults restored, Advanced mode off, app stopped. Parity: 98 done / 4 n/a / 97 todo, 27 named tweaks. Commit/push/deliver, then continue chapter snapping and the remaining full port.

## Chapter snapping continuation

- End time committed/pushed as ebda3cb31fc56cd12d4c2708ace8cd1e9322e1e4; remote main verified. Delivery: YTAfterglow_Android_20261114T114612Z_yt21.43.523_ebda3cb3.mpp, 8,565,571 bytes, SHA-256 cfb5793b6b69afb3767d9ed712d877a8c09326275f6a3518e1d7d9d6aa5c8034. All 217 production paths/hashes match committed blobs.
- iOS disables the chapter snap when scrubbing ends. Android Ljsb.r compares the original Larua.Q position with nearby chapter starts (10 percent/500ms tolerance), then calls Larua.P(J) and emits changed-position feedback. The new helper chooses the original position only when dontSnapToChapter is enabled, before that native commit and comparison. Replacing the original invoke preserves incoming branch targets. No native flags or chapter metadata are changed.
- Native build-42 baseline on rfscVS0vtbw shows chapters at 0:00, 1:45, 6:40, 10:23 and 15:06. A portrait scrub from (16,733) to (100,733) over 200ms snaps to 10:23. The new setting remains partial until strict application and off/on/reset behavior are verified.

- Build 44 strict standalone/GmsCore/streaming/isolated-gestures runs pass 27/28/29/1, all exit 0. Settings pass 216/216 and 218 source input hashes match. Android 16 verifies live off/on/off (1:45 chapter -> 12:51 unsnapped -> 15:06 chapter), both/two-finger-only/snap-only preferences, fullscreen 51:42 between chapters and actual page reset to native 1:03:10. The published chapter timestamps are captured from the native description. Portrait return and decoded playback pass, defaults restored, app stopped; no runtime errors or crashes. Parity 99 done / 4 n/a / 96 todo. Commit/push/deliver, then continue the remaining full port.


## Autoplay continuation

- Chapter snapping committed/pushed as e6be912d93ccd1a3a7f63db2c16169cf7218257f. Delivery provenance: delivery-44.json; all 218 production inputs verified against committed blobs.
- Build 45 implements both Off modes at Laowv.l's private configuration-copy boundary, clearing only the native playWhenReady bit. Native Lnzt's inflated switch binds to the shared visibility policy with an independent Autoplay gate, allowing restoration without skipping its controller.
- Strict standalone/GmsCore/streaming 27/28/29 and isolated Autoplay 1 pass, all exit 0. 242 settings checks and 218 production hashes pass. Android 16 verifies 12 basic cases, three native-next cases, manual portrait/fullscreen Play, actual reset and Default Shorts decoded motion. The Shorts Play label stayed stale; actual frame comparison replaces that failed label assertion. Baseline and candidate lack the overlay switch, so live visibility remains source-verified.
- Runtime logs have no errors, crash buffers are empty, Playback defaults are restored, Advanced mode remains off and the app is stopped. Parity: 100 done / 4 n/a / 95 todo. Full port continues with the native Captions saved-choice/server-hint boundaries; the old 150ms auto-caption gate must not defeat an explicitly remembered choice.


## Captions continuation

- Autoplay committed/pushed as da6d282162a33a49fc5d527a171415e4faeb10f5; verified bundle delivery and its 218 committed production inputs are recorded in delivery-45.json.
- Replaced the 150ms auto-caption gate with native ON/ON_RECOMMENDED server-hint suppression. Manual selection remains untouched. Remember captions now takes the native saved-enabled/language branches, using YouTube's own existing preference store. Build and runtime verification are pending; no new parity completion claimed yet.

- The baseline emulator confirms manual captions ON becomes OFF after a fresh player for rfscVS0vtbw. Build 46 resolves the saved-choice and server-hint hooks and passes standalone/streaming strict validation. Build 47 additionally gates both CaptioningManager activation/language fallbacks without changing Android's system setting; 299 settings/policy checks pass. Candidate 47 strict application and runtime persistence checks are active.
- Build 47 passes strict 27/28/29 and isolated Captions 1, but cold-start ON persistence fails. Diagnostic build 48 does not compile (immutable method reference); corrected diagnostic build 49 passes streaming 29 and confirms manual=true, storageEnabled=false, followed by stored=false in the next process. No diagnostic or failed-runtime build is a delivery.
- Build 50 removes diagnostics, enables the existing local caption persistence gate only when Remember caption state is on, and prefers its optional cache for enabled/presence/language reads. The account/server write gate and automatic-selection write guard are unchanged. 310 settings checks pass; strict application and runtime verification are pending. Parity remains 100 done / 4 n/a / 95 todo.

- Build 50 passes all strict 27/28/29/1 selections but still loses ON at cold launch; runtime logs contain no errors and the crash buffer is empty. It is not a delivery. Build 51 removes the native persistence override and instead records native preference writes in two Android-private Afterglow values (enabled and language). The native saved-choice reads use that record, with native fallback for an absent choice or unavailable track. 313 settings checks pass; runtime verification is pending.
- Build 51 verifies ON and OFF across cold restarts and visible decoded captions, with no runtime errors or crashes. Its generic multi-key notification unnecessarily refreshes unrelated settings listeners. Build 52 uses one atomic `android_caption_choice` value with a targeted notification; 316 settings checks pass. Strict standalone/GmsCore/streaming/Captions-only runs pass 27/28/29/1, all exit 0, and all 218 source paths/hashes match.
- Final build 52 completes 20 runtime observations: remembered ON/OFF, both caption switches together, portrait/fullscreen, native Next Video, manual controls with only Disable auto captions enabled, actual page reset and resumed playback. One UI tap initially missed temporarily hidden controls; after revealing the controls, the native media session confirms PAUSED and the remaining checks pass. No source change was needed for that UI-test timing issue. Runtime logs contain no errors; the crash buffer is empty. Language checks are running before commit/delivery. No physical device was used.

- Build 52 language verification completes: native Arabic persists across a cold start; fixed English-only video 6IegDENuxU4 plays decoded frames with English captions; reopening rfscVS0vtbw restores Arabic. A separate native recommendation failed at the media HTTP 413 boundary and is not counted as fallback proof. Native English/OFF, Playback defaults and Advanced off are restored; app stopped, no runtime errors or crashes. Final parity 101 done / 4 n/a / 94 todo, 27 named tweaks. Commit/push/deliver this checkpoint, then continue Remember loop mode and the remaining full port.

## Loop persistence continuation

- Captions committed/pushed as 1252e9bd288d61e7a5255ad41639620b3f74830d. Delivery YTAfterglow_Android_20261114T132757Z_yt21.43.523_1252e9bd.mpp is 8,577,309 bytes, SHA-256 8479277012a11b7da17d8533b02d62f02f3ccf30cd58fb7a31a4f7bd1a5e62c2; all 218 production paths and committed blob hashes match.
- Added independently selectable Remember loop mode: the native Lobh host bridges to guarded Lasjv.k(int), and only five explicit menu/command/button calls record choices. Automatic new-video resets are excluded. Weak host/player references and activation generations protect the three-second delayed restore and prevent startup changes from overwriting the saved mode. 26 session-race and 323 settings checks pass; build 53 strict/runtime verification is pending. Parity remains 101 done / 4 n/a / 94 todo; 28 named tweaks.

- Build 53 strict standalone/GmsCore/streaming/isolated-loop runs pass 28/29/30/1, all exit 0; all 222 production inputs match. APK signing initially hit a host-side parallel-read ENOMEM and stalled. The failed signer was terminated, its partial file preserved, and signing retried with Java ActiveProcessorCount=4. Signature verification and emulator installation pass. Native ON/OFF/cold-start runtime checks are active; no parity completion yet.

- Build 53 completes the 15-observation native loop matrix: ON/OFF cold starts, fullscreen and disabled-recording preservation pass, with no runtime errors and an empty crash buffer. A fixed 19-second video plays to an estimated 18.444s, repeats to 1.875s and continues through 9.025s with the same metadata and decoded frames. Warm navigation, Autoplay Off interaction and final reset remain in progress.

- Build 53 final runtime is complete: 22 main observations plus actual repeat. Warm navigation retains On; Autoplay Off remains paused at 0:00 while loop restores; manual Play advances to 0:07 and keeps On. Actual page reset restores Off/default initial playback and decoded playback resumes. No Afterglow errors or crash entries; Playback defaults restored, Advanced off, app stopped. Parity 102 done / 4 n/a / 93 todo, 28 named tweaks. Commit/push/deliver, then continue native Music button and paid-promotion labels and the remaining full port.

## Native Music and paid-promotion controls

- Loop committed/pushed as 923fcc1728fc3fdcc9124cd069634d301267f64b. Delivery YTAfterglow_Android_20261114T134542Z_yt21.43.523_923fcc17.mpp is 8,588,498 bytes, SHA-256 00b2f8a5b9d31bf971f4740da2c142b5554342df8667f30ca76e533b40a12eee; all 222 production paths and committed hashes match.
- Added music button binding after the two native TouchImageView casts in Lojg.h/l. Paid-promotion labels bind after their native TextView casts in Lomq.a and Ljwx; Remove ads depends on that independent hook, retaining the existing paid_content_overlay Litho filter. Shared live visibility preserves native fades/layout/listeners. 328 settings checks pass; build 54 strict application is running. Baseline 53 does not offer the Music button on the tested official music video in portrait or fullscreen. Paid-label availability checks remain active.

- Build 54 strict standalone/GmsCore/streaming/isolated-overlay/isolated-ads runs pass 28/29/30/1/1, all exit 0; 328 settings checks, 223 production inputs and ZIP integrity pass. Seven emulator observations verify switches, controls, decoded playback and actual page resets. Defaults restored, Advanced off, app stopped, no Afterglow errors or crashes. Music and paid-content targets were absent in baseline fixtures; visual hide/restore remains source verified only. The preroll Sponsored badge is unrelated. Parity: 104 done / 4 n/a / 91 todo. Source/delivery provenance: delivery-54.json. Continue Classic video quality and the remaining full port.

## Classic video quality

- Native controls committed/pushed as 2afde6791ce2c2a7dbc357088497b0db4c225fca. Delivery-54.json records the verified unique bundle and 223 committed production inputs. A copied checksum typo in the first delivery script was corrected before accepting the final artifact; the unmanifested copy is preserved in evidence.
- Classic quality uses the native Lobm.f(boolean) selector: true opens the original native resolution list, false opens the quick menu. Lkzs routes base/advanced commands here; the native availability guard remains intact. The build-54 baseline displays the four quick choices. Build 55 strict/runtime verification is pending.

- Build 55 compiles and passes 336 settings checks. Its first streaming wrapper exited 143 during APK assembly without a result.json or APK; the incomplete directory is preserved as streaming-55-terminated. A fresh strict run of the identical bundle is in progress. Standalone 28 passes; combined/runtime pending.

- Build 55 passes all strict 28/29/30/isolated-quality 1 selections, but Classic ON still opens the modern quick sheet. It is not a delivery. Native Litho trace confirms quick_quality_sheet_content and advanced_quality_sheet_content are server-driven JavaScript templates. Diagnostic build 56 binds the actual native sheet adapter to identify its first item; this avoids a global pending-menu flag. No behavior is claimed complete. Diagnostic properties were restored to INFO after the trace.

- Diagnostic build 56 passes streaming 30 and installs. Both the quick and advanced sheets own one Latqo item; no runtime errors/crashes. Its native byte-array field is the exact element passed into Lvns.b. Build 57 adds a bounded diagnostic prefix of that per-sheet element so the template identifier can be verified before adding behavior. Temporary validation output now lives under /home/corey/.cache/ytafterglow-android/port-completion-20261113 with evidence-directory symlinks; existing outputs remain intact.

- Diagnostic 57 confirms the root-template field path 1/168777401/3/172035250/1 for both native sheets. Build 58 removes diagnostics and uses that precise per-sheet identity, the native Advanced row, one guarded post and detach/replacement checks. It does not share a global menu flag or change native visibility. 93 identity/parser and 336 settings checks pass. Strict/runtime verification is pending.

- Build 58 passes strict 28/29/30 and isolated-quality 1, all exit 0, with 225 matching production inputs. The per-sheet matcher reaches Advanced, but the resolution list remains empty after settling; it is not a delivery. Build 59 moves the action from pre-draw to the next frame after onDraw to preserve native controller initialization. It also explicitly depends on disableRenderNextPatch so Video quality works when selected independently. Runtime validation will determine whether the timing change fixes the empty list.

- Build 59 passes strict 28/29/30/1, all exit 0, but still opens an empty Advanced list. The working manual trace shows the Advanced click payload initially has no resolutions and receives 720p/480p/360p/240p/144p about 200 ms later. The automatic trace never reaches that update before opening. Diagnostic 60 exposes the current ComponentHost click listener and its native event arguments, preserving native setters and clearing on native unbind, to find a per-row readiness boundary. It is diagnostic only; no fixed timing workaround is accepted.

- Diagnostic 60 streaming validation, signing and installation pass. Runtime keeps the four-choice quick sheet and manual Advanced remains populated, with no Afterglow errors or crashes. Its actual Advanced view is ComponentHost and the mounted native hfq listener is replaced when the data arrives (08:41:47.060 -> 08:41:47.288). The event argument array contains only the Litho context; the payload belongs to its dispatch target. Diagnostic 61 inspects that target to map a direct production bridge. Diagnostic reflection/logging will not ship.

- Diagnostic 61 identifies ElementEventWithGesture (vmu) as the mounted handler target. Its click dispatch reads vmu.E, then vrs obtains the command from xso.y. The production bridge can use those fingerprinted fields and MessageLite encoding without reflection or a shared readiness flag. Build 62's strict run failed because the constructor fingerprint lacked PUBLIC; 63 corrects the exact access flags and captures both command versions. 62 was not installed or delivered.

- Diagnostic 63 passes streaming 30 and captures two real Advanced commands, 3491 and 3603 bytes. The populated command adds five positive-resolution entries at its Advanced model field 8. Build 64 removes all diagnostics/reflection and checks this exact scoped data before clicking and again before the posted action. Native command generation/encoding is observed without execution; native click execution remains unchanged. 3707 parser tests pass, including both captures and all truncated prefixes. Strict/runtime validation is pending.

- Build 64 completes strict 28/29/30 and isolated quality 1/3, all exit 0; 3707 parser and 336 settings checks pass, with 225 matching production inputs. Android 16 verifies populated watch lists, manual 360p/720p/480p, fullscreen, live OFF, unrelated playback-speed menu and actual page reset. Shorts ON/OFF menu forms pass, but selection remains Auto/1080p in both native OFF Data saver and Classic ON resolution comparisons; selection persistence is not claimed. Native 360p playback and explicit Play/Pause followups pass after a prior toggle-based transition stalled.
- Video-quality-only runtime passes direct 240p/144p, dismissal/reopen, live OFF and decoded playback on the 19-second fixture. Earlier isolated attempts hit a buffering native preroll and then the ad's duplicate More options button; evidence is preserved and the helper now scopes the player gear by resource ID. All final feature logs are clean and crash buffers empty. Classic ends OFF and full candidate 64 is restored. Parity: 105 done / 4 n/a / 90 todo. Continue Hide HUD messages and the full port after commit/push/delivery.

## Hide HUD messages

- Classic quality committed/pushed as ea7f0605b2a1dc65c5a657af3ff7e31287aad069. Delivery: YTAfterglow_Android_20261114T152902Z_yt21.43.523_ea7f0605.mpp, 8,604,804 bytes, SHA-256 38e22b9f16be157cef02750a45b12378fd9cfd3a4ce19297af4a6bcbf6a6c05d; all 225 committed inputs verified.
- Build 65 adds the native HUD skip-display gate, all five message-view constructor families, and an ID-scoped root_pill_container binding. Native callbacks, default behavior and the separate pane footer are preserved; Lite Mode honors the original forced key. 347 settings checks pass. Strict standalone/GmsCore/streaming 28/29/30 and overlay-only 1 all exit 0; 226 hashes and ZIP integrity pass. The build helper itself prints completion after a successful compiler/bundler subprocess, while the outer tool session reports 143. Signed installation passes.
- Runtime is active. Build-64 Loop On/Off has no visible HUD in this configuration. Sleep timer's visible 10 min left bar is a persistent slim_status_bar rather than a snackbar, and the timer was restored Off. Share/Copy link is the next native baseline. Visual suppression is not yet claimed.

- Build 65 final runtime completes seven cases: Copy link native confirmation hides/restores live, cold start retains ON, fullscreen ON/OFF works, actual Overlay reset restores the confirmation and decoded playback resumes. Android clipboard preview remains visible. Logs have no Afterglow errors and crash buffers are empty; Overlay defaults and Advanced off restored, app stopped. All constructor families are strict/source verified, not individually runtime triggered; Lite override is unit verified only. Parity: 106 done / 4 n/a / 89 todo. Commit/push/deliver, then continue Hide Subbar native feed/search/related rows and the remaining full port.

## Native Hide Subbar continuation

- HUD committed/pushed as 70497a208956239294325e916b78c1614075b79f; delivery-65.json records the unique bundle and 226 committed inputs.
- Added reversible native feed/search/related chip bindings, retaining native visibility/adapters/dimension caches. 35 height-state and 355 settings checks pass. Build 66 compiles but fails strict feed matching: the legacy controller owns the experiment flag, while the actual RecyclerView constructor does not. Build 67 instead identifies its native container ID, dimension and layout call. No failed candidate was installed.
- Search baseline exposes its chip row after a down/up scroll, with All/Unwatched/Watched/Videos/Recently uploaded. Initial-load screenshots omit the deferred row; use the actual visible baseline for runtime comparison. Parity remains 106 done / 4 n/a / 89 todo pending verification.

- Build 67 passes strict 28/29/30 and navigation-only 1, all exit 0, 229 input hashes and signature/install. Live Home/search ON/OFF and scrolling pass without gaps. Cold-start ON hides correctly, but the search row created while hidden fails OFF restoration, even after scrolling. No runtime errors/crashes; it is not a delivery. Build 68 adds bounded per-binding dimension/attachment diagnostics to trace the first zero-height boundary; diagnostics will not ship. The main QA script records an assertion failure, while its outer tool wrapper reported 143; evidence is preserved.

- Diagnostic 68 reproduces the cold failure. The stored height restores to 126, but a full native log captures SearchResultsChipBarCon's caught `Target view height does not match expected height (0!=126)` from the animation constructor. Earlier Afterglow-only logs missed this native error. Native top-start pulling does not repair that failed controller. Build 69 preserves all native height requests and uses reversible bottom spacing plus offscreen placement instead; 43 animation/reuse spacing checks pass. All temporary diagnostics are removed. Strict/runtime verification is active; no Subbar delivery or completion yet.

- Build 69 passes strict 28/29/30/1, 43 spacing and 355 settings checks, and 19 runtime observations after normalizing the native `Top ` accessibility label. Initial QA wrapper 1 was an assertion whitespace issue; resumed finisher exits 0. All three cold search restorations pass, along with comments, actual reset and decoded playback. Full logs expose a separate Home reveal warning `126!=0`; three OFF Home controls do not produce it. The initial control wrapper exited 143 after two cases; an exit-0 followup completes the third. A UiAutomation helper crash is distinct from the app, whose final feature crash buffer was empty. Build 70 adapts only an actively collapsed bound row's zero-to-full reveal when native actual height already equals its end height, preserving native validation/callbacks and OFF behavior. 59 spacing/animation checks pass. Neither 69 nor 70 is delivered yet.

- Final build 70 passes strict 28/29/30/navigation-only 1, all exit 0, with 230 matching production inputs, ZIP/signature/install checks, 59 spacing/animation checks and 355 settings checks. Android 16 completes 17 cases: live Home/search ON/OFF, scrolling, three cold Home restorations and cold search, native comments sort chips, actual Navigation page reset and advancing decoded playback. Full native logs no longer contain the animation height exception; no Afterglow errors or target-app crashes. One shell UiAutomation helper crashed after a successful dump; its UID/process identity and raw log are preserved separately. QA continued and exited 0. Defaults restored, Advanced off, app stopped. Related/Litho targets remain source verified where baseline UI was absent; Lite override remains policy verified. Parity is 107 done / 4 n/a / 88 todo. Commit/push/deliver, then continue heatwaves and the full port.

## 2026-11-14 — Native most-replayed graph and independent seek settings

- Build 71 gates native HeatMarkerView drawing through the independently installed Seek bar owner, default off. Native graph model, preview, scrubbing and visibility callbacks are preserved.
- SeekBarTheme now depends on the settings resource patch. Isolated Seek bar and Glow include the activity, implicit settings action and cairo settings row without an unrelated color-resource rewrite.
- 365 settings checks; strict standalone/GmsCore/streaming 28/29/30, Seek bar only/Glow only 1/1 and isolated Seek bar streaming 3 all pass, wrappers exit 0. Build, signature/install, ZIP and all 231 production input hashes pass.
- Eight full-install and four independent-install observations pass, with visually reviewed native graph restoration, continued seeking, actual reset and decoded playback. No Afterglow errors or target-app crashes. Crash buffers are empty.
- Earlier QA overruns/wrong-fixture attempts are preserved separately. Final runtime wrappers exit 0. Full candidate/defaults restored, Advanced off, app stopped. Physical devices, live/DVR, Shorts and casting untested; isolated Glow settings are package verified only.
- Parity: 108 done / 4 n/a / 87 todo; 28 named tweaks. Delivery provenance: delivery-71.json. Continue persistent progress and the full port.

## 2026-11-14 — Persistent native progress

- Build 72 adds Seek Bar's Persistent progress bar, default OFF. Only three native render fractions are wrapped; duration guards, animators, controls and input state remain native.
- Fullscreen ON keeps the native red segmented track visible with controls hidden; OFF restores native hiding. Portrait retains its already-visible collapsed indicator, including pause, cold start and reset.
- 382 settings checks; strict standalone/GmsCore/streaming and isolated Seek bar/Glow/Seek bar streaming 28/29/30/1/1/3 all pass. Nine full and five isolated runtime observations are visually verified, with decoded playback and actual settings restoration. Logs have no Afterglow errors or crashes.
- Initial portrait expectations incorrectly required recoloring/expansion. The ineffective alpha hook from 73 and diagnostic code from 74 are removed; all 232 source hashes match the tested 72 bundle. Original assessments remain in evidence. Full QA wrapper 143 was completed by a successful bounded finisher; isolated runtime exits 0.
- Parity: 109 done / 4 n/a / 86 todo. Provenance: delivery-72.json. Physical-device/live/DVR/Shorts/casting coverage remains untested. Continue native Shorts controls and the full port.

## 2026-11-14 — Native and modern Shorts header controls

- Build 78 implements the four independent Shorts layout header/Lens switches, default OFF. Native icon families match iOS; modern Search/More are tagged at conversion and bound on mount, with restoration before view recycling.
- 57 identity, 394 settings and 46 existing player action checks pass. All five strict selections (28/29/30/1/3), signatures and installation pass; 236 production hashes match the bundle.
- Eleven full observations on 77 plus six isolated and four final full observations on 78 verify live hide/restore, both Shorts routes, cold start, native menu/Search commands, preserved Mute/Home Search, actual reset and decoded playback. Only two native icon-classification files differ between 77 and 78; lifecycle hooks are identical.
- Camera and Lens were absent in baseline fixtures, so visual behavior remains unverified. Earlier cold-only filtering, repeated-link QA and Advanced-mode QA ordering evidence are preserved. Runtime log results and exact wrapper exits are in execution-78.json and shorts-log-audit-78.json.
- Parity: 113 done / 4 n/a / 82 todo. Source/delivery provenance: delivery-78.json. Physical-device and alternate-layout coverage remain untested; the full port continues.

## 2026-11-14 — Independent native Shorts progress

- Build 80 adds Enable progress bar, default OFF, to the independent Shorts tweak. It maps known disabled/pause-only model reads to native always-visible mode; models, pause/panel/active-state checks, seeking and unknown modes remain native.
- Live preference refresh calls the current attached Shorts controller's normal and paused policy methods. Weak controller keys avoid retaining player instances.
- 416 settings checks, strict 28/29/30/1/3, ZIP/signatures/installation and all 239 production hashes pass. Ten full and six isolated emulator observations verify setting changes, pause/resume, cold ON, seeking, both Shorts routes, Home, reset and advancing decoded frames.
- Tested fixtures already show progress in native always-visible mode. Disabled/pause-only conversion is source/policy verified; physical devices and alternate/absent models remain unverified. Diagnostic79's empty-wrapper QA assertion was corrected, raw evidence retained, and its bounded logging removed in 80.
- Exact wrapper/log results and committed-source delivery provenance are in execution-80.json and delivery-80.json. Parity: 114 done / 4 n/a / 81 todo. Full port incomplete.

## Session Ledger Checkpoint — Shorts fullscreen, build 85

- The full Android port remains the active authorized task. Continue after this checkpoint; Shorts-only mode's exit gesture is next. Active checkout is `/home/corey/projects/ytafterglow-morphe-patches`, main; only emulator-5600 was used.
- Added the independent default-OFF Pinch to Fullscreen setting. Native pinch recognition and Clear Screen rendering remain in charge. The extension coordinates native tab visibility, height notifications and the Shorts fragment margin, expanding both content and player by the existing 126-pixel tab height.
- Tab intent is independent from the three-second idle overlay timer. Pinch-in and taps reveal native controls; comments/options panels, detach, background and OFF guard deferred changes. Native play/pause and hold behavior remain available. Build 85 preserves tab and overlay state when native observers reset between reels.
- Exploratory 81/82 exposed separate browse/fragment insets; 83 added idle controls; 84 fixed the fragment margin but failed next-reel continuity. Those failures and interrupted strict runs remain in raw evidence. Only 85 is the final candidate.
- Build 85 passes 427 settings checks and strict standalone/GmsCore/streaming/Shorts/Shorts-streaming selections 28/29/30/1/3. All 242 production hashes match; ZIP integrity passes. Bundle is 8,669,053 bytes, SHA-256 `8dbaecf285066b4aec56f2fc047d6d3e9f636d7e685d962ded9697f7d5781384`.
- Eight focused, nineteen full and thirteen isolated observations and their motion frames are visually reviewed. The initial isolated hold assertion expected idle clear mode, but native long hold opens the options sheet; a bounded continuation verifies its guard and completes native exit/reset without source changes. An intervening wrapper exited 143; the installed isolated APK hash was checked before continuation. Full install's interrupted wrapper is also retained with installed APK hash proof.
- All five final log sets have zero app/extension errors or crashes and no shell-helper crashes. Exact wrapper outcomes, cleanup and delivery provenance are in execution-85.json and delivery-85.json. Native OFF-capability forcing is source/policy verified because the baseline already enables it; native video aspect-ratio fitting is preserved. Physical devices and alternate server layouts remain untested.
- Parity: 115 done / 4 n/a / 80 todo. Full port incomplete. Next: Shorts-only mode with independent tab hiding, live/cold native routing, two-finger 500ms escape, localized toast and delayed restoration; retain pinch independence and native touch handling.

## Session Ledger Checkpoint — Shorts-only mode in progress

- Fullscreen 85 committed and pushed as `7fbf9d2ee5bf7b52861343cb5b748b12836113fb`. Delivery `YTAfterglow_Android_20261114T200940Z_yt21.43.523_7fbf9d2e.mpp` has all 242 inputs verified against committed blobs. The full APK was restored, hash-matched and stopped with defaults restored.
- Added ShortsOnlyMode around the existing native bottom layout and touch bridges. It observes two stable pointers for 500ms even with pinch fullscreen OFF, clears the mode preference, shows the existing translation, and restores tabs after one second. Touch movement/loss and view focus/attachment guard the timer; re-enable cancels the delayed restore. Live ON uses the native Shorts shortcut with the current main component.
- Build 86 passes 427 settings checks and all strict 28/29/30/1/3 combinations. Its 243 production hashes match and ZIP integrity passes. Emulator installation succeeds. Runtime default OFF and Home baseline pass; live routing, gesture cancellation, timed escape, cold startup, Back, pinch independence and reset remain in progress. No Shorts-only parity completion or delivery claimed.

- Build 87 fixes warm entry and Back, and passes strict 28/29/30/1/3 plus 427 settings checks. Thirty reviewed observations retain successes and failed probes. Native feed identity testing catches blocked swipes while Shorts-only is ON; the same feed advances after OFF. Build87 is not deliverable. A hidden accessibility Next control tap only paused the video; it is not navigation evidence. Diagnostic build88 traces native RecyclerView/player events, Back and bottom-layout callbacks without changing those decisions. Independent install is deferred until the navigation failure is fixed. Raw evidence and original production files are retained under port-completion-20261113.


## Session Ledger Checkpoint — Shorts-only mode, build 87 verified

- The earlier blocked-navigation attribution is withdrawn. Diagnostic88 shows complete native swipe delivery, no blocked-list flag, no layout interruption and no Back callback during those gestures. Sustained drags on the original, hash-verified build87 advance SkyeRanks -> yano11onay -> NiloChip with decoded motion and hidden tabs. A further SkyeRanks -> GlobalHoopss change preserves pinch Clear Screen. No production gesture change was needed; all diagnostic code was removed.
- Thirty-eight full and thirteen independent-install observations are reviewed. Live/cold routing, native Back/panels, negative holds, two-finger exit with pinch OFF/ON, preference preservation, confirmation cancellation, live OFF, Home, actual reset and decoded motion pass. Some recommended clips buffered; their cases verify routing/layout only.
- Independent escape and reset wrappers exited 143 after partial captures. Fresh bounded observations complete both without overwriting the originals; installation and APK hashes are verified. Cleanup restores defaults and Advanced OFF, the full final APK is restored and hash-matched, and the app is stopped. Full/native/pinch/independent log audits have no app/extension errors or crashes.
- Strict 28/29/30/1/3, 427 settings checks, ZIP integrity and 243 production input hashes pass. Bundle: 8,672,424 bytes, SHA-256 `9348f3384d88f1efd6bef438c2ca32c8088e21f9db562ab6e756cd5b63000bfc`. Exact execution and delivery provenance are in execution-87.json and delivery-87.json. Physical devices and alternate layouts remain untested.
- Parity: 116 done / 4 n/a / 79 todo. The full port continues with the native Shorts player-layer setting; Lmpo.Y() owns the narrow overlay visibility boundary. Preserve the separate decoded video and native gesture dispatch.

Build87 log qualification: the earlier full run contains two SIGSEGV crashes in
the emulator goldfish VP9 decoder service (UID 1013), with no target-app crash.
The relationship to this feature change is not established. Later native-feed,
pinch-feed and independent runs have empty crash buffers; raw tombstones remain
in crash-shorts-progress-87-only.log and the execution audit.


## Session Ledger Checkpoint — Native Shorts player layer, build 89

- Shorts-only 87 is committed/pushed as `b8f6bbe2d59d69418b91d6ba9eccccc575a772c5`; delivery-87.json records the verified 243-input bundle and its historical emulator decoder crashes. Build89 adds independent advanced Hide built-in player layer, default OFF, through the narrow Lmpo.Y() visibility boundary. Native state, decoded video and parent input are preserved; weak bindings refresh live preference/reset changes.
- 427 settings checks, strict 28/29/30/1/3, ZIP integrity and all 245 production hashes pass. Sixteen full and ten independent observations are visually reviewed: live hide/restore, pause/resume, cold ON, actual reset and decoded motion. Full tests also cover native pinch and Shorts-only escape while hidden. Header, tabs and separate thin progress remain outside the masked layer.
- The original settings-round-trip assertion incorrectly expected fullscreen navigation retention. An unchanged-setting control reproduces the exit while this setting is OFF. No production change was needed. Interrupted ON navigation, mode and standalone pause/cleanup finalization plus the failed fullscreen assertion and pre-action Reset viewport check remain recorded. Bounded continuations completed the observations and verified the stopped app. Final logs have no app/extension errors or crashes. Defaults and Advanced OFF restored; final full APK restored, hash-verified and stopped.
- Bundle: 8,678,736 bytes, SHA-256 `f73743b1e29a06e990433cd47e885fc9debd9c71e48f3258568f0b3d67b79fb5`. Execution and delivery provenance: execution-89.json, shorts-player-layer-audit-89.json, delivery-89.json. Physical devices and alternate layouts remain untested.
- Parity: 117 done / 4 n/a / 78 todo. Full port remains active. Continue About actions/preferences and diagnostic logging; the paused Shorts subscriptions carousel has no proven Android mapping yet and must not be conflated with Subscribe.


## Session Ledger Checkpoint — About and diagnostics, build 92

- Player-layer89 is committed/pushed as `08f1ceb860d70a1109fd227500d352296951d540`. Fourteen reviewed About observations on that exact APK verify Advanced, cache retention, reset cancellation and a new process with defaults after confirmation. One invalid navigation observation is retained and excluded.
- Build92 adds the rotating diagnostic log, category policy, pre-queue redaction, read-only snapshot provider and app-local HUD. It corrects a real development drag defect using raw screen coordinates. 91 log tests, 427 settings checks, strict 28/29/30/1/3, ZIP integrity and all 251 production inputs pass.
- Twenty-six final full and fifteen independent observations are reviewed: exact drag/clamping/rotation, decoded playback and pause/resume, read-only share receipts, cold independent persistence, clear and actual reset. Build91 retains 34 reviewed observations with four explicitly limited/incorrect-test scopes; valid continuations verify category filtering, Firehose bypass and cold native playback. Build90's compile error and original test/wrapper failures remain recorded. Final full/independent app, extension and crash logs are clean. Defaults and the hash-verified full APK are restored and stopped.
- Bundle: 8,689,457 bytes; SHA-256 `5fc2150fa8622905e6609e1a97f161fc42308f212c9549678a21bbf859062bf1`. Evidence: execution-92.json, diagnostics-audit-92.json and delivery-92.json. Physical devices, actual PiP activation and unported feature/network event coverage remain pending.
- Parity: 123 done / 4 n/a / 72 todo. Full port remains active. Continue preferences transfer with archived iOS colors and nested theme records, then remaining native feature mappings.


## Session Ledger Checkpoint — Preferences transfer, build 95

- XML/binary plists, UIKit color archives and structured theme records now import through the real document picker. Unchanged originals retain exact data, dates and precision; Android edits take precedence. Invalid imports are atomic and reset clears both native values and private records.
- Corrected two proven defects: invalid tabs returning through preserved originals, and Android's indented serializer adding spaces to newline-ending strings after a cold restart. Original-source regression tests fail; final95 passes 103 transfer checks including the actual SDK serializer and independent plistlib comparisons.
- 427 settings checks, 438 theme checks, strict 28/29/30/1/3, ZIP integrity and all 253 production hashes pass. 15 final full and 9 independent observations are reviewed. Development93 has 15 observations covering XML, theme rename and rejection; development94 retains 12 observations including two limited cold-failure observations. Picker-navigation failure and interrupted build wrappers remain documented with successful continuations/retries.
- Final full/independent logs are clean; defaults and the hash-verified full APK are restored and stopped. Bundle: 8,694,296 bytes; SHA-256 `4645fccaa1df9ec38445eae163f5a0b3927d35a591d01da577da3c891cb3e48d`. Evidence: execution-95.json, preferences-audit-95.json and delivery-95.json. Physical Android/iOS interoperability remains untested.
- Parity: 125 done / 4 n/a / 70 todo. The full port remains active; continue native player-overlay controls and remaining feature mappings.


## Session Ledger Checkpoint — Pause on overlay, build 96

- Advanced default-OFF Pause on overlay now uses the standard native controls owner's final visibility and explicit pause/play commands. Foreground/readiness and per-owner feedback guards preserve native manual playback and avoid replaying ended videos.
- 29 policy checks, 433 settings checks, strict 28/29/30/1/3, ZIP integrity and all 256 production hashes pass. 35 full and 23 independent observations are reviewed, with 9 explicitly limited observations. Successful continuations verify show/pause, hide/resume, manual Play/Pause, fullscreen/portrait, cold persistence, background pause, Shorts motion, live OFF and actual resets.
- Loading/transient captures, a Shorts label mismatch, the premature media-key assertion, independent preroll/autoplay assumptions, the Reset-row visibility-margin correction and interrupted runner attempts remain in the evidence. Final app/extension/crash logs are clean; defaults and the exact full APK are restored and stopped. Physical devices, casting and live/DVR are untested.
- Bundle: 8,711,671 bytes; SHA-256 `f5386d2dc0d9b87ea758c6af48d0251954eb00c82032a2b9a836c499a03a140d`. Evidence: execution-96.json, pause-overlay-audit-96.json and delivery-96.json.
- Parity: 126 done / 4 n/a / 69 todo. Continue the remaining native controls and full port.

## Session Ledger Checkpoint — native mute and lock, build100

Build100 adds the independently named Overlay buttons tweak. Default-ON Mute and
Lock switches retain the advanced Player > Overlay rows and translations. The
utility row includes Afterglow Settings and follows the native player bounds.
Mute uses the native watch facade; Lock requests native fullscreen and publishes
the native lock state. Both custom and native unlock work, including portrait
return. The row stays usable above the native lock input layer.

21 request-policy, 441 settings and 17 threading checks pass. Strict standalone,
GmsCore, streaming and independent selections pass 29/30/31/1/3. All 260 production
inputs and bundle integrity match. 31 full and 21 independent observations are
visually reviewed (1 limited). The same native audio track changes from 0dB to
-inf and back, including while locked. Cold visibility, live OFF, independent
settings ownership, page/full reset, minimized-player exclusion and Shorts motion
pass. Defaults and the exact full APK are restored, hash-verified and stopped.
Final app/extension/crash and ANR logs are clean.

Build97 exposed lazy root binding and input interception; build99 corrected both.
Build99 then exposed a real existing WatchActions deadlock. Its retained ANR trace
proves a component-store/owner monitor inversion. Build100 defers observations
until the callback returns and captures scoped context inside native subscription
and transfer. The deterministic old-code regression fails; the corrected version
passes. Warm unavailable-to-playable navigation and live Share/Save refresh pass.
The third warm intent retained the existing video; that capture proves response
and motion only. A test-script variable collision and strict UTF8 log decoding
failure are retained with their successful corrections; raw logs are preserved.
The independent baseline initially buffered into a preroll. Its original failure
is retained; the continuation skips the native ad and verifies actual content.

Physical devices, casting and alternate player architecture runtime are untested.
The emulator has audio output disabled; mixer gain is verified, audible hardware
output is not. Evidence: execution-100.json, overlay-buttons-audit-100.json and
delivery-100.json under port-completion-20261113. See docs/overlay-buttons.md.
Continue the eye/declutter modes and remaining native mappings. The full port
remains incomplete at 128 done / 4 n/a / 67 todo.

## Session Ledger Checkpoint — eye modes, build103

Build103 completes the default-ON advanced Clean overlay button under the
independent Overlay buttons tweak. One process-wide mode cycles through native
controls, pinned Afterglow controls, timed controls and the eye alone on standard
watch and Shorts. Timed controls hide after three seconds and a fresh native show
reveals them again. Native requested visibility remains intact for Pause on overlay.

55 session-policy and 445 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 29/30/31/1/3; all 264 production input
hashes and bundle integrity match. 46 full and 34 independent observations are
visually reviewed (3 limited). Watch/Shorts cycle, timeout, reveal, restoration,
surface continuity, fullscreen lock and timed rotation pass. Native mixer gain
changes from 0dB to -inf and back while pinned and locked. Live and cold OFF,
independent ownership, page/full reset, Shorts player-layer composition and
Pause on overlay pass. The page reset preserves session mode; a fresh process
starts at default. Defaults and the exact full APK are restored and stopped.
Final app, extension, crash and ANR logs are clean.

Development101 failed strict matching before installation because its fingerprint
checks had the wrong instruction order. Development102 passed initial runtime
scenarios but failed Pause on overlay in a fresh pinned player. Packaged DEX
proved its visibility mask skipped native lazy controls initialization. Showing
normal controls once made pause/resume work, confirming the missing controller.
Build103 preserves initialization before masking visibility; the fresh-process
pause regression now passes. Native requested visibility remains unmodified.
Development102's navigation, stale media-session and scroll-test corrections
remain documented with their original failures. Native clock and decoded-frame
checks verify warm playback after Shorts without trusting that stale status.
Build103 also retains an initial ADB-server connection failure before app launch;
the recovered baseline passed without a production change.

Independent testing retained three observations with black video captures between
decoded frames. The emulator later disappeared during a cold-launch preroll.
Its configured swiftshader_indirect mode was unsupported by emulator37.2.12 and
fell back to the host GPU, whose log contains graphics memory-import errors.
The exact cause of the process exit and individual black frames is unestablished.
The same AVD and hash-verified APK resumed with supported SwiftShader; cold OFF,
remaining reset checks and a separate five-state Shorts motion follow-up pass.
Both log periods and the interrupted phase are retained in the release audit.

Physical devices, casting and alternate player architecture runtime are untested.
The emulator has audio output disabled; mixer gain is checked, audible output is
not. Reset Player Overlay belongs to the unported Control Center: its internal
reset entry point exists, but the action remains pending and hidden. Evidence:
execution-103.json, eye-modes-audit-103.json and delivery-103.json under
port-completion-20261113. See docs/overlay-eye-modes.md. Continue the remaining
native mappings and full port, now 129 done / 4 n/a / 66 todo.

## Session Ledger Checkpoint — native transport, build104

Build104 completes the default-OFF advanced Fast forward and Rewind buttons
switch under the independent Player overlay tweak. Standalone videos use the
native seek pair; explicit playlists and live playback retain native controls.
The original handlers, configured interval, icons and accessibility labels survive.
Hide Previous and Next buttons also hides the replacement pair. Live changes and
resets refresh attached native owners without changing their source model.

60 transport-policy and 447 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 29/30/31/1/3. All 267 production input
hashes, signed native DEX and bundle integrity match. 41 full and 24
independent observations are visually reviewed (4 limited). Native 10-second
forward/back seeks, fullscreen, hide/show, live OFF, cold persistence, ownership,
page/full reset and Shorts motion pass. Full-app eye-mode composition, live-player
exclusion and playlist Next/Previous round trips with decoded playback pass.
Defaults and the exact full APK are restored, hash-verified and stopped. Retained
log periods have no target-app crash, ANR or Afterglow exception.

Initial playlist tests selected the correct adjacent entry, then paused while
playback was loading and remained at 0:00 without a Play/Pause control. A warm OFF
comparison left that loading state unchanged. A cold OFF baseline played the next
entry. The ON continuation waits for playback readiness before pausing and verifies
both directions, original controls and advancing decoded frames. No production
change was needed; the exact cause of the original stalls is unestablished.
Original failures and the interrupted wait are retained. The initial baseline
also retained a test-only duration-label punctuation mismatch; its corrected
continuation passes. A settings-test API typo was corrected before packaging.

Physical devices, casting and alternate player architecture runtime are untested.
Other seek intervals retain the original native handler but are not runtime
tested. Queue-without-playlist, ad, clip and composite-player exclusions have
policy/source proof only. The live fixture proves control exclusion, not scene
motion. One independent capture has a native ad panel covering the playlist heading;
its control check has limited scope. Full-app playlist metadata and navigation
are separately verified. Evidence: execution-104.json, paddles-audit-104.json and delivery-104.json
under port-completion-20261113. See docs/player-paddles.md. The full port remains
incomplete at 130 done / 4 n/a / 65 todo.

## Session Ledger Checkpoint — watch recommendations, build105

Build105 completes the default-OFF Hide up-next panel switch under Player >
Playback, owned by the independent Watch page tweak. It uses YouTube's own
information/comments boundary and filters a copy of the main watch-list model.
The original response, metadata, comments, playlist and playback owners remain
intact. Live OFF restores the original list and its continuations. Unknown
information boundaries retain native content.

459 settings checks and strict standalone/GmsCore/streaming/Watch-page-only/
independent selections pass 29/30/31/1/3. All 269 production inputs, signed DEX,
installed APK hashes and bundle integrity match. 36 full and
34 independent observations are visually reviewed (5 limited).
Live hide/restore, cold persistence, native description/comments/Share panels,
fullscreen, repeated scrolling and page/full resets pass. The full build also
preserves children's-video information/actions, Home, playlist entries/minibar
and decoded Shorts playback. The independent install verifies behavior with
native ads present and organic recommendations below them. Defaults and the
exact full APK are restored, hash-verified and stopped.

Two ON description attempts terminated the Windows qemu emulator process with
access violation 0xc0000005. OFF opened, and the identical APK subsequently passed
ON description/comments/Share after restarting with the swangle option. Startup
still reported SwiftShader; the exact host crash cause is unestablished. These
failed runs, Windows events and the successful continuations are retained. The
available app logs have no target-app crash, ANR or Afterglow exception.

QA corrections cover a timed Pause tap, an absent Description accessibility
label, controls covered by the native playlist panel, an ad occupying the first
recommendation viewport, a native pause-ad panel covering information, and
incomplete swipe arguments. Collapsing the pause-ad panel restores the intact
information/comments section with recommendations still hidden. The original scrolled
frame mislabeled as restored information is retained with limited scope; a fresh
OFF baseline verifies the actual information section after a return gesture
entered native fullscreen. Three independent screenshots were black despite
populated UI hierarchies; they remain limited evidence. The affected comments
dismissal, portrait return and scroll transitions pass separate visual follow-ups.
The exact cause of the black captures is unestablished. The DEX reader now
escapes modified UTF-8 bytes. No application source changed during validation.

Physical devices and the separate elevated metapanel architecture remain runtime
untested. Lite/import rules have unit/source proof. Native continuation
cancellation has source proof and hidden-list scroll checks; no forced in-flight
network race is claimed. Evidence: execution-105.json, next-audit-105.json,
next-development-105.json and delivery-105.json under port-completion-20261113.
See docs/watch-next.md. Full port remains incomplete: 131 done / 4 n/a / 64 todo.
