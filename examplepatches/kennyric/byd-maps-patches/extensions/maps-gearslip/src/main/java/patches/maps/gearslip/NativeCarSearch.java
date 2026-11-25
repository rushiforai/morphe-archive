package patches.maps.gearslip;

import android.view.View;

/** Selects native local Search only for our authenticated CAL window. */
public final class NativeCarSearch {
    private NativeCarSearch() {}

    public static int target(View root) {
        Object owner = root == null ? null : NativeCarScopes.contextOwner(root.getContext());
        if (owner == null) return 0; // Original native host path, including unowned phone UI.
        // CAL already owns the primary window. Its compact surface cannot
        // expand through the private host's overlay-close/redirect handshake.
        // Reuse the original local editor branch rather than requeue its URI.
        return owner == LocalCarUiSession.owner() ? 1 : 2;
    }
}
