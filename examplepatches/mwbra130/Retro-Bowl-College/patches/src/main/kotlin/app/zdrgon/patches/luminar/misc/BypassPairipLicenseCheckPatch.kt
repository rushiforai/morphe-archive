package app.zdrgon.patches.luminar.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.luminar.shared.Constants.COMPATIBILITY_LUMINAR
import java.util.logging.Logger

/**
 * Luminar — Bypass PairIP license check.
 *
 * This build carries stock PairIP as its licensecheck SDK: the
 * manifest Application is com.pairip.application.Application (a
 * generated subclass of the real LuminarApplication), and its
 * attachBaseContext calls LicenseClient.checkLicense(Context)
 * at every cold start. That is the ONLY trigger — a full-dex
 * reference scan found zero references to com.pairip.* from any
 * app or SDK class outside PairIP itself, and no Skylum-written
 * signature or certificate check exists in the Java layer.
 * checkLicense binds Google Play's licensing service and runs
 * the verdict state machine (repeated checks every 5 minutes);
 * a NOT_LICENSED verdict extracts the paywall intent and opens
 * PairIP's LicenseActivity block page, with an eventual app
 * shutdown if it is refused. A re-signed build cannot be left
 * to whatever Play answers.
 *
 * Fix, at the single entry point: checkLicense returns
 * immediately. The service is never bound, the state machine
 * never starts, no repeated checks are scheduled and the
 * paywall activity can never open. LicenseResponseHelper and
 * TrialClient become dead code and are deliberately left
 * untouched. Required for any re-signed Luminar build to open
 * reliably, so it defaults on.
 */
@Suppress("unused")
val bypassPairipLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends unlicensed installs to a Play Store block page. Disables that check at its entry point so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LUMINAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        CheckLicenseFingerprint.method.addInstructions(0, "return-void")
        logger.info("Luminar: PairIP license check disabled (LicenseClient.checkLicense returns immediately).")
    }
}
