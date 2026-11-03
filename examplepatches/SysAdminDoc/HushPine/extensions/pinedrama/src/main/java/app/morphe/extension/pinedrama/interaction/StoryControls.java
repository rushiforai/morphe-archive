/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.interaction;

import app.morphe.extension.pinedrama.blockauthor.Reflect;
import java.util.Collection;

/**
 * The story viewer's own end-of-story behavior. PineDrama keeps a play mode on the story pager (a
 * real-named enum, AUTO_PLAY_NEXT_USER and LOOP_CURRENT_VIDEO among its constants) and reads it
 * when a story finishes, so Loop a story answers with the loop constant instead of adding a replay
 * of its own. Hold a photo story answers the pager's play-completed callback, which is what moves
 * a story on by itself, for photo stories only.
 */
public final class StoryControls {
    private static final String FAMILY = "story controls";

    private StoryControls() {}

    /** Whether the story is a photo story: one that carries images. The story seek bar asks too. */
    public static boolean isPhoto(Object aweme) {
        if (aweme == null) return false;
        Object images = Reflect.property(aweme, "getImageInfos", "imageInfos");
        return images instanceof Collection && !((Collection<?>) images).isEmpty();
    }
}
