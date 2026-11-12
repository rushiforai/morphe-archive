/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link Lyrics} and {@link SongDates} whether they would act, since the unpatched app has no player. */
public final class LyricsForTests {
    private LyricsForTests() {}

    public static boolean lyrics() {
        return Lyrics.on();
    }

    public static boolean songDates() {
        return SongDates.on();
    }
}
