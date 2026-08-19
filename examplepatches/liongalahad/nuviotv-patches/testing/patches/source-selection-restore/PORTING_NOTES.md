# Restore Source Selection porting notes

## Nuvio 0.8.6-beta behavior

`StreamScreen` saves `focusedStreamIndex` and passes it to `StreamsList`. `StreamsList` already owns a restore focus requester, index clamping, saved lazy-list state and a one-shot completion callback. However, `restoreFocusedStream` is raised only by the activity `ON_RESUME` observer used for an external player. Navigating to Nuvio's internal player does not resume the activity, so returning through Navigation Compose leaves the native restore flag false. The newly created picker composition then requests the first stream.

## Patch strategy

`StreamScreenFingerprint` identifies the source-picker composable structurally by its view-model, three callback, composer and change-mask signature. Its manual internal-player callback is wrapped without changing the callback result or playback data.

`PlayerScreenFingerprint` identifies the fullscreen-player composable by its exact view-model, normal Back, error Back, playback-ended, composer and change-mask structure. It wraps both Back paths while preserving their arguments and results. Player entry confirms the selection; only a player exit makes it consumable. This prevents the source screen's forward-transition recompositions from consuming the marker before a real return.

`StreamsListFingerprint` identifies the native stream `LazyColumn` by the exact focused-index/restore-action parameter structure plus stable `Stream` accessors and index clamping. It keeps the Boolean restore parameter true through return recompositions, wraps the native completion action, and locates the matched method's `rememberLazyListState` result structurally. A main-thread viewport request runs after composition because Nuvio's `LaunchedEffect(selectedAddonFilter)` otherwise scrolls every newly composed list to item zero before focus restoration. The runtime resolves the target's unique non-suspending two-integer list-position method without naming its R8 symbol. Nuvio continues to own focus, bounds handling and completion.

No R8 class or method name is fingerprinted. All three fingerprints must match exactly once. A future version is unsupported until the same lifecycle gap, callback path, player entry/exit structure and native restore structure are reverified on every declared asset.

## Deliberate exclusions

- No source object, URL, addon name, header or content ID is retained by the extension.
- No global per-title history is created; the transient selected index is cleared by the native restore completion and is never written to disk.
- External-player, browser, failed-resolution, cancelled-consent and no-playback exits are not reimplemented.
