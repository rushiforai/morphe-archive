/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/cleardisplay/RememberClearDisplayPatch.java
 */

package app.morphe.extension.tiktok.cleardisplay;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.tiktok.settings.Settings;

@SuppressWarnings("unused")
public class RememberClearDisplayPatch {
    private static volatile Boolean lastLoggedState;

    public static boolean getClearDisplayState() {
        if (AutomaticClearDisplayController.isEnabled()) {
            return false;
        }

        boolean state = Settings.CLEAR_DISPLAY.get();
        if (BaseSettings.DEBUG.get() && (lastLoggedState == null || lastLoggedState != state)) {
            lastLoggedState = state;
            Logger.printInfo(() -> "[BlueIT ClearDisplay] get remembered state=" + state);
        }
        return state;
    }

    /**
     * Restores the remembered state without directly linking TikTok's obfuscated event class from
     * the player bytecode. The event class name is supplied as a String and instantiated reflectively.
     */
    public static void restoreClearDisplayState(String eventClassName) {
        if (!getClearDisplayState()) return;
        AutomaticClearDisplayController.postRemembered(eventClassName);
    }

    public static void rememberClearDisplayState(boolean newState) {
        AutomaticClearDisplayController.onClearDisplayStateChanged(newState);

        if (AutomaticClearDisplayController.isEnabled()) {
            return;
        }

        if (BaseSettings.DEBUG.get()) {
            boolean oldState = Settings.CLEAR_DISPLAY.get();
            Logger.printInfo(() -> "[BlueIT ClearDisplay] remember state " + oldState + " -> " + newState);
        }
        Settings.CLEAR_DISPLAY.save(newState);
    }
}
