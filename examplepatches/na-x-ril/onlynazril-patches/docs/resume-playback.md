# Resume playback

The `Resume playback` patch makes TikTok hand a video back at the position it already stored. It
opens two of the app's own progress-continue gates and leaves the restore to the player: no seek
is issued, so there is no frame at zero, no jump and no flash.

Version scope: 47.9.1, 47.9.2, 47.9.3, 48.0.1 and 48.0.2.

## What the app already has

TikTok keeps a position per item and, for its own "continue where you left off" behaviour, asks two
questions before using it:

| Gate | Where | Shape |
|---|---|---|
| may this build continue at all | a lambda reading `FeedPlayProgressContinueConfig.enable` | `invoke()Ljava/lang/Object;` |
| may this feed continue | the resume method's `event_type_list.contains(eventType)` | `(Aweme,String,String)J` |

The second method is the one that answers "where should this video start"; it returns the stored
millisecond, or `0` when the app does not want to resume.

Both are forced open while the switch in Tweaks is on. The position itself is never read, written
or converted by this patch: the app's store and the player own it.

## Hooks

| Hook | Role |
|---|---|
| `onPreparePlay`'s continue lambda | returns `true` while the switch is on |
| the resume method's event type check | replaces the allow-list answer with the gate below |
| `PlayerController#onPlayProgressChange(String, long, long)` | keeps the completed set up to date |
| `PlayerController#onPlayCompleted(String)` / `(String, int)` | marks the item finished |

Nothing else is hooked: the playhead, the seek bar, pause, release, loop and the failure callbacks
are the app's business again.

## The completed set

The app would resume a video that already finished at its last second. `ResumePlayback` keeps an
in-memory set of item ids that must not resume, and the resume gate refuses those.

A progress tick marks an item when it

- reached its duration,
- is still below the start threshold, or
- is inside the end threshold of the end.

`onPlayCompleted` marks it as well. A later tick outside those bounds clears the mark, so a video
rewatched past the start threshold resumes normally the next time it is opened.

The set holds the 32 most recently marked ids, newest last. It lives in memory only; a process
death clears it, and the next watch re-marks whatever it sees.

## Why the restore is not a seek

An earlier version of this feature kept its own twelve-item map and called the manager's
`seek(float)` at `onPlayPrepared`, with `onRenderFirstFrame` as a fallback. It worked, but the seek
had to land before the first frame and the guard that protected the target from the pre-seek ticks
made the restore timing-sensitive: a slow player left the video running from zero for the rest of
the open, and a missed seek showed the first frame before jumping.

The play request was not a substitute. On 47.9.x and 48.x its start-time value does reach the
engine as `init_start_time_ms`, but playback still began at 0, and the nonzero value brought the
cover flash back on pause; on 47.7.x and 47.8.3 it never reached the player at all.

With the two gates open the app does the whole job itself, at the point in its own pipeline where
it knows the duration, the player state and the feed. That is why the patch no longer seeks, keeps
no position and applies no thresholds of its own; the thresholds only decide which items are
allowed to resume.

## What this does not cover

The app's store is the only source of positions. If TikTok has no position for an item (a fresh video, a cleared store, a process it no
longer remembers), nothing is resumed. The patch cannot
resume further back than the app itself would.

The completed set is fed by the feed player's callbacks. A video that finishes in the detail page
is marked only if the feed controller reports it; otherwise the app's own handling of a finished
item applies.

## Thresholds

`Skip from start` (default 4 s) and `Skip from end` (default 4 s) are checked on every progress
tick, and the completed set is what applies them:

- a video left inside the start threshold is marked, so it starts over;
- a video left inside the end threshold is marked, so it starts over;
- anything between the two thresholds resumes.

## Diagnostics

The About section prints one line from `ResumePlayback.summary()`:

```text
Resume playback: 12 resumed, 2 from the start, 3 finished · 7712025979194969351 resumes
```

With diagnostics on, each gate answer is one line:

```text
resume: 7712025979194969351 resumes app=true
resume: 7712025979194969351 starts over app=true
```

`app=` is TikTok's own allow-list answer before the override; a `resumes` next to `app=false` is
the override doing its job.
