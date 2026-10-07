/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link NonContacts} about its switch, since the unpatched app never calls it. */
public final class NonContactsForTests {
    private NonContactsForTests() {}

    /** Whether a stranger's notification would go out silently. */
    public static boolean on() {
        return NonContacts.on();
    }
}
