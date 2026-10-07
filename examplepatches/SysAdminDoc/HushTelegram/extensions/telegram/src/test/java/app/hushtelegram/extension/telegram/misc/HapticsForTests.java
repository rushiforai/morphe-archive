/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link Haptics} about its switch, since the unpatched app never calls it. */
public final class HapticsForTests {
    private HapticsForTests() {}

    /** Whether Telegram's vibration would be skipped. */
    public static boolean quiet() {
        return Haptics.quiet();
    }
}
