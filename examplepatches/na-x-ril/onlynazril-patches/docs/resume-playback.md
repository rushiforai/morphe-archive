# Resume playback

The `Resume playback` patch keeps the play head of the last twelve videos in memory and seeks back
to it when a video is opened again. It is a bytecode patch plus the
`extensions/tiktok/playback` code.

Version scope: 47.7.1, 47.7.2 and 47.7.3.

## Hooks

The patch treats playback as a small state machine, because the progress tick alone cannot see
every position change:

| Hook | Role |
|---|---|
| `onPreparePlay(String)` / `onPreparePlay(String, event)` | the open boundary: reset the per-open flags |
| `onSeekStart(String, int, float)` | a user seek began; progress ticks must not save the intermediate value |
| `onSeekEnd(String, boolean)` / `onRenderSeekComplete(String, boolean)` | the seek ended; read the exact position, save it, or clear it at the start/end |
| `onPlayProgressChange(String, long, long)` | the fallback save while playing |
| `onPausePlay(String)` / `onPausePlay(String, event)` | the exact save before the event handler can move the play head |
| `onPlayCompleted(String)` / `(String, int)` | the video finished: the entry goes |
| `onLoopPlay(String, int)` | the video looped: the entry goes, the reset is not a user seek |
| `onPlayRelease(String)` / `onStopPlay(String)` | the final save when no pause callback arrives |
| `onPlayFailed(...)` / `onRetryOnError(...)` / `onResolutionSwitchComplete(...)` | the surface is recovering; a temporary zero must not erase the point |
| `onRenderFirstFrame(String, event)` / `onRenderFirstFrameFromResume(String)` | the restore seek |

`onPlayStop` is deliberately not used as the main save; at that point the controller's position has
already fallen back to the older `lastPosition`. The release/stop hooks above only make a final
save from the last valid position.

## PlayerController callbacks that are not hooked

The class exposes more callbacks than the feature needs. These are deliberately left alone:

| Callback | Why it is not used |
|---|---|
| `onPlayCompletedFirstTime` | a subset of `onPlayCompleted`; clearing there as well would be duplicate work |
| `onPlayStop(...)` (four overloads) | the position has already fallen back to `lastPosition`; `onPlayRelease` / `onStopPlay` are the final-save paths |
| `onPlayPause`, `onPause()`, `onResume()`, `onPlaying`, `onResumePlay` | state notifications; no position change that the progress/pause hooks do not see first |
| `onPlayPrepare`, `onPlayPrepared` | prepare aliases; `onPreparePlay` is the open boundary |
| `onSpeedChanged` | changes the tick cadence, not the position unit (still milliseconds) |
| `onResolutionSwitchStart` | the completion callback already marks the item suspect |
| `onBuffering`, `onDecoderBuffering` | buffering state, not a play head |
| `onVideoSecondFrame`, `onVideoSizeChanged`, `onFrameAboutToBeRendered`, `onRenderReady`, `onPreRenderReady`, `onPreRenderSessionMissed`, `onLiveRenderFirstFrame` | rendering/metrics, not a position to remember |
| `onRenderFirstFrame(event)` | the event-only overload has no source id; the two-parameter overload is the hooked one |
| `onPlayerInternalEvent`, `onBufferedPercent`, `onBufferedTimeMs`, `onVideoBitrateChanged`, `onBrightnessChanged`, `onMaskInfoCallback`, `onCrosstalkHappened` | telemetry/player metrics |
| `onPageScrollStateChanged` | pager scroll, not playback |
| `onAttach`, `onDetach`, `onDestroyView`, `onPause()`, `onResume()` | lifecycle without a source id; the per-item callbacks carry the id |
| `getCurrentPosition`, `getPlayerManager`, `getContext`, `getEventType`, `getPageType` | helpers; the extension reads the manager and the controller directly |

## Per-page or global?

The store is **global by `aid`**, not per page. A video is the same content whether it is opened
from the For You feed, search, a profile, or a deep link; giving each surface its own key would
create several resume points for one video and confuse the next open.

The current patch saves and restores by `aid` on every surface. If the feed's autoplay behaviour
should differ, the policy can be split without changing the key. A sane split is:

| Surface | Save | Restore |
|---|---|---|
| detail, search result detail, profile video, `video lainnya` | yes | yes |
| For You / Following autoplay | yes, subject to the thresholds | no by default; a video that merely scrolled past should not jump to an old position. A later `Resume in feed` switch can opt in |
| LIVE, ad, photo mode, story | no | no |

