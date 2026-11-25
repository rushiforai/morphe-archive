package dev.materialtidal.extension.tidal.sheets;

import android.app.Dialog;
import android.view.View;
import android.view.Window;

import dev.materialtidal.extension.tidal.theme.ExpressiveBlurKit;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Dalvik hook entrypoint for the Material 3 Expressive Bottom Sheets, Context Menus,
 * Popup/Dropdown Menus, and Dialogs patch.
 *
 * <p>Kept strictly Android-SDK-only so zero AndroidX/Compose/Kotlin classes leak into {@code tidal.mpe}.
 */
@SuppressWarnings("unused")
public final class ExpressiveSheetsBridge {

    private ExpressiveSheetsBridge() {
    }

    // ---- Runtime Config Queries ----

    public static boolean isExpressiveSheetsEnabled() {
        return MaterialYouConfig.isExpressiveSheetsEnabled();
    }

    public static boolean isExpressivePopupMenusEnabled() {
        return MaterialYouConfig.isExpressivePopupMenusEnabled();
    }

    public static boolean isExpressiveDialogsEnabled() {
        return MaterialYouConfig.isExpressiveDialogsEnabled();
    }

    // ---- Compose Material 3 Dimension & Color Tokens ----

    public static float getSheetCornerRadiusDp() {
        if (!MaterialYouConfig.isExpressiveSheetsEnabled()) {
            return 28f;
        }
        int style = MaterialYouConfig.getSheetCornerStyle();
        if (style == MaterialYouConfig.SHEET_CORNER_EXTRA_EXPRESSIVE) {
            return 32f;
        }
        if (style == MaterialYouConfig.SHEET_CORNER_ROUNDED) {
            return 20f;
        }
        return 28f;
    }

    public static float getMenuCornerRadiusDp() {
        if (!MaterialYouConfig.isExpressivePopupMenusEnabled()) {
            return 4f;
        }
        int style = MaterialYouConfig.getSheetCornerStyle();
        if (style == MaterialYouConfig.SHEET_CORNER_EXTRA_EXPRESSIVE) {
            return 24f;
        }
        if (style == MaterialYouConfig.SHEET_CORNER_ROUNDED) {
            return 16f;
        }
        return 22f;
    }

    public static float getDialogCornerRadiusDp() {
        if (!MaterialYouConfig.isExpressiveDialogsEnabled()) {
            return 28f;
        }
        int style = MaterialYouConfig.getSheetCornerStyle();
        if (style == MaterialYouConfig.SHEET_CORNER_EXTRA_EXPRESSIVE) {
            return 32f;
        }
        if (style == MaterialYouConfig.SHEET_CORNER_ROUNDED) {
            return 22f;
        }
        return 28f;
    }

    public static float getDragHandleWidthDp() {
        return MaterialYouConfig.isExpressiveSheetsEnabled() ? 40f : 32f;
    }

    public static float getDragHandleHeightDp() {
        return MaterialYouConfig.isExpressiveSheetsEnabled() ? 4.5f : 4f;
    }

    public static float getMenuItemHorizontalPaddingDp() {
        return MaterialYouConfig.isExpressivePopupMenusEnabled() ? 16f : 12f;
    }

    private static long toComposeColor(int argb) {
        return (((long) argb) & 0xFFFFFFFFL) << 32;
    }

    private static boolean isOpaqueOrNearlyOpaque(long composeColor) {
        if (composeColor == 0L) {
            return false;
        }
        int argb = (int) (composeColor >>> 32);
        return ((argb >>> 24) & 0xFF) >= 0xE0;
    }

    public static long resolveSheetContainerColorCompose(long original) {
        if (!MaterialYouConfig.isExpressiveSheetsEnabled() || !isOpaqueOrNearlyOpaque(original)) {
            return original;
        }
        return toComposeColor(MaterialYouColorEngine.getSurfaceContainer());
    }

    public static long resolveSheetContentColorCompose(long original) {
        if (!MaterialYouConfig.isExpressiveSheetsEnabled() || !isOpaqueOrNearlyOpaque(original)) {
            return original;
        }
        return toComposeColor(MaterialYouColorEngine.getOnSurface());
    }

