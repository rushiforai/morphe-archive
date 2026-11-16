package app.onlynazril.extension.tiktok.pausesearch;

import app.onlynazril.extension.tiktok.settings.PauseImageSearchSettings;

/**
 * The bytecode guard for the pause-panel image-search item.
 * <p>
 * The patch puts one call at the top of the item manager's list method. When the disable switch is
 * on the bridge answers `true` and the method returns an empty list, so the pause panel has no
 * image-search entry; when it is off the app's own list is built as before.
 */
public final class PauseImageSearchBridge {
    private PauseImageSearchBridge() {}

    public static boolean hidden() {
        return PauseImageSearchSettings.isDisabled();
    }
}
