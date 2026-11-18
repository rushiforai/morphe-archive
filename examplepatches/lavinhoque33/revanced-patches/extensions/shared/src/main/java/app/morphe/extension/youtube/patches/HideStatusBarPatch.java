/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3337
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-16.
 * Modified by lavinhoque33, 2026-11-17.
 */

package app.morphe.extension.youtube.patches;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.view.DisplayCutout;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import kotlin.Unit;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.patches.theme.StatusBarPatch;
import app.morphe.extension.youtube.patches.general.GlassNavigationBar;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;

@SuppressWarnings({"unused", "deprecation"})
public final class HideStatusBarPatch {
    private static final boolean HIDE_STATUS_BAR = isPatchIncluded() && Settings.HIDE_STATUS_BAR.get();
    private static final Set<Activity> mainActivities = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Set<Activity> activities = Collections.newSetFromMap(new WeakHashMap<>());
    private static boolean callbacksRegistered;
    private static volatile boolean isWatchingVideo;

    private static boolean isPatchIncluded() {
        return false;
    }

    public static boolean isEnabled() {
        return HIDE_STATUS_BAR;
    }

    private static final Application.ActivityLifecycleCallbacks ACTIVITY_CALLBACKS =
            new Application.ActivityLifecycleCallbacks() {
        public void onActivityStarted(@NonNull Activity activity) {
            try {
                if (mainActivities.remove(activity) && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    StatusBarPatch.watchWindowPosition(activity);
                }

                if (HIDE_STATUS_BAR) {
                    hideStatusBar(activity);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Status bar activity start failure", ex);
            }
        }

        public void onActivityCreated(@NonNull Activity activity, @Nullable Bundle state) {}
        public void onActivityResumed(@NonNull Activity activity) {}
        public void onActivityPaused(@NonNull Activity activity) {}
        public void onActivityStopped(@NonNull Activity activity) {}
        public void onActivitySaveInstanceState(@NonNull Activity activity, @NonNull Bundle state) {}
        public void onActivityDestroyed(@NonNull Activity activity) {}
    };

    /** Injection point. Both patches share this lifecycle owner, before the main window is created. */
    public static void initialize(Activity activity) {
        mainActivities.add(activity);
        if (callbacksRegistered) {
            return;
        }

        activity.getApplication().registerActivityLifecycleCallbacks(ACTIVITY_CALLBACKS);
        callbacksRegistered = true;

        if (HIDE_STATUS_BAR) {
            PlayerType.getOnChange().addObserver((PlayerType type) -> {
                final boolean watchingVideo = type == PlayerType.WATCH_WHILE_MAXIMIZED;
                if (watchingVideo != isWatchingVideo) {
                    isWatchingVideo = watchingVideo;
                    for (Activity hiddenActivity : activities) {
                        hiddenActivity.getWindow().getDecorView().requestApplyInsets();
                    }
                }
                return Unit.INSTANCE;
            });
        }
    }

    private static boolean canHideStatusBar(Activity activity) {
        return !activity.isInPictureInPictureMode() && !activity.isInMultiWindowMode()
                && !activity.isFinishing() && !activity.isDestroyed();
    }

    private static void hideStatusBar(Activity activity) {
        if (!activities.add(activity)) {
            return;
        }

        Window window = activity.getWindow();
        View decorView = window.getDecorView();
        if (canHideStatusBar(activity)) {
            hideStatusBar(window, decorView);
        }

        decorView.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            if (canHideStatusBar(activity) && isStatusBarVisible(decorView)) {
                hideStatusBar(window, decorView);
            }
        });
        addDisplayCutoutInset(activity, window);

