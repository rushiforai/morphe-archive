/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.shorts;

import android.os.Build;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;

@SuppressWarnings("deprecation")
final class ShortsStatusBar {
    private static final int LEGACY_FLAGS = View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;

    private final Window window;
    private final View decor;
    private boolean entered;
    private int addedFlags;
    private WindowInsetsController controller;
    private int previousBehavior;
    private boolean changedBehavior;

    ShortsStatusBar(Window window) {
        this.window = window;
        decor = window.getDecorView();
    }

    void enter() {
        if (entered) return;

        if (isWindowFullscreen()) {
            entered = true;
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            enterModern();
        } else {
            enterLegacy();
        }
    }

    private boolean isWindowFullscreen() {
        return (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_FULLSCREEN) != 0;
    }

    private void enterModern() {
        WindowInsets insets = decor.getRootWindowInsets();
        WindowInsetsController currentController = window.getInsetsController();
        if (insets == null || currentController == null) return;

        entered = true;
        if (!insets.isVisible(WindowInsets.Type.statusBars())) return;

        controller = currentController;
        int immersive = WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE;
        previousBehavior = controller.getSystemBarsBehavior();
        changedBehavior = previousBehavior != immersive;
        if (changedBehavior) controller.setSystemBarsBehavior(immersive);
        controller.hide(WindowInsets.Type.statusBars());
    }

    private void enterLegacy() {
        // Called after a layout. Check both decor flags and flags aggregated from its descendants.
        entered = true;
        int flags = decor.getSystemUiVisibility();
        if (((flags | decor.getWindowSystemUiVisibility()) & View.SYSTEM_UI_FLAG_FULLSCREEN) != 0) return;

        addedFlags = LEGACY_FLAGS & ~flags;
        decor.setSystemUiVisibility(flags | addedFlags);
    }

    void exit() {
        entered = false;
        if (addedFlags != 0) {
            decor.setSystemUiVisibility(decor.getSystemUiVisibility() & ~addedFlags);
            addedFlags = 0;
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && controller != null) {
            if (changedBehavior && controller.getSystemBarsBehavior()
                    == WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE) {
                controller.setSystemBarsBehavior(previousBehavior);
            }
            if (!isWindowFullscreen()) controller.show(WindowInsets.Type.statusBars());
            controller = null;
        }
    }
}
