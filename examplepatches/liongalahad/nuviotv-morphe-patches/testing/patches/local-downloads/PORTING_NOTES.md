# Porting notes

Target: NuvioTV `0.8.7-beta`. The older phase-two prompt described a single `0.8.2` patch dependent on Local Media; the current requirement supersedes that architecture.

The detail-hero and Continue Watching fingerprints wrap the native composable content before NuvioDialog receives it. NuvioTV 0.8.7 moved episode options to a native action list, so that fingerprint appends patch actions immediately before the list is finalized while retaining Nuvio's native action renderer.

The stream-route hook captures exact content/video/season/episode identity and may replace a normal route with a completed local player route. The StreamScreen hook wraps both resolved callbacks so the normal source picker and debrid resolution remain Nuvio-owned while a pending download consumes the final direct source.

The Media3 source-factory hook adds only subtitle URIs recorded in this patch's completed-entry index. The full-screen listener is used only to suppress hidden completion UI during active playback.

`SubtitleWorkerFingerprint` identifies Nuvio's subtitle-fetch coroutine structurally from its repository log strings, `Function2` contract and ten-parameter constructor. The StreamScreen hook passes that exact resolved class to the extension so repository discovery never depends on architecture-specific obfuscated class names. The legacy names remain fallback-only for older already-supported layouts.

The shared path contribution is generic settings infrastructure registered by either Local Downloads or Local Media. It has one neutral preference key, one manifest contribution and no dependency on either optional runtime. Consumers declare only whether an enabled feature requires write access: Local Downloads registers that capability inside its own compartment, while Local Media remains read-only capable. The generic picker requires a persisted SAF write grant or a successful raw-path create/delete probe whenever any enabled consumer requires writes. Local Media alone owns migration from its older patch-specific path key.

Download initiation revalidates the saved location instead of treating a stored URI as proof of access. This is required for permission revocation, removable media remounted read-only, deleted folders, and Android 10 devices where read permission does not imply raw-path write permission. The foreground service repeats the write probe to close the remount/revocation race between source selection and file creation.

Porting to another Nuvio version requires re-verifying all twelve structural fingerprints, including the subtitle worker constructor shape, the `StreamPlaybackInfo` property fallback order, Nuvio's TV Button/Text reflection boundaries, the Player route query, source-picker destination detection, and Android foreground-service declarations.

The episode badge is hosted inside Nuvio's existing Compose `Box`. Its runtime bridge must use the concrete `c0.u` BoxScope singleton, not the `c0.t` interface, and the background modifier is the static `w.n.g` helper. Both target contracts are checked from the patched APK's Smali so an obfuscation or Compose-layout change fails application verification instead of silently dropping the badge at runtime.

NuvioTV 0.8.7 renamed the Compose mutable-state factory and updater helpers. Local Downloads now resolves the factory and updater by their static parameter/return signatures and resolves the native slider icon as a zero-argument static icon factory. These lookups remain inside the Local Downloads compartment and do not introduce patch-specific names into shared settings infrastructure.
