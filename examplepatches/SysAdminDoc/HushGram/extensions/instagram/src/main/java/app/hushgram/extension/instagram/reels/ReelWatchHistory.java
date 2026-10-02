/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Don't send reel watch history" patch.
 *
 * <p>Instagram keeps the reels you watch in a pending batch and posts it to
 * {@code clips/write_seen_state/}: each reel's id as you reach it, and how far into it you got. It
 * ranks your Reels with that, and nobody else sees it. The patch asks here first thing in both of
 * the batch's record methods, so with the switch on nothing goes into the batch, and a flush finds
 * it empty.
 */
public final class ReelWatchHistory {
    /** The diagnostic counter route: each reel Instagram went to record, and the ones left out. */
    static final String ROUTE = "Reel watch history";

    /** What a record left out is counted under. */
    static final String LEFT_OUT = "watched reels";

    private ReelWatchHistory() {
    }

    /**
     * Asked first thing where Instagram records a reel as watched, or how far into it you got. True
     * makes the record return before anything goes into the batch. False while the switch is off,
     * HushGram is paused or the settings aren't ready. Never throws.
     */
    public static boolean holdBack() {
        try {
            HookStatus.invoked(FamilyNames.REEL_WATCH_HISTORY);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.DONT_SEND_REEL_WATCH_HISTORY.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, LEFT_OUT);
            Logger.printDebug(() -> "Reel watch history: left a watched reel out of the batch");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REEL_WATCH_HISTORY, "reel watch history record", failure);
            return false;
        }
    }
}
