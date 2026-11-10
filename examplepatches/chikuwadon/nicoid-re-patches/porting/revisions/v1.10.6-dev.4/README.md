# v1.10.6-dev.4 — Vertical tab manager and popup touch regression

Development-only; no release, main or Issue state changes.

- Add a centered tab-list dialog, accessible from a left fixed tab-bar button or an optional gesture assignment
- Show distinct icons for ranking, search, local/account watch history, playlists, watch later, my page, following, cached videos and Nico Reports
- Tap a row to switch; close via its X; restore the last closed tab; long-press and drag to reorder, persisting into the horizontal tab strip
- Add two default-ON preferences immediately below "Use multiple tabs": show list button and show + button; independently hide to free tab-strip width
- Remove the tab-strip buttons without removing the tab feature or changing gesture mapping
- Ensure popup playback buttons and seekbar receive touch events when visible, including following a video tap
- Preserve all v1.10.6-dev.3 controls, gestures, audio focus and existing playback behavior
- Android 9/14/16 device verification remains required
