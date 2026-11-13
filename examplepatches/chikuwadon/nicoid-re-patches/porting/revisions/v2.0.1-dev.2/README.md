# nicoid Re v2.0.1-dev.2 — NicoLive usability and resilience

Development-only verification candidate based on v2.0.1-dev.1. Published v2.0.0 remains unchanged.

- Show the configured gesture trace in NicoLive lists without disrupting native scrolling, long press, or axis rules
- Fetch user-broadcast history thumbnails from trusted watch metadata with the active account cookie, guarded image-host validation and bounded retry suppression
- Offer a long-press playback chooser for live programs while preserving history deletion and timeshift actions
- Use short comment-post success/error Toasts; replace stale feedback to prevent a backlog
- Avoid unnecessarily long image-network waits without changing live-feed timeouts or player retry policy
- Run source contracts, JUnit thumbnail fixtures, Java/DEX compilation, MPP integrity and retained regressions in CI

No official release or tag is authorized; physical-device and external network integration tests remain separately required
