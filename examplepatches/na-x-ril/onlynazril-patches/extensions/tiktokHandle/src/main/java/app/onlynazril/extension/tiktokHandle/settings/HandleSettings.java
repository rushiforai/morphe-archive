package app.onlynazril.extension.tiktokHandle.settings;

import android.content.Context;
import android.content.SharedPreferences;

import app.onlynazril.extension.tiktokHandle.Surfaces;

/**
 * Every switch, and the gates built from them.
 *
 * Three elements have a switch of their own — the @handle stamp, the region and the post time — and
 * each surface has one too. A writer asks only for its own elements, through `handleOn`, `regionOn`
 * or `timeOn`: no writer reads another element's switch, so a switch cannot change behaviour it does
 * not name. A surface switch stops everything on that surface.
 *
 * Persisted in private prefs. While the context is missing the defaults are the ones the screen
 * shows: the @handle stamp and the region on, the post time off, and only the feed surface on.
 */
public final class HandleSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "handle_enabled";
    private static final String KEY_REGION = "region_enabled";
    private static final String KEY_POST_TIME = "post_time_enabled";
    private static final String KEY_SURFACE = "surface_";

    private HandleSettings() {}

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_ENABLED, true);
    }

    public static boolean isEnabled() {
        Context c = appContext();
        if (c == null) return true;
        return isEnabled(c);
    }

    public static boolean isRegionEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_REGION, true);
    }

    public static boolean isRegionEnabled() {
        Context c = appContext();
        if (c == null) return true;
        return isRegionEnabled(c);
    }

    public static void setEnabled(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_ENABLED, v).apply();
    }

    public static void setRegionEnabled(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_REGION, v).apply();
    }

    /** Independent of the handle switches: the post time and the region share the time view. */
    public static boolean isPostTimeEnabled() {
        Context c = appContext();
        return c != null && isPostTimeEnabled(c);
    }

    public static boolean isPostTimeEnabled(Context ctx) {
        if (ctx == null) return false;
        return prefs(ctx).getBoolean(KEY_POST_TIME, false);
    }

    public static void setPostTimeEnabled(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_POST_TIME, v).apply();
    }

    public static boolean isSurfaceEnabled(String surface) {
        Context c = appContext();
        if (c == null) return Surfaces.defaultEnabled(surface);
        return isSurfaceEnabled(c, surface);
    }

    public static boolean isSurfaceEnabled(Context ctx, String surface) {
        boolean fallback = Surfaces.defaultEnabled(surface);
        if (ctx == null) return fallback;
        return prefs(ctx).getBoolean(KEY_SURFACE + surface, fallback);
    }

    public static void setSurfaceEnabled(Context ctx, String surface, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_SURFACE + surface, v).apply();
    }

    /**
     * The gates the writers ask, one per element. A writer asks for its own element and never for
     * another one's, so no switch can change behaviour it does not name.
     */
    public static boolean surfaceEnabled(String surface) {
        return isSurfaceEnabled(surface);
    }

    /** The @handle stamp on a surface: the master switch and that surface's switch together. */
    public static boolean handleOn(String surface) {
        return isEnabled() && surfaceEnabled(surface);
    }

    /** The region on a surface. Not part of the handle stamp: it carries its own switch. */
    public static boolean regionOn(String surface) {
        return isRegionEnabled() && surfaceEnabled(surface);
    }

    /** The post time on a surface, written on the same view the region rides on. */
    public static boolean timeOn(String surface) {
        return isPostTimeEnabled() && surfaceEnabled(surface);
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static Context appContext() {
        Context c = app.onlynazril.extension.tiktokHandle.internal.AppContext.get();
        if (c != null) return c;
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            java.lang.reflect.Method m = at.getMethod("currentApplication");
            Object app = m.invoke(null);
            if (app instanceof Context) return (Context) app;
        } catch (Exception ignored) {}
        return null;
    }
}
