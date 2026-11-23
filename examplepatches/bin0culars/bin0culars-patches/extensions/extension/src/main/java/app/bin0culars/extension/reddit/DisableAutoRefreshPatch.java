package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class DisableAutoRefreshPatch {

    private DisableAutoRefreshPatch() {}

    public static boolean isEnabled() {
        return BinocularsMods.isEnabled("disable_home_auto_refresh");
    }
}
