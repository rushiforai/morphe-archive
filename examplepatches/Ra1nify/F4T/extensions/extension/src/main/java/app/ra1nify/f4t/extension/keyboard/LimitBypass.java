package app.ra1nify.f4t.extension.keyboard;

import android.content.Context;

/**
 * Runtime gate for the realOS style limit bypass trio.
 *
 * The gates follow the realOS hook side: the trio only runs while the liquid glass feature switch is
 * on, and the whitelist / day-night bypass additionally requires the "bypass all limits" switch. The
 * fold check is installed together with liquid glass and has no separate switch, exactly like realOS.
 */
public final class LimitBypass {
    private LimitBypass() {
    }

    /** Whitelist decision: liquid glass enabled AND the bypass switch on. */
    public static boolean isWhitelistBypassEnabled() {
        Context context = applicationContext();
        if (context == null) return false;
        return FeatureSwitches.isLiquidGlassEnabled(context) && FeatureSwitches.isBypassAllLimits(context);
    }

    /** Fold check: installed together with liquid glass, no separate bypass switch (realOS parity). */
    public static boolean isFoldBypassEnabled() {
        Context context = applicationContext();
        return context != null && FeatureSwitches.isLiquidGlassEnabled(context);
    }

    /** Day/night check: liquid glass enabled AND the bypass switch on. */
    public static boolean isDayNightBypassEnabled() {
        Context context = applicationContext();
        if (context == null) return false;
        return FeatureSwitches.isLiquidGlassEnabled(context) && FeatureSwitches.isBypassAllLimits(context);
    }

    private static Context applicationContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            if (application instanceof Context) {
                return ((Context) application).getApplicationContext();
            }
        } catch (Throwable ignored) {
            // The keyboard process always has an application before drawing; fail closed otherwise.
        }
        return null;
    }
}
