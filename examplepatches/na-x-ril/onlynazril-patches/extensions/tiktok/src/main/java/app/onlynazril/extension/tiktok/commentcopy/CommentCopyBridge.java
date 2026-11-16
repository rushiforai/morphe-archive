package app.onlynazril.extension.tiktok.commentcopy;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.settings.CommentCopySettings;

/**
 * The copy-comment patch's hooks: what the clipboard receives when a comment is copied.
 * <p>
 * TikTok puts the commenter's name in front of the text before it copies. Two routes do it, and
 * both are answered here:
 * <p>
 *  - the comment sheet's own Copy builds its {@code ClipData} through one static builder that takes
 *    the name prefix, the text and the text's emoji spans apart. The patch blanks the prefix at the
 *    top of that builder; the text and its emoji are left exactly as the app built them. This is
 *    the route every comment copy from the sheet takes on 47.0.3 and 47.1.4.
 *  - another menu (Favorites → Comments, and the reply copy) joins the name and the text itself and
 *    hands the one string to a plain-text clipboard helper. There the patch replaces that string
 *    with the comment's own text at the call, so the joined name never reaches the clipboard.
 * <p>
 * Both ask the same switch, and each reports its own branch: a copy that keeps the username and a
 * hook that never ran look the same on screen.
 */
public final class CommentCopyBridge {
    private static final int LOG_CAP = 12;

    private static int logged;

    private CommentCopyBridge() {}

    /** The name prefix the comment menu puts before the copied text; blank while the switch says so. */
    public static String copiedPrefix(String prefix) {
        if (!CommentCopySettings.isEnabled()) return prefix;
        report("menu prefix blanked");
        return "";
    }

    /**
     * The string the plain helper was about to copy, against the comment's own text. While the
     * switch says so the comment's text is what is copied, so the name joined to it is dropped;
     * with the switch off, or with no text to fall back on, the app's own string is left alone.
     */
    public static String sanitizeCopiedCommentText(String copiedText, String commentText) {
        if (!CommentCopySettings.isEnabled()) return copiedText;
        if (commentText == null) return copiedText;
        report("name prefix dropped from the copied text");
        return commentText;
    }

    private static void report(String message) {
        if (logged++ < LOG_CAP) Debug.print("comment copy: " + message);
    }
}
