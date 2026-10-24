/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.search;

import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Don't save search history (#196): what you search for stops going into your Facebook search
 * history.
 *
 * <p>Every search Facebook adds to your history from the app goes through one method of its recent
 * searches store, which sends it to Facebook as FB4ASearchTypeaheadAddRecentSearch. That method takes a boolean Facebook sets on some searches
 * so they aren't added: with it set, the method returns before the mutation is built and skips the
 * feature logging mutation it sends beside it. The patch hands that boolean to {@link #skipSave}
 * first thing in the method, and while the switch is on the answer is always set.
 *
 * <p>The same method also puts the search at the top of the search screen's Recent list for the
 * rest of the run, a map it keeps whatever that boolean says. The patch hands that one put to
 * {@link #keepRecent}, which leaves the list as it was while the switch is on.
 *
 * <p>A page or profile you open from a search goes into the same history as "You visited", and
 * that entry comes from somewhere else: Facebook builds it from the {@value #PROFILE_VISIT}
 * analytics event the profile sends as it opens (#221). Every analytics event is made by one
 * factory, and the patch asks {@link #keepVisitOut} first thing there; while the switch is on, that
 * one event comes back as Facebook's own "not logged" event, so it's never sent.
 *
 * <p>Searches already in your history stay there until you delete them.
 */
public final class SearchHistory {
    /** The member the report names once a search has been asked about. */
    static final String ADD_RECENT = "add recent search";

    /** The member the report names once the Recent list has been asked about. */
    static final String RECENT_LIST = "recent list";

    /** What the report counts each time a search is kept out of the history. */
    static final String KEPT_OUT = "Search kept out of your history";

    /** What the report counts each time a search is kept off the Recent list. */
    static final String KEPT_OFF_RECENT = "Search kept off Recent";

    /** The analytics event a profile sends as it opens, which Facebook turns into "You visited". */
    static final String PROFILE_VISIT = "profile_engagement";

    /** The member the report names once a profile visit event has been asked about. */
    static final String VISIT_EVENT = "profile visit event";

    /** What the report counts each time a profile visit is kept out of the history. */
    static final String KEPT_VISIT_OUT = "Profile visit kept out of your history";

    private static final String FAMILY = FamilyNames.SEARCH_HISTORY;

    private SearchHistory() {
    }

    /**
     * The hook, first thing where Facebook adds a search to your history, handed Facebook's own
     * "don't add this one" flag. True while Don't save search history is on; otherwise, and for a
     * throw, Facebook's own flag comes back.
     */
    public static boolean skipSave(boolean facebookSkips) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, ADD_RECENT);
            if (facebookSkips || !Utils.settingsReady() || !Settings.DONT_SAVE_SEARCH_HISTORY.get()) {
                return facebookSkips;
            }
            HookStatus.counted(FAMILY, KEPT_OUT);
            Logger.printDebug(() -> "Don't save search history: a search was kept out of your history");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, ADD_RECENT, failure);
            return facebookSkips;
        }
    }

    /**
     * The hook in place of Facebook's put of {@code list}, the Recent list with the new search at
     * its top, into {@code recent} under {@code filter}. While Don't save search history is on,
     * the list stays as it was; otherwise, and for a throw, Facebook's put runs.
     */
    public static void keepRecent(Map<Object, Object> recent, Object filter, Object list) {
        try {
            HookStatus.bound(FAMILY, RECENT_LIST);
            if (Utils.settingsReady() && Settings.DONT_SAVE_SEARCH_HISTORY.get()) {
                HookStatus.counted(FAMILY, KEPT_OFF_RECENT);
                Logger.printDebug(() -> "Don't save search history: a search was kept off Recent");
                return;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, RECENT_LIST, failure);
        }
        recent.put(filter, list);
    }

    /**
     * The hook, first thing where Facebook makes an analytics event, handed the event's name. True,
     * so the event isn't logged, only for {@link #PROFILE_VISIT} while Don't save search history is
     * on; every other event, and a throw, answers false. Every event the app logs comes through
     * here, so the name is checked before anything else.
     */
    public static boolean keepVisitOut(String event) {
        if (!PROFILE_VISIT.equals(event)) return false;
        try {
            HookStatus.bound(FAMILY, VISIT_EVENT);
            if (!Utils.settingsReady() || !Settings.DONT_SAVE_SEARCH_HISTORY.get()) return false;
            HookStatus.counted(FAMILY, KEPT_VISIT_OUT);
            Logger.printDebug(() -> "Don't save search history: a profile visit was kept out of your history");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, VISIT_EVENT, failure);
            return false;
        }
    }
}
