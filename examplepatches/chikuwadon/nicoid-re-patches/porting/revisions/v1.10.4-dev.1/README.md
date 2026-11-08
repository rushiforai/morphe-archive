# v1.10.4-dev.1 — local validation build

Based on the publicly released v1.10.3. No official version is published by this source branch.

- Tune the playback controls timeout to 2 seconds for normal and popup video interactions, using the existing ExoMedia control lifecycle.
- Incrementally hydrate newly obtained historical comments, coalescing updates at 1,000 new comments and a minimum 3-second interval; support a 500-comment/5-second fallback on slow connections.
- Preserve the initial fast comment display, final comment cache/reload path, video identity, cancellation and low-memory checks.
- Keep saved settings and the visual layout unchanged.

This revision is intended for local device verification. CI and static checks do not substitute for Android runtime testing.
