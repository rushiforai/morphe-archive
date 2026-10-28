/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import android.text.SpannableString;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * A post's text shows whole in the feed, with no "See more" to tap (issue #268). Facebook cuts a
 * story's message to a character and line budget as it builds the text, and hands back the cut
 * text with "See more" on the end, or nothing when the text fits. The builder then shows the cut
 * text when there is one and the whole text otherwise. With the switch on, the cut comes back as
 * nothing, so the builder takes its whole-text path.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the cut is Facebook's
 * own.
 */
public final class FullPostText {
    /** Counted under the patch's name each time a post's text that Facebook cut shows whole. */
    static final String KEPT_WHOLE = "post text kept whole";

    /** The member the report names once a post's text has gone through the cutter. */
    static final String CUTTER = "post text cut";

    private static final String FAMILY = FamilyNames.FULL_POST_TEXT;

    private static volatile boolean logged;

    private FullPostText() {
    }

    /**
     * The hook, right after Facebook cuts a post's text, handed the cut text, or null when the text
     * fit. Answers null while the switch is on, so the whole text shows, and the cut otherwise.
     */
    public static SpannableString cut(SpannableString cut) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, CUTTER);
            if (cut == null || !Utils.settingsReady() || !Settings.SHOW_FULL_POST_TEXT.get()) return cut;
            HookStatus.counted(FAMILY, KEPT_WHOLE);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Full post text: a post's text Facebook cut for See more shows whole");
            }
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, CUTTER, failure);
            return cut;
        }
    }
}
