# v1.9.10-dev.5 verification revision

The recording shows direct mini playback running, then a newly loading normal screen that remains black. The exported log records another HLS session and Playback transfer timed out while the original Service session continues playing. Fixing seek restoration alone cannot make this route seamless.

Direct entry now initializes the normal playback component once in retained mini presentation. DirectBootstrap238 hides that Activity before native UI creation and first draw, then begins MiniSession225 before the prepared callback. The browsing Activity is reordered to the front after creation; the normal playback window is revealed only on expansion. This avoids a visible normal-playback screen on initial entry. Prepared playback uses the original normal Fragment and View; subsequent expansion reorders that same Activity and reparents that same player View. There is no Service-to-normal transfer, URI reset, seek, decoder replacement or replay command on expansion. Native Home/app-switch Service policy remains available through the existing retained-session path.

The first source resume is distinguished from an explicit expansion. Initial metadata updates refresh the shared mini chrome. Navigation tasks/timeouts are cancelled on close. SurfaceKeeper now waits for destination attachment/texture availability before returning the renderer listener and binding output, instead of releasing the retained texture while its destination window is still unattached. Existing popup geometry/controls, diagnostic metadata, version display, tab sources and resource ZIP remain unchanged except the dev version.

Validation: 82 Robolectric tests passed on SDK 28/34 with the candidate DEX runtime helpers. New cases assert initial window hiding and token isolation; exact player identity, position and paused state through mini/normal restoration with zero URI/seek/start/pause commands; cancellation of pending navigation; identifier validation; and output retention until the destination texture becomes available. 49,531 invocation argument-word checks and 11,869 defined-target dispatch checks passed. All 800 PNG contracts/28 icon families retained. Extension/input/translation payloads and accepted tab code are unchanged. PlaybackRulesTest (139 checks), RankingRules190Test and ContentHistoryRulesTest passed.

Physical-device first-entry window visibility, native ExoMedia/SurfaceTexture continuity, audio-focus handling and subjective animation behavior remain unverified. No official release or main-branch update.

Rebuild: stage helpers/native/executor/resources from dev.4, convert its helpers DEX to helpers.jar, overlay native-overrides, retain helpers-overrides, run build.py, regenerate runtime-helpers.jar and run verify.py with Robolectric 4.13 SDK 28/34 dependencies.

MPP SHA256: 1fd7766dd855377d6550b26f3a595e02249c6904d38ea2bc0878112c4bbd3745
