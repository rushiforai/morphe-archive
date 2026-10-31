package com.dhuadapter.display;

import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;

import java.util.HashMap;
import java.util.Map;

import com.dhuadapter.BackButtonOverlay;
import com.dhuadapter.RoundedCornersProvider;
import com.dhuadapter.core.HookEnv;

/**
 * Category 1 (window chrome) — ActivityLifecycleCallbacks: fullscreen, rounded
 * corners, draggable back button. Also drives MediaCenter teardown when the
 * app's last activity is destroyed (via HookEnv.mediaBridge).
 */
public final class LifecycleHooks {

    private static final String TAG = HookEnv.TAG;
    private static final Map<Activity, BackButtonOverlay> overlays = new HashMap<>();
    private static int liveActivityCount = 0;

    private LifecycleHooks() {}

    public static void register(Application app) {
        app.registerActivityLifecycleCallbacks(new ActivityLifecycleCallbacks() {

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                liveActivityCount++;
                try {
                    if (HookEnv.config.fullscreen) {
                        applyFullscreen(activity);
                    } else {
                        applyInsetFit(activity);   // reserve system-bar space so content isn't under the nav bar
                    }
                    if (HookEnv.config.roundedCornersEnabled) {
                        applyRoundedCorners(activity);
                    }
                    // Defer back button to onActivityResumed to avoid
                    // WindowLeaked on short-lived splash/launcher activities
                    Log.d(TAG, "onActivityCreated: " + activity.getClass().getName());
                } catch (Exception e) {
                    Log.e(TAG, "onActivityCreated error", e);
                }
            }

            @Override
            public void onActivityStarted(Activity activity) { /* no-op */ }

            @Override
            public void onActivityResumed(Activity activity) {
                try {
                    if (HookEnv.config.fullscreen) {
                        applyFullscreen(activity);
                    } else {
                        applyInsetFit(activity);   // reserve system-bar space (nav bar) on resume
                    }
                    // Attach back button on resume (not create) to avoid
                    // WindowLeaked on splash activities that finish() immediately.
                    // Also skip if the activity is already finishing — a
                    // fast splash/UID-onboarding activity can resume while
                    // finishing, and adding a window to a dying activity token
                    // leaks it (WindowLeaked BackButtonView).
                    // backButton.onlySettings=true switches the button to the
                    // settings-only mode (digits instead of the arrow, tap
                    // opens the menu instead of going back).
                    if (HookEnv.config.backButtonEnabled
                            && !activity.isFinishing()
                            && !overlays.containsKey(activity)) {
                        BackButtonOverlay overlay = new BackButtonOverlay();
                        overlay.attach(activity);
                        overlays.put(activity, overlay);
                    }
                    // Density is applied automatically via getDisplayMetrics /
                    // getConfiguration afterCall hooks — no per-activity re-apply needed.
                } catch (Exception e) {
                    Log.e(TAG, "onActivityResumed error", e);
                }
            }

            @Override
            public void onActivityPaused(Activity activity) { /* no-op */ }

            @Override
            public void onActivityStopped(Activity activity) {
                // Tear the overlay down when the activity is no longer visible.
                // onActivityResumed re-attaches it if the activity comes back.
                // This guarantees the overlay window is gone BEFORE a fast
                // activity is destroyed, closing the WindowLeaked race.
                try {
                    BackButtonOverlay overlay = overlays.remove(activity);
                    if (overlay != null) {
                        overlay.detach();
                    }
                } catch (Exception e) {
                    Log.e(TAG, "onActivityStopped detach error", e);
                }
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                /* no-op */
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                try {
                    BackButtonOverlay overlay = overlays.remove(activity);
                    if (overlay != null) {
                        overlay.detach();
                    }
                    // Media bridge: when the app's last activity is gone, the app
                    // is (about to be) backgrounded/killed — unregister from
                    // MediaCenter so we don't leave a stale client. Bridge re-binds
                    // on next setActive if the app comes back.
                    if (liveActivityCount > 0) {
                        liveActivityCount--;
                    }
                    if (HookEnv.mediaBridge != null && liveActivityCount == 0) {
                        HookEnv.mediaBridge.teardown();
                    }
                    Log.d(TAG, "onActivityDestroyed: " + activity.getClass().getName());
                } catch (Exception e) {
                    Log.e(TAG, "onActivityDestroyed cleanup error", e);
                }
            }
        });
        Log.i(TAG, "ActivityLifecycleCallbacks registered");
    }

    // Non-fullscreen counterpart of applyFullscreen: make the window's decor
    // FIT the system bars, so content (e.g. Waze's "Where to?" bottom sheet) is
    // laid out ABOVE the nav bar instead of drawing under it. Many apps declare
    // an edge-to-edge window (DRAWS_SYSTEM_BAR_BACKGROUNDS); this reverses that.
    // Pure android.view.Window framework API — no app code touched.
    private static void applyInsetFit(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                // API 30+: decor fits system windows → content insets reserve the bars
                window.setDecorFitsSystemWindows(true);
                View decorView = window.getDecorView();
                WindowInsetsController controller = decorView.getWindowInsetsController();
                if (controller != null) {
                    // ensure the bars are shown (we are NOT hiding them here)
                    controller.show(WindowInsets.Type.statusBars()
                            | WindowInsets.Type.navigationBars());
                }
            } else {
                // API 28-29: clear the edge-to-edge layout flags so the view
                // hierarchy is inset by the system bars.
                View decorView = window.getDecorView();
                decorView.setSystemUiVisibility(
                        decorView.getSystemUiVisibility()
                                & ~View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                                & ~View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                                & ~View.SYSTEM_UI_FLAG_FULLSCREEN
                                & ~View.SYSTEM_UI_FLAG_HIDE_NAVIGATION);
            }
        } catch (Exception e) {
            Log.e(TAG, "applyInsetFit error", e);
        }
    }

    private static void applyFullscreen(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            View decorView = window.getDecorView();

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                // API 30+ (Android 11+, but target is Android 12)
                WindowInsetsController controller = decorView.getWindowInsetsController();
                if (controller != null) {
                    controller.hide(WindowInsets.Type.statusBars()
                            | WindowInsets.Type.navigationBars());
                    controller.setSystemBarsBehavior(
                            WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                }
            } else {
                // Fallback for API 28-29
                decorView.setSystemUiVisibility(
                        View.SYSTEM_UI_FLAG_FULLSCREEN
                                | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                                | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                                | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                                | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                                | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
            }
        } catch (Exception e) {
            Log.e(TAG, "applyFullscreen error", e);
        }
    }

    private static void applyRoundedCorners(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            View decorView = window.getDecorView();
            float density = activity.getResources().getDisplayMetrics().density;
            float radiusPx = HookEnv.config.roundedCornersRadius * density;

            decorView.setOutlineProvider(new RoundedCornersProvider(radiusPx));
            decorView.setClipToOutline(true);
        } catch (Exception e) {
            Log.e(TAG, "applyRoundedCorners error", e);
        }
    }
}
