package app.southstar21.extension.instagram.tabs;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import app.southstar21.extension.instagram.InstagramHooks;
import app.southstar21.extension.instagram.navbuttons.HideNavigationButtonsPatch;

/**
 * Removes tabs from the bottom bar. Instagram builds the bar, and the pages you can swipe
 * between, from one list of IgTab enum constants (FEED, SEARCH, CLIPS, DIRECT, PROFILE, ...),
 * which the patches filter here. Home and Profile are never removed.
 */
@SuppressWarnings("unused")
public final class TabsHook {
    private static final String HOME = "FEED";

    private TabsHook() {
    }

    private static boolean isHidden(Object tab) {
        if (!(tab instanceof Enum)) return false;
        String name = ((Enum<?>) tab).name();
        if (HOME.equals(name) || "PROFILE".equals(name)) return false;
        return HideNavigationButtonsPatch.hides(name);
    }

    /** Called with the tab list Instagram is about to use. */
    public static List<?> filterTabs(List<?> tabs) {
        try {
            if (tabs == null) return null;
            List<Object> kept = new ArrayList<>(tabs.size());
            for (Object tab : tabs) {
                if (!isHidden(tab)) kept.add(tab);
            }
            // Never leave Instagram without tabs.
            return kept.isEmpty() ? tabs : kept;
        } catch (Throwable t) {
            Log.e(InstagramHooks.TAG, "Failed to filter tabs", t);
            return tabs;
        }
    }

    /** Called with the tab Instagram opens at launch. Swaps a hidden tab for Home. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object startTab(Object tab) {
        try {
            if (isHidden(tab)) return Enum.valueOf((Class) ((Enum<?>) tab).getDeclaringClass(), HOME);
        } catch (Throwable t) {
            Log.e(InstagramHooks.TAG, "Failed to change start tab", t);
        }
        return tab;
    }
}
