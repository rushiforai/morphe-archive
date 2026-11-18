# Buffered progress and live scrubber colors

The Android 21.43.523 adapter now applies the existing `SEEK_BUFFERED` palette role at the three native buffered-color reads and selects `SEEK_SCRUBBER_LIVE` for the current ongoing live video. The named **Seek bar** patch remains the runtime owner. Selecting only a dependent feature does not enable these colors.

## Verified native boundaries

All three resources have one read, in the `Ljsd` constructor with parameters `(Context, Ljsq, Laruf, Lbuov, Lopg, Laktm)`. Each `Resources.getColor(int)` result immediately initializes the indicated `Laruc` field:

| Resource | Stock ID | Field |
| --- | --- | --- |
| `inline_time_bar_buffered_color` | `0x7f060633` | `Laruc.j:I` |
| `inline_time_bar_buffered_highlighted_color` | `0x7f060634` | `Laruc.l:I` |
| `inline_time_bar_colorized_bar_buffered_color_dark` | `0x7f060635` | `Laruc.k:I` |

The patch requires exactly one owner and one color read for each resource, verifies the immediate native field store, and wraps only the resolved integer. It does not replace native drawing or change buffered-range geometry. These constructor colors follow the existing restart-applied palette behavior for native views.

An unset role returns the original color including its alpha. The existing palette derives `0x99A6A6A6` buffering when an explicit played color is present; this adapter makes that existing derivation reach the renderer. An unrelated theme color does not invent a buffered override. The legacy red-progress preference never colors buffering. Explicit transparent colors remain configured colors.

## Current-video live state

The final scrubber-circle boundary in `Ljsb.onDraw` remains the sole scrubber draw interception. The preceding timed-marker circles and native paint selection remain intact. `Laruc.A` is not used as a live flag: it selects between native scrubber styles and is assigned from `Larrq.O`, which does not establish current-video live state.

`seekBarThemePatch` explicitly depends on the original Morphe `videoInformationPatch`. It binds three small extension methods to the pinned runtime's public static `getVideoId()`, `getPlayerResponseVideoId()`, and `isLiveStream()` methods. The actual bundled `youtube.mpe` DEX confirms that `isLiveStream()` requires both its live bit and equality between `liveStreamVideoId` and `playerResponseVideoId`. The patch verifies those field references before installing the bridge.

The adapter additionally requires a nonempty current-player ID equal to the response ID, then rechecks both IDs. A background-prefetched response, unknown ID, or changing player falls back to the ordinary scrubber role. The original native observer supplies whether the video is currently live; a recorded live video with a false live bit remains an ordinary video. Existing live-role inheritance remains unchanged: explicit live scrubber, then explicit ordinary scrubber, live track, or played track. No view-specific live getter is added to `SeekBarHost` because the verified seekbar model does not contain a video ID.

## Validation and runtime gate

`python3 tools/check_seekbar_colors.py` exercises the real policy and palette: 81 checks cover original ARGB preservation, owner isolation, transparent overrides, existing buffered derivation, red-progress exclusion, live/VOD roles, and stale or transitioning IDs. Full extension Java compilation and focused patch Kotlin compilation pass. These checks establish source behavior, not a rendered-device result.

The release candidate must still pass strict patching with both the default set and optional original Seekbar components. Inspect the final DEX for all three buffered calls and the three live-state bridges. On device, use a visibly buffered video and compare the system palette, a played-color preset, and a distinct buffered override where available. Restart after changing cached native colors. Confirm ordinary and ongoing-live videos use their respective scrubber colors, including live-to-VOD navigation and background prefetch. Check hidden controls, scrubbing, glow, custom scrubber images, and SponsorBlock markers; disabling or omitting the Seek bar owner must preserve native colors. A live-only scrubber color must leave ordinary-video scrubbers unchanged.

Native evidence for this change is stored in the task cache under `theme-completion/native-{jsb,jsc,jsd,jsl,aruc}.txt`, `resources.txt`, and `pinned-youtube-VideoInformation.txt`. No upstream runtime asset was modified.

Build125 passes Android16 rendered checks with an imported test theme: red played
track, green buffered track, cyan ordinary scrubber and magenta live scrubber.
The paused 19-second `jNQXAC9IVRw` fixture rendered the green buffered range and
cyan dot. The ongoing NASA stream `M3HKLzjvKPc` displayed native Live and a
magenta endpoint. Returning to the ordinary video in the same process restored
cyan with no magenta in the seekbar. Screenshots097/099/101 and pixel checks are
in `bundle-125-qa/native-runtime`; the test palette was then reset. This verifies
these specific rendered paths, while the broader optional-patch/surface matrix
above and physical devices remain separate coverage.
