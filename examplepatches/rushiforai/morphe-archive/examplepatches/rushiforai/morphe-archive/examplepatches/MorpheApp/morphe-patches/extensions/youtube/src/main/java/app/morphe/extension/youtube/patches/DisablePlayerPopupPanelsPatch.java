package app.morphe.extension.youtube.patches;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;

@SuppressWarnings("unused")
public class DisablePlayerPopupPanelsPatch {

    private static boolean playerPopupPanelsAllowed = false;

    private static Object previousAllowBypassToken = null;

    /**
     * Injection point.
     */
    public static void allowPlayerPopupPanelsBypass() {
        // Allow popup panels blocking when video starts.
        Logger.printDebug(() -> "allowPlayerPopupPanelsBypass: Popup panel blocking is ready...");
        playerPopupPanelsAllowed = true;

        // Creates an object for a late verification, before disabling
        // the 'playerPopupPanelsAllowed' boolean.
        final Object allowBypassToken = previousAllowBypassToken = new Object();

        // Set a wait timer for the amount of time it takes for the popup
        // panel to appear, then stop the blocking.
        Utils.runOnMainThreadDelayed(() -> {
            if (previousAllowBypassToken == allowBypassToken && playerPopupPanelsAllowed) {
                Logger.printDebug(() -> "allowPlayerPopupPanelsBypass: Popup panel blocking stopped.");
                playerPopupPanelsAllowed = false;
            }
        }, 1500);
    }

    /**
     * Injection point.
     */
    public static boolean disablePlayerPopupPanels() {
        if (Settings.DISABLE_PLAYER_POPUP_PANELS.get() &&
                PlayerType.getCurrent().isMaximizedOrFullscreen()) {
            Logger.printDebug(() -> "allowPlayerPopupPanelsBypass: Popup panel blocked!");
            return playerPopupPanelsAllowed;
        }
        return false;
    }
}