    public static long getSheetBorderColorCompose() {
        return toComposeColor(MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x48));
    }

    public static long resolveMenuContainerColorCompose(long original) {
        if (!MaterialYouConfig.isExpressivePopupMenusEnabled() || !isOpaqueOrNearlyOpaque(original)) {
            return original;
        }
        return toComposeColor(MaterialYouColorEngine.getSurfaceContainerHigh());
    }

    public static long getMenuBorderColorCompose() {
        return toComposeColor(MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x55));
    }

    public static long resolveDialogContainerColorCompose(long original) {
        if (!MaterialYouConfig.isExpressiveDialogsEnabled() || !isOpaqueOrNearlyOpaque(original)) {
            return original;
        }
        return toComposeColor(MaterialYouColorEngine.getSurfaceContainerHigh());
    }

    public static long getDialogBorderColorCompose() {
        return toComposeColor(MaterialYouColorEngine.withAlpha(MaterialYouColorEngine.getOutlineVariant(), 0x48));
    }

    // ---- Android View / Material Dialog / Popup / Adapter Lifecycle Hooks ----

    public static void onBottomSheetDialogStart(Dialog dialog) {
        try {
            ExpressiveBottomSheetStyler.styleBottomSheetDialog(dialog);
        } catch (Throwable ignored) {
        }
    }

    public static void onContextMenuItemBound(Object adapter, Object viewHolder, int position) {
        try {
            ExpressiveBottomSheetStyler.styleContextMenuRow(adapter, viewHolder, position);
        } catch (Throwable ignored) {
        }
    }

    public static void onListPopupWindowBeforeBuild(Object listPopupWindow) {
        try {
            ExpressiveMenuAndDialogStyler.prepareListPopupWindow(listPopupWindow);
        } catch (Throwable ignored) {
        }
    }

    public static void onListPopupWindowAfterBuild(Object listPopupWindow) {
        try {
            ExpressiveMenuAndDialogStyler.styleListPopupDropDown(listPopupWindow);
        } catch (Throwable ignored) {
        }
    }

    public static void onPopupMenuItemView(Object menuAdapter, View itemView, int position) {
        try {
            ExpressiveMenuAndDialogStyler.stylePopupMenuItem(menuAdapter, itemView, position);
        } catch (Throwable ignored) {
        }
    }

    public static void onAlertControllerInstalled(Object alertController) {
        try {
            ExpressiveMenuAndDialogStyler.styleAlertController(alertController);
        } catch (Throwable ignored) {
        }
    }

    public static void onComposeBottomSheetWindowCreated(Dialog dialog) {
        if (dialog == null) {
            return;
        }
        try {
            Window window = dialog.getWindow();
            MaterialYouColorEngine.installTouchTracker(window);
            if (window != null
                    && dev.materialtidal.extension.tidal.navbar.ExpressiveScaffoldBridge.isPendingInstantSheetSnap()) {
                window.setWindowAnimations(0);
            }
            if (!MaterialYouConfig.isExpressiveSheetsEnabled()) {
                return;
            }
            float density = dialog.getContext().getResources().getDisplayMetrics().density;
            ExpressiveBlurKit.applyWindowBackdropBlur(window, 22, 0, 0.36f, 0.65f, density);
            MaterialYouColorEngine.applySystemBarAppearance(window, MaterialYouColorEngine.isLightMode(dialog.getContext()));
        } catch (Throwable ignored) {
        }
    }

    public static void onComposeDialogWindowCreated(Dialog dialog) {
        if (dialog == null || !MaterialYouConfig.isExpressiveDialogsEnabled()) {
            return;
        }
        try {
            Window window = dialog.getWindow();
            MaterialYouColorEngine.installTouchTracker(window);
            float density = dialog.getContext().getResources().getDisplayMetrics().density;
            ExpressiveBlurKit.applyWindowBackdropBlur(window, 18, 0, 0.45f, 0.65f, density);
            MaterialYouColorEngine.applySystemBarAppearance(window, MaterialYouColorEngine.isLightMode(dialog.getContext()));
        } catch (Throwable ignored) {
        }
    }
}
