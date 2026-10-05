package app.template.extension.settings;

import android.content.Context;
import android.view.View;

import java.util.List;

/**
 * "Launch tab" — which bottom-nav destination the app opens on.
 *
 * <p>Called from {@code MainActivity.setup} with the id the app resolved on its own (its
 * last-used tab). Returns the id to actually select:
 * <ul>
 *   <li>{@code last} (default): the app's own choice, unless that tab is now hidden — then the
 *       first visible item.</li>
 *   <li>a fixed pick: that tab if it is currently shown, else the first visible item.</li>
 * </ul>
 * Any surprise falls back to the id the app passed in.
 */
public final class LaunchTab {

    private LaunchTab() {}

    public static int menuId(View bottomNav, int lastUsedId) {
        try {
            Context ctx = bottomNav.getContext();
            Prefs.load(ctx);
            List<Integer> visible = NavItems.visibleMenuIds(ctx);
            int first = visible.isEmpty() ? lastUsedId : visible.get(0);

            String pref = Prefs.getString(Prefs.KEY_LAUNCH_TAB, "last");
            if ("last".equals(pref)) {
                return visible.contains(lastUsedId) ? lastUsedId : first;
            }
            int want = NavItems.menuId(ctx, pref);
            return (want != 0 && visible.contains(want)) ? want : first;
        } catch (Throwable t) {
            return lastUsedId;
        }
    }
}
