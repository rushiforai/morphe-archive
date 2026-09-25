package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.view.View;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Fail-open entry point for the experimental TikTok Theme Engine.
 *
 * Keep this class deliberately independent from ThemeEngine at link time. The actual engine is
 * loaded through reflection so a VerifyError/LinkageError in theme code can never make TikTok's
 * MainActivity fail verification or crash synchronously during onCreate.
 */
@SuppressWarnings("unused")
public final class ThemeEngineBootstrap {
    private static final String ENGINE_CLASS = "app.morphe.extension.tiktok.theme.ThemeEngine";
    private static final String REALTIME_GUARD_CLASS =
            "app.morphe.extension.tiktok.theme.ThemeRealtimeUiGuard";
    private static final String DYNAMIC_LIST_GUARD_V3_CLASS =
            "app.morphe.extension.tiktok.theme.ThemeDynamicListGuardV3";
    private static volatile boolean runtimeFailed;
    private static volatile String patchDefaultPreset = "default";

    private ThemeEngineBootstrap() {}

    public static void setPatchDefaultPreset(String preset) {
        try {
            patchDefaultPreset = preset == null || preset.isEmpty() ? "default" : preset;
        } catch (Throwable ignored) {
            patchDefaultPreset = "default";
        }
    }

    public static void start(Activity activity) {
        if (activity == null || runtimeFailed) return;

        try {
            Utils.setContext(activity);
        } catch (Throwable throwable) {
            safeLog("BlueIT Theme Engine context bootstrap failed", throwable);
            return;
        }

        try {
            View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
            Runnable start = () -> startEngine(activity, patchDefaultPreset);
            if (decor != null) {
                // Keep theme work out of TikTok's critical MainActivity.onCreate path.
                decor.postDelayed(start, 350L);
            } else {
                activity.runOnUiThread(start);
            }
        } catch (Throwable throwable) {
            runtimeFailed = true;
            safeLog("BlueIT Theme Engine bootstrap scheduling failed", throwable);
        }
    }

    private static void startEngine(Activity activity, String preset) {
        if (runtimeFailed || activity == null || activity.isFinishing()) return;

        try {
            // ThemeStateStore owns patch-default seeding now. Unlike a normal Setting it persists an
            // explicit "default" selection too, so a patch-time Liquid Glass seed can never return
            // after the user has chosen another preset.
            ThemeStateStore.initialize(activity, preset);

            Class<?> engine = Class.forName(ENGINE_CLASS, true, activity.getClassLoader());
            Method onCreated = engine.getDeclaredMethod("onMainActivityCreated", Activity.class);
            onCreated.setAccessible(true);
            onCreated.invoke(null, activity);
        } catch (Throwable throwable) {
            runtimeFailed = true;
            Throwable cause = unwrap(throwable);
            safeLog("BlueIT Theme Engine disabled after runtime bootstrap failure", cause);
            return;
        }

        installActivityGuards(activity);
    }

    /** Each Activity owns a different DecorView and ViewTreeObserver. Installation is idempotent. */
    static void installActivityGuards(Activity activity) {
        // Retain the working Inbox/Activity paths. Native roots now own sidebar motion.
        installGuard(activity, REALTIME_GUARD_CLASS, "BlueIT realtime theme guard unavailable");
        installGuard(
                activity,
                DYNAMIC_LIST_GUARD_V3_CLASS,
                "BlueIT dynamic list guard V3 unavailable"
        );
        // Drawer motion is handled by exact native roots, not a screen-wide candidate search.
    }

    private static void installGuard(Activity activity, String className, String failureMessage) {
        try {
            Class<?> guard = Class.forName(className, true, activity.getClassLoader());
            Method install = guard.getDeclaredMethod("install", Activity.class);
            install.setAccessible(true);
            install.invoke(null, activity);
        } catch (Throwable throwable) {
            safeLog(failureMessage, unwrap(throwable));
        }
    }

    private static Throwable unwrap(Throwable throwable) {
        try {
            if (throwable instanceof InvocationTargetException
                    && ((InvocationTargetException) throwable).getCause() != null) {
                return ((InvocationTargetException) throwable).getCause();
            }
        } catch (Throwable ignored) {
        }
        return throwable;
    }

    private static void safeLog(String message, Throwable throwable) {
        try {
            if (throwable instanceof Exception) {
                Logger.printDebug(() -> message, (Exception) throwable);
            } else {
                Logger.printInfo(() -> message + ": " + throwable.getClass().getSimpleName());
            }
        } catch (Throwable ignored) {
            // Logging must never turn a fail-open guard into a startup crash.
        }
    }
}
