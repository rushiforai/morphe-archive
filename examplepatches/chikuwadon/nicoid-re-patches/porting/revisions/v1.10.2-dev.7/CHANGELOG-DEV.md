# v1.10.2-dev.7 development changes

1. Cache all-delete now previews selected folder video count, file count and byte size; post-delete reports actual freed size.
2. App-return normal playback uses the existing PopupReturn244 decoder handoff first, with legacy return only as a fallback.
3. Playlist long-press actions resolve the active local page and the video ID rather than a stale intent/URL.
4. Local playlist rows use their video ID for the native thumbnail resolver when no image URL was saved.
5. Normal status bar insets are recomputed after fullscreen exit, including tablet landscape.

Build and static tests are not Android device tests. No release, main update or issue closure.
