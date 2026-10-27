/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link ChannelMute} about its switch, since the unpatched app never calls it. */
public final class ChannelMuteForTests {
    private ChannelMuteForTests() {}

    /** Whether a channel's Mute bar would go. */
    public static boolean on() {
        return ChannelMute.on();
    }
}
