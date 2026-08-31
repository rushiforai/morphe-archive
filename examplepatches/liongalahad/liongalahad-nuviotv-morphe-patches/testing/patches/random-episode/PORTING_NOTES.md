# Random Episode porting notes

The behavior is derived from DeclanSC/NuvioTV branch `feat-random-episode` at commit `96b644f6daf66d2a4787e303d15b7501f7f3216a`. That branch last shared Nuvio history at `0.7.10-beta`, so its source changes cannot be copied into 0.8.11 directly.

The 0.8.11 binary port preserves the feature's visible behavior and its explicit no-progress/no-scrobble policy while adapting to the current navigation, tracking-provider coordinator, player startup and post-play implementations. It stores the toggle under `detail.random_episode_button` in Morphe-private preferences rather than Nuvio's profile-backed layout data store.

The runtime reuses Nuvio's native circular hero action and an existing packaged shuffle vector. A click selects a valid aired episode, then rewrites only the resulting Stream route. A process-local random-session token is consumed by the current player and by random Next Episode routing; the next unrelated Stream route clears it. Central progress persistence, resume loading, tracking identity construction and Trakt mapping warm-up are gated while that token is active.

Fingerprints use the detail composable's model/callback structure, the native hero-action signature, the Stream route schema, Video model calls, WatchProgress construction, TrackingMediaReference production and saved-progress diagnostic text. They do not depend on obfuscated class or method names. Every fingerprint must match exactly once on each 0.8.11 asset.

A later Nuvio release remains unsupported until the fingerprints and all application/runtime gates pass again.
