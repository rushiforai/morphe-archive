package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

/**
 * The app phones home to a Telegram channel whenever it detects a security
 * breach or an APK integrity failure (POST /api/internal/telegram/send).
 * Neutralizing these methods stops the app from reporting the patched device.
 */
@Suppress("unused")
val neuterSecurityReporterPatch = bytecodePatch(
    name = "Neuter Telegram security breach reporter",
    description = "Stops the app from reporting security breaches or APK integrity failures to the developers' Telegram channel.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        SecurityReporterBreachFingerprint.method.addInstruction(0, "return-void")
        SecurityReporterIntegrityFingerprint.method.addInstruction(0, "return-void")
    }
}
