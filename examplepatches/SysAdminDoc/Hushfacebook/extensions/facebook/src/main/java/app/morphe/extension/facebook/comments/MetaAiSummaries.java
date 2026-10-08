/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Meta AI's summaries of a post's comments. Facebook draws them through two sockets, each going
 * through its plugins in a fixed order and asking a check of each whether it applies. The comment
 * sheet's top content socket has two summary plugins, the plain summary and the one with a deep
 * dive card, and the socket under a post's buttons has one, the inline summary. The patch asks
 * {@link #holds} first in each socket's check, with the name of the plugin it asks about, and a yes
 * answers no for that plugin, so the socket goes on to the next one. Comments, replies, the sort
 * menu and every other plugin stay Facebook's.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is no and
 * the check runs as Facebook wrote it.
 */
public final class MetaAiSummaries {
    /** The comment sheet's plain summary plugin, as the socket's name table gives it. */
    public static final String SHEET_SUMMARY =
            "com.facebook.feedback.comments.plugins.flyouttopcontent.genaicommentsummary.GenAICommentSummaryFlyoutTopContentPlugin";

    /** The comment sheet's summary plugin with a deep dive card. */
    public static final String SHEET_DEEP_DIVE =
            "com.facebook.feedback.comments.plugins.flyouttopcontent.genaideepdiveandcommentsummary."
                    + "GenAIDeepDiveAndCommentSummaryFlyoutTopContentPlugin";

    /** The summary under a post's buttons. */
    public static final String POST_SUMMARY =
            "com.facebook.feed.plugins.belowufifooter.impl.inlinecommentsummarywithgenai.InlineCommentSummaryWithGenAIPlugin";

    /** Counted under the patch's name each time a comment sheet's summary is kept out. */
    static final String SHEET_HIDDEN = "Comment sheet summary kept out";

    /** Counted each time a post's summary under its buttons is kept out. */
    static final String POST_HIDDEN = "Summary under a post kept out";

    /** The member the report names once the comment sheet's socket has asked about a summary. */
    static final String SHEET = "comment sheet summary";

    /** The member the report names once the socket under a post's buttons has asked about its summary. */
    static final String POST = "summary under posts";

    private static final String FAMILY = FamilyNames.META_AI_SUMMARIES;

    private static volatile boolean logged;

    private MetaAiSummaries() {
    }

    /**
     * The hook, first thing in each socket's check of whether a plugin applies, handed the plugin's
     * name. True answers no for a summary plugin while the switch is on; false leaves the check to
     * Facebook, for every other plugin and otherwise.
     */
    public static boolean holds(@Nullable String plugin) {
        try {
            HookStatus.invoked(FAMILY);
            boolean sheet = SHEET_SUMMARY.equals(plugin) || SHEET_DEEP_DIVE.equals(plugin);
            if (!sheet && !POST_SUMMARY.equals(plugin)) return false;
            HookStatus.bound(FAMILY, sheet ? SHEET : POST);
            if (!Utils.settingsReady() || !Settings.HIDE_META_AI_SUMMARIES.get()) return false;
            HookStatus.counted(FAMILY, sheet ? SHEET_HIDDEN : POST_HIDDEN);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Meta AI summaries: a summary of a post's comments was kept out");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "plugin check", failure);
            return false;
        }
    }
}
