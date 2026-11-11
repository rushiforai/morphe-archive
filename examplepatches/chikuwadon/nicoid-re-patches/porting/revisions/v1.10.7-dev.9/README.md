# v1.10.7-dev.9 — notification metadata / return audio stability

Developer-only regression candidate based on Galaxy S23 Ultra Android 16
video and 23:47 bugreport.

- Keep the original player and its timeline across both app-switch directions.
- On return to the same NicoidVideoActivity, keep the notification/Foreground
  Service alive until the original window has regained focus and the retained
  player's playback clock is progressing. Do not seek, pause or recreate HLS.
- Build MediaSession metadata from Nicoid's existing title/author bundle and
  PlaybackBar metadata, with asynchronous cached thumbnail artwork via
  FeedbackMedia and CachedMediaArtwork.
- Replace the generic "nicoid Re / Playback continues ..." notification.
- Preserve Play/Pause/Stop notification controls and the distinct Back/Popup routes.

Static/DEX tests validate code paths, not Android audio output. Device testing
is needed to establish whether the observed brief audible dropout is resolved.
No regular release or main update.
