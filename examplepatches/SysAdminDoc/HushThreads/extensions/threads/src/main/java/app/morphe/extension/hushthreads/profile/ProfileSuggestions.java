/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * The Suggested for you accounts Threads draws on a profile, yours and other people's.
 *
 * <p>Threads has two of them, both drawn by its suggested accounts row. The profile screen draws
 * a carousel from a list the profile's state holds, and only when that list is there: the patch
 * hands the list to {@link #carousel} where the screen reads it, so with the switch on the screen
 * finds no list and takes the path it already has for a profile without one. The rows above a
 * profile's tabs can carry a suggestions row too, which the profile's view model adds to the row
 * list only once its suggestions are ready. The patch asks {@link #showRow} first thing on that
 * path, and with the switch on the view model goes the way it goes when they aren't ready, so the
 * row never joins the list.
 *
 * <p>Both answers belong to the Hide suggested users switch, the one that takes suggestion cards
 * out of the feed. Nothing else on a profile changes, and the suggestions in Search, Activity and
 * the feed's own follow bundles are left as they are. Off, paused, before the settings are ready,
 * or a failure in here, and Threads' own answer goes back unchanged. A profile already on screen
 * keeps what it drew until Threads draws it again.
 */
public final class ProfileSuggestions {
    static final String HIDDEN_CAROUSEL = "hid a profile's suggested accounts carousel";
    static final String HIDDEN_ROW = "kept the suggested accounts row out of a profile";
    /** Counted when the profile screen had no carousel to draw, so there was nothing to hide. */
    static final String NO_CAROUSEL = "Threads had no profile carousel to draw";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left profile suggestions to Threads: ";
    /** The outcome last logged. Threads asks each time a profile redraws, so a log line marks a change. */
    private static volatile String lastLogged;

    private ProfileSuggestions() { }

    /**
     * Where the profile screen reads the list its Suggested for you carousel is drawn from. Answers
     * null while the switch is on, so the screen draws no carousel, and the list otherwise. Never
     * throws.
     */
    public static Object carousel(Object users) {
        try {
            HookStatus.invoked(FamilyNames.HIDE_SUGGESTED_USERS);
            if (users == null) {
                HookStatus.counted(FamilyNames.HIDE_SUGGESTED_USERS, NO_CAROUSEL);
                return null;
            }
            return decide(HIDDEN_CAROUSEL) ? users : null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SUGGESTED_USERS, "profile carousel", failure);
            return users;
        }
    }

    /**
     * First thing on the path where the profile's view model adds its suggested accounts row.
     * Answers false while the switch is on, so the row stays out, and true otherwise. Never throws.
     */
    public static boolean showRow() {
        try {
            HookStatus.invoked(FamilyNames.HIDE_SUGGESTED_USERS);
            return decide(HIDDEN_ROW);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SUGGESTED_USERS, "profile row", failure);
            return true;
        }
    }

    /** Counts the outcome and answers whether Threads keeps what it was about to draw. */
    private static boolean decide(String hidden) {
        String off = offBecause();
        HookStatus.counted(FamilyNames.HIDE_SUGGESTED_USERS, off == null ? hidden : LEFT_TO_THREADS + off);
        String outcome = off == null ? "profiles show no suggested accounts" : "Threads shows its profile suggestions, " + off;
        if (!outcome.equals(lastLogged)) {
            lastLogged = outcome;
            Logger.printDebug(() -> "Profile suggestions: " + outcome);
        }
        return off != null;
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.HIDE_SUGGESTED_USERS.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
