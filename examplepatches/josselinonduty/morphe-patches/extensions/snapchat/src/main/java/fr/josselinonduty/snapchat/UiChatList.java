package fr.josselinonduty.snapchat;

import android.view.View;
import android.view.ViewGroup;

import java.util.regex.Pattern;

/** Chat feed helpers: hides the "My AI" and "Team Snapchat" rows. */
public final class UiChatList {
    private UiChatList() {}

    public static final int MY_AI = 1;
    public static final int TEAM_SNAPCHAT = 2;

    // Bits enabled by the patches present in the build (each patch calls enable() on every bind).
    private static volatile int enabled;

    // FriendsFeedView.toString() prints "feedDisplayName=<name>," (and the friend variant).
    private static final Pattern MY_AI_ROW =
        Pattern.compile("(?:feedDisplayName|friendDisplayName)=My AI[,)]");
    private static final Pattern TEAM_ROW =
        Pattern.compile("(?:feedDisplayName|friendDisplayName)=Team Snapchat[,)]");

    public static void enable(int mask) {
        enabled |= mask;
    }

    private static boolean isHidden(Object feedRow) {
        if (feedRow == null) return false;
        int mask = enabled;
        String text = feedRow.toString();
        return ((mask & MY_AI) != 0 && MY_AI_ROW.matcher(text).find())
            || ((mask & TEAM_SNAPCHAT) != 0 && TEAM_ROW.matcher(text).find());
    }

    private static Object field(Object owner, String name) {
        try {
            java.lang.reflect.Field f = owner.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(owner);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Called on every row bind with the row binder (m0w) and the row model (u0w).
     * Rows are recycled: always restore the non-hidden state.
     */
    public static void bind(Object binder, Object model) {
        if (binder == null || model == null) return;
        Object root = field(binder, "n0");
        if (root instanceof View) apply((View) root, field(model, "n0"));
    }

    static void apply(View itemRoot, Object feedRow) {
        if (itemRoot == null) return;
        boolean hide = isHidden(feedRow);
        ViewGroup.LayoutParams lp = itemRoot.getLayoutParams();
        if (lp != null) {
            int height = hide ? 0 : ViewGroup.LayoutParams.WRAP_CONTENT;
            if (lp.height != height) {
                lp.height = height;
                itemRoot.setLayoutParams(lp);
            }
        }
        itemRoot.setVisibility(hide ? View.GONE : View.VISIBLE);
    }
}
