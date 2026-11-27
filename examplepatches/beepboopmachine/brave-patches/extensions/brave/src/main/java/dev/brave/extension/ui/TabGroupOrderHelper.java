package dev.brave.extension.ui;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.chromium.chrome.browser.tab.Tab;

public final class TabGroupOrderHelper {
    private TabGroupOrderHelper() {}

    /**
     * Selects the previous non-closing tab in a tab group when closing a tab.
     * Falls back to the next non-closing tab if closing the first tab in the group.
     */
    public static Tab selectPreviousTabInGroup(Iterable<Tab> groupTabs, int closingIndex, List<Tab> closingTabs) {
        if (groupTabs == null) return null;
        Set<Tab> excluded = closingTabs != null ? new HashSet<>(closingTabs) : null;

        Tab prevTab = null;
        Tab nextTab = null;
        int idx = 0;
        for (Tab t : groupTabs) {
            if (t != null && !t.isClosing() && (excluded == null || !excluded.contains(t))) {
                if (idx < closingIndex) {
                    prevTab = t;
                } else if (idx > closingIndex && nextTab == null) {
                    nextTab = t;
                }
            }
            idx++;
        }
        return prevTab != null ? prevTab : nextTab;
    }
}
