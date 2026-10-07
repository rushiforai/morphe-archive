/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Lets a test outside this package give BlackTheme ids without Telegram's lookup. */
public final class BlackThemeForTests {
    private BlackThemeForTests() {}

    /** Ids 1 to 16 in the order of {@link BlackTheme#SURFACES}. */
    public static void useStandInIds() {
        int[] ids = new int[BlackTheme.SURFACES.length];
        for (int i = 0; i < ids.length; i++) ids[i] = i + 1;
        BlackTheme.ids = ids;
    }
}
