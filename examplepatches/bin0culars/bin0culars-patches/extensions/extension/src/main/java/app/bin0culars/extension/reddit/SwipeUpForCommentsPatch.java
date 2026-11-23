package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class SwipeUpForCommentsPatch {

    private SwipeUpForCommentsPatch() {}

    public static boolean isEnabled() {
        return BinocularsMods.isEnabled("swipe_up_for_comments");
    }
}
