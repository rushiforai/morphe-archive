/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.comment;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.tiktok.settings.Settings;

@SuppressWarnings("unused")
public final class CommentCopySanitizer {
    private CommentCopySanitizer() {}

    public static String sanitizeCopiedCommentText(String copiedText, String commentText) {
        if (!Settings.COPY_COMMENTS_WITHOUT_USERNAME.get()) return copiedText;
        if (commentText == null) return copiedText;

        if (Settings.DEBUG.get()) {
            Logger.printInfo(() -> "[Morphe TikTok CommentCopy] Removed copied comment username prefix");
        }
        return commentText;
    }
}
