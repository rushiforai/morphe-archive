# v1.10.7-dev.12

- Add a configurable single-tap playback controls area for normal, landscape fullscreen, and popup playback.
- Provide entire-video, side edges, top and bottom edges, center, and up to three custom rectangles.
- Confirm single taps before toggling controls so double-tap seek does not briefly show them.
- Show the selected startup screen in its settings summary.


- Group the tap-area editor into presets, preview, fine adjustment and area management.
- Resolve taps against the native video owner, and route popup single-tap chrome changes through the same area policy.

- Apply the saved area in the foreground player touch dispatch, independently of the library listener.
- Keep area management and the two-row quick adjustment visible for every preset.
