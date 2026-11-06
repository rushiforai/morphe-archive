package app.template.extension.gospellibrary;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

@SuppressWarnings("unused")
public class FullscreenPatch {

    private static final Set<View> CONFIGURED =
            Collections.newSetFromMap(new WeakHashMap<>());

    @SuppressWarnings("deprecation")
    private static final int LEGACY_FLAGS = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
            | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
            | View.SYSTEM_UI_FLAG_FULLSCREEN
            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;

    private static boolean registered;

    public static void onActivityCreate(Activity activity) {
        register(activity.getApplication());
        setup(activity);
        apply(activity);
    }

    public static synchronized void register(Application app) {
        if (registered) return;
        registered = true;
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity a, Bundle b) {
                setup(a);
            }

            @Override
            public void onActivityStarted(Activity a) {
                apply(a);
            }

            @Override
            public void onActivityResumed(Activity a) {
                setup(a);
                apply(a);
            }

            @Override
            public void onActivityPaused(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle b) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
            }
        });
    }

    // Window setup plus listeners that undo any attempt by the app to bring the bars back.
    private static void setup(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            WindowManager.LayoutParams lp = window.getAttributes();
            int mode = Build.VERSION.SDK_INT >= 30
                    ? WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS
                    : WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
            if (Build.VERSION.SDK_INT >= 28 && lp.layoutInDisplayCutoutMode != mode) {
                lp.layoutInDisplayCutoutMode = mode;
                window.setAttributes(lp);
            }

            View decor = window.getDecorView();
            if (!CONFIGURED.add(decor)) return;

            window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);

            // Reading mode toggles the bars through insets/visibility changes, so re-hide.
            decor.setOnSystemUiVisibilityChangeListener(v -> apply(activity));
            decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                if (barsVisible(decor)) apply(activity);
            });
        } catch (Throwable ignored) {
        }
    }


    private static boolean barsVisible(View decor) {
        if (Build.VERSION.SDK_INT >= 30) {
            WindowInsets insets = decor.getRootWindowInsets();
            return insets != null && (insets.isVisible(WindowInsets.Type.statusBars())
                    || insets.isVisible(WindowInsets.Type.navigationBars()));
        }
        return (decor.getSystemUiVisibility() & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0;
    }

    @SuppressWarnings("deprecation")
    private static void apply(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            View decor = window.getDecorView();

            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
                WindowInsetsController c = window.getInsetsController();
                if (c != null) {
                    c.setSystemBarsBehavior(
                            WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                    c.hide(WindowInsets.Type.systemBars());
                }
            } else {
                decor.setSystemUiVisibility(LEGACY_FLAGS);
            }
        } catch (Throwable ignored) {
        }
    }
}
