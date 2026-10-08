/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link FeaturesInvite} about its switch, since the unpatched app never calls it. */
public final class FeaturesInviteForTests {
    private FeaturesInviteForTests() {}

    /** Whether Settings' Features row and Contacts' invite rows would be left out. */
    public static boolean on() {
        return FeaturesInvite.on();
    }
}
