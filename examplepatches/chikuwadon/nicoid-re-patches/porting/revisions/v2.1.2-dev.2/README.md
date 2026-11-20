# nicoid Re v2.1.2-dev.2 test candidate

- Keep the published v2.1.1 behavior and avoid changes to the existing release tag
- Prevent automatic background/popup/mini transfers from initiating playback when the current player was explicitly paused
- End a stranded Media3 scrub preview before an explicit play/pause action, without changing seekbar drag or seekTo semantics
- Retain the complete official v2.1.1 feature set, settings, and default values
- Make the visible candidate version v2.1.2-dev.2 in the MPP manifest and runtime helper classes

This is an **unreleased validation candidate**. The external report of an endless buffering spinner after seeking is not yet reproduced; the scrubbing guard is a targeted defensive adjustment, not a confirmed fix for that report. Official patch metadata remains v2.1.1 until a future approved public release.

- Prevent delayed app-resume restoration from hijacking a newly requested popup playback session after returning to the app
- Restore only the playback service that was active when the app came to the foreground
