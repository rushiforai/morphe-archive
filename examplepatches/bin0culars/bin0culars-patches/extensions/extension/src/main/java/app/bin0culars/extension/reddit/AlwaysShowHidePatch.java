package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class AlwaysShowHidePatch {

    private AlwaysShowHidePatch() {}

    public static boolean hideReplaced(boolean replaced) {
        return replaced && !BinocularsMods.isEnabled("always_show_hide");
    }
}
