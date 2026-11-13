# v2.0.1-dev.5 — responsive tabs and retained list cache

Development-only candidate based on user-verified v2.0.1-dev.3 and the subsequent dev.4 test build. The official v2.0.0 release is unchanged.

- Remove the full-screen/list overlay from tab scroll restoration. Always show the native list immediately
- Make at most one jump when the exact saved row is loaded; otherwise leave the ordinary list usable
- Never progressively scroll through partial pages to fetch more data
- Cancel deferred positioning when the user scrolls or the tab is hidden, with a bounded 1.1-second wait
- Prevent pending restoration from overwriting persisted saved scroll positions
- Retain up to eight recently used list fragments rather than three (LRU, not unlimited)
- Keep native Activity state-save/destruction cleanup for lifecycle safety
- Keep versioned artifact names, including nicoid-re-v2.0.1-dev.5-mpp.zip
- Preserve prior playback, NicoLive, gesture, and theme fixes

Device-specific Android lifecycle/scroll behavior still requires real-device verification.
