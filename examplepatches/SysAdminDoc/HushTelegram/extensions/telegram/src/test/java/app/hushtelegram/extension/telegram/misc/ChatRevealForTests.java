/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link ChatReveal} whether it would act, since the unpatched app has no chat menu or message rows. */
public final class ChatRevealForTests {
    private ChatRevealForTests() {}

    public static boolean menuActive() {
        return ChatReveal.active();
    }

    public static boolean searchActive() {
        return ChatReveal.searchActive();
    }
}
