# Library Mode Focus Fix

This setting-free patch corrects NuvioTV 0.8.3-beta's native Library focus path. When the user moves down from Saved or Cloud into the first filter and then moves back up, focus returns to the selected mode instead of jumping to another mode.

The patch is independent of Local Media. Its runtime, fingerprints, bytecode changes, tests, and documentation live only in the `library-mode-focus-fix` compartment.

## Implementation

- Each Library mode contributes its current focus target without changing Nuvio's existing requester.
- The Saved list/type filters and Cloud provider/type filters resolve the active mode's requester when Up is pressed, rather than retaining a requester captured by an earlier composition.
- No setting, manifest component, permission, resource, or persistent state is added.
