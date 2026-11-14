/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link VoiceSkip} about a voice message, since the unpatched app never calls it. */
public final class VoiceSkipForTests {
    private VoiceSkipForTests() {}

    /** Telegram's media session buttons for a voice message: play, pause, seek and stop. */
    static final long VOICE_ACTIONS = 2360070L;

    /** Whether a plain voice message playing would get next and previous. */
    public static boolean voiceGetsSkipButtons() {
        VoiceSkip.Telegram before = VoiceSkip.telegram;
        VoiceSkip.telegram = FakeVoiceTelegram.playing(new FakeVoiceTelegram.Message(1, 7L));
        try {
            return VoiceSkip.actions(VOICE_ACTIONS) != VOICE_ACTIONS;
        } finally {
            VoiceSkip.telegram = before;
            VoiceSkip.forget();
        }
    }
}
