/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link HidePhone} about its switch, since unpatched stubs know no accounts to match. */
public final class HidePhoneForTests {
    private HidePhoneForTests() {}

    /** Whether your own number would be covered. */
    public static boolean covers() {
        return HidePhone.on();
    }
}
