# nicoid Re v1.11.1-dev.8

Development-only adjustment to preserve the Vivid ambient preset.

The normal portrait player now extends the video-bottom glow into the tab
strip's BACKGROUND, with the tab text and indicator drawn afterward. This
restores a visible halo without covering text, icons or their panels.

Landscape top/bottom halo distance scales with the user's preset instead of
the extremely narrow dev.7 cap. Its right gutter remains safely limited so
video-details thumbnails and text are not tinted. Fullscreen, popup, ON/OFF
and the tablet fullscreen-exit behavior are unchanged.

Requires real-device checks in portrait and landscape. No production release.
