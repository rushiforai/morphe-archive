/*
 * Copyright 2026 Morphe.
 * Copyright (C) 2026 lavinhoque33
 * https://github.com/MorpheApp/morphe-patches/pull/5107
 * https://github.com/MorpheApp/morphe-patches/pull/5123
 * https://github.com/MorpheApp/morphe-patches/pull/5128
 * https://github.com/MorpheApp/morphe-patches/pull/5130
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.PopupWindow;

import androidx.annotation.ChecksSdkIntAtLeast;
import androidx.annotation.ColorInt;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Glass menus for YouTube and YouTube Music. Unhooked surfaces keep the stock presentation. */
@SuppressWarnings("unused")
public final class GlassMenusPatch {
    public static boolean isPatchIncluded() {
        return false; // Modified during patching.
    }

    public static final class GlassMenusAvailability implements Setting.Availability {
        @Override
        @ChecksSdkIntAtLeast(api = Build.VERSION_CODES.S)
        public boolean isAvailable() {
            return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
        }
    }

    @ChecksSdkIntAtLeast(api = Build.VERSION_CODES.S)
    static boolean isEnabled() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S && SharedYouTubeSettings.GLASS_MENUS.get();
    }

    public static void onBottomSheetDialog(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        try {
            Window window = dialog.getWindow();
            if (window == null) return;

            View panelHost = findView(window.getDecorView(), "design_bottom_sheet");
            if (panelHost != null) {
                GlassSurface.apply(panelHost, panelHost, window, dialog.getOwnerActivity(),
                        GlassSurface.Shape.BOTTOM_SHEET);
            }
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass bottom sheet", ex);
        }
    }

    public static void onDialogShown(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        try {
            Window window = dialog.getWindow();
            if (window != null) {
                // The fragment may change the window layout and background immediately after Dialog.show().
                window.getDecorView().post(() -> styleWindowPanel(dialog, window));
            }
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not schedule glass dialog panel", ex);
        }
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static void styleWindowPanel(Dialog dialog, Window window) {
        if (!isEnabled() || !dialog.isShowing()) return;

        try {
            View decor = window.getDecorView();
            if (window.getAttributes().height != WindowManager.LayoutParams.WRAP_CONTENT
                    || findView(decor, "design_bottom_sheet") != null
                    || !GlassSurface.isThemeMenuColor(decor.getContext(), SolidColors.colorOf(decor.getBackground()))) {
                return;
            }

            GlassSurface.apply(decor, decor, window, dialog.getOwnerActivity(), GlassSurface.Shape.WINDOW_PANEL);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass dialog panel", ex);
        }
    }

    public static void onSlideDialog(@Nullable Dialog dialog, @Nullable View panel, Context context) {
        if (dialog == null || panel == null || !isEnabled()) return;

        try {
            Window window = dialog.getWindow();
            if (window == null) return;

            Activity owner = dialog.getOwnerActivity();
            if (owner == null) owner = BlurRegion.contextActivity(context);

            GlassSurface.apply(panel, panel, window, owner, GlassSurface.Shape.ROUNDED);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass slide dialog", ex);
        }
    }

    public static void onPopupWindow(@Nullable PopupWindow popup) {
        if (popup == null || !isEnabled()) return;

        // PopupWindow creates its background view when it is shown, not when it gets its content.
        Utils.runOnMainThreadDelayed(() -> {
            if (!isEnabled() || !popup.isShowing()) return;

            try {
                View content = popup.getContentView();
                if (content == null) return;

                View surface = content.getParent() instanceof View parent && parent.getBackground() != null
                        ? parent : content;
                GlassSurface.apply(surface, content, null, null, GlassSurface.Shape.POPUP);
            } catch (RuntimeException ex) {
                Logger.printException(() -> "Could not attach glass popup", ex);
            }
        }, 0);
    }

    public static void onAddToPlaylistView(@Nullable View root) {
        if (root == null || !isEnabled()) return;

        try {
            View list = findView(root, "list");
            if (list != null) {
                GlassSurface.apply(list, root, null, null, GlassSurface.Shape.PLAYLIST_LIST);
            }

            View closeBar = findView(root, "add_to_playlist_bottom_sheet_close_button");
            if (closeBar != null && closeBar != list) {
                GlassSurface.apply(closeBar, root, null, null, GlassSurface.Shape.FLAT);
            }
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass playlist sheet", ex);
        }
    }

    public static void onLithoBackgroundColor(Drawable drawable, @ColorInt int color) {
        if (!isEnabled()) return;

        try {
            LithoFills.onColor(drawable, color);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not identify a Litho glass menu fill", ex);
        }
    }

    @Nullable
    private static View findView(View root, String name) {
        int id = Utils.getResourceIdentifier(root.getContext(), name, "id");
        return id == 0 ? null : root.findViewById(id);
    }

    private GlassMenusPatch() {
    }
}
