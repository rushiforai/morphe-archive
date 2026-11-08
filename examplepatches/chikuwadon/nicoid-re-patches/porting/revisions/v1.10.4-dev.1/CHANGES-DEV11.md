# v1.10.2-dev.11 performance and lifecycle review

- Coalesce duplicate scroll-restoration callbacks per list; cancel when the list leaves the screen after attaching. Preserve initial loading and attachment waits; synchronize registry use on the main thread.
- Share unresolved thumbnail URL lookups by video ID, notify all waiting playlist adapters, and batch refreshes within a 48 ms window. Prefer stored image URLs.
- Remove settings-listener's strong Activity capture, use weak reference in posted summary updates, and skip destroyed screens.
- Synchronize the compiled DEX payloads in source ZIP and TAR with the distributed development MPP and verify their byte identity.
- Retain the v1.10.2-dev.10 native playlist menu, thumbnail visibility and hamburger fixes.
- Development only; no official release, Android runtime testing or measured device performance claim.
