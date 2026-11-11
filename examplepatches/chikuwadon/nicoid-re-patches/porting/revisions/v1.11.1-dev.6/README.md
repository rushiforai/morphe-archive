# nicoid Re v1.11.1-dev.6

Development-only fix for normal-playback ambient rendering.

- Compose the normal halo in a dedicated child of the native videoLayout,
  above the video and below comments/playback controls. Do not overlay the
  system bars or right-side video details, thumbnails, or icons.
- Blend the diagonal corners between horizontal and vertical light strips.
- Keep normal Ambient ON/OFF responsiveness, popup inner lighting,
  fullscreen lighting and landscape tablet fullscreen restoration intact.

Review portrait/landscape normal playback on a real device before release.
No stable release, tag update, or main branch change.
