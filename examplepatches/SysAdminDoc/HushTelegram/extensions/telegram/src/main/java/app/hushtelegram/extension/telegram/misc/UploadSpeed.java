/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * How many upload pieces are in flight at once.
 *
 * <p>FileUploadOperation sends a file in pieces of at least 128 KB (more for a file so big that the
 * server's part limit forces it) and keeps {@code 2048 KB / piece size} of them outstanding, so 16
 * pieces for most files and 2 for a multi-gigabyte one. Telegram's servers cap one piece at 512 KB and
 * the number of pieces per file, and say nothing about how many a client keeps outstanding. The
 * patch passes that count through {@link #requests} when it is set, and with the switch on the answer
 * is four times as many, up to {@link #MOST}. The piece size, the part limit and Premium's larger file
 * limit stay Telegram's, and the server may still slow an account's uploads whatever the app asks for.
 */
public final class UploadSpeed {
    /** The most pieces kept in flight, 32 MB of 512 KB pieces at the very most. */
    static final int MOST = 64;
    static final int TIMES = 4;

    private UploadSpeed() {}

    /**
     * Injected where FileUploadOperation sets its outstanding-piece limit.
     *
     * @param count Telegram's own limit; 1 on a slow network, which stays as it is
     * @return the limit to use
     */
    public static int requests(int count) {
        HookStatus.invoked(FamilyNames.FASTER_DOWNLOADS);
        if (count < 2) return count;
        try {
            if (!Utils.settingsReady() || !Settings.FASTER_UPLOADS.get()) return count;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "upload switch", failure);
            return count;
        }
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "upload with more pieces in flight");
        return (int) Math.min((long) count * TIMES, Math.max(count, MOST));
    }
}
