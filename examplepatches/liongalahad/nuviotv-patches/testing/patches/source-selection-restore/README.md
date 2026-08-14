# Restore Source Selection

Patch ID: `source-selection-restore`.

This optional patch adds **Settings > Morphe > Playback > Restore source selection**. It defaults off. When enabled, leaving Nuvio's internal player returns the source picker to the source that launched playback instead of focusing the first source.

## Behavior and storage

- The clicked source index remains owned by Nuvio's `rememberSaveable` state for the current source-picker back-stack entry.
- The patch arms one restoration only when Nuvio invokes its manual internal-player navigation callback, confirms player entry when the player composable is reached, and makes it consumable only when the player's normal or error Back callback runs.
- Source-screen recompositions during forward navigation cannot consume the armed request. On the actual Back transition, the patch queues the selected index into Nuvio's `LazyListState` after Nuvio's unconditional top reset, then leaves focus and bounds handling to Nuvio's existing restore requester and completion callback.
- The request remains active through return recompositions and is cleared by Nuvio's restore-completion callback. A different movie or episode cannot inherit it.
- The only persistent value is the Boolean `playback.restore_source_selection` in private `morphe_patches` preferences. Sources, URLs, headers and content identifiers are never persisted.
- Nuvio's existing external-player restoration remains authoritative.

The patch does not change source loading, ordering, filtering, resolution, autoplay, playback, or provider behavior.
