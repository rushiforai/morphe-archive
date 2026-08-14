# Porting notes

Target: NuvioTV `0.8.4-beta`. The older phase-two prompt described a single `0.8.2` patch dependent on Local Media; the current requirement supersedes that architecture.

The three options-dialog fingerprints cover the only 0.8.4-beta render sites for `Play manually`: detail hero, episode options and Continue Watching options. They wrap the native composable content before NuvioDialog receives it, retaining the native TV Button/Text implementation.

The stream-route hook captures exact content/video/season/episode identity and may replace a normal route with a completed local player route. The StreamScreen hook wraps both resolved callbacks so the normal source picker and debrid resolution remain Nuvio-owned while a pending download consumes the final direct source.

The Media3 source-factory hook adds only subtitle URIs recorded in this patch's completed-entry index. The full-screen listener is used only to suppress hidden completion UI during active playback.

`SubtitleWorkerFingerprint` identifies Nuvio's subtitle-fetch coroutine structurally from its repository log strings, `Function2` contract and ten-parameter constructor. The StreamScreen hook passes that exact resolved class to the extension so repository discovery never depends on architecture-specific obfuscated class names. The legacy names remain fallback-only for older already-supported layouts.

The shared path contribution is generic settings infrastructure registered by either Local Downloads or Local Media. It has one neutral preference key, one manifest contribution and no dependency on either optional runtime. Local Media alone owns migration from its older patch-specific path key.

Porting to another Nuvio version requires re-verifying all twelve structural fingerprints, including the subtitle worker constructor shape, the `StreamPlaybackInfo` property fallback order, Nuvio's TV Button/Text reflection boundaries, the Player route query, source-picker destination detection, and Android foreground-service declarations.
