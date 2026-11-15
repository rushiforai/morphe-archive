package app.drbushytop.extension.relay.inline;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.os.SystemClock;

/**
 * The two rows the patch adds to Relay's Settings, Behaviour, Comments, and the Relay settings
 * inline pictures follow. They live in Relay's own settings file, so Relay's backup and restore
 * carry them.
 */
final class InlineMediaSettings {
    /** Relay's settings file, as its preference screens name it. */
    private static final String PREFERENCES = "SettingsV2_test";
    static final String KEY_ENABLED = "drbushytop_inline_media";
    static final String KEY_UNMETERED_ONLY = "drbushytop_inline_media_unmetered_only";
    /** Relay's, from {@code pref_key_nsfw_thumbnails}. */
    private static final String KEY_NSFW_THUMBNAILS = "NSFWThumbnails";

    private static final long NETWORK_CHECK_INTERVAL_MS = 5000;
    private static volatile long checkedAt;
    private static volatile boolean metered;

    private InlineMediaSettings() {
    }

    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi"})
    static Context application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Whether comments being loaded now should draw their pictures. */
    static boolean showInline() {
        Context context = application();
        if (context == null) return true;
        SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        if (!preferences.getBoolean(KEY_ENABLED, true)) return false;
        return !preferences.getBoolean(KEY_UNMETERED_ONLY, false) || !isMetered(context);
    }

    /** Whether GIFs animate, or show their still frame: they animate unless on a metered network. */
    static boolean animateGifs() {
        Context context = application();
        return context == null || !isMetered(context);
    }

    /** Relay's own Settings, Filters, "NSFW Thumbnails" (off unless turned on). */
    static boolean showNsfwThumbnails() {
        Context context = application();
        if (context == null) return false;
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .getBoolean(KEY_NSFW_THUMBNAILS, false);
    }

    private static boolean isMetered(Context context) {
        long now = SystemClock.elapsedRealtime();
        if (now - checkedAt > NETWORK_CHECK_INTERVAL_MS) {
            try {
                ConnectivityManager connectivity =
                        (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
                metered = connectivity == null || connectivity.isActiveNetworkMetered();
            } catch (Throwable t) {
                metered = true;
            }
            checkedAt = now;
        }
        return metered;
    }
}
