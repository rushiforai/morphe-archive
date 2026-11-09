# v1.10.5-dev.5 — restore popup double-tap close

Development-only validation build based on v1.10.5-dev.4. No official release.

- Fix popup double-tap close not firing after the gesture-reliability changes.
- Root cause: the gesture bridge tried to call an unsupported isVisible() method on player controls and aborted before routing touches. It also relied on a separate GestureDetector callback to confirm the second tap.
- Use View.isShown() for control visibility; do not abort tap tracking if optional controls cannot be queried.
- Recognize a valid second down/up sequence directly using Android standard double-tap time/distance, cancel on drag, pinch, long hold or cancelled touch stream. Commit close only on the second finger-up.
- Preserve double-tap seek preference, visible player button priority and 2-second controls timeout.
- Add regression tests for a double tap even when the native GestureDetector does not fire and for a second tap becoming a drag.
- Preserve the public-mylist title fix, comment posting fix, and earlier improvements.

Android device validation remains necessary, especially rapid video double taps, dragging, pinch, playback buttons and popup seek mode.
