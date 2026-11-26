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
 * Modified by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.shared.patches.glassmenus;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupWindow;

import androidx.annotation.ChecksSdkIntAtLeast;
import androidx.annotation.ColorInt;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import java.util.WeakHashMap;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Glass menus for YouTube and YouTube Music. Unhooked surfaces keep the stock presentation. */
@SuppressWarnings("unused")
public final class GlassMenusPatch {
    @Nullable private static WeakHashMap<View, Boolean> landscapePlayerGearRoots;

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

    public static void onBottomSheetStarting(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        attachBottomSheet(dialog, true);
    }

    public static void onBottomSheetDialog(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        attachBottomSheet(dialog, false);
    }

    /** Receives only the native Gear fragment's returned view, not generic sheet content. */
    public static void markLandscapePlayerGearView(@Nullable View root) {
        if (root == null || !isEnabled() || !isLandscape(root)) return;
        View panel = gearFill(root);
        if (panel == null || Color.alpha(SolidColors.colorOf(panel.getBackground())) < 0xF0) return;

        if (landscapePlayerGearRoots == null) landscapePlayerGearRoots = new WeakHashMap<>();
        landscapePlayerGearRoots.put(root, Boolean.TRUE);
    }

    @Nullable
    static View landscapePlayerGearPanel(View sheetHost) {
        if (landscapePlayerGearRoots == null || !(sheetHost instanceof ViewGroup host)
                || host.getChildCount() != 1) return null;

        View root = host.getChildAt(0);
        return landscapePlayerGearRoots.containsKey(root) && isLandscape(root) ? gearFill(root) : null;
    }

    @Nullable
    private static View gearFill(View root) {
        if (!(root instanceof FrameLayout frame) || frame.getChildCount() != 1) return null;

        // The stock fragment puts the rounded fill and grip in this inner column. The outer
        // Material host is a touch/layout container and must retain its own background.
        View panel = frame.getChildAt(0);
        return panel instanceof LinearLayout && panel.getClipToOutline() ? panel : null;
    }

    private static boolean isLandscape(View view) {
        return view.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static void attachBottomSheet(Dialog dialog, boolean beforeShow) {
        try {
            Window window = dialog.getWindow();
            if (window == null) return;

            View decor = window.peekDecorView();
            if (decor == null) return;

            View panelHost = findView(decor, "design_bottom_sheet");
            if (panelHost != null) {
                View playerPanel = landscapePlayerGearPanel(panelHost);
                if (playerPanel == null) {
                    GlassSurface.apply(panelHost, panelHost, window, dialog.getOwnerActivity(),
                            GlassSurface.Shape.BOTTOM_SHEET, beforeShow);
                } else {
                    GlassSurface.apply(playerPanel, playerPanel, window, dialog.getOwnerActivity(),
                            GlassSurface.Shape.LANDSCAPE_PLAYER, beforeShow);
                }
            }
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass bottom sheet", ex);
        }
    }

    public static void onDialogBeforeShow(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        attachWindowPanel(dialog, true);
    }

    public static void onDialogShown(@Nullable Dialog dialog) {
        if (dialog == null || !isEnabled()) return;

        attachWindowPanel(dialog, false);
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static void attachWindowPanel(Dialog dialog, boolean beforeShow) {
        try {
            Window window = dialog.getWindow();
            if (window == null) return;

            View decor = window.peekDecorView();
            if (decor == null || findView(decor, "design_bottom_sheet") != null) return;

            // Late-configured fragments (including Quality) keep stock dim. Observe their final
            // synchronous layout at the first traversal, without posting past the draw.
            if (beforeShow && !isConfiguredWindowPanel(window, decor)) {
                return;
            }
            GlassSurface.apply(decor, decor, window, dialog.getOwnerActivity(),
                    GlassSurface.Shape.WINDOW_PANEL, beforeShow);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass dialog panel", ex);
        }
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static boolean isConfiguredWindowPanel(Window window, View decor) {
        WindowManager.LayoutParams attributes = window.getAttributes();
        if (attributes.height != WindowManager.LayoutParams.WRAP_CONTENT
                || (attributes.gravity & Gravity.VERTICAL_GRAVITY_MASK) != Gravity.BOTTOM) return false;

        return GlassSurface.isThemeMenuColor(decor.getContext(), SolidColors.colorOf(decor.getBackground()));
    }

    public static void onSlideDialog(@Nullable Dialog dialog, @Nullable View panel, Context context) {
        attachSlideDialog(dialog, panel, context, false);
    }

    public static void onOverlayVideoQualityDialog(@Nullable Dialog dialog, @Nullable View panel, Context context) {
        attachSlideDialog(dialog, panel, context, true);
    }

    private static void attachSlideDialog(
            @Nullable Dialog dialog, @Nullable View panel, Context context, boolean playerMenu) {
        if (dialog == null || panel == null || !isEnabled()) return;

        try {
            Window window = dialog.getWindow();
            if (window == null) return;

            Activity owner = dialog.getOwnerActivity();
            if (owner == null) owner = BlurRegion.contextActivity(context);

            GlassSurface.Shape shape = playerMenu && isLandscape(panel)
                    ? GlassSurface.Shape.LANDSCAPE_PLAYER : GlassSurface.Shape.ROUNDED;
            GlassSurface.apply(panel, panel, window, owner, shape, true);
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass slide dialog", ex);
        }
    }

    public static void onPopupWindow(@Nullable PopupWindow popup) {
        if (popup == null || !isEnabled() || !popup.isShowing()) return;

        try {
            View content = popup.getContentView();
            if (content != null) {
                // showAtLocation has built the framework wrapper, but the first traversal has not drawn.
                View panel = GlassSurface.findPopupPanel(content);
                if (panel != null) GlassSurface.apply(panel, panel, null, null, GlassSurface.Shape.POPUP, false);
            }
        } catch (RuntimeException ex) {
            Logger.printException(() -> "Could not attach glass popup", ex);
        }
    }

    public static void onAddToPlaylistView(@Nullable View root) {
        if (root == null || !isEnabled()) return;

        try {
            View list = findView(root, "list");
            if (list != null) {
                GlassSurface.apply(list, root, null, null, GlassSurface.Shape.PLAYLIST_LIST, false);
            }

            View closeBar = findView(root, "add_to_playlist_bottom_sheet_close_button");
            if (closeBar != null && closeBar != list) {
                GlassSurface.apply(closeBar, root, null, null, GlassSurface.Shape.FLAT, false);
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
