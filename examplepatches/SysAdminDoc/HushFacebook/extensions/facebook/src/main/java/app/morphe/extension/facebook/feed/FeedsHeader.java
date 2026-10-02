/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.view.View;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The Feeds tab without its header (issue #34): the title row, with the menu and search, and the
 * filters under it, All, Favorites, Friends and the rest. Both belong to Facebook's
 * FeedFiltersFragment. The tab builds a title row only when that fragment says it wants one, and
 * {@link #navBar} answers no to that while the switch is on. The filters go in a container that a
 * controller fills and shows once they've loaded. While the switch is on, {@link #hidesFilters}
 * has the patch hand that controller a copy of the container that's never on screen, so
 * Facebook's own stays hidden, the way it starts. Facebook would still move the posts down by the
 * filters' height once they show, and {@link #roomForFilters} tells it they don't, so the posts
 * start at the top.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, Facebook's answers
 * stand. The title row and the filters are settled as the Feeds tab is built, so a change shows
 * after a restart. Facebook asks about the posts' room again each time the filters load, long
 * after that, so that answer follows what was done with the filters of the last Feeds tab built
 * rather than the switch as it is then. A switch flipped while the tab is open can't leave a gap
 * where hidden filters would go, or slide the posts under filters that show.
 */
public final class FeedsHeader {
    /** Counted under the patch's name each time the Feeds tab's wish for a title row is answered no. */
    static final String NO_TITLE_ROW = "Feeds title row left out";

    /** Counted under the patch's name each time the Feeds tab's filters go to the copy. */
    static final String NO_FILTERS = "Feeds filters left out";

    /** Counted under the patch's name each time the Feeds tab's posts keep their place at the top. */
    static final String NO_ROOM = "room for the Feeds filters left out";

    /** The members the report names once the Feeds tab has asked. */
    static final String TITLE_ROW = "title row";
    static final String FILTERS = "filters";
    static final String ROOM = "room for the filters";

    private static final String FAMILY = FamilyNames.FEEDS_HEADER;

    private static volatile boolean logged;

    /** Whether the last Feeds tab built had its filters go to the copy, which the posts' room follows. */
    private static volatile boolean filtersLeftOut;

    private FeedsHeader() {
    }

    /**
     * The hook, on each answer the Feeds fragment gives to whether its tab gets a title row.
     * Answers false while the switch is on, and Facebook's answer otherwise.
     */
    public static boolean navBar(boolean wanted) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, TITLE_ROW);
            if (!wanted || !hides()) return wanted;
            HookStatus.counted(FAMILY, NO_TITLE_ROW);
            log();
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, TITLE_ROW, failure);
            return wanted;
        }
    }

    /**
     * The hook, right before the Feeds fragment builds the controller of its filters, handed the
     * container on screen. True while the switch is on and there's a container to copy, and the
     * patch then hands the controller a new one built the same way. The answer is kept for
     * {@link #roomForFilters}.
     */
    public static boolean hidesFilters(View container) {
        filtersLeftOut = false;
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, FILTERS);
            if (container == null || !hides()) return false;
            HookStatus.counted(FAMILY, NO_FILTERS);
            log();
            filtersLeftOut = true;
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, FILTERS, failure);
            return false;
        }
    }

    /**
     * The hook, where Facebook decides how far down the Feeds tab's posts go: as far as the filters
     * are tall when it says they show, and to the top when they don't. Answers that they don't when
     * the last Feeds tab built had its filters go to the copy, and Facebook's answer otherwise.
     */
    public static boolean roomForFilters(boolean shown) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, ROOM);
            if (!shown || !filtersLeftOut) return shown;
            HookStatus.counted(FAMILY, NO_ROOM);
            log();
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, ROOM, failure);
            return shown;
        }
    }

    private static boolean hides() {
        return Utils.settingsReady() && Settings.HIDE_FEEDS_HEADER.get();
    }

    private static void log() {
        if (logged) return;
        logged = true;
        Logger.printDebug(() -> "Feeds header: the Feeds tab opens without its title row and filters");
    }
}
