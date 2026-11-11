# nicoid Re v1.11.1-dev.7

Development-only ambient rendering repair.

Normal playback now draws only a narrow, fully faded exterior halo on the
window decor. Unlike dev.5, it never paints over full control/icon rectangles
or through the side information panel: top/bottom bands end ahead of the
controls and a short right gutter band fades to zero before the detail
thumbnails and text. The portrait player gets a short bottom halo even when
the picture fills its width. Corners fade elliptically with no abrupt seams.

Fullscreen and popup sampling, themes, preference defaults and ON/OFF toggle
behavior remain unchanged. Android 9/14/16 and real-device portrait/landscape
verification is required before publishing. No stable release or tag update.
