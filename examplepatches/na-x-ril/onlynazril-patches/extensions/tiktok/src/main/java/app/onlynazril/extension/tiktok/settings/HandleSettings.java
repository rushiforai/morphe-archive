package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

import app.onlynazril.extension.tiktok.AppLocale;
import app.onlynazril.extension.tiktok.Surfaces;

/**
 * Every switch and the gates built from them.
 * <p>
 * Three elements have a switch of their own — the @handle stamp, the region and the post time — and
 * each surface has one too. A writer asks only for its own elements, through `handleOn`, `regionOn`
 * or `timeOn`: no writer reads another element's switch, so a switch cannot change behavior it does
 * not name. A surface switch stops everything on that surface.
 * <p>
 * Persisted in private prefs. While the context is missing the defaults are the ones the screen
 * shows: the @handle stamp and the region on, the post time off, and only the feed surface on.
 */
public final class HandleSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "handle_enabled";
    private static final String KEY_REGION = "region_enabled";
    private static final String KEY_REGION_NAME = "region_name";
    private static final String KEY_POST_TIME = "post_time_enabled";
    private static final String KEY_COMPACT = "post_time_compact";
    private static final String KEY_DATE = "date_format";
    private static final String KEY_DATE_PATTERN = "date_pattern";
    private static final String KEY_CLOCK = "clock";
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

    /** When the region is on, show the country name instead of its code. */
    public static boolean isRegionName(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_REGION_NAME, false);
    }

    public static void setRegionName(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_REGION_NAME, v).apply();
    }

    /** 0 = off, 1 = code, 2 = name. */
    public static int regionMode(Context ctx) {
        if (!isRegionEnabled(ctx)) return 0;
        return isRegionName(ctx) ? 2 : 1;
    }

    public static void setRegionMode(Context ctx, int mode) {
        setRegionEnabled(ctx, mode != 0);
        setRegionName(ctx, mode == 2);
    }

    /** Remove the space between a time's number and unit. */
    public static boolean isCompactEnabled(Context ctx) {
        return ctx == null || prefs(ctx).getBoolean(KEY_COMPACT, true);
    }

    public static void setCompactEnabled(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_COMPACT, v).apply();
    }

    /** How a post older than a week is dated. */
    public static PostDateFormat dateFormat(Context ctx) {
        if (ctx == null) return PostDateFormat.AUTO;

        int value = prefs(ctx).getInt(KEY_DATE, PostDateFormat.AUTO.stored);
        return PostDateFormat.fromStored(value);
    }

    public static void setDateFormat(Context ctx, PostDateFormat mode) {
        if (ctx == null) return;

        prefs(ctx).edit()
                .putInt(KEY_DATE, mode.stored)
                .apply();
    }

    /** The typed pattern behind {@link PostDateFormat#CUSTOM}, empty when nothing was saved. */
    public static String customDatePattern(Context ctx) {
        if (ctx == null) return "";
        String pattern = prefs(ctx).getString(KEY_DATE_PATTERN, "");
        return pattern == null ? "" : pattern;
    }

    public static void setCustomDatePattern(Context ctx, String pattern) {
        if (ctx == null) return;

        prefs(ctx).edit()
                .putString(KEY_DATE_PATTERN, pattern == null ? "" : pattern.trim())
                .apply();
    }

    /**
     * The pattern the writers format with: null means the automatic, locale-aware shape. A custom
     * pattern that no longer validates (an old backup, an edited file) falls back to the same
     * automatic shape instead of throwing while a name is being drawn.
     */
    public static String datePattern(Context ctx) {
        if (ctx == null) return null;
        PostDateFormat format = dateFormat(ctx);
        if (format != PostDateFormat.CUSTOM) return format.pattern;
        String custom = customDatePattern(ctx);
        return PostDateFormat.isValidPattern(custom, AppLocale.of(ctx)) ? custom.trim() : null;
    }

    /**
     * The hour and minute next to a date, on a post's header and on a comment. Both surfaces read
     * the one switch, because it changes the same thing: a date with no time of day.
     */
    public static boolean isClockEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_CLOCK, true);
    }

    public static void setClockEnabled(Context ctx, boolean v) {
        prefs(ctx).edit().putBoolean(KEY_CLOCK, v).apply();
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
     * another one's, so no switch can change behavior it does not name.
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

    /** Flushes every pending write before a restart ends the process. */
    static void flush(Context ctx) {
        prefs(ctx).edit().apply();
    }

    static Context appContext() {
        Context c = app.onlynazril.extension.tiktok.internal.AppContext.get();
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
