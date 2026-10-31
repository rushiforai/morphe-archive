package app.morphe.extension.syncforreddit.ui.gestures;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import app.morphe.extension.shared.Logger;

/**
 * The gesture settings, read from the same store Sync writes its own settings to.
 *
 * <p>They are read at the moment a gesture is made rather than held, so turning one off in the
 * settings takes effect on the next touch without the app being restarted or repatched. The
 * entries themselves are added to Sync's own settings screen by the patch, so Sync's preference
 * machinery is what displays them and what writes them here.
 *
 * @noinspection unused
 */
public final class VideoGestureSettings {
    static final String DOUBLE_TAP = "sync_up_video_double_tap";
    static final String SEEK = "sync_up_video_seek";
    static final String SEEK_NEEDS_DOUBLE_TAP = "sync_up_video_seek_double_tap";
    static final String SEEK_PRECISION = "sync_up_video_seek_precision";

    /** Never. */
    static final int SEEK_NEVER = 0;
    /** Where a sideways drag means nothing else, which is a video on its own. */
    static final int SEEK_OUTSIDE_GALLERIES = 1;
    /** Everywhere, taking the gesture from an album, which pages with it. */
    static final int SEEK_ANYWHERE = 2;
    static final String VOLUME = "sync_up_video_volume";
    static final String SEEK_SPAN = "sync_up_video_seek_span";

    /** Seconds covered by a swipe across the whole width, when the setting is unset. */
    static final int DEFAULT_SEEK_SPAN = 90;

    /** Where a video is on its own, and nothing else wants a sideways drag. */
    static final int DEFAULT_SEEK = SEEK_OUTSIDE_GALLERIES;

    private VideoGestureSettings() {}

    static boolean enabled(Context context, String key, boolean fallback) {
        SharedPreferences settings = store(context);
        if (settings == null) {
            return fallback;
        }
        try {
            return settings.getBoolean(key, fallback);
        } catch (ClassCastException ex) {
            // Written by something else under the same name; the default is the safer answer.
            Logger.printInfo(() -> "Could not read " + key + ": " + ex);
            return fallback;
        }
    }

    /**
     * A setting Sync stores as text even though it is a number, which is how its own list
     * settings are written.
     */
    static int number(Context context, String key, int fallback) {
        SharedPreferences settings = store(context);
        if (settings == null) {
            return fallback;
        }
        try {
            String held = settings.getString(key, null);
            return held == null || held.isEmpty() ? fallback : Integer.parseInt(held.trim());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read " + key + ": " + ex);
            return fallback;
        }
    }

    /**
     * Says what the settings were read as, and whether each was ever written, for as long as
     * they are not taking effect. Reported once for a screen rather than for every touch.
     */
    static void report(Context context) {
        SharedPreferences settings = store(context);
        if (settings == null) {
            Logger.printInfo(() -> "gestures: no settings to read");
            return;
        }
        StringBuilder read = new StringBuilder();
        for (String key : new String[]{DOUBLE_TAP, SEEK, SEEK_SPAN, SEEK_PRECISION,
                SEEK_NEEDS_DOUBLE_TAP, VOLUME}) {
            Object held = settings.getAll().get(key);
            read.append(key.replace("sync_up_video_", "")).append('=')
                    .append(held == null ? "unset" : held).append(' ');
        }
        Logger.printInfo(() -> "gestures: " + read + "in " + name(context));
    }

    /**
     * The settings, from wherever Sync is keeping them.
     *
     * <p>Sync keeps a set for each account signed in, in a file named after that account, and
     * points its settings screens at it. Reading the file an app has by default finds nothing
     * those screens ever wrote, which is what made every one of these settings look unset.
     */
    /** Which settings file was read, for as long as that is in question. */
    private static String name(Context context) {
        try {
            return t7.z.i() ? t7.z.a() : "the default";
        } catch (Throwable ex) {
            return "the default";
        }
    }

    private static SharedPreferences store(Context context) {
        try {
            String named = null;
            try {
                if (t7.z.i()) {
                    named = t7.z.a();
                }
            } catch (Throwable ex) {
                // An older or newer Sync that keeps one set of settings for everyone.
                Logger.printInfo(() -> "Could not tell which settings are in use: " + ex);
            }
            return named == null || named.isEmpty()
                    ? PreferenceManager.getDefaultSharedPreferences(context)
                    : context.getSharedPreferences(named, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not reach the settings: " + ex);
            return null;
        }
    }
}
