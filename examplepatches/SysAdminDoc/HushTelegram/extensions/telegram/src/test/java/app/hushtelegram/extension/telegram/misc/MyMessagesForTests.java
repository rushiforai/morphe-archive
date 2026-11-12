/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link MyMessages} whether it would act, since the unpatched app has no chat menu to add to. */
public final class MyMessagesForTests {
    private MyMessagesForTests() {}

    public static boolean active() {
        return MyMessages.active();
    }
}
