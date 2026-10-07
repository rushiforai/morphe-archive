/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link VoicePlayer} about a voice message, since the unpatched app never calls it. */
public final class VoicePlayerForTests {
    private VoicePlayerForTests() {}

    /** Whether a plain voice message would open the full player. */
    public static boolean voiceOpensThePlayer() {
        return VoicePlayer.plays(false, true, false);
    }
}
