# Maps controls through the standard Car App Library interface

The native renderer keeps the live map on the complete host Surface. The Maps adapter exposes its controls as standard `NavigationTemplate` actions and map actions, with standard `IOnClickListener` delegates to the existing Maps handlers. Android Auto and compatible hosts own the controls' placement, sizing and input targets, as they do for other template navigation apps.

The duplicate native buttons are hidden from the map image without resizing the canvas or reparenting native views. Native listeners and state remain available to the adapter. A standard `ListTemplate` holds actions exceeding the public action-strip limits. Search continues through the existing standard `SearchTemplate` and native editor bridge. Public visible/stable areas update native insets without replacing the drawing dimensions.

Callbacks retain the authenticated Session and native action owner. Another UID, an older Session, a replaced native view or inactive search context cannot invoke a retired action. Native state and icon changes invalidate the standard template. Closing the adapter restores only its own temporary visibility changes.

No host update, companion service, additional geometry protocol, floating-player measurement or client-side button-position planner is required. The abandoned geometry-based implementation is not part of this worktree.

The protocol tests decode the emitted bundles with the real Car App Library, validate its template constraints and invoke the typed action delegates. Native-action tests cover visibility, map touches, replacement, enablement and cleanup. Existing renderer/keyboard evidence remains valid; new affected checks run at the implementation batch checkpoint.
