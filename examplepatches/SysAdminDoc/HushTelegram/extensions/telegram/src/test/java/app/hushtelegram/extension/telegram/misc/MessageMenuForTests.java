/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.telegram.settings.Settings;

/** Asks {@link MessageMenu} about its switches, since the unpatched app never calls it. */
public final class MessageMenuForTests {
    private MessageMenuForTests() {}

    /** Whether a message's menu would offer Repeat. */
    public static boolean repeatOn() {
        return MessageMenu.on(Settings.MESSAGE_MENU_REPEAT);
    }

    /** Whether a photo's menu would offer Copy photo. */
    public static boolean copyPhotoOn() {
        return MessageMenu.on(Settings.MESSAGE_MENU_COPY_PHOTO);
    }

    /** Whether a message's menu would offer Message details. */
    public static boolean detailsOn() {
        return MessageMenu.on(Settings.MESSAGE_MENU_DETAILS);
    }
}
