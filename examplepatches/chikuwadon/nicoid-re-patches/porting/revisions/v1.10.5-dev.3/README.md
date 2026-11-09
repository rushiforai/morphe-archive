# v1.10.5-dev.3 — Popup gesture reliability

Development-only validation based on v1.10.5-dev.2. No official release.

- Improve popup video touch arbitration while retaining one-tap controls and the existing 2-second timeout.
- Double-tap close/seek is committed on the second finger release, not second touch-down. Drag, hold-speed, edge resize and pinch cancel pending close.
- Move/drag operations do not automatically reveal controls or reset their visibility timer.
- Respect visible play, pause, seekbar and toolbar controls; video taps in an unoccupied area continue to toggle player controls.
- Use Android scaled touch/double-tap slop and gesture timing without additional fixed delays.
- Preserve hold-to-speed, corner resize, native window dragging, two-finger pinch, popup double-tap seek and normal playback features.
- Include JVM gesture state tests and compiled-DEX hook assertions.

Actual Android device checks still required, especially popup movement with controls hidden/visible and quick double-tap while the play button appears.
