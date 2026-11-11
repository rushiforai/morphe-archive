# nicoid Re v1.11.1-dev.5

Development-only ambient regression fix:

- Make the normal-mode halo visible even when opaque native player panels
  completely cover the player background.
- Draw the normal halo around the video while excluding glyph outlines,
  control-icon centers, and the system bar areas; do not promote entire
  control and text background rectangles above the light.
- Preserve popup inner glow, fullscreen rendering, and the responsive ON/OFF
  control from previous development builds.

This is a development build, not a public release. Device-level testing is
required in portrait and landscape.
