/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Stops automatic call debug reports and log-file uploads requested by Telegram's server. */
public final class CallDebug {
    private CallDebug() {}

    /** Called after Telegram removes pending call data and takes its need_debug branch. */
    public static boolean skipCallDebugUpload(boolean requested) {
        return requested && skip("call debug report suppressed");
    }

    /** Called only once a requested log file is compressed and ready for FileLoader.uploadFile. */
    public static boolean skipCallLogFileUpload() {
        return skip("call log file upload suppressed");
    }

    /** Also protects saveCallLog callbacks from uploads started before this switch was enabled. */
    public static boolean skipCallLogUpload() {
        return skip("call log report suppressed");
    }

    private static boolean skip(String what) {
        HookStatus.invoked(FamilyNames.DISABLE_CALL_DEBUG);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_CALL_DEBUG.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_CALL_DEBUG, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_CALL_DEBUG, what);
        return true;
    }
}
