/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.comments;

import java.util.Collections;
import java.util.List;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * The suggested threads Threads adds under an opened post's replies.
 *
 * <p>Threads shows related threads as cards under an opened post's replies, below a "More threads
 * for you" header. They come two ways: on a page of replies, and (from 455 on) from a query of
 * their own that Threads runs beside the replies. The patch hands both lists to
 * {@link #relatedThreads} as Threads reads them, and with the switch on the answer is empty, so
 * Threads keeps no cards and draws neither the header nor the cards. The post, its replies and
 * their paging are left as they are.
 *
 * <p>It's the third switch of Hide suggested users, next to the feed and profile switch and the one
 * for Search, and each works without the others. Off, paused, before the settings are ready, or a
 * failure in here, and Threads keeps its list. A post already open keeps what it drew until Threads
 * loads its replies again.
 */
public final class SuggestedThreads {
    static final String HIDDEN = "kept suggested threads out of an opened post";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left an opened post's suggested threads to Threads: ";
    /** The outcome last logged. Threads asks for each page of replies, so a log line marks a change. */
    private static volatile String lastLogged;

    private SuggestedThreads() { }

    /**
     * The related threads Threads read off a page of an opened post's replies. Answers an empty list
     * while the switch is on and the page has any, and {@code threads} otherwise. Never throws.
     */
    public static List<?> relatedThreads(List<?> threads) {
        try {
            HookStatus.invoked(FamilyNames.HIDE_SUGGESTED_USERS);
            if (threads == null || threads.isEmpty()) return threads;
            String off = offBecause();
            HookStatus.counted(FamilyNames.HIDE_SUGGESTED_USERS, off == null ? HIDDEN : LEFT_TO_THREADS + off);
            String outcome = off == null ? "an opened post shows no suggested threads" : "Threads shows an opened post's suggested threads, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Suggested threads: " + outcome);
            }
            return off == null ? Collections.emptyList() : threads;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_SUGGESTED_USERS, "suggested threads", failure);
            return threads;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.HIDE_SUGGESTED_THREADS.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
