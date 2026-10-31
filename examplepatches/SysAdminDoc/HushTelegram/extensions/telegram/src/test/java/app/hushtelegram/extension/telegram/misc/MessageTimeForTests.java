/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;

/** Asks {@link MessageTime} about its switch, since the unpatched formatter returns nothing. */
public final class MessageTimeForTests {
    private MessageTimeForTests() {}

    /** Whether message times would get their seconds. */
    public static boolean addsSeconds() {
        return PatchFamilyForTests.alsoInBuild(PatchFamily.MESSAGE_SECONDS, MessageTime::on);
    }
}
