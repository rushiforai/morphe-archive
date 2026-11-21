/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.general;

import android.graphics.Insets;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;

import androidx.annotation.RequiresApi;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.youtube.settings.Settings;

/** Colors only the portion of the window occupied by Android's navigation controls. */
@RequiresApi(Build.VERSION_CODES.TIRAMISU)
@SuppressWarnings("deprecation")
final class SystemNavigationBarAppearance implements ViewTreeObserver.OnPreDrawListener,
        View.OnAttachStateChangeListener {
    // The decor owns its listener. A weak value avoids retaining the decor through that listener.
    private static final WeakHashMap<View, WeakReference<SystemNavigationBarAppearance>> appearances =
            new WeakHashMap<>();

    private final Window window;
    private final View decor;
    private final boolean opaqueLight;
    private final boolean opaqueDark;

    private int nativeColor;
    private int appliedWindowColor;
    private ColorDrawable background;
    private boolean backgroundAdded;

    static int getColor(Window window, int original) {
        final boolean light = Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_LIGHT.get();
        final boolean dark = Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_DARK.get();
        if (!light && !dark) return original;

        final View decor = window.getDecorView();
        WeakReference<SystemNavigationBarAppearance> existing = appearances.get(decor);
        SystemNavigationBarAppearance appearance = existing == null ? null : existing.get();
        if (appearance == null) {
            appearance = new SystemNavigationBarAppearance(window, decor, light, dark);
            appearances.put(decor, new WeakReference<>(appearance));
        }

        appearance.nativeColor = original;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) return original;

        appearance.appliedWindowColor = appearance.useOpaqueTheme() ? opaqueColor(original) : original;
        return appearance.appliedWindowColor;
    }

    private SystemNavigationBarAppearance(Window window, View decor, boolean opaqueLight, boolean opaqueDark) {
        this.window = window;
        this.decor = decor;
        this.opaqueLight = opaqueLight;
        this.opaqueDark = opaqueDark;

        decor.addOnAttachStateChangeListener(this);
        if (decor.isAttachedToWindow()) onViewAttachedToWindow(decor);
    }

    private boolean useOpaqueTheme() {
        return BaseThemeUtils.isAppThemeResolved()
                && (BaseThemeUtils.isDarkModeEnabled() ? opaqueDark : opaqueLight);
    }

    private static int opaqueColor(int original) {
        return OpaqueSystemBars.systemNavigationBarColor(original) | 0xFF000000;
    }

    @Override
    public boolean onPreDraw() {
        try {
            final boolean opaque = useOpaqueTheme();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
                updateBackground(opaque);
            } else {
                updateWindowColor(opaque);
            }
        } catch (Exception ex) {
            removeBackground();
            decor.getViewTreeObserver().removeOnPreDrawListener(this);
            decor.removeOnAttachStateChangeListener(this);
            Logger.printException(() -> "Could not update the system navigation bar appearance", ex);
        }
        return true;
    }

    private void updateWindowColor(boolean opaque) {
        final int color = opaque ? opaqueColor(nativeColor) : nativeColor;
        if (color == appliedWindowColor) return;

        // Theme resolution can follow the native color hook. Do not overwrite a newer, unrelated
        // Window color (for example when a fullscreen player has taken ownership).
        if (window.getNavigationBarColor() == appliedWindowColor) {
            window.setNavigationBarColor(color);
        }
        appliedWindowColor = color;
    }

    private void updateBackground(boolean opaque) {
        if (!opaque) {
            removeBackground();
            return;
        }

        final WindowInsets insets = decor.getRootWindowInsets();
        if (insets == null || insets.isVisible(WindowInsets.Type.ime())) {
            removeBackground();
            return;
        }

        final Insets edges = insets.getInsets(WindowInsets.Type.navigationBars());
        final int width = decor.getWidth();
        final int height = decor.getHeight();
        if (width == 0 || height == 0 || Insets.NONE.equals(edges)) {
            removeBackground();
            return;
        }

        final int color = opaqueColor(nativeColor);
        if (background == null) background = new ColorDrawable(color);
        if (background.getColor() != color) background.setColor(color);
        if (edges.bottom > 0 && edges.bottom < height) {
            background.setBounds(0, height - edges.bottom, width, height);
        } else if (edges.right > 0 && edges.right < width) {
            background.setBounds(width - edges.right, 0, width, height);
        } else if (edges.left > 0 && edges.left < width) {
            background.setBounds(0, 0, edges.left, height);
        } else {
            removeBackground();
            return;
        }

        // Android 15+ enforces edge-to-edge for the supported YouTube versions. The drawable
        // leaves native icon/contrast decisions, insets, and the separate glass capsule alone.
        if (!backgroundAdded) {
            decor.getOverlay().add(background);
            backgroundAdded = true;
        }
    }

    private void removeBackground() {
        if (backgroundAdded) {
            decor.getOverlay().remove(background);
            backgroundAdded = false;
        }
    }

    @Override
    public void onViewAttachedToWindow(View view) {
        view.getViewTreeObserver().addOnPreDrawListener(this);
    }

    @Override
    public void onViewDetachedFromWindow(View view) {
        view.getViewTreeObserver().removeOnPreDrawListener(this);
        removeBackground();
    }
}
