/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Stop Story auto-advance" patch.
 *
 * <p>The story viewer is told when a story item is done: a photo's timer ran out or a video
 * reached its end. The viewer then moves to the next item, or to the next person's stories after
 * the last one. The patch asks here first thing in that handler. A tap or a swipe takes another
 * path, so the viewer still moves on when you ask it to.
 *
 * <p>A photo's timer keeps calling in on every frame once it's full, so this stays cheap.
 */
public final class StoryAdvance {
    private StoryAdvance() {
    }

    /**
     * True keeps the finished story on screen. False while the switch is off, HushGram is paused
     * or the settings aren't ready. Never throws.
     */
    public static boolean hold() {
        try {
            HookStatus.invoked(FamilyNames.STORY_AUTO_ADVANCE);
            return Utils.settingsReady() && Settings.BLOCK_STORY_AUTO_ADVANCE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "story finished", failure);
            return false;
        }
    }
}