        if (GlassNavigationBar.isEnabled()) {
            rehideWhenWindowRegainsFocus(activity, window, decorView);
        }
    }

    /** Settings submenus use their own window; their toolbar already accounts for the cutout. */
    public static void hideStatusBar(Dialog dialog) {
        if (!HIDE_STATUS_BAR) {
            return;
        }

        try {
            Window window = dialog.getWindow();
            if (window == null) {
                return;
            }

            View decorView = window.getDecorView();
            hideStatusBar(window, decorView);
            decorView.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                if (decorView.hasWindowFocus() && isStatusBarVisible(decorView)) {
                    hideStatusBar(window, decorView);
                }
            });
        } catch (Exception ex) {
            Logger.printException(() -> "Status bar dialog failure", ex);
        }
    }

    /** Injection point. Stable insets retain the hidden bar; only the cutout should reserve room. */
    public static void setSystemWindowInsetTop(Rect systemWindowInsets, @Nullable View view) {
        if (!HIDE_STATUS_BAR || view == null) {
            return;
        }

        try {
            View decorView = view.getRootView();
            WindowInsets insets = decorView.getRootWindowInsets();
            if (insets != null && !isStatusBarVisible(decorView)) {
                systemWindowInsets.top = HideStatusBarPolicy.topInset(isWatchingVideo, getDisplayCutoutInsetTop(insets));
            }
        } catch (Exception ex) {
            Logger.printException(() -> "setSystemWindowInsetTop failure", ex);
        }
    }

    private static int getDisplayCutoutInsetTop(WindowInsets insets) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return insets.getInsets(WindowInsets.Type.displayCutout()).top;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            DisplayCutout cutout = insets.getDisplayCutout();
            return cutout == null ? 0 : cutout.getSafeInsetTop();
        }
        return 0;
    }

    private static void addDisplayCutoutInset(Activity activity, Window window) {
        View content = window.findViewById(android.R.id.content);
        if (content == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.P) {
            return;
        }

        content.setOnApplyWindowInsetsListener((view, insets) -> {
            if (!canHideStatusBar(activity)) {
                return view.onApplyWindowInsets(insets);
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                Insets cutout = insets.getInsets(WindowInsets.Type.displayCutout());
                Insets statusBars = insets.getInsets(WindowInsets.Type.statusBars());
                if (!insets.isVisible(WindowInsets.Type.statusBars()) && cutout.top > statusBars.top) {
                    insets = new WindowInsets.Builder(insets)
                            .setInsets(WindowInsets.Type.statusBars(),
                                    Insets.of(statusBars.left, cutout.top, statusBars.right, statusBars.bottom))
                            .build();
                }
            } else {
                DisplayCutout cutout = insets.getDisplayCutout();
                if (cutout != null && cutout.getSafeInsetTop() > insets.getSystemWindowInsetTop()) {
                    insets = insets.replaceSystemWindowInsets(insets.getSystemWindowInsetLeft(),
                            cutout.getSafeInsetTop(), insets.getSystemWindowInsetRight(),
                            insets.getSystemWindowInsetBottom());
                }
            }
            return view.onApplyWindowInsets(insets);
        });
    }

    /**
     * The layout listener above is the only way the status bar is hidden again, and it only runs when a layout
     * pass sees the status bar shown. After the app was stopped, for example by opening another app from
     * the miniplayer, it is not guaranteed to run once the system shows the bar again, so the bar is also
     * hidden again when the window has the focus back.
     * <p>
     * The hide request runs from a posted message, after the app handled the focus change itself.
     * It is only added with glass, so without glass nothing changes.
     */
    private static void rehideWhenWindowRegainsFocus(Activity activity, Window window, View decorView) {
        decorView.getViewTreeObserver().addOnWindowFocusChangeListener(hasFocus -> {
            if (!hasFocus) {
                return;
            }

            decorView.post(() -> {
                try {
                    if (HideStatusBarPolicy.shouldRehideOnFocus(decorView.hasWindowFocus(),
                            activity.isInPictureInPictureMode(), activity.isInMultiWindowMode(),
                            activity.isFinishing() || activity.isDestroyed())) {
                        hideStatusBar(window, decorView);
                    }
                } catch (Exception ex) {
                    Logger.printException(() -> "rehideWhenWindowRegainsFocus failure", ex);
                }
            });
        });
    }

    private static boolean isStatusBarVisible(View decorView) {
        WindowInsets insets = decorView.getRootWindowInsets();
        if (insets == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return insets.isVisible(WindowInsets.Type.statusBars());
        }
        //noinspection deprecation
        return (decorView.getSystemUiVisibility() & View.SYSTEM_UI_FLAG_FULLSCREEN) == 0;
    }

    private static void hideStatusBar(Window window, View decorView) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            WindowInsetsController controller = window.getInsetsController();
            if (controller != null) {
                controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
                controller.hide(WindowInsets.Type.statusBars());
            }
            return;
        }
        //noinspection deprecation
        decorView.setSystemUiVisibility(decorView.getSystemUiVisibility()
                | View.SYSTEM_UI_FLAG_FULLSCREEN
                | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
    }
}
