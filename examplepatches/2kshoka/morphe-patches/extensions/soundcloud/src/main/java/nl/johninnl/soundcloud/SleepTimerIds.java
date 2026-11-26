package nl.johninnl.soundcloud;

import android.content.Context;

/**
 * Resolves the menu item's string and icon resource ids at runtime, by name.
 * Resource ids change between SoundCloud builds, resource names do not, so this
 * survives repacks without pinning public.xml ids:
 *
 *   string   "morphe_sleep_timer"  -> added by the sleep-timer resource patch
 *   drawable "ic_actions_timer"    -> SoundCloud action icon (falls back to ic_actions_behind_track)
 *
 * titleId()/iconId() never return 0 (a 0 title would crash the bottom sheet when
 * it is rendered). If the real resource cannot be resolved, a framework resource
 * is returned instead and is NOT cached, so the next call retries the lookup.
 */
public final class SleepTimerIds {
    private static volatile Context appContext;
    private static volatile int titleId;
    private static volatile int iconId;

    public static void init(Context app) {
        if (app != null) appContext = app;
    }

    public static int titleId() {
        int id = titleId;
        if (id != 0) return id;
        id = resolve("morphe_sleep_timer", "string");
        if (id == 0) id = resolve("app_name", "string");
        if (id == 0) return android.R.string.ok; // last resort, not cached
        titleId = id;
        return id;
    }

    public static int iconId() {
        int id = iconId;
        if (id != 0) return id;
        id = resolve("ic_actions_timer", "drawable");
        // ic_actions_behind_track is the icon of the existing "Info" menu item, so it is
        // known to exist in the app; use it if the timer icon is missing.
        if (id == 0) id = resolve("ic_actions_behind_track", "drawable");
        if (id == 0) return android.R.drawable.ic_menu_recent_history; // last resort, not cached
        iconId = id;
        return id;
    }

    private static Context context() {
        Context c = appContext;
        if (c != null) return c;
        // The menu can be built before any attach() call (process started through a
        // non-launcher Activity). ActivityThread.currentApplication() is a hidden but
        // long-standing accessor; failure is tolerated and handled by the callers.
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app instanceof Context) {
                appContext = (Context) app;
                return appContext;
            }
        } catch (Exception ignored) {
            // fall through
        }
        return null;
    }

    private static int resolve(String name, String type) {
        Context context = context();
        if (context == null) return 0;
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    private SleepTimerIds() {}
}
