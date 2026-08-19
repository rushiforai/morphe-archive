# Rating Visibility porting notes

The behavior is derived from NuvioMedia/NuvioTV PR #2384, rebased there onto the 0.8.x development line. The patch targets the released `0.8.6-beta` APKs only.

The binary implementation stores equivalent policy in Morphe-private preferences and hooks rendering boundaries instead of adding fields to Nuvio's profile-backed layout data store. This prevents settings from entering Nuvio synchronization or telemetry.

Fingerprints identify the settings pane, central Meta and MetaPreview rating accessors, the modern Continue Watching mapper, Detail metadata, episode cards, the episode-ratings renderer, and the native detail tab list by stable model signatures, resource literals, and semantic method calls. The hooks do not hard-code obfuscated class or method names.

A later Nuvio release is unsupported until all fingerprints match exactly once and all application, inspection, emulator, and real-TV gates pass again.
