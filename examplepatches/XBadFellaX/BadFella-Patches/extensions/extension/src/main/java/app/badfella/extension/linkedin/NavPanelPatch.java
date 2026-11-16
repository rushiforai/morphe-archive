package app.badfella.extension.linkedin;

import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/** Filters native Me panel sections without adding a second settings entry. */
@SuppressWarnings("unused")
public final class NavPanelPatch {
    public static AbstractList<Object> filterPanel(Object panel) {
        @SuppressWarnings("unchecked")
        AbstractList<Object> list = (AbstractList<Object>) panel;
        if (list == null || !Settings.hideGames()) return list;
        try {
            ArrayList<Object> result = new ArrayList<>(list);
            removeGames(result, Class.forName("com.linkedin.android.home.navpanel.SectionType"));
            return result;
        } catch (Throwable t) {
            Diagnostics.error("filterPanel failed", t);
            return list;
        }
    }

    /**
     * Removes the "Games" section (any panel item whose sectionType is GAMES), for "Hide games". Builds without
     * it are left as they are.
     */
    private static void removeGames(List<Object> items, Class<?> sectionType) {
        Object games;
        try {
            games = sectionType.getField("GAMES").get(null);
        } catch (ReflectiveOperationException e) {
            return;
        }
        for (int i = items.size() - 1; i >= 0; i--) {
            Object item = items.get(i);
            if (Reflect.get(item, "sectionType") == games) {
                items.remove(i);
                Settings.debugLog("hide games section");
            }
        }
    }

}
