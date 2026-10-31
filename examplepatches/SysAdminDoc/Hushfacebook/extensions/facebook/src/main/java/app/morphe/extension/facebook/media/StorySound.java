/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Mute stories (#261). The story viewer sets a story video's volume in one place, after it has
 * worked out whether the story should be heard: from the phone's own mute state on some builds,
 * from a server flag on others, and from the feed's sound flag ({@link FeedSound}) on the rest.
 * Many of those answers start a story with its sound on.
 *
 * <p>While the switch is on, every story plays silent until you turn the sound on yourself: a tap
 * on a speaker or the volume up key, the same two things {@link FeedSound#yours} counts as yours.
 * From then on stories are heard as Facebook decides, until you mute again or a new session starts.
 * Muting always goes through. Off, paused, before the settings are ready or when anything here
 * fails, Facebook's own volume goes through.
 */
public final class StorySound {
    /** Counted under the patch's name each time a story's sound was kept off. */
    static final String KEPT_MUTED = "Story kept muted";

    private static final String FAMILY = FamilyNames.KEEP_FEED_VIDEOS_MUTED;

    /** Whether you turned the sound on in this session and haven't muted it since. */
    private static volatile boolean yoursOn;

    private StorySound() {
    }

    /**
     * Injection point, right before the story viewer hands a story video's volume, [asked] (0 for
     * silent, up to 1), to its player. Answers the volume to use: 0 while the switch is on and you
     * haven't turned the sound on, else [asked].
     */
    public static float volume(float asked) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, "story sound");
            if (asked <= 0f || yoursOn || !on()) return asked;
            HookStatus.counted(FAMILY, KEPT_MUTED);
            Logger.printDebug(() -> "Mute stories: kept a story's sound off");
            return 0f;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "story sound", failure);
            return asked;
        }
    }

    /** A new app session: stories start muted again. */
    static void newSession() {
        yoursOn = false;
    }

    /** You turned the sound on ([on] true) or off with a speaker tap or a volume key. */
    static void yoursSound(boolean on) {
        yoursOn = on;
    }

    /** Whether stories are kept muted: the switch on, not paused, and the settings ready. */
    static boolean on() {
        return Utils.settingsReady() && Settings.MUTE_STORIES.get();
    }

    /** Forgets your sound choice, for tests. */
    static void forget() {
        yoursOn = false;
    }
}
