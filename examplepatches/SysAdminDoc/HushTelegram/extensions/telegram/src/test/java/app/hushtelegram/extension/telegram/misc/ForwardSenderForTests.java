/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link ForwardSender} about its switch, since the unpatched app never calls it. */
public final class ForwardSenderForTests {
    private ForwardSenderForTests() {}

    /** Whether new forwards would start with the sender hidden. */
    public static boolean on() {
        return ForwardSender.on();
    }
}
