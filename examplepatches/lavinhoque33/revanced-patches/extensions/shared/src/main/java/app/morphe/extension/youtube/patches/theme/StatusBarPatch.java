/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Portions of this file are modified by anddea:
 * Copyright (C) 2026 anddea
 * https://github.com/anddea/revanced-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-17.
 */

package app.morphe.extension.youtube.patches.theme;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.view.View;
import android.view.WindowInsets;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import app.morphe.extension.youtube.patches.HideStatusBarPatch;
import app.morphe.extension.youtube.patches.general.NavigationButtonsPatch;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.patches.theme.ThemePatch.StatusBarTranslucency;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public final class StatusBarPatch {
    /**
     * The view the app dims the status bar with. It is empty and the app owns its height and
     * visibility, so only its color is taken over.
     */
    private static final int STATUS_BAR_VIEW = ResourceUtils.getIdentifier(
            ResourceType.ID, "global_status_bar_view");

    /**
     * Injection point. Applies the setting to the overlay itself, including colors that bypass
     * the top-bar fallback hook. Alpha suppresses its drawing without changing system insets,
     * layout space, or the visibility controlled by YouTube's fullscreen handling.
     */
    public static void apply(View bottomBarContainer) {
        StatusBarTranslucency translucency = Settings.STATUS_BAR_TRANSLUCENCY.get();
        if (translucency == StatusBarTranslucency.DEFAULT || STATUS_BAR_VIEW == 0) return;

        try {
            View statusBarView = bottomBarContainer.getRootView().findViewById(STATUS_BAR_VIEW);
            if (statusBarView != null) {
                if (translucency == StatusBarTranslucency.TRANSPARENT) {
                    statusBarView.setAlpha(0);
                } else {
                    // Painted as the foreground, so the dimming the app keeps writing into
                    // the background of this view never shows through again.
                    statusBarView.setForeground(new ColorDrawable(BaseThemeUtils.getAppBackgroundColor()));
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not apply status bar translucency", ex);
        }
    }

    /**
     * Injection point.
     * <p>
     * The status bar background view is sized with the stable status bar inset,
     * so when the status bar is hidden it covers the search bar and channel page top bar.
     */
    public static void hideStatusBarBackground(View view) {
        if (HideStatusBarPatch.isEnabled() || !isStatusBarVisible(view.getRootView())) {
            view.setVisibility(View.INVISIBLE);
        } else {
            // Keep the selected translucency when the system status bar is visible.
            apply(view);
        }
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

    /** Window position from the previous app start, kept stable throughout this session. */
    private static final boolean WINDOW_ABOVE_NAVIGATION_BAR = Settings.WINDOW_ABOVE_NAVIGATION_BAR.get();

    /** Keep all readers on one value for the entire session, including before the first flag read. */
    private static final boolean EDGE_TO_EDGE_TOP_BAR_TURNED_OFF =
            HideStatusBarPatch.isEnabled() || Settings.WINDOW_BELOW_STATUS_BAR.get();
    @Nullable
    private static volatile Boolean edgeToEdgeTopBarUsed;

    public static Boolean isEdgeToEdgeTopBar() {
        return EDGE_TO_EDGE_TOP_BAR_TURNED_OFF ? Boolean.FALSE : edgeToEdgeTopBarUsed;
    }

    public static boolean isWindowAboveNavigationBar() {
        return WINDOW_ABOVE_NAVIGATION_BAR;
    }

    /** Injection point. Top-bar layout and its consumers must use the same edge-to-edge state. */
    public static boolean useEdgeToEdgeTopBar(boolean original) {
        Boolean value = edgeToEdgeTopBarUsed;
        if (value == null) {
            synchronized (StatusBarPatch.class) {
                value = edgeToEdgeTopBarUsed;
                if (value == null) {
                    value = original && !EDGE_TO_EDGE_TOP_BAR_TURNED_OFF;
                    edgeToEdgeTopBarUsed = value;
                }
            }
        }
        return value;
    }

    /** Scrolling color needs the edge-to-edge overlay, otherwise the first scroll can crash. */
    public static boolean useStatusBarScrollColor(boolean original) {
        Boolean edgeToEdge = edgeToEdgeTopBarUsed;
        return original && (edgeToEdge == null ? !EDGE_TO_EDGE_TOP_BAR_TURNED_OFF : edgeToEdge);
    }

    /**
     * Some devices keep the window out of the status bar area, for example Samsung devices with
     * the app not allowed to use the camera cutout area. The edge to edge top bar still makes room
     * for the status bar above the top bars, which is then drawn as a second status bar below
     * the real one and covers the top bars (https://github.com/MorpheApp/morphe-patches/issues/2969).
     * <p>
     * The flag is read before the window is laid out, so the position is saved and the flag is
     * turned off from the next app start. Only the full screen window in portrait with the status bar
     * shown is checked, where the status bar is above the window.
     * <p>
     * The same way, a window drawn edge to edge is expected to end behind the system navigation
     * buttons, which the navigation bar covering them relies on. Some devices and Android versions
     * keep it above them, and the room for them is then added twice, see
     * {@link NavigationButtonsPatch#useTranslucentNavigationBar(boolean)}. The bottom of the window is
     * saved, and the flags of the translucent navigation bar are turned off from the next app start.
     */
    @RequiresApi(api = Build.VERSION_CODES.R)
    public static void watchWindowPosition(Activity activity) {
        View decorView = activity.getWindow().getDecorView();
        // Width, height and status bar visibility of the window last checked,
        // so the position is only read when they change.
        final int[] lastSize = {-1, -1, -1};
        final int[] location = new int[2];

        decorView.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
            try {
                WindowInsets insets = decorView.getRootWindowInsets();
                // The keyboard can resize the window on some devices.
                if (insets == null || insets.isVisible(WindowInsets.Type.ime())
                        || activity.isInMultiWindowMode() || activity.isInPictureInPictureMode()
                        || activity.getResources().getConfiguration().orientation
                        != Configuration.ORIENTATION_PORTRAIT) {
                    return;
                }

                final int width = decorView.getWidth();
                final int height = decorView.getHeight();
                final boolean statusBarVisible = insets.isVisible(WindowInsets.Type.statusBars());
                final int statusBar = statusBarVisible ? 1 : 0;
                if ((width == lastSize[0] && height == lastSize[1] && statusBar == lastSize[2])
                        || width == 0 || height == 0) {
                    return;
                }
                lastSize[0] = width;
                lastSize[1] = height;
                lastSize[2] = statusBar;

                decorView.getLocationOnScreen(location);
                final int windowTop = location[1];
                final int windowBottom = windowTop + height;
                final int displayHeight = activity.getWindowManager().getMaximumWindowMetrics().getBounds().height();
                Logger.printDebug(() -> "Window top: " + windowTop + " bottom: " + windowBottom
                        + " display height: " + displayHeight
                        + " status bar inset: " + insets.getInsets(WindowInsets.Type.statusBars()).top
                        + " stable: " + insets.getInsetsIgnoringVisibility(WindowInsets.Type.statusBars()).top
                        + " cutout: " + insets.getInsets(WindowInsets.Type.displayCutout()).top
                        + " navigation bar inset: " + insets.getInsets(WindowInsets.Type.navigationBars()).bottom);

                // Without the edge to edge top bar the app itself can lay the window out below
                // the status bar (it uses the default display cutout mode on Android 14 and lower)
                // and above the system navigation buttons, so only a window that was drawn edge to edge
                // tells that the device keeps it there. Otherwise the flags would stay off for good
                // after one app start without them.
                final boolean edgeToEdge = Boolean.TRUE.equals(edgeToEdgeTopBarUsed);

                if (statusBarVisible) {
                    final boolean belowStatusBar = windowTop > 0;
                    if ((!belowStatusBar || edgeToEdge)
                            && belowStatusBar != Settings.WINDOW_BELOW_STATUS_BAR.get()) {
                        Settings.WINDOW_BELOW_STATUS_BAR.save(belowStatusBar);
                    }
                }

                // Only with the system navigation buttons at the bottom of the screen. The navigation bar
                // covering them can change how the window is laid out, so only a window laid out with it
                // tells that the device keeps the window above them. On Android 15 and later the navigation
                // bar covers them also without the edge to edge top bar, such as with the status bar hidden.
                if ((edgeToEdge || NavigationButtonsPatch.isNavigationBarCoveringSystemButtons())
                        && insets.isVisible(WindowInsets.Type.navigationBars())
                        && insets.getInsetsIgnoringVisibility(WindowInsets.Type.navigationBars()).bottom > 0) {
                    final boolean aboveNavigationBar = windowBottom < displayHeight;
                    if ((!aboveNavigationBar || NavigationButtonsPatch.isNavigationBarCoveringSystemButtons())
                            && aboveNavigationBar != Settings.WINDOW_ABOVE_NAVIGATION_BAR.get()) {
                        Logger.printDebug(() -> "Window above navigation bar: " + aboveNavigationBar
                                + ", applied from the next app start");
                        Settings.WINDOW_ABOVE_NAVIGATION_BAR.save(aboveNavigationBar);
                    }
                }
            } catch (Exception ex) {
                Logger.printException(() -> "watchWindowPosition failure", ex);
            }
        });
    }

    private StatusBarPatch() {
    }
}
