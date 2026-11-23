package patches.maps.gearslip;

import android.content.Context;
import android.view.View;

/** Selects native local Search only for our authenticated CAL window. */
public final class NativeCarSearch {
    private NativeCarSearch() {}

    public static int target(View root) {
        return targetForContext(root == null ? null : root.getContext());
    }

    /**
     * The same decision from a plain Context: Maps' newer car search controller keeps no View,
     * only the window context it was built with.
     */
    public static int targetForContext(Context context) {
        Object owner = context == null ? null : NativeCarScopes.contextOwner(context);
        if (owner == null) return 0; // Original native host path, including unowned phone UI.
        // CAL already owns the primary window. Its compact surface cannot
        // expand through the private host's overlay-close/redirect handshake.
        // Reuse the original local editor branch rather than requeue its URI.
        return owner == LocalCarUiSession.owner() ? 1 : 2;
    }
}
