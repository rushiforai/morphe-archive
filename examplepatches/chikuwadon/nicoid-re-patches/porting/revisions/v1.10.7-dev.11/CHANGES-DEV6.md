# v1.10.2-dev.6 (development verification)

- Restore the known-good Smali assembly invocation and fail the build when development helper class definitions or generated nested classes are missing from the final DEX.
- Preserve playlist actions and thumbnail binding from dev.5; improve support for historical thumbnail fields and missing video IDs.
- Intercept the hamburger action in the main tabbed host as well as the video-list host without changing other navigation.
- Remove one unnecessary image metadata request and correct the settings listener's Activity retention path.
- Maintain existing cache cleanup, media session logic, settings, and prior release assets unchanged.
- No official release; in-app verification on Android devices remains necessary.
