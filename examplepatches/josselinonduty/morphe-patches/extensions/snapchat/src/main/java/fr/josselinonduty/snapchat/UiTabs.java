package fr.josselinonduty.snapchat;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** UI helpers for the tab bar. */
public final class UiTabs {
    private UiTabs() {}

    public static final int MAP = 1;
    public static final int STORIES = 2;
    public static final int SPOTLIGHT = 4;

    // Icon container view ids (14.33.1.0), read from the int field `b` of each tab spec.
    // Spotlight has two specs (one per feature-flag branch).
    private static final int ID_MAP = 0x7f0b1196;
    private static final int ID_STORIES = 0x7f0b1190;
    private static final int ID_SPOTLIGHT_A = 0x7f0b11a0;
    private static final int ID_SPOTLIGHT_B = 0x7f0b119e;

    private static int hidden;
    // The app's tab model getter returns a cached list; the bar controller relies on that
    // stability (a fresh list per call breaks the selected-tab icon). Cache per source list.
    private static List<?> source;
    private static int sourceMask;
    private static List<Object> cached;

    public static synchronized void hide(int mask) {
        hidden |= mask;
    }

    public static synchronized List<Object> filter(List<?> tabs) {
        if (cached != null && tabs == source && hidden == sourceMask) {
            return cached;
        }
        List<Object> kept = new ArrayList<>();
        for (Object tab : tabs) {
            if ((hidden & maskOf(tab)) == 0) {
                kept.add(tab);
            }
        }
        source = tabs;
        sourceMask = hidden;
        cached = Collections.unmodifiableList(kept);
        return cached;
    }

    private static int maskOf(Object tab) {
        try {
            Field f = tab.getClass().getDeclaredField("b");
            f.setAccessible(true);
            switch (f.getInt(tab)) {
                case ID_MAP: return MAP;
                case ID_STORIES: return STORIES;
                case ID_SPOTLIGHT_A:
                case ID_SPOTLIGHT_B: return SPOTLIGHT;
                default: return 0;
            }
        } catch (ReflectiveOperationException e) {
            return 0;
        }
    }
}
