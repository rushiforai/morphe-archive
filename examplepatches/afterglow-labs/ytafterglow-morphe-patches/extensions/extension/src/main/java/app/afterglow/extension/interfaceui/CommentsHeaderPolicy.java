package app.afterglow.extension.interfaceui;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

/** Only the current comments panel's scroll-driven chip collapse is overridden. */
public final class CommentsHeaderPolicy {
    private static volatile boolean loggedFailure;
    private CommentsHeaderPolicy() {}

    public static boolean keepVisible(String panelId) {
        if (!"comment-item-section".equals(panelId)
                && !"PAwatch_mobile_top_level_comments".equals(panelId)
                && !"engagement-panel-comments-section".equals(panelId)
                && !"shorts-comments-panel".equals(panelId)) return false;
        try {
            return InstalledTweaks.has("comments-header") && AfterglowPrefs.getInt("commentsHeaderMode") == 1;
        } catch (Throwable error) {
            if (!loggedFailure) {
                loggedFailure = true;
                Afterglow.error("CommentsHeaderPolicy.keepVisible", error);
            }
            return false;
        }
    }
}
