package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Shared prefs accessor for Morphe Extra Settings (host-side storage).
 *
 * Note: the accent color is a BUILD-TIME patch option (see
 * ExtraSettingsPatch.kt) — theme-attr colors resolve through framework
 * TypedArray and new resource entries cannot be registered by the patch
 * pipeline, so no runtime accent remap exists. morphe.* prefs remain the
 * store for runtime toggles (theme mode is Strava's own pref.appearance.value;
 * future phase-2 hide-toggles use morphe.* keys).
 */
public final class StravaAccentHelper {

    private StravaAccentHelper() {
    }

    public static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences("com.strava_preferences", Context.MODE_PRIVATE);
    }

    private static volatile Context appContext;

    /** Captured from the first Activity context seen (ux70-style hooks). */
    public static void init(Context ctx) {
        if (appContext == null) {
            appContext = ctx.getApplicationContext();
        }
    }

    private static Context context() {
        Context ctx = appContext;
        if (ctx != null) {
            return ctx;
        }
        // Tokens can be constructed before any Activity hook runs — fall
        // back to the process Application via ActivityThread (reflection,
        // not a blocked API).
        try {
            ctx = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable ignored) {
        }
        if (ctx == null) {
            try {
                ctx = (Context) Class.forName("android.app.AppGlobals")
                        .getMethod("getInitialApplication").invoke(null);
            } catch (Throwable ignored) {
            }
        }
        if (ctx != null) {
            appContext = ctx;
        }
        return ctx;
    }

    /**
     * Runtime replacement for brand-orange Compose ColorToken literals
     * ({@code const-wide 0xfffc5200L} → ColorToken(0xfffc5200L) sites).
     * Returns the CURRENT brand color as a Compose color long (ARGB in the
     * low 32 bits) — {@code global_brand}, which the resource patch points at
     * the user accent (static presets) or the Material You dynamic palette
     * (values-v31 overlay). Returns the original literal if no context yet.
     */
    public static long brandOrange(long original) {
        try {
            Context ctx = context();
            if (ctx == null) {
                return original;
            }
            int id = ctx.getResources().getIdentifier(
                    "global_brand", "color", ctx.getPackageName());
            if (id == 0) {
                return original;
            }
            return ctx.getColor(id) & 0xFFFFFFFFL;
        } catch (Throwable t) {
            return original;
        }
    }
}
