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
 * Bypasses integrity and certificate verification checks that Telegram uses to detect a re-signed
 * or modified app. Hooks the SafetyNet/Play Integrity call site and the native signature check so
 * the server receives a passing attestation and the stock signing certificate.
 */
public final class IntegrityBypass {
    private IntegrityBypass() {
    }

    /**
     * Called where Telegram starts an integrity/attestation request. Returns true to skip the
     * request entirely so no failing attestation reaches the server.
     */
    public static boolean skipIntegrityCheck(int unused) {
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_INTEGRITY_CHECK.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_INTEGRITY_CHECK, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.BYPASS_INTEGRITY_CHECK, "integrity check skipped");
        return true;
    }

    /**
     * Called where Telegram reads its own package signature. Returns true to supply the original
     * vendor certificate instead of the re-signed one.
     */
    public static boolean spoofSignature(int unused) {
        try {
            if (!Utils.settingsReady() || !Settings.BYPASS_INTEGRITY_CHECK.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.BYPASS_INTEGRITY_CHECK, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.BYPASS_INTEGRITY_CHECK, "signature spoofed");
        return true;
    }
}
