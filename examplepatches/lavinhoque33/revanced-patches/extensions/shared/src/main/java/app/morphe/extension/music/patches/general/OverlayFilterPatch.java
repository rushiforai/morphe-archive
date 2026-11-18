/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-18.
 */

package app.morphe.extension.music.patches.general;

import static android.view.WindowManager.LayoutParams.FLAG_DIM_BEHIND;

import android.app.Dialog;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.Window;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.settings.Setting;

@SuppressWarnings("unused")
public final class OverlayFilterPatch {
    /** Only restore the bit for windows where this patch cleared it. Accessed on the UI thread. */
    private static final Set<Window> windowsWithSuppressedDim = Collections.newSetFromMap(new WeakHashMap<>());

    public static void updateDialogDim(Dialog dialog) {
        updateWindowDim(dialog.getWindow());
    }

    static void updateWindowDim(Window window) {
        if (window == null) return;

        if (Settings.HIDE_OVERLAY_FILTER.get()) {
            if ((window.getAttributes().flags & FLAG_DIM_BEHIND) != 0) {
                windowsWithSuppressedDim.add(window);
                window.clearFlags(FLAG_DIM_BEHIND);
            }
        } else if (windowsWithSuppressedDim.remove(window)) {
            window.addFlags(FLAG_DIM_BEHIND);
        }
    }

    public static void drawMenuScrim(Canvas canvas, Paint paint) {
        if (!Settings.HIDE_OVERLAY_FILTER.get()) {
            canvas.drawPaint(paint);
        }
    }

    public static void trackPlayerScrim(View view) {
        if (view == null) return;

        PlayerScrim scrim = new PlayerScrim(view);
        view.addOnAttachStateChangeListener(scrim);
        if (view.isAttachedToWindow()) {
            scrim.onViewAttachedToWindow(view);
        } else {
            scrim.updateBackground();
        }
    }

    private static final class PlayerScrim
            implements View.OnAttachStateChangeListener, SharedPreferences.OnSharedPreferenceChangeListener {
        private final View view;
        private Drawable hiddenBackground;

        PlayerScrim(View view) {
            this.view = view;
        }

        @Override
        public void onViewAttachedToWindow(View attached) {
            Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(this);
            updateBackground();
        }

        @Override
        public void onViewDetachedFromWindow(View detached) {
            Setting.preferences.preferences.unregisterOnSharedPreferenceChangeListener(this);
        }

        @Override
        public void onSharedPreferenceChanged(SharedPreferences preferences, String key) {
            if (Settings.HIDE_PLAYER_OVERLAY_FILTER.key.equals(key)) updateBackground();
        }

        private void updateBackground() {
            Drawable background = view.getBackground();
            if (Settings.HIDE_PLAYER_OVERLAY_FILTER.get()) {
                if (background != null) {
                    hiddenBackground = background;
                    view.setBackground(null);
                }
            } else if (hiddenBackground != null) {
                if (background == null) view.setBackground(hiddenBackground);
                hiddenBackground = null;
            }
        }
    }
}
