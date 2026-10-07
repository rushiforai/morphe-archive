/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link MessageTime} about its switch, since the unpatched formatter returns nothing. */
public final class MessageTimeForTests {
    private MessageTimeForTests() {}

    /** Whether message times would get their seconds. */
    public static boolean addsSeconds() {
        return MessageTime.on();
    }
}
