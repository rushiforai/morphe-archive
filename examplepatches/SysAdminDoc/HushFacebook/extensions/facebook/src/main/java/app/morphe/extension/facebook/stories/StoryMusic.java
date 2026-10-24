/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.stories;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Longer music on photo stories patch asks before Facebook says how long a song on a
 * photo story plays.
 *
 * <p>The Story composer asks one method how long a song's clip may be each time a song is picked.
 * For a photo the answer is 15 seconds, or a length from one of Facebook's server tests, and the
 * music picker cuts the song to it. A feed post shared to a Story already gets 30 seconds. While
 * the switch is on, a photo's clip is at least 30 seconds too. A longer length of Facebook's own
 * stays.
 *
 * <p>Off, paused, settings that aren't ready yet or a failure in here, and Facebook's own length
 * goes on.
 */
public final class StoryMusic {
    /** The clip length a photo's song gets while the switch is on, in milliseconds. */
    static final int LONGER_MS = 30_000;

    /** Counted each time a photo's song gets the longer clip instead of Facebook's length. */
    static final String RAISED = "photo story music set to 30 seconds";

    private StoryMusic() {
    }

    /**
     * Injection point, right before the composer returns a photo's music clip length in
     * milliseconds: the length to return. Never throws.
     */
    public static int clipLength(int facebooks) {
        try {
            HookStatus.invoked(FamilyNames.STORY_MUSIC_LENGTH);
            HookStatus.bound(FamilyNames.STORY_MUSIC_LENGTH, "photo story music");
            if (!Utils.settingsReady() || !Settings.LONGER_STORY_MUSIC.get()) return facebooks;
            if (facebooks >= LONGER_MS) return facebooks;
            HookStatus.counted(FamilyNames.STORY_MUSIC_LENGTH, RAISED);
            Logger.printInfo(() -> "Longer music on photo stories: a photo's song plays for 30 s instead of "
                    + facebooks + " ms");
            return LONGER_MS;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STORY_MUSIC_LENGTH, "photo story music length", failure);
            return facebooks;
        }
    }
}
