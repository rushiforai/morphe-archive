package app.ckzombies.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;

/**
 * Lets the intro video play once per install. GluMovieActivity asks skip() when it opens, and
 * calls markSeen() whenever the video ends, whether it ran out, was tapped away, or the game was
 * paused. The mark is the package's firstInstallTime rather than a plain flag: the game targets
 * API 25, so Android's auto backup restores these preferences into a fresh install, which should
 * still see the intro once, while an update keeps the install time and so does not replay it.
 */
@SuppressWarnings("unused")
public final class IntroOnce {

    static final String PREFS = "app.ckzombies.extension";
    static final String KEY = "intro_seen_install";

    /** Stands in for firstInstallTime, which API 9 added, so the mark works as a plain flag there. */
    static final long NO_INSTALL_TIME = 1;

    private IntroOnce() {
    }

    /** Called at the end of GluMovieActivity.onCreate(); true finishes the activity at once. */
    public static boolean skip(Context context) {
        try {
            return seen(prefs(context).getLong(KEY, 0), stamp(context));
        } catch (Throwable ignored) {
            // When in doubt, play it: the player can still tap it away as before.
            return false;
        }
    }

    /** Called at the top of GluMovieActivity.finishMovieActivity(). */
    public static void markSeen(Context context) {
        try {
            long stamp = stamp(context);
            SharedPreferences prefs = prefs(context);
            if (!seen(prefs.getLong(KEY, 0), stamp)) {
                // commit(), not apply(): apply() needs API 9, and this runs once per install.
                prefs.edit().putLong(KEY, stamp).commit();
            }
        } catch (Throwable ignored) {
            // The intro then plays again next launch, which is how the game behaved anyway.
        }
    }

    /** Nothing stored reads as 0, which no stamp equals. */
    static boolean seen(long stored, long stamp) {
        return stored == stamp;
    }

    static long stamp(int sdk, long firstInstallTime) {
        return sdk >= 9 && firstInstallTime > 0 ? firstInstallTime : NO_INSTALL_TIME;
    }

    private static long stamp(Context context) throws Exception {
        int sdk = Build.VERSION.SDK_INT;
        long firstInstallTime = sdk >= 9
                ? context.getPackageManager().getPackageInfo(context.getPackageName(), 0).firstInstallTime
                : 0;
        return stamp(sdk, firstInstallTime);
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
