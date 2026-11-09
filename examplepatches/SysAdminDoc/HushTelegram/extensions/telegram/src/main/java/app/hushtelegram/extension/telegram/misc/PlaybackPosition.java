/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram keeps where a video, voice message or song stopped, but only past a length: videos
 * from two or five minutes, voice messages from five, music from ten. These are the lengths it
 * compares against, and with the switch on they all drop to {@link #SHORTEST} seconds, so
 * playback picks up where it stopped (#53). The saving and the seeking stay Telegram's own, and
 * off or paused every length is the one Telegram wrote.
 */
public final class PlaybackPosition {
    /** Under this a clip is over before there's anything to come back to. */
    static final int SHORTEST = 10;

    private PlaybackPosition() {}

    /** A length in seconds, as an int, that Telegram compares a video's length with. */
    public static int videoSeconds(int telegrams) {
        return (int) Math.min(telegrams, limit(telegrams));
    }

    /** The same length as a long, where the video viewer reads it. */
    public static long videoSecondsLong(long telegrams) {
        return Math.min(telegrams, (long) limit(telegrams));
    }

    /** The same length as a double, where the player compares a voice message's or song's. */
    public static double audioSeconds(double telegrams) {
        return Math.min(telegrams, limit(telegrams));
    }

    private static double limit(double telegrams) {
        HookStatus.invoked(FamilyNames.VOICE_MUSIC_PLAYER);
        try {
            if (!Utils.settingsReady() || !Settings.PLAYBACK_POSITION.get()) return telegrams;
            HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "playback position kept");
            return SHORTEST;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "playback position", failure);
            return telegrams;
        }
    }
}
