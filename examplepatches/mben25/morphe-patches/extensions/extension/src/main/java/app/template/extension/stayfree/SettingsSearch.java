package app.template.extension.stayfree;

import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Keeps removed screens out of StayFree's settings search.
 * <p>
 * The search walks a {@code ScreenTreeNode} tree (title, icon, target screen, children) that
 * mirrors the drawer and the settings menus. Removing a row from a screen does not remove its
 * node, so the search would still list it and navigate there. Patches call {@link #without}
 * from the node constructor to drop the child carrying a given title.
 */
@SuppressWarnings("unused")
public final class SettingsSearch {
    private static volatile Method getTitleResId;

    private SettingsSearch() {
    }

    /**
     * Returns {@code children} without the nodes titled {@code titleResId}. Null entries are kept
     * (the tree filters them itself); anything unexpected returns the list unchanged.
     */
    public static List<?> without(List<?> children, int titleResId) {
        if (children == null || children.isEmpty()) return children;
        try {
            List<Object> result = null;
            for (int i = 0; i < children.size(); i++) {
                Object child = children.get(i);
                if (child != null && titleOf(child) == titleResId) {
                    if (result == null) result = new ArrayList<>(children.subList(0, i));
                } else if (result != null) {
                    result.add(child);
                }
            }
            return result == null ? children : result;
        } catch (Throwable t) {
            Log.w(LocalBackup.TAG, "Settings search filter failed", t);
            return children;
        }
    }

    private static int titleOf(Object node) throws ReflectiveOperationException {
        Method method = getTitleResId;
        if (method == null || method.getDeclaringClass() != node.getClass()) {
            method = node.getClass().getMethod("getTitleResId");
            getTitleResId = method;
        }
        return (Integer) method.invoke(node);
    }
}
