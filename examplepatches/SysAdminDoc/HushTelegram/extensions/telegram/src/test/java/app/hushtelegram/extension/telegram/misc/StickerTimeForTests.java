/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link StickerTime} about its switch, since the unpatched app never calls it. */
public final class StickerTimeForTests {
    private StickerTimeForTests() {}

    /** Whether a sticker would skip its time. */
    public static boolean on() {
        return StickerTime.on();
    }
}
