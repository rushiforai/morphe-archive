package app.morphe.extension.youtube.patches.utils;

import android.util.SparseArray;
import android.view.MenuItem;
import android.view.View;

import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;

@SuppressWarnings("unused")
public class CastButtonPatch {
    // The Cast and Companion controllers both use menu_cast in stock YouTube.
    private static final class ToolbarMenuIds {
        static final int CAST = ResourceUtils.getIdIdentifier("menu_cast");
        static final int COMPANION = View.generateViewId();
    }

    public interface ToolbarCastView {
        void patch_markToolbarCast();
        boolean patch_isToolbarCast();
    }

    public interface ToolbarCastController {
        void patch_setCompanionButton(Object companionButton);
        Object patch_getCompanionButton();
    }

    public static boolean hideToolbarCastButton(boolean original) {
        return original && showToolbarCastButton();
    }

    public static void hideToolbarCastButton(MenuItem menuItem) {
        if (!showToolbarCastButton()) setToolbarCastHidden(menuItem);
    }

    private static void setToolbarCastHidden(MenuItem menuItem) {
        menuItem.setVisible(false);
        menuItem.setEnabled(false);
    }

    public static void initializeToolbarCastButton(MenuItem menuItem) {
        if (!showToolbarCastButton()) {
            setToolbarCastHidden(menuItem);
            return;
        }

        View view = menuItem.getActionView();
        if (view instanceof ToolbarCastView toolbarCastView) {
            toolbarCastView.patch_markToolbarCast();
            view.setVisibility(View.VISIBLE);
            view.setEnabled(true);
        }
    }

    public static boolean showToolbarCastButton() {
        return !Settings.HIDE_TOOLBAR_CAST_BUTTON.get();
    }

    public static boolean useStockToolbarCastExperiment(boolean original) {
        return original && !showToolbarCastButton();
    }

    public static boolean useCastCompanionOnClick(View view, boolean original) {
        return original && !isToolbarCastView(view);
    }

    public static boolean toolbarCastViewEnabled(View view, boolean original) {
        return original || isToolbarCastView(view);
    }

    public static int toolbarCastViewVisibility(View view, int original) {
        return isToolbarCastView(view) ? View.VISIBLE : hideCastButton(original);
    }

    private static boolean isToolbarCastView(View view) {
        return view instanceof ToolbarCastView toolbarCastView && toolbarCastView.patch_isToolbarCast();
    }

    public static Object keepCompanionButton(Object castButton, Object companionButton) {
        if (!Settings.HIDE_TOOLBAR_COMPANION_BUTTON.get() && castButton instanceof ToolbarCastController controller) {
            controller.patch_setCompanionButton(companionButton);
        }

        return castButton;
    }

    public static int toolbarCompanionButtonId() {
        return ToolbarMenuIds.COMPANION;
    }

    public static void addToolbarCompanionButton(SparseArray<Object> buttons) {
        if (Settings.HIDE_TOOLBAR_COMPANION_BUTTON.get()) return;

        if (buttons.get(ToolbarMenuIds.CAST) instanceof ToolbarCastController controller) {
            Object companionButton = controller.patch_getCompanionButton();
            if (companionButton != null) {
                buttons.put(ToolbarMenuIds.COMPANION, companionButton);
            }
        }
    }

    /**
     * Preserve the existing shared visibility override when both Cast buttons are disabled.
     */
    public static int hideCastButton(int original) {
        return Settings.HIDE_TOOLBAR_CAST_BUTTON.get()
                && PatchStatus.ToolBarComponents()
                && Settings.HIDE_PLAYER_CAST_BUTTON.get()
                && PatchStatus.PlayerButtons()
                ? View.GONE
                : original;
    }
}
