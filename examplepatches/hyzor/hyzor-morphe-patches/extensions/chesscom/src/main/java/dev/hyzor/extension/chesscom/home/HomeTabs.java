package dev.hyzor.extension.chesscom.home;

import android.content.SharedPreferences;
import android.text.TextUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import dev.hyzor.extension.chesscom.Features;

/**
 * The bottom bar: Home and More stay first and last, and the user picks and orders the tabs in
 * between (the app picks two of them by its own feature flags).
 */
public final class HomeTabs {
    /** Middle tab choices, by the app's own tab names, with the app's default ones first. */
    public static final String[] TABS = {"Puzzles", "Learn", "Watch", "Bots", "Train"};
    public static final String[] TAB_TITLES = {"Puzzles", "Learn", "Watch", "Bots", "Train"};
    public static final int MAX_MIDDLE_TABS = 4;

    private static final String ORDER = "tabs_order";
    private static final String SHOWN = "tabs_shown";

    private HomeTabs() {}

    private static boolean enabled() {
        return Features.customTabsPatched() && Features.isEnabled(Features.CUSTOM_TABS);
    }

    /** Called with the bar's tabs (the app's own list); returns the user's choice. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List tabs(List tabs) {
        if (tabs == null || tabs.isEmpty() || !enabled()) return tabs;
        SharedPreferences preferences = Features.preferences();
        if (preferences == null || !preferences.contains(SHOWN)) return tabs;
        try {
            Object[] all = tabs.get(0).getClass().getEnumConstants();
            if (all == null) return tabs;
            List result = new ArrayList();
            result.add(byName(all, "Play"));
            for (String name : shownTabs()) {
                Object tab = byName(all, name);
                if (tab != null) result.add(tab);
            }
            result.add(byName(all, "More"));
            if (result.contains(null)) return tabs;
            return result;
        } catch (Throwable throwable) {
            return tabs;
        }
    }

    /**
     * 4.10.23 builds [Play, Puzzles, middle tabs..., More] inside the bar composable; drop
     * Puzzles when the user turned it off in the settings.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List finalTabs(List tabs) {
        if (tabs == null || tabs.isEmpty() || !enabled()) return tabs;
        if (shownTabs().contains("Puzzles")) return tabs;
        try {
            List result = new ArrayList();
            for (Object tab : tabs) {
                if (tab instanceof Enum && ((Enum<?>) tab).name().equals("Puzzles")) continue;
                result.add(tab);
            }
            return result.isEmpty() ? tabs : result;
        } catch (Throwable throwable) {
            return tabs;
        }
    }

    /**
     * 4.10.23's bottom bar state stores only the middle tabs; the app adds Play and More itself.
     * Returns the user's choice, or the app's list when nothing was saved.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List middleTabs(List tabs) {
        if (tabs == null || tabs.isEmpty() || !enabled()) return tabs;
        SharedPreferences preferences = Features.preferences();
        if (preferences == null || !preferences.contains(SHOWN)) return tabs;
        try {
            Object[] all = tabs.get(0).getClass().getEnumConstants();
            if (all == null) return tabs;
            List result = new ArrayList();
            for (String name : shownTabs()) {
                // 4.10.23's bar adds Play and Puzzles itself, then More; adding them here
                // again showed a second Puzzles tab.
                if (name.equals("Play") || name.equals("Puzzles") || name.equals("More")) continue;
                Object tab = byName(all, name);
                if (tab != null) result.add(tab);
            }
            return result.isEmpty() ? tabs : result;
        } catch (Throwable throwable) {
            return tabs;
        }
    }

    /** Middle tabs in display order: the saved choice, or the app's defaults. */
    public static List<String> shownTabs() {
        SharedPreferences preferences = Features.preferences();
        String saved = preferences == null ? null : preferences.getString(SHOWN, null);
        List<String> shown = new ArrayList<>();
        if (saved == null) {
            shown.addAll(Arrays.asList("Puzzles", "Learn", "Watch"));
            return shown;
        }
        for (String name : saved.split(",")) {
            if (Arrays.asList(TABS).contains(name) && !shown.contains(name)) shown.add(name);
        }
        return shown;
    }

    /** Every middle tab in the order shown on the settings screen (shown ones first). */
    public static List<String> order() {
        List<String> order = new ArrayList<>(shownTabs());
        SharedPreferences preferences = Features.preferences();
        String saved = preferences == null ? null : preferences.getString(ORDER, null);
        if (saved != null) {
            for (String name : saved.split(",")) {
                if (Arrays.asList(TABS).contains(name) && !order.contains(name)) order.add(name);
            }
        }
        for (String name : TABS) if (!order.contains(name)) order.add(name);
        return order;
    }

    public static void save(List<String> order, List<String> shown) {
        SharedPreferences preferences = Features.preferences();
        if (preferences == null) return;
        preferences.edit()
            .putString(ORDER, TextUtils.join(",", order))
            .putString(SHOWN, TextUtils.join(",", shown))
            .apply();
    }

    private static Object byName(Object[] values, String name) {
        for (Object value : values) {
            if (value instanceof Enum && ((Enum<?>) value).name().equals(name)) return value;
        }
        return null;
    }
}
