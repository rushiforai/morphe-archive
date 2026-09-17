package app.template.extension.settings;

import java.util.ArrayList;
import java.util.List;

/**
 * "Home tabs" — which of the home screen's four section tabs (Films, Reviews, Lists, Journal)
 * show, and in what order. The first one in the order is what the app opens on.
 *
 * <p>The home pager addresses its sections by position, and {@code PopularFragment$Tab.valueOf(int)}
 * is a plain ordinal lookup (Films 0, Reviews 1, Lists 2, News/"Journal" 3). So all this has to do
 * is: report a shorter {@link #count()} to the adapter and the tab strip, and translate a visible
 * slot index back to the real ordinal via {@link #realOrdinal(int)}. Everything fails open to the
 * stock four-tab layout.
 */
public final class HomeTabs {

    /** UI order matches the tab strip; "journal" is the app's {@code News} section (ordinal 3). */
    static final String[] KEYS = { "films", "reviews", "lists", "journal" };
    static final String[] LABELS = { "Films", "Reviews", "Lists", "Journal" };

    static final String DEFAULT = "films,reviews,lists,journal";

    private HomeTabs() {}

    static List<String> order() {
        List<String> out = new ArrayList<>();
        for (String raw : Prefs.getString(Prefs.KEY_HOME_TABS, DEFAULT).split(",")) {
            String k = raw.trim();
            if (indexOfKey(k) >= 0 && !out.contains(k)) out.add(k);
        }
        if (out.isEmpty()) {
            for (String k : KEYS) out.add(k);
        }
        return out;
    }

    static void setOrder(List<String> keys) {
        StringBuilder sb = new StringBuilder();
        for (String k : keys) {
            if (indexOfKey(k) < 0) continue;
            if (sb.length() > 0) sb.append(',');
            sb.append(k);
        }
        Prefs.putString(Prefs.KEY_HOME_TABS, sb.length() == 0 ? "films" : sb.toString());
    }

    // --- patch entry points --------------------------------------------

    public static int count() {
        try {
            int n = order().size();
            return n < 1 ? 1 : n;
        } catch (Throwable t) {
            return KEYS.length;
        }
    }

    public static int realOrdinal(int visibleIndex) {
        try {
            List<String> o = order();
            if (visibleIndex < 0 || visibleIndex >= o.size()) return 0;
            int ord = indexOfKey(o.get(visibleIndex));
            return ord < 0 ? 0 : ord;
        } catch (Throwable t) {
            return 0;
        }
    }

    // --- helpers -----------------------------------------------------

    private static int indexOfKey(String key) {
        for (int i = 0; i < KEYS.length; i++) {
            if (KEYS[i].equals(key)) return i;
        }
        return -1;
    }
}
