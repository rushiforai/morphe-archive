package app.template.extension.darkmode;

import android.app.Activity;
import android.app.Application;
import android.app.UiModeManager;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Called from the start of the patched app's Application.onCreate().
 *
 * 1. Per-app night mode (Android 12+): the app gets a dark configuration, so apps with a
 *    dark theme use it. Only this app is affected; the system theme is left alone.
 * 2. AppCompat default night mode, for apps that manage their own theme through AppCompat.
 * 3. If the patch added the "morphe_force_dark" style, it is applied to every activity so
 *    Android can auto-darken light-only screens (Android 10+).
 */
@SuppressWarnings("unused")
public final class ForceDarkModePatch {

    private static final String TAG = "MorpheForceDark";
    private static final String FORCE_DARK_STYLE = "morphe_force_dark";

    private static boolean applied;

    private ForceDarkModePatch() {
    }

    public static void apply(Context context) {
        if (applied) return;
        applied = true;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                UiModeManager uiModeManager = context.getSystemService(UiModeManager.class);
                if (uiModeManager != null) {
                    // Persisted by the system; setting the same value again does nothing.
                    uiModeManager.setApplicationNightMode(UiModeManager.MODE_NIGHT_YES);
                }
            } catch (Throwable t) {
                Log.e(TAG, "setApplicationNightMode failed", t);
            }
        }

        try {
            Class<?> delegate = Class.forName("androidx.appcompat.app.AppCompatDelegate");
            Method setDefaultNightMode = delegate.getMethod("setDefaultNightMode", int.class);
            setDefaultNightMode.invoke(null, 2 /* MODE_NIGHT_YES */);
        } catch (Throwable ignored) {
            // AppCompat not present, or renamed by R8.
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            registerAutoDarken(context);
        }
    }

    private static void registerAutoDarken(Context context) {
        final int styleId;
        try {
            styleId = context.getResources()
                    .getIdentifier(FORCE_DARK_STYLE, "style", context.getPackageName());
        } catch (Throwable t) {
            return;
        }
        // 0 means the "Auto-darken" option was off when patching.
        if (styleId == 0) return;

        Context appContext = context.getApplicationContext();
        if (!(appContext instanceof Application)) return;

        ((Application) appContext).registerActivityLifecycleCallbacks(
                new Application.ActivityLifecycleCallbacks() {
                    @Override
                    public void onActivityPreCreated(Activity activity, Bundle savedInstanceState) {
                        try {
                            // Runs before the activity's onCreate(), so the window picks it up.
                            activity.getTheme().applyStyle(styleId, true);
                        } catch (Throwable t) {
                            Log.e(TAG, "Could not apply force-dark style", t);
                        }
                    }

                    @Override
                    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                    }

                    @Override
                    public void onActivityStarted(Activity activity) {
                    }

                    @Override
                    public void onActivityResumed(Activity activity) {
                    }

                    @Override
                    public void onActivityPaused(Activity activity) {
                    }

                    @Override
                    public void onActivityStopped(Activity activity) {
                    }

                    @Override
                    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                    }

                    @Override
                    public void onActivityDestroyed(Activity activity) {
                    }
                });
    }
}
