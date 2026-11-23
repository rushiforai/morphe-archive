package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class FullScreenReplyPatch {

    private FullScreenReplyPatch() {}

    public static boolean isEnabled() {
        return BinocularsMods.isEnabled("full_screen_reply");
    }
}
