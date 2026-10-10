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
 * Telegram Beta's debug logs.
 *
 * <p>Telegram decides once per start, in BuildVars' static initializer, whether it writes its debug
 * logs: {@code LOGS_ENABLED} is {@code DEBUG_VERSION}, or else the "logsEnabled" choice its debug
 * menu saves, read with {@code DEBUG_VERSION} as the default. Telegram Beta is built with
 * {@code DEBUG_VERSION} on, so it always logs and its debug menu can't stop it. The Java log and the
 * native network log both follow that one value: ConnectionsManager hands native code a log file
 * path only while {@code LOGS_ENABLED} is on, and an empty path otherwise.
 *
 * <p>The patch passes the {@code DEBUG_VERSION} value read there through {@link #forceLogs} first.
 * With the switch on the answer is false, so {@code LOGS_ENABLED} falls back to the saved debug
 * menu choice, which is off unless you turned logs on there yourself. {@code DEBUG_VERSION} keeps
 * its value everywhere else. telegram.org's regular build has it off, so nothing changes there.
 * Log files already written stay until you clear them.
 */
public final class BetaLogs {
    private BetaLogs() {}

    /**
     * Injected right after BuildVars' static initializer reads {@code DEBUG_VERSION} to decide the
     * logs. That runs once per process, in the application's onCreate after the context is set.
     *
     * @param debugVersion the value Telegram read
     * @return what Telegram decides its logging with instead: false stops forcing the logs on
     */
    public static boolean forceLogs(boolean debugVersion) {
        HookStatus.invoked(FamilyNames.BETA_LOGS_OFF);
        if (!debugVersion) return false;
        try {
            if (!Utils.settingsReady()) {
                HookStatus.counted(FamilyNames.BETA_LOGS_OFF, "logging decided before app start");
                return true;
            }
            if (!Settings.BETA_LOGS_OFF.get()) return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BETA_LOGS_OFF, "switch", failure);
            return true;
        }
        HookStatus.counted(FamilyNames.BETA_LOGS_OFF, "forced beta logging turned off");
        return false;
    }
}
