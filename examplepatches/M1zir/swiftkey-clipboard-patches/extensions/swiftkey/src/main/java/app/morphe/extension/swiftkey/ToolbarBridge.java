package app.morphe.extension.swiftkey;

import android.view.View;

/** Rewritten by the patch after resolving the host's types. Never ships host stubs. */
public final class ToolbarBridge {
    private ToolbarBridge() {}
    public static Object transform(Object state, View toolbar) { return state; }
    public static void refresh(View toolbar) {}
    public static int itemId(Object item) { return -1; }
    public static String caption(Object item) { return ""; }
    public static int icon(Object item) { return 0; }
}
