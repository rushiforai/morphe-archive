# Publication

Current beta 0.2.4-beta.1 uses one primary MPP and the root patches-bundle.json feed, providing Full Collection and Lyrics-only Add-on as native categories. Add the repository once. Legacy full/patches-bundle.json remains historical for prior users; disable that separate source when using the combined one.

Beta releases advance dev only; main retains its prior bootstrap metadata until a stable release. Existing root imports receive the combined bundle with Pre-release patches enabled. The shared Toolkit export/archive/prepare/validate/push/publish workflow runs in place, without copied global code. All text reads and writes use explicit UTF-8. Never overwrite existing release assets or tags. Source and payload checks must match exact prepared bytes. No device installation is part of publication.
