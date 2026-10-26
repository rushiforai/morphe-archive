/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.navigation;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.pixkk.extension.core.Settings;

/**
 * Discover tab instead of Friends. The bottom bar is built from a map of position to the tags of
 * the tabs that may take it. Wherever Friends is named, Discover, the compass, is named instead.
 */
public final class DiscoverTab {
    // The map names its tabs in lower case, as in {1=[friends, discover]}.
    private static final String FRIENDS = "friends";
    private static final String DISCOVER = "discover";

    private DiscoverTab() {
    }

    private static boolean containsFriends(List<String> tags) {
        return containsIgnoreCase(tags, FRIENDS);
    }

    private static boolean containsIgnoreCase(List<String> tags, String wanted) {
        for (String tag : tags) {
            if (wanted.equalsIgnoreCase(tag)) return true;
        }
        return false;
    }

    /** @return the bar's tags with Friends swapped for Discover, or {@code tabs} itself when off. */
    @SuppressWarnings("unchecked")
    public static Map<Integer, List<String>> swap(Map<Integer, List<String>> tabs) {
        if (tabs == null || !Settings.DISCOVER_TAB.get()) return tabs;
        Map<Integer, List<String>> swapped = new LinkedHashMap<>();
        for (Map.Entry<Integer, List<String>> entry : tabs.entrySet()) {
            List<String> tags = entry.getValue();
            if (tags == null || !containsFriends(tags)) {
                swapped.put(entry.getKey(), tags);
                continue;
            }
            List<String> copy = new ArrayList<>(tags.size());
            for (String tag : tags) {
                if (FRIENDS.equalsIgnoreCase(tag)) tag = DISCOVER;
                if (!containsIgnoreCase(copy, tag)) copy.add(tag);
            }
            swapped.put(entry.getKey(), copy);
        }
        return swapped;
    }
}
