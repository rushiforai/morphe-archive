/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/** Called only when Facebook reports a Story's progress as complete. */
public final class StoryAdvance {
    /** What a finished story started again is counted under. */
    static final String LOOPED = "stories looped";

    private StoryAdvance() { }

    public static boolean waitForTap() {
        try {
            HookStatus.invoked(FamilyNames.STORY_AUTO_ADVANCE);
            return Utils.settingsReady() && Settings.BLOCK_STORY_AUTO_ADVANCE.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "Story completion", failure);
            return false;
        }
    }

    /**
     * Asked once {@link #waitForTap} has held a finished story: true has the patch make Facebook's
     * own restart, so the story plays again from the start. Loop stories works only together with
     * Stop Story auto-advance, so either off, a pause, or settings that aren't ready leave the
     * story on its last frame (or moving on, with Stop Story auto-advance off). Never throws.
     */
    public static boolean loop() {
        try {
            if (!Utils.settingsReady() || !Settings.BLOCK_STORY_AUTO_ADVANCE.get()
                    || !Settings.LOOP_STORIES.get()) return false;
            HookStatus.counted(FamilyNames.STORY_AUTO_ADVANCE, LOOPED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "Story loop", failure);
            return false;
        }
    }

    /**
     * Facebook's restart threw inside the loop helper: the viewer had detached, or the surface
     * has no restart. The story stays on its last frame.
     */
    public static void loopFailed(Throwable failure) {
        HookStatus.threw(FamilyNames.STORY_AUTO_ADVANCE, "Story loop restart", failure);
    }
}
