# v1.10.7-dev.11 — seamless background / notification return

Development-only successor of v1.10.7-dev.10. Stable release v1.10.6,
main, public release tags and issue states remain unchanged.

## Targeted change

- Capture the **original** normal-playback TextureView SurfaceTexture on app
  switch. Preserve the existing ExoPlayer, stream, position, speed and audio
  while a notification-only foreground Service keeps the process active.
- Restore the retained SurfaceTexture when the original Activity regains focus.
  Remove its interception listener when the normal Activity is stable or the
  session ends, including exceptional exit.
- Before returning from the lower background bar / notification, record the
  Service's prepared decoder output. Idempotent VideoOutput binding skips
  `setSurface` when the destination SurfaceTexture and underlying Surface
  have not changed; a truly new or invalid surface still receives a bind.
- Do not initiate a new HLS request, seek, create a decoder, pause playback or
  hide the UI spinner as a substitute for keeping the real output.

Existing ranking chooser, 14 drawer gesture actions, notification media
metadata, player controls, tab management, and previous fixes are retained.

## Verification

CI tests include the precise smali/Dex hooks, packaged MPP identity,
security/feature continuity and the no-reload/no-seek policy. Android 16
device verification is still required for transition smoothness, codec
compatibility, and notification/normal playback handoff.
