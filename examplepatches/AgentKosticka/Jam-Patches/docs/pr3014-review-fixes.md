# PR 3014 review fixes in Jam Patches

This change applies all 13 comments in [zappybiby's 2026-09-27 review](https://github.com/MorpheApp/morphe-patches/pull/3014#pullrequestreview-5329848254)
to Jam Patches. The upstream PR branch is not the delivery target.

- Artwork connections use Requester, preserving timeouts, redirect refusal and size bounds.
- Artwork, palette and now-playing failures use the exported Morphe Logger.
- Song-menu lookup uses Utils' background executor and keeps its single-request guard.
- Host seek cancels its FutureTask after waiting, including timeout or interruption, so a
  queued operation cannot execute after the caller has abandoned it.
- Jam dialogs and action buttons use CustomDialog and theme colors. Input validation
  keeps invalid join codes/package names open; long action labels can wrap.
- Activity fallback uses Utils.getActivity, populated by the shared extension's existing
  activity initialization hook.
- Both quit-and-play paths retain the state published by JamUi.call, including pairing
  metadata; the publisher already clears the clock and restores the native queue.
- NativeQueueList documents how the outer native display list notifies listeners.
- Maintenance/release notes moved out of JamPatch.kt to jam-patch-maintenance.md.
- Regression checks no longer ban first/single/filter/runCatching syntax. Real missing
  and ambiguous ABI fixtures remain, as do checks for literal host obfuscation anchors.

## Device acceptance

Repatch both devices using the next Jam Patches prerelease, enable Jam, and restart YTM.
Start with 9.15.51 and 9.37.54. No Companion change is required by these review fixes.

1. In light and dark themes, open the session panel, join-code dialog, Companion package
   settings, invite code and QR dialogs, playback choices and seek choices. Check small
   screens/large font settings, keyboard visibility, wrapped labels, Cancel/Done and Back.
2. Enter an invalid join code and package name: each dialog must stay open with an error.
   Check a valid join, cancel joining, copy code/link, and opening the QR scanner.
3. On a participant, use Quit Jam and play locally from a queue row, a browse song and
   the seek dialog. Local playback must resume (at the selected position for seek), the
   mirrored queue/artwork must clear, and Start/Join must remain available without re-pairing.
4. Seek the host and change tracks; verify the intended host track is affected. If a timeout
   occurs while the host is busy, there must be no delayed seek after the error.
5. Long-press a mirrored queue item repeatedly and while scrolling or leaving Jam. Song
   options should open only for the still-visible matching item and never start guest audio.
6. Change host tracks quickly: participant artwork, colors, title and play/pause icons should
   follow the host. Leave Jam and verify local artwork/colors and controls are restored.
7. Add, remove and reorder queue items; check one consistent visible update on both devices.
   Check guest-edit lock and play/pause/previous/next from both player layouts.

Report YTM version, device, selected patches, exact failing action and exported Morphe logs.
Device acceptance remains manual; local compilation and APK validation do not establish it.

## Local validation (2026-09-27)

- Nine tests passed on each of 9.15.51 and 9.37.54, with zero failures or skips.
- Both versions passed selected-patch application, Android SDK DEX and cross-DEX
  hierarchy verification, resource compilation and unsigned APK assembly.
- The final Android patch bundle and a repeated 9.37.54 APK validation passed after
  the dialog label/touch-target adjustments. The baseline run preceded the final
  48 dp minimum action-button height adjustment; its functional code was unchanged.
- Local traces in the parent workspace's analysis directory: jam-review-9.15.51.log,
  jam-review-9.37.54.log and jam-review-final.log.
- No new device acceptance or 9.35.54/9.36.50 validation is claimed for this change.

## Device-feedback fixes (2026-09-27)

Home/Speed Dial watch endpoints may include playlist/radio context alongside an
explicit video ID. Jam now offers its normal song choices for that form, retaining
the original endpoint for Quit Jam and play locally. Playlist-only and malformed
commands still fail closed; enqueue decoding remains restricted to single tracks.
The decoder regression covers song-with-playlist, playlist-only and duplicate IDs.

The phone/tablet screenshots showed padded video art on the participant and a square
album cover on the host. The host now includes its MediaSession cover bitmap as an
optional snapshot field, capped at 512 pixels and 128 KB JPEG. Encoding is cached by
bitmap identity and song ID. Existing thumbnail URLs remain a fallback for older
hosts or unavailable native artwork; the Companion forwards the field unchanged.
Both devices must be repatched to use this path.

Artwork interception caches native bitmaps outside Jam and retains that pre-Jam image.
Native refreshes during Jam cannot replace it with artwork for the mirrored host item.
Session exit restores artwork independently of native queue availability, tolerates
palette restoration failures, and invalidates pending loads with a generation token.
An explicit participant-role check prevents late image callbacks from repainting
host artwork after exit. These changes address plausible intermittent restoration
paths; the reported intermittent failure has not been reproduced deterministically.

Retest Home/Speed Dial song choices and all Quit-and-play routes. Compare the same
album cover on both screens; then leave while a new cover is loading, after rapid
host skips, after background/foreground, and after reopening the player. Verify
local artwork and colors return and remain correct after several seconds.

Device-feedback validation: nine tests passed with no failures/skips against each of
9.15.51 and 9.37.54. Both APKs passed SDK DEX/hierarchy verification and assembly.
The final pre-Jam artwork-cache adjustment was then rebuilt and APK-verified on
9.37.54. Traces: jam-device-fixes.log, jam-device-fixes-baseline.log and
jam-device-fixes-final.log in the parent workspace's analysis directory.
Device behavior still needs the retest above; no runtime pass is inferred.
