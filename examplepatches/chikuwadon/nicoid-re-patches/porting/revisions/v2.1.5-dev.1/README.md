# v2.1.5-dev.1 — Seek-buffer freeze recovery (non-published)

## Evidence

The user's 2026-11-20 SC-52D log includes a healthy seek sequence where
Media3 returned from `state=2` (BUFFERING) to `state=3` (READY).
At 10:07:21–10:07:32, a later session (`player=13a45c3`) remained in
BUFFERING, with `position=102376 buffered=102376 seeking=true` despite
multiple Play/Pause commands. No `onPlayerError` or IDLE state was logged.
Codec event delivery to a dead handler thread was also observed after rapid
seeking, but that warning also appeared during a previously successful seek,
so it does **not** establish the underlying cause.

## Scoped fix

Only observe Media3 after an explicit seek remains pending, with:
- active Play intent, BUFFERING, and no playback suppression;
- no ongoing scrub, released owner, or retained-view handoff;
- same exact player/media item and no meaningful position/buffer progress
  for eight seconds.

A single recovery per media-item BUFFERING episode performs `stop()`,
`seekTo(originalPosition)`, and `prepare()`; the prior Play intent remains
owned by Media3. Never auto-play paused content. Cancel timers on Pause,
handoff, errors, READY, release and media changes. No new settings or network
request privileges. Do not log media URLs, authentication headers or cookies.

The Android MPP stage recompiles only the diagnostic helper and its two
private state classes, updates helper/extension display-version owners,
and verifies all other classes and archive entries unchanged.

## Verification

`python3 porting/revisions/v2.1.5-dev.1/tests/test_freeze_recovery.py`
exercises actual Java code against controllable Player doubles (buffer
stagnation, late buffer progress, pause, handoff, changed media, scrubbing,
suppressed playback and one-shot limits). CI must also assemble and validate
the Android MPP; **only an on-device Morphe install and regression run can
confirm the incident is resolved**.

This is a bounded recovery for an evidenced silent Media3 stall, not proof
that the underlying server/network/decoder cause is known. Do not publish
as a stable version until the user confirms actual behavior.
