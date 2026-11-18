# Old playlist minibar

`playlistOldMinibar` is the default-OFF advanced **Old playlist minibar** switch
under Player > Playback, owned by **Mini player**. The iOS behavior overrides
`queueClientGlobalConfigEnableFloatingPlaylistMinibar` to false. Android
21.43.523 retains the corresponding native playlist layouts and selects them
with feature flag **45798642 / 0x02bad4f2**, namespace 23.

`PlaylistMinibar` reads the installed-tweak gate and effective preference once
per process. ON returns false at every matching native flag read. OFF preserves
each original value. The setting affects the collapsed playlist entry point;
it does not select or alter the floating video mini-player. Lite Mode does not
force this key.

If the initial preference read fails, the gate logs the error and retains the
native choice for that process. It does not retry after an owner may have cached
its layout, and a preference-store error cannot poison the hook's class initializer.

Changing the switch, importing a changed value, or resetting an active value
requires a restart. YouTube constructs and caches the controls, event subject
and visibility animation separately. Keeping the decision fixed prevents a live
change from mixing those native architectures. The settings integration must
provide a clear restart notice and action.

The shared extension publishes the supplied application base context before
native application initialization. It verifies the manifest application and
walks its superclass chain to the sole inherited `attachBaseContext(Context)`
method before injecting `Afterglow.onBaseContext`. On this build the owner is
`Lijr;`, beneath `YouTubeTikTokRoot_Application -> Lijl; -> Lijo;`. The original
method only records elapsed time and forwards the context to its superclass.
This makes stored preferences available to early cached owners such as
`Lalun.a()` without relying on reflective `ActivityThread.currentApplication`
access. The existing main-activity bootstrap and guarded context setter remain.

## Native evidence

The `engagement-panel-playlist` constructor identifies `Lref;`. Its `l()V`
method creates `Lrfd;` when the floating flag is true and `Lrel;` otherwise:

- `Lrfd;` substitutes `next_gen_playlist_fab_entry_point` for
  `next_gen_playlist_entry_point`, or `playlist_fab_entry_point` for the ordinary
  playlist entry point. It uses the rounded background, elevation, shrinkable
  width, separate touch target and **Show playlist videos** accessibility label.
- `Lrel;` inflates the original `ViewStub` without substituting a layout. Both
  original XML layouts retain the full bar, playlist name/position, next-title
  views and native callbacks.
- `Lalun.a()` chooses and caches the corresponding native event subject.
  `Lrgu;` chooses the visibility animator during construction. `Lrey.k()` selects
  scroll behavior. `Lqth.e()` and `Lrdg.a()` retain matching panel/event dispatch.
  `Lref.k()` chooses the accessibility text and `Lref.l()` selects the touch view.

The patch discovers and verifies both constructors and their resources, then
requires **18 reads from 14 flag-id loads across 13 methods in seven classes**.
The classes in this exact stock build are `Lqth;`, `Lalun;`, `Lrdg;`, `Lref;`,
`Lrey;`, `Lrfd;` and `Lrgu;`. `Lrfd.t()` and `Lrfd.o()` each reuse a single
loaded flag id for three reads. The patch traces the unchanged wide register
pair to the shared native `(IJZ)Z` getter and validates its namespace. The
getter's original default argument is retained unchanged.
This preserves unrelated reads, including other flags in the same methods.
It also avoids incorrectly treating `Integer.intValue()` as a flag read.

All changes occur after the native boolean result. Original constructors,
models, playlist navigation, open/close handlers, animation implementations,
resources and logging remain native.

Stock evidence is retained under
`/home/corey/.cache/ytafterglow-android/team-106/playlist-minibar/`: extracted
classes, resource mapping and the four original/floating layout XML trees.

## Validation and runtime handoff

`python3 -B -I tools/check_playlist_minibar.py` checks native true/false passthrough,
installed ownership, independence from the video `miniplayer` preference,
Lite Mode behavior and stable decisions after setting changes or resets. Each
initial configuration runs in a fresh JVM, including a first native false read.
The current regression run covers 122 checks across 18 fresh JVM processes,
including a failed first read followed by preference-store recovery.

Runtime proof is still required. Validate full and Mini-player-only builds:

1. Cold OFF: record the native collapsed playlist entry point, then open/close
   the panel, select an entry and verify Next/Previous with advancing playback.
2. Enable the switch and restart. Verify the full native bar instead of the
   floating button, playlist name/position, next-title content, panel expansion,
   dismissal and scrolling. Check portrait/fullscreen return and native gestures.
3. Change the switch while a playlist is attached; the current controls must
   remain coherent until restart. Cold OFF must restore the original server
   choice. Page/full reset and imported changes need the same notice and restart.
4. Verify standalone video mini-player, children's-video mini-player ownership,
   ordinary watch, Shorts and player overlay composition independently. Confirm
   playlist playback continues after entry changes and no duplicate panel/event
   handling appears.

Do not count this as runtime-complete from source or strict patch validation
alone. Physical devices, casting and alternate watch layouts need their own
observations.

## Emulator checkpoint: build109, retained in build110

The advanced switch shows its restart dialog. Restarting with ON preserves a
usable full native playlist bar, panel dismissal and advancing playback
(14→21 seconds). The OFF baseline already rendered the original resource layout, so this fixture
cannot demonstrate a floating-to-full visual transition. That decision retains
native/bytecode and fresh-process policy proof. Build110 keeps the exact playlist
hook; physical devices and alternate layouts remain untested. Full release
validation is recorded in `release-build110.md`.
