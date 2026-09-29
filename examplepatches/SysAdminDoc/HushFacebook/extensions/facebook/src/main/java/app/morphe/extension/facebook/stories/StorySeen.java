/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the View stories anonymously patch asks before Facebook reports the stories you've viewed.
 *
 * <p>The story viewer queues each story card you view and sends the queue as one GraphQL mutation,
 * DirectSeenMutation, which is what puts you on a story's viewer list. The patch asks
 * {@link #holdBack} first thing in the method that builds and sends it, and nothing is built or
 * sent when the answer is yes. Facebook has already counted those cards as reported in a set it
 * keeps in memory, so they aren't queued again until it restarts. The switch is read at each send,
 * so turning it off lets the next batch through.
 *
 * <p>It fails open, like the other hooks: the switch off, a pause, settings that aren't ready yet,
 * or a failure in here send the views as Facebook would.
 */
public final class StorySeen {
    /** The diagnostic counter route: each batch of views Facebook went to send, and the ones held back. */
    static final String ROUTE = "Story views";

    /** What a batch held back is counted under. */
    static final String HELD_BACK = "viewed stories";

    private StorySeen() {
    }

    /** Injection point, first thing in the seen sender. True keeps the batch of views on the phone. Never throws. */
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
