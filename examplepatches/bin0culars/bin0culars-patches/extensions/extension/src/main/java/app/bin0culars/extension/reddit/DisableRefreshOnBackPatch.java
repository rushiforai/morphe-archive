package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class DisableRefreshOnBackPatch {

    private DisableRefreshOnBackPatch() {}

    public static boolean feedScrolled(boolean scrolled) {
        if (BinocularsMods.isEnabled("disable_refresh_on_back")) {
            return false;
        }
        return scrolled;
    }

    public static boolean alwaysShowExitHint(boolean show) {
        if (BinocularsMods.isEnabled("disable_refresh_on_back")) {
            return true;
        }
        return show;
    }
}
