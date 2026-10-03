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
 * <p>With Loop a story looping stories too, the patch asks {@link #holdUnlessItLoops()} next, and
 * then asks the viewer's own loop check about the finished item itself, right there. An item the
 * check says plays again goes on into the handler, where Instagram starts it over. An item the
 * check turns down (an ad, or one of the few special kinds) is held as if Loop weren't there. The
 * check's answer is for the item in hand and is used on the spot, so nothing is remembered between
 * items.
 *
 * <p>A photo's timer keeps calling in on every frame once it's full, so this stays cheap.
 */
public final class StoryAdvance {
    private StoryAdvance() {
    }

    /**
     * True keeps the finished story on screen. False while the switch is off, HushGram is paused
     * or the settings aren't ready, and while Loop a story is looping stories, since then the
     * patch asks the loop check through {@link #holdUnlessItLoops()} first. Never throws.
     */
    public static boolean hold() {
        try {
            HookStatus.invoked(FamilyNames.STORY_AUTO_ADVANCE);
            return stops() && !StoryLoop.takesOver();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "story finished", failure);
            return false;
        }
    }

    /**
     * Asked when {@link #hold()} said no. True while the switch is on and Loop a story is looping
     * stories: the patch then asks the viewer's loop check about the finished item and holds it
     * only when the check says no. False otherwise, so the story moves on or loops as Instagram
     * decides. Never throws.
     */
    public static boolean holdUnlessItLoops() {
        try {
            return stops() && StoryLoop.takesOver();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "story loop hold", failure);
            return false;
        }
    }

    private static boolean stops() {
        return Utils.settingsReady() && Settings.BLOCK_STORY_AUTO_ADVANCE.get();
    }
}
