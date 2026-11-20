# nicoid Re v2.1.2-dev.4 test candidate

Retains the approved v2.1.1 behavior and the v2.1.2-dev.1/dev.2 guards without changing published releases or user settings

- Preserve the paused playback intent when a retained popup or background session is returned to a normal player
- Ensure a final seek clears any interrupted Media3 scrub state before seeking
- Allow explicit Play to prepare an idle player after a failed seek
- Bound retry attempts for recoverable network errors so the UI receives an error rather than buffering indefinitely
- Preserve pause state and playback mode settings during app switches and returns

Android-device validation remains necessary. The third-party seek report used v2.1.0 and does not prove that these conditions are the only causes.

Additional v2.1.2-dev.4 changes (development only):
- Independently configure background-return and popup-return behavior from the active service presentation, not the app-switch setting
- Keep the existing native resume preference as the background choice and add a popup choice without removing, merging, or resetting settings
- Migrate the legacy stored preference once; provide Japanese, English, and Traditional Chinese titles/options/summaries
- Retain the pre-tab-swap ambient glow across transient layout resets; refresh panel decorations before first visible frame and rewrap replaced backgrounds
- Prune only tagged, orphaned mini-player panels on explicit close after lifecycle transitions; preserve active successor panels
