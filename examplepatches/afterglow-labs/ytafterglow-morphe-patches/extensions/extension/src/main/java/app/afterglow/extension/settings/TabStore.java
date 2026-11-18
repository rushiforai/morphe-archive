package app.afterglow.extension.settings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Active tab list and startup tab, ported from the iOS YTAGUserDefaults.m
 * (currentActiveTabs, setActiveTabs:, currentStartupTab, lines 65-185 and
 * 347-349). This class is the only reader and writer of {@link #ACTIVE_TABS_KEY}.
 *
 * <p>Storage: iOS keeps {@code activeTabs} as an ordered array of tab ids.
 * SharedPreferences has no ordered list type, so the same ids are stored as a JSON
 * array string, e.g. {@code ["FEwhat_to_watch","FEshorts"]}. Reads are lenient
 * (JSON array, comma-separated string or a string set); writes always use the
 * JSON form. {@code startupTab} is a plain tab id string, exactly as on iOS.
 */
public final class TabStore {
    public static final String ACTIVE_TABS_KEY = "activeTabs";
    public static final String STARTUP_TAB_KEY = "startupTab";
    public static final String TWO_ROW_TAB_BAR_KEY = "twoRowTabBar";
    public static final String CONTROL_CENTER_TAB_ID = "YTAGControlCenter";

    /** iOS kMinimumActiveTabsCount. */
    public static final int MINIMUM_ACTIVE_TABS = 2;
    /** iOS kSingleRowMaximumActiveTabsCount. */
    public static final int SINGLE_ROW_MAXIMUM_ACTIVE_TABS = 6;

    /** iOS YTAGAllowedTabs(), in order (the same order as Settings.x ytag_allTabIds). */
    public static final List<String> ALLOWED_TABS = Collections.unmodifiableList(Arrays.asList(
            "FEwhat_to_watch", "FEshorts", "FEsubscriptions", "FElibrary", "FEhype_leaderboard", "FEhistory",
            "VLWL", "FEpost_home", "FEconnections_inbox", "FEuploads", CONTROL_CENTER_TAB_ID));

    /** iOS +defaultActiveTabs. */
    public static final List<String> DEFAULT_ACTIVE_TABS = Collections.unmodifiableList(Arrays.asList(
            "FEwhat_to_watch", "FEshorts", "FEsubscriptions", "FElibrary", CONTROL_CENTER_TAB_ID));

    private TabStore() {}

    /** iOS YTAGCanonicalTabId: retired Explore/Trending ids become Hype. */
    public static String canonicalTabId(String tabId) {
        if ("FEexplore".equals(tabId) || "FEtrending".equals(tabId)) return "FEhype_leaderboard";
        return tabId;
    }

    /** iOS YTAGMaximumActiveTabsCount: every allowed tab with the bonus row, else 6. */
    public static int maximumActiveTabs() {
        return AfterglowPrefs.getBool(TWO_ROW_TAB_BAR_KEY) ? ALLOWED_TABS.size() : SINGLE_ROW_MAXIMUM_ACTIVE_TABS;
    }

    /**
     * iOS sanitizedActiveTabsFromValue: keep allowed ids in order, canonicalized and
     * deduplicated, stop at the maximum; fewer than two -> the default tabs.
     */
    public static List<String> sanitize(Collection<?> value) {
        if (value == null) return new ArrayList<>(DEFAULT_ACTIVE_TABS);
        List<String> tabs = new ArrayList<>();
        int maximum = maximumActiveTabs();
        for (Object item : value) {
            if (!(item instanceof String)) continue;
            String tabId = canonicalTabId((String) item);
            if (!ALLOWED_TABS.contains(tabId) || tabs.contains(tabId)) continue;
            tabs.add(tabId);
            if (tabs.size() >= maximum) break;
        }
        if (tabs.size() < MINIMUM_ACTIVE_TABS) return new ArrayList<>(DEFAULT_ACTIVE_TABS);
        return tabs;
    }

    /**
     * iOS currentActiveTabs: the stored list, sanitized. Like iOS it writes the
     * sanitized list back, but only when the stored value actually differs, so a
     * settings listener that re-reads cannot loop.
     */
    public static List<String> currentActiveTabs() {
        Object stored = AfterglowPrefs.snapshot().get(ACTIVE_TABS_KEY);
        List<String> decoded = decode(stored);
        List<String> sanitized = sanitize(decoded);
        if (stored != null && !encode(sanitized).equals(stored)) {
            AfterglowPrefs.setString(ACTIVE_TABS_KEY, encode(sanitized));
        }
        return sanitized;
    }

    /** iOS setActiveTabs: stores the sanitized list and repairs startupTab when it is no longer active. */
    public static void setActiveTabs(List<String> tabs) {
        List<String> sanitized = sanitize(tabs);
        String encoded = encode(sanitized);
        if (!encoded.equals(AfterglowPrefs.snapshot().get(ACTIVE_TABS_KEY))) {
            AfterglowPrefs.setString(ACTIVE_TABS_KEY, encoded);
        }
        String startup = AfterglowPrefs.getString(STARTUP_TAB_KEY);
        if (startup == null || !sanitized.contains(startup)) {
            AfterglowPrefs.setString(STARTUP_TAB_KEY, sanitized.get(0));
        }
    }

    /** iOS currentStartupTab: the stored tab when active, else the first active tab (written back). */
    public static String currentStartupTab() {
        List<String> active = currentActiveTabs();
        String startup = AfterglowPrefs.getString(STARTUP_TAB_KEY);
        if (startup == null || !active.contains(startup)) {
            startup = active.isEmpty() ? DEFAULT_ACTIVE_TABS.get(0) : active.get(0);
            AfterglowPrefs.setString(STARTUP_TAB_KEY, startup);
        }
        return startup;
    }

    /** The native (top-row) tabs the anchor pickers choose from: the first six or fewer active tabs. */
    public static List<String> nativeTabs() {
        List<String> active = currentActiveTabs();
        return new ArrayList<>(active.subList(0, Math.min(SINGLE_ROW_MAXIMUM_ACTIVE_TABS, active.size())));
    }

    /** The stored encoding of a tab list: a JSON array of strings, e.g. ["FEwhat_to_watch","FEshorts"]. */
    public static String encode(List<String> tabs) {
        StringBuilder out = new StringBuilder("[");
        for (int i = 0; i < tabs.size(); i++) {
            if (i > 0) out.append(',');
            out.append('"');
            for (char c : tabs.get(i).toCharArray()) {
                if (c == '"' || c == '\\') out.append('\\').append(c);
                else if (c < 0x20) out.append(String.format("\\u%04x", (int) c));
                else out.append(c);
            }
            out.append('"');
        }
        return out.append(']').toString();
    }

    /** Lenient decode of a stored tab list (JSON string array, comma list or string set); null when unusable. */
    public static List<String> decode(Object stored) {
        if (stored == null) return null;
        if (stored instanceof Collection) {
            List<String> tabs = new ArrayList<>();
            for (Object item : (Collection<?>) stored) if (item instanceof String) tabs.add((String) item);
            return tabs;
        }
        if (!(stored instanceof String)) return null;
        String text = ((String) stored).trim();
        if (text.startsWith("[")) return decodeJsonArray(text);
        List<String> tabs = new ArrayList<>();
        for (String part : text.split(",")) {
            if (!part.trim().isEmpty()) tabs.add(part.trim());
        }
        return tabs;
    }

    /** Parses a JSON array of strings; null when the text is not one. */
    private static List<String> decodeJsonArray(String text) {
        List<String> tabs = new ArrayList<>();
        int i = 1;
        int n = text.length();
        while (true) {
            while (i < n && Character.isWhitespace(text.charAt(i))) i++;
            if (i < n && text.charAt(i) == ']') return i == n - 1 ? tabs : null;
            if (i >= n || text.charAt(i) != '"') return null;
            StringBuilder value = new StringBuilder();
            i++;
            while (i < n && text.charAt(i) != '"') {
                char c = text.charAt(i);
                if (c == '\\') {
                    if (i + 1 >= n) return null;
                    char e = text.charAt(i + 1);
                    if (e == 'u') {
                        if (i + 6 > n) return null;
                        try {
                            value.append((char) Integer.parseInt(text.substring(i + 2, i + 6), 16));
                        } catch (NumberFormatException error) {
                            return null;
                        }
                        i += 6;
                        continue;
                    }
                    value.append(e == 'n' ? '\n' : e == 't' ? '\t' : e == 'r' ? '\r' : e == 'b' ? '\b' : e == 'f' ? '\f' : e);
                    i += 2;
                    continue;
                }
                value.append(c);
                i++;
            }
            if (i >= n) return null;
            tabs.add(value.toString());
            i++;
            while (i < n && Character.isWhitespace(text.charAt(i))) i++;
            if (i < n && text.charAt(i) == ',') {
                i++;
                continue;
            }
            if (i < n && text.charAt(i) == ']') return i == n - 1 ? tabs : null;
            return null;
        }
    }
}
