/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "View stories anonymously" patch.
 *
 * <p>Instagram gathers the stories you've seen into a batch and posts it to {@code media/seen/},
 * which is what puts you on each story's viewer list. The patch asks {@link #holdBack} first thing
 * in the method that sends a batch, and nothing is built or sent when the answer is yes. Each
 * caller has already cleared its own copy, so a batch held back is gone, and turning the switch off
 * lets the next batch through.
 *
 * <p>It fails open, like the other hooks: the switch off, a pause, settings that aren't ready yet,
 * or a failure in here send the views as Instagram would.
 */
public final class StorySeen {
    /** The diagnostic counter route: each batch of views Instagram went to send, and the ones held back. */
    static final String ROUTE = "Story views";

    /** What a batch held back is counted under. */
    static final String HELD_BACK = "viewed stories";

    private StorySeen() {
    }

    /**
     * Asked first thing in the send. True makes it return before the request is built. False while
     * the switch is off, HushGram is paused or the settings aren't ready. Never throws.
     */
    public static boolean holdBack() {
        try {
            HookStatus.invoked(FamilyNames.STORY_SEEN);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.VIEW_STORIES_ANONYMOUSLY.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, HELD_BACK);
            Logger.printDebug(() -> "Story views: held back a batch of viewed stories");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_SEEN, "story seen send", failure);
            return false;
        }
    }
}
