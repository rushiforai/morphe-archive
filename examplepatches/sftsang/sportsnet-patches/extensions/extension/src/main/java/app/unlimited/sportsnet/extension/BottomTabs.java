package app.unlimited.sportsnet.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Shows the bottom navigation tabs the patch was given, in that order. Tabs are named after their
 * classes (HomeTab is "home"); tabs the app does not have are skipped, and tabs left out are hidden
 * from the bar but still open from links. The app opens on the start tab, or else the first tab.
 */
@SuppressWarnings("unused")
public final class BottomTabs {
    private static final String TAB_PACKAGE = "com.rogers.sportsnet.ui.navigation.";

    private BottomTabs() {
    }

    /** Replaced by the patch with the chosen tabs, such as "watch,scores,home,more". */
    private static String tabs() {
        return "";
    }

    /** Replaced by the patch with the tab the app opens on, such as "watch"; empty for the first tab. */
    private static String startTabName() {
        return "";
    }

    private static List<String> names() {
        List<String> names = new ArrayList<>();
        for (String name : tabs().split(",")) {
            String trimmed = name.trim().toLowerCase(Locale.ROOT);
            if (!trimmed.isEmpty() && !names.contains(trimmed)) names.add(trimmed);
        }
        return names;
    }

    private static String nameOf(Object tab) {
        String name = tab.getClass().getSimpleName().toLowerCase(Locale.ROOT);
        return name.endsWith("tab") ? name.substring(0, name.length() - 3) : name;
    }

    /** The bar's tabs, filtered and ordered. Called with the app's list of tabs. */
    public static List<?> visibleTabs(List<?> appTabs) {
        List<Object> result = new ArrayList<>();
        for (String name : names()) {
            for (Object tab : appTabs) {
                if (nameOf(tab).equals(name)) result.add(tab);
            }
        }
        return result.isEmpty() ? appTabs : result;
    }

    /** The tab the app opens on: the start tab, else the first chosen tab. Called with the app's start tab. */
    public static Object startTab(Object appStartTab) {
        List<String> candidates = new ArrayList<>();
        String start = startTabName().trim().toLowerCase(Locale.ROOT);
        if (!start.isEmpty()) candidates.add(start);
        candidates.addAll(names());
        for (String name : candidates) {
            String className = TAB_PACKAGE + Character.toUpperCase(name.charAt(0)) + name.substring(1) + "Tab";
            try {
                return Class.forName(className).getField("INSTANCE").get(null);
            } catch (Exception ignored) {
                // Not a tab of this app version; try the next one.
            }
        }
        return appStartTab;
    }
}
