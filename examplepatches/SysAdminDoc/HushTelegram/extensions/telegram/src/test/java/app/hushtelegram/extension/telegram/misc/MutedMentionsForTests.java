/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link MutedMentions} about its switch, since the unpatched app never calls it. */
public final class MutedMentionsForTests {
    private MutedMentionsForTests() {}

    /** Whether a mention in a muted chat would keep the chat's mute. */
    public static boolean on() {
        return MutedMentions.on();
    }
}
