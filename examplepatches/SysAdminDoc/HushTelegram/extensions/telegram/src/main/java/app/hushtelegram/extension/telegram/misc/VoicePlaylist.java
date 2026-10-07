/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;

/**
 * When you play a voice or video message, Telegram queues the ones after it and plays them in a
 * row. With the switch on the queue stays empty, so playback stops when the message you tapped ends.
 */
public final class VoicePlaylist {
    private VoicePlaylist() {}

    /**
     * Asked before Telegram stores its queue.
     *
     * @param playlist the messages Telegram would play next, or null
     * @return the queue to keep, null for none
     */
    public static ArrayList<?> queue(ArrayList<?> playlist) {
        HookStatus.invoked(FamilyNames.VOICE_ONE_AT_A_TIME);
        try {
            if (playlist == null || !Utils.settingsReady() || !Settings.VOICE_ONE_AT_A_TIME.get()) return playlist;
            HookStatus.counted(FamilyNames.VOICE_ONE_AT_A_TIME, "queue dropped");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_ONE_AT_A_TIME, "switch", failure);
            return playlist;
        }
    }
}
