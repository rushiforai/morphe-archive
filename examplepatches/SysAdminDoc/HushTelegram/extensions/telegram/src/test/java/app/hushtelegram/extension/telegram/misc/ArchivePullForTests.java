/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link ArchivePull} about its switch, since its archive state stubs answer no until patched. */
public final class ArchivePullForTests {
    private ArchivePullForTests() {}

    /** Whether a hidden archive would be left out of the chat list. */
    public static boolean on() {
        return ArchivePull.on();
    }
}
