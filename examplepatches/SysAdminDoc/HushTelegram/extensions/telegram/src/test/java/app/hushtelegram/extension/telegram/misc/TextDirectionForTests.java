/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link TextDirection} whether it would act, since the unpatched app has no message box menu. */
public final class TextDirectionForTests {
    private TextDirectionForTests() {}

    public static boolean active() {
        return TextDirection.active();
    }
}
