package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The copy-comment switch.
 * <p>
 * One switch, and it is on out of the box: copying a comment gives the comment's own text and
 * leaves the username out. Off restores TikTok's own copied string, username and all.
 * <p>
 * It is not part of the @handle stamp and takes no surface switch: what the clipboard receives has
 * nothing to do with what a name is drawn with, so no other switch may change it.
 */
public final class CommentCopySettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_WITHOUT_USERNAME = "comment_copy_without_username";

    private CommentCopySettings() {}

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_WITHOUT_USERNAME, true);
    }

    public static boolean isEnabled() {
        return isEnabled(appContext());
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_WITHOUT_USERNAME, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
