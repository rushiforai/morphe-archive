/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.stories;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Story ring size" patch.
 *
 * <p>Instagram works out the size of each item in the stories row from the screen's width: about
 * 3.75 items a screen, kept between 66dp and 100dp. The ring, the picture inside it and the space
 * around it all follow from that one size. The patch passes the size through {@link #size} wherever
 * Instagram settles it, so everything in the row grows or shrinks together.
 */
public final class StoryRing {
    private static volatile boolean logged;

    private StoryRing() {
    }

    /**
     * Injected right after Instagram settles a stories row item's size, in pixels. Answers [size]
     * times the chosen share while the switch is on, and [size] itself otherwise, or when anything
     * goes wrong. Never throws, and never waits for the settings: before they're ready the row keeps
     * Instagram's size.
     */
    public static float size(float size) {
        try {
            HookStatus.invoked(FamilyNames.STORY_RING);
            if (!(size > 0f) || !Utils.settingsReady() || !Settings.STORY_RING.get()) return size;
            StoryRingSize chosen = Settings.STORY_RING_SCALE.get();
            if (chosen == null || chosen == StoryRingSize.INSTAGRAM) return size;
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Story ring size: drawing the stories row at " + chosen.percent() + "%");
            }
            return size * chosen.scale;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_RING, "ring size", failure);
            return size;
        }
    }
}
