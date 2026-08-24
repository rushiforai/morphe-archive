# Library Mode Focus Fix porting notes

The NuvioTV 0.8.7-beta selector row conditionally applies one shared `FocusRequester` by loop index, so it cannot represent every mode. The patch leaves that native behavior intact and adds one stable requester to every mode button. It patches both official filter paths: Saved's list/type row and Cloud's provider/type row. Each top control receives an explicit Up destination plus an event-time fallback that reads the active requester when Up is pressed; the fallback is required because Cloud's lazy filter item may survive a mode change without recomposition.

For a future upstream Nuvio fix, the equivalent source-level change should remember one requester per mode and route every top filter's Up action to the selected mode's requester. No upstream pull request is part of this patch work.
