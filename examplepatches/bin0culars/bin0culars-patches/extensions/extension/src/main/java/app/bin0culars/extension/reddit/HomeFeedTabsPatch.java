package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class HomeFeedTabsPatch {

    private HomeFeedTabsPatch() {}

    public static boolean isEnabled() {
        return BinocularsMods.isEnabled("home_feed_tabs");
    }
}
