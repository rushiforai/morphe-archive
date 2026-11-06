package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

/**
 * The app phones home to a Telegram channel whenever it detects a security
 * breach or an APK integrity failure (POST /api/internal/telegram/send).
 * Neutralizing these methods stops the app from reporting the patched device.
 *
 * 2.1.6 reobfuscated reportIntegrityFailure to "b" (public static (String)V);
 * both fingerprints are tried, whichever matches first wins.
 */
@Suppress("unused")
val neuterSecurityReporterPatch = bytecodePatch(
    name = "Neuter Telegram security breach reporter",
    description = "Stops the app from reporting security breaches or APK integrity failures to the developers' Telegram channel.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        // reportBreach kept its name in both 2.1.4 and 2.1.6.
        SecurityReporterBreachFingerprint.method.addInstruction(0, "return-void")

        val integrityMethod = SecurityReporterIntegrityFingerprint.methodOrNull
            ?: SecurityReporterIntegrityFingerprintV216.methodOrNull
            ?: throw IllegalStateException("SecurityReporter integrity method not found")
        integrityMethod.addInstruction(0, "return-void")
    }
}
