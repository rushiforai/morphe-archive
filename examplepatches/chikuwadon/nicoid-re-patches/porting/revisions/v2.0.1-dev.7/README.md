# v2.0.1-dev.7 — final quality audit fixes

Development-only candidate. The approved v2.0.0 release remains unchanged.

- Cancel stale deferred tab scroll restoration when a tab is reset to the first row
- Restore a reused list to its saved top position in a single movement
- Bound stalled NicoLive comment-stream frame reads to prevent CPU spinning
- Keep diagnostic events that arrive during an earlier log-file write
- Reuse precompiled URL and credential redaction patterns to reduce log processing overhead
- Retain eight-tab caching, normal list rendering, NicoLive functionality, notification cleanup, and theme changes from prior development versions
- Verify real staged Java through JVM Android doubles, a filesystem write race and a stalled-stream test
- Keep all existing CI and regression checks, DEX assembly, and MPP integrity verification

Real device UI, process lifecycle and network conditions remain separate validation tasks. No stable release is authorized.
