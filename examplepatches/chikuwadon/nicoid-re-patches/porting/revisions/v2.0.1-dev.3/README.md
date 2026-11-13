# v2.0.1-dev.3 — playback cleanup, visual consistency and side menu

Development-only source candidate based on v2.0.1-dev.2; published v2.0.0 remains unchanged.

- Stop orphaned media controls when NicoLive or a retained playback service is closed
- Ignore stale media-control intents from an earlier playback session rather than ending the new session
- Release MediaSession and cancel only the playback-owned notification ID
- Use a slightly thinner black outline on the central Play symbol, keeping size and positioning
- Give the uploader panel a subtle theme-aware background in both light and dark modes
- Keep weak view/background references so theme restoration does not retain detached Activities
- Change the NicoLive (β) sidebar subtitle to 「ニコニコ生放送の視聴」
- Preserve all v2.0.1-dev.1/dev.2 playlist and NicoLive fixes
- Build and verify Java/DEX, all existing retained regression checks, image/service lifecycle contracts and packaged MPP

Android hardware, notification-panel rendering and real-world stream quality require separate device testing.
