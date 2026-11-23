package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class DisableBottomBarAutoHidePatch {

    private DisableBottomBarAutoHidePatch() {}

    public static float barFraction(float fraction) {
        if (BinocularsMods.isEnabled("disable_bottom_bar_auto_hide")) {
            return 1.0f;
        }
        return fraction;
    }
}
