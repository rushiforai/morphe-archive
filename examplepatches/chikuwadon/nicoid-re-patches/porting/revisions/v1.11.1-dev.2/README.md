# nicoid Re v1.11.1-dev.2

Development-only follow-up to v1.11.1-dev.1. Never publish a stable
release, edit the v1.11.0 tag, or merge to main without approval.

- Restore ambient light in normal playback where the comments region is the
  same size as the video: render an inner edge gradient below captions/controls
  rather than clipping the outward light to an empty area.
- Restore popup ambient lighting when enabled (including Vivid preset):
  render inside the comment plane instead of beneath the opaque video surface.
- Keep the popup's limited inner spread, normal playback's exterior halo where
  available, and existing fullscreen behavior unchanged.
- Preserve tablet fullscreen-to-normal viewport correction from dev.1.

CI verifies the development MPP and regression guards. On-device checks must
verify Normal, Fullscreen, Popup (enabled/Vivid), colors, tap targets and mode
transitions before any further release decision.
