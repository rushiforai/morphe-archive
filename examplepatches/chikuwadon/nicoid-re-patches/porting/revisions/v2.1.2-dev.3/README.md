# nicoid Re v2.1.2-dev.3 test candidate

Retains the approved v2.1.1 behavior and the v2.1.2-dev.1/dev.2 guards without changing published releases or user settings

- Preserve the paused playback intent when a retained popup or background session is returned to a normal player
- Ensure a final seek clears any interrupted Media3 scrub state before seeking
- Allow explicit Play to prepare an idle player after a failed seek
- Bound retry attempts for recoverable network errors so the UI receives an error rather than buffering indefinitely
- Preserve pause state and playback mode settings during app switches and returns

Android-device validation remains necessary. The third-party seek report used v2.1.0 and does not prove that these conditions are the only causes.
