# nicoid Re v1.11.1

Stable source snapshot from the user-tested v1.11.1-dev.14 revision
(commit f3a8afb6c4326153942f3e56c05ada9eeb5ded30).

## Fixes

- Prevent Ambient Mode lighting from tinting comments, text, icons, thumbnails
  and playback controls while retaining the selected preset's spread.
- Restore the normal playback lighting below the video tab bar and across
  the right-hand edge and corners in landscape tablet mode.
- Restore prompt, reliable Ambient Mode ON/OFF interaction, including
  consecutive taps and synchronized buttons.
- Restore video viewport and status bar layout after leaving fullscreen in
  landscape tablet mode.

The canonical build generates the helper DEX and MPP with the stable 1.11.1
version through Gradle. Preserve the published v1.11.0 source unchanged.
