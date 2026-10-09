/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.telegram.settings.Settings;

/** Asks {@link SendConfirm} about its switches, since the unpatched app never calls it. */
public final class SendConfirmForTests {
    private SendConfirmForTests() {}

    public static boolean stickerOn() {
        return SendConfirm.on(Settings.ASK_BEFORE_STICKER);
    }

    public static boolean gifOn() {
        return SendConfirm.on(Settings.ASK_BEFORE_GIF);
    }

    public static boolean voiceVideoOn() {
        return SendConfirm.on(Settings.ASK_BEFORE_VOICE_VIDEO);
    }

    public static boolean callOn() {
        return SendConfirm.on(Settings.ASK_BEFORE_CALL);
    }
}
