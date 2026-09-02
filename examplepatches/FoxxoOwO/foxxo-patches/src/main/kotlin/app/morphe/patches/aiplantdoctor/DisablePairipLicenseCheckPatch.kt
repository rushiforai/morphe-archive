package app.morphe.patches.aiplantdoctor

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import java.util.logging.Logger

private val logger = Logger.getLogger("DisablePairipLicenseCheckPatch")

@Suppress("unused")
val disablePairipLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP License Check",
    description = "Disables Google Play Integrity / PairIP client-side licensing and anti-tamper check to prevent crashes on modified APKs."
) {
    compatibleWith("me.jodoin.aiplantdoctor")

    execute {
        logger.info("Applying Disable PairIP License Check patch for AI Plant Doctor...")

        // 1. Short-circuit LicenseClient.checkLicense(Context)
        LicenseClientCheckLicenseFingerprint.methodOrNull?.let { method ->
            method.returnEarly()
            logger.info("Successfully bypassed LicenseClient.checkLicense")
        } ?: logger.warning("LicenseClient.checkLicense fingerprint not matched")

        // 2. Short-circuit Application.attachBaseContext if it calls checkLicense
        ApplicationAttachBaseContextFingerprint.methodOrNull?.let { method ->
            // Replace checkLicense invocation with return-void or nop
            method.returnEarly()
            logger.info("Successfully neutralized Application.attachBaseContext check")
        }

        // 3. Neutralize LicenseActivity kill/dialog methods so app is never terminated
        LicenseActivityOnCreateFingerprint.methodOrNull?.let { method ->
            method.returnEarly()
            logger.info("Successfully neutralized LicenseActivity.onCreate")
        }
    }
}
