package app.sircoderin.extension.spotify;

import android.view.View;

/**
 * Access to Spotify's obfuscated RecyclerView / LinearLayoutManager from the extension.
 *
 * Both method bodies below are placeholders: RestoreHomeScrollPatch replaces them at patch time with calls to the real
 * (obfuscated) methods, found by bytecode shape. They are only reached after being patched.
 */
@SuppressWarnings("unused")
public final class HomeListBridge {
    private HomeListBridge() {}

    /** Patched to {@code LayoutManager.getPosition(child)}: the child's adapter position, or -1. */
    public static int childPosition(View child) {
        return -1;
    }

    /**
     * Patched to {@code ((LinearLayoutManager) ((RecyclerView) list).layoutManager).scrollToPositionWithOffset(...)}.
     * Returns false if the list does not use a LinearLayoutManager. {@code scratch} is an unused register for the
     * patched body (the compiler decides how many locals a stub gets, a parameter is guaranteed); pass 0.
     */
    public static boolean scrollToPositionWithOffset(View list, int position, int offset, int scratch) {
        return false;
    }
}
