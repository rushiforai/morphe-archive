/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link BlockedSenders} about its switch, since the unpatched app never calls it. */
public final class BlockedSendersForTests {
    private BlockedSendersForTests() {}

    /** Whether a blocked person's message in a group would be left out. */
    public static boolean on() {
        return BlockedSenders.on();
    }
}
