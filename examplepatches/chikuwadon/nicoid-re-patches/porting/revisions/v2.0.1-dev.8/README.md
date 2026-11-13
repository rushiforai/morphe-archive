# v2.0.1-dev.8 — 12-tab in-memory cache

Development-only build based on the user-tested v2.0.1-dev.7.

- Increase the live tab LRU upper limit from 8 to 12 retained screens
- Keep the native constructor reflection argument count at 3; adjust the cache bound only inside the later eviction loop
- Continue to fetch current data when launching the app after process termination, rather than persisting live Fragment objects
- Preserve the existing view/scroll restoration, tab opening, playback, NicoLive, diagnostics and theme behavior
- Run the full previous regression suite, source-level arity checks, Java/DEX compilation and MPP verification
- Keep versioned verification artifacts

No v2.0.0 release assets or tags are modified. Android hardware and memory profiling require separate device validation.