So: no per-page storage, and no separate hook set per page. `PlayerController` is shared; one set
of hooks covers every surface. Only the restore decision needs the surface classification, and that
classification belongs in the extension, not in the map key.

The surface can be read from the controller's real-named `getContext()` activity (the detail pages
report `com.ss.android.ugc.aweme.detail.ui.DetailActivity`, the main feed reports
`com.ss.android.ugc.aweme.main.MainActivity`). `getEventType()` / `getPageType()` are the fallback
when the activity is not one of those.

## Data

`ResumePlayback` keeps one `Entry` per item id:

```text
Entry {
  positionMs, durationMs, updatedAtMs, lastKnownPositionMs,
  openedAtMs, seeking, seekStartedAtMs, seekTargetMs,
  userSeeking, suspect, started
}
```

The map is a `LinkedHashMap` with `accessOrder = true`, capped at twelve entries. `get` and `put`
move an item to the young end, so a thirteenth item evicts the **least recently touched** one, not
the first one ever saved. Nothing is written to disk; killing the process clears every position.

The item id is the callback's `sourceId`. The controller's `mCurrentAid` is only the fallback,
because it can still name the previous cell on a preloaded item.

## What is saved

The same thresholds apply to progress ticks, pauses and seek completion:

- before the start threshold: not saved;
- within the end threshold of the video's end: the entry is removed;
- otherwise the position and duration are stored together.

Progress ticks smaller than 250 ms do not rewrite the entry; pause and user-seek completion always
store the exact value. The duration is accepted at once when it is close to the stored one (within
two seconds). A larger jump is held back until the same new value repeats for three readings: one
neighbouring preloaded item's duration cannot become this item's seek denominator, but a genuine
server-side duration change still lands after a few ticks.

A progress tick below the start threshold removes an older resume point only when this open has
already played past that threshold. Before that, the tick is the pre-seek play head and must leave
the point it is about to restore alone.

A pause or a successful user seek below the start threshold clears the point explicitly: those
callbacks are user actions, not the pre-seek tick.

A reported position of `0` is a real position, not a missing one. The manager's value is kept
unclamped: only a negative value means "position unavailable", and only then does a save fall back
to the last saved position. Clamping it to zero made a seek back to the start and a released player
look the same, so seeking to `00:00` and reopening the video resumed at the old point instead of
clearing it.

## Recovery states

- `onSeekStart` sets `userSeeking`; progress and pause callbacks ignore the item until the seek ends.
- `onSeekEnd`/`onRenderSeekComplete` read the final position. A failed seek leaves the previous
  point untouched.
- `onPlayFailed`, `onRetryOnError` and `onResolutionSwitchComplete` set `suspect`. While suspect, a
  zero or a sub-start position is ignored; the next position past the start threshold clears the
  flag and saves normally.
- `onPlayCompleted` and `onLoopPlay` remove the entry; the loop's reset to zero must not be treated
  as a user seek.
- `onPlayRelease`/`onStopPlay` make one final save from the current position, or from the stored
  position when the player can no longer report one.

## Restore

On the first frame:

1. read the entry, its stored duration and the player's current position;
2. if the current position is already within one second of the target, do not seek;
3. otherwise install the guard **before** calling the manager's `seek(float)`:

```text
seeking = true
seekStartedAt = now
seekTarget = clamp(saved position, start, duration - 1s)
seek(seekTarget * 100 / duration)
```

While `seeking` is true, progress ticks are ignored until the player reports a position within one
second of the target, or five seconds pass. This is what keeps the first ticks, which still
describe the pre-seek play head, from moving the resume point backwards. A pause during the guard
keeps the target; it does not save the pre-seek position.

The guard is per item, not global: a repeated first-frame callback while the first seek is in
flight does not issue a second seek.

## Example

Duration 6:00, two-second end threshold:

| Event | Result |
|---|---|
| tick at 5:00 | entry `(5:00, 6:00)` |
| tick at 6:00 | within 2 s of the end: entry removed |
| tick back at 5:00 | entry `(5:00, 6:00)` again |

There is no "new duration" here: the duration is a property of the video, not of the position. The
position changes; when the entry was cleared at the end, the return creates it again.

## Diagnostics

The About section prints one line from `ResumePlayback.summary()`:

```text
Resume playback: 84 saved, 41 restored, 6 seeked, 7 cleared, 5 evicted · seek ... pos=300000 dur=360000
```

Nothing is logged per tick. Read the line after watching and reopening a video; the counters show
whether the save, the seek and the eviction paths actually ran.
