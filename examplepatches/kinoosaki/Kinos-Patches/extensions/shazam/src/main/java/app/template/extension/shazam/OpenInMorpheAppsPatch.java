package app.template.extension.shazam;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.util.Log;

import java.util.HashMap;
import java.util.Map;

/**
 * Points Shazam's "Open in YouTube Music" / "Open in YouTube" providers at the Morphe-patched
 * apps. The providers come from server config (package name plus intent:// URIs carrying
 * {@code package=<stock>;}); the patch runs every string field of the provider through
 * {@link #remap(String)} when it is constructed.
 */
@SuppressWarnings("unused")
public final class OpenInMorpheAppsPatch {
    private static final String TAG = "Morphe-Shazam";

    private static final String STOCK_YOUTUBE_MUSIC = "com.google.android.apps.youtube.music";
    private static final String STOCK_YOUTUBE = "com.google.android.youtube";

    /** How long an installed/not-installed answer is reused. */
    private static final long CACHE_MILLIS = 30_000L;

    private static final Map<String, Long> CHECKED_AT = new HashMap<>();
    private static final Map<String, Boolean> INSTALLED = new HashMap<>();

    private static volatile Context context;

    private OpenInMorpheAppsPatch() {
    }

    /** Replaced by the patch with the "YouTube Music package" option value. */
    public static String getYouTubeMusicPackage() {
        return "app.morphe.android.apps.youtube.music";
    }

    /** Replaced by the patch with the "YouTube package" option value. */
    public static String getYouTubePackage() {
        return "app.morphe.android.youtube";
    }

    /**
     * Injection point: every string of a streaming provider (package name, song/artist/album URI).
     *
     * @return the value with the stock YouTube (Music) package swapped for the Morphe one when
     *         that app is installed and enabled, otherwise the value unchanged. Never throws.
     */
    public static String remap(String value) {
        if (value == null || value.isEmpty()) return value;
        try {
            String result = swap(value, STOCK_YOUTUBE_MUSIC, getYouTubeMusicPackage());
            return swap(result, STOCK_YOUTUBE, getYouTubePackage());
        } catch (Throwable t) {
            Log.w(TAG, "remap failed", t);
            return value;
        }
    }

    /**
     * Matches whole tokens only: the bare package name, or the intent URI's
     * {@code package=<stock>;} extra. "com.google.android.youtube" therefore never matches inside
     * "com.google.android.apps.youtube.music".
     */
    private static String swap(String value, String stock, String target) {
        if (target == null || target.isEmpty() || target.equals(stock)) return value;

        final boolean exact = value.equals(stock);
        final String token = "package=" + stock + ";";
        if (!exact && !value.contains(token)) return value;
        if (!isInstalled(target)) return value;

        return exact ? target : value.replace(token, "package=" + target + ";");
    }

    private static boolean isInstalled(String packageName) {
        final long now = SystemClock.elapsedRealtime();
        synchronized (INSTALLED) {
            Long checkedAt = CHECKED_AT.get(packageName);
            if (checkedAt != null && now - checkedAt < CACHE_MILLIS) {
                return Boolean.TRUE.equals(INSTALLED.get(packageName));
            }
        }

        Context ctx = getContext();
        if (ctx == null) return false; // Not cached: retry once the app context exists.

        boolean installed;
        try {
            ApplicationInfo info = ctx.getPackageManager().getApplicationInfo(packageName, 0);
            installed = info != null && info.enabled;
        } catch (PackageManager.NameNotFoundException e) {
            installed = false;
        }

        synchronized (INSTALLED) {
            INSTALLED.put(packageName, installed);
            CHECKED_AT.put(packageName, now);
        }
        return installed;
    }

    private static Context getContext() {
        Context ctx = context;
        if (ctx != null) return ctx;
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app instanceof Context) {
                ctx = (Context) app;
                context = ctx;
            }
        } catch (Throwable t) {
            Log.w(TAG, "could not get application context", t);
        }
        return ctx;
    }
}
