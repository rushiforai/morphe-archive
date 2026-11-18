# Pause on overlay

The advanced Player > Overlay switch is owned by the independent **Player
overlay** tweak and defaults to off. When enabled, the standard watch player's
controls pause playback on appearance and resume it on dismissal. It follows
the iOS `setOverlayVisible:` behavior in `YTAfterglow.x`.

For YouTube 21.43.523, the existing controls binder identifies `Lolx`. Its
`X(Z)V` parameter controls animation; the final `Z:I` field records actual
visibility. The hook runs at the shared return after both native branches.
Native layout, visibility policy and animations remain intact.

The injected controller bridge uses this owner's actual `Lokb.k:Larrt`, the
same controller used by its play/pause button. The native PLAYING branch calls
`Larrt.a()` to pause, and PAUSED calls `Larrt.b()` to play. The patch resolves
these commands from the native enum and click handler, then checks the public
fields and shared readiness gate. Ended, loading, error and unavailable players
receive no command; the hook does not synthesize button clicks or replay.

The enclosing player root must be attached, visible and in the focused window.
A weak per-owner session prevents synchronous feedback and duplicate visibility
updates from repeatedly issuing commands. A preference revision invalidates the
previous observation; a failed/unavailable command can retry on the next native
update. Turning the option off or resetting it leaves playback to YouTube.

`tools/check_overlay_pause.py` exercises duplicate, reentrant, disabled,
foreground, unavailable-player and exception traces. Settings checks verify the
default, advanced-mode placement and independent tweak ownership. Build96 passes
strict patch selections
28/29/30/1/3 and all 256 production hashes. 35 full and 23 independent runtime
observations are reviewed (9 explicitly limited). Corrected observations verify
native show/hide playback, manual controls, fullscreen, cold persistence,
background pause, Shorts motion, live OFF and page/full resets. Test assumptions
and interrupted wrappers remain recorded with their successful continuations.
The final full APK is restored and stopped with defaults and clean logs.

Evidence: execution-96.json, pause-overlay-audit-96.json and delivery-96.json under
port-completion-20261113. Physical devices, casting and live/DVR remain untested.
