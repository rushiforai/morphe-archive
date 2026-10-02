/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.explore;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide the Explore grid" patch.
 *
 * <p>The Search tab's grid comes from Instagram's topical Explore pages, read from the server (or
 * its copy of the last one) by one parser. The patch asks {@link #hide} as that parser finishes a
 * page, and while the switch is on it empties the page's sections and marks it the last, so the
 * grid stays empty and nothing more is fetched. The load more row state the Explore fragment hands
 * its grid adapter is noted when the adapter's built, and {@link #loadMoreRow} hides that row's
 * button on the empty grid. Search, recent searches and search results come from other requests and
 * stay.
 */
public final class ExploreGrid {
    /** The Explore fragments' load more row states. Their classes keep Object's identity equals. */
    private static final Map<Object, Boolean> EXPLORE_STATES = Collections.synchronizedMap(new WeakHashMap<>());

    private ExploreGrid() {
    }

    /**
     * Injected where Instagram finishes reading an Explore page, with the page's sections. Answers
     * true while Hide the Explore grid is on, and false otherwise, or when anything goes wrong.
     * Never throws, and never waits for the settings: before they're ready the page stays.
     */
    public static boolean hide(List<?> sections) {
        try {
            HookStatus.invoked(FamilyNames.EXPLORE_GRID);
            if (!Utils.settingsReady() || !Settings.HIDE_EXPLORE_GRID.get()) return false;
            int count = sections == null ? 0 : sections.size();
            Logger.printDebug(() -> "Explore: emptied a page of " + count + " sections");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXPLORE_GRID, "explore page", failure);
            return false;
        }
    }

    /**
     * Injected right after the Explore fragment builds its grid adapter, with the load more row
     * state it hands that adapter. The adapter's type also draws other grids, a location's page
     * among them, so the state is what marks Explore's row. Held weakly. Never throws.
     */
    public static void track(Object state) {
        try {
            if (state != null) EXPLORE_STATES.put(state, Boolean.TRUE);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXPLORE_GRID, "explore row", failure);
        }
    }

    /**
     * Injected where a load more button binds and asks whether to show itself, with the row's state
     * and Instagram's answer, non-zero for yes. Instagram shows the row, a "+" that fetches one more
     * page, on any empty grid, so for Explore's state this answers 0 while Hide the Explore grid is
     * on, and the button hides itself. Every other list gets Instagram's answer. Never throws.
     */
    public static int loadMoreRow(Object state, int show) {
        try {
            if (show == 0 || state == null || !EXPLORE_STATES.containsKey(state)) return show;
            HookStatus.invoked(FamilyNames.EXPLORE_GRID);
            if (!Utils.settingsReady() || !Settings.HIDE_EXPLORE_GRID.get()) return show;
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.EXPLORE_GRID, "load more row", failure);
            return show;
        }
    }
}
