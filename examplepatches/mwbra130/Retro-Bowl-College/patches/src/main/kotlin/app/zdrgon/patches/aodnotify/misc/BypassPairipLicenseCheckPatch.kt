package app.zdrgon.patches.aodnotify.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.aodnotify.shared.Constants.COMPATIBILITY_AODNOTIFY
import java.util.logging.Logger

/**
 * aodNotify — Bypass PairIP license check.
 *
 * This build carries PairIP only as its licensecheck SDK (18 dex
 * classes, no native core, no VM). At every cold start the
 * manifest-declared LicenseContentProvider constructs the app's
 * only LicenseClient and runs initializeLicenseCheck, which binds
 * Google Play's licensing service (checkLicenseV2). The response
 * JWT is validated locally for signature and package name only —
 * but a NOT_LICENSED verdict or any error opens PairIP's
 * LicenseActivity (the Play Store block page, or an error dialog)
 * and closes the app behind it, so a re-signed build cannot be
 * left to whatever Play answers.
 *
 * Fix, at the funnel: initializeLicenseCheck is replaced at entry
 * with "licenseCheckState = OK; return" — OK is exactly the
 * terminal value the real flow stores after a LICENSED response,
 * and it is the value the error gate keys on. Nothing ever binds
 * to Play's licensing service, and LicenseActivity — whose only
 * two launchers sit downstream of that bind — can never open.
 *
 * Defense in depth, the downstream chokepoints are stubbed as
 * well: processResponse (the verdict handler; code 2 is the only
 * route to the paywall) and both LicenseActivity launchers return
 * immediately. All four methods are plain dex with real bodies in
 * 6.10. Required for any re-signed aodNotify build to open
 * reliably, so it defaults on.
 */
@Suppress("unused")
val bypassPairipLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends unlicensed installs to a Play Store block page. Disables that check, its verdict handler and both block-page launchers so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AODNOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val setLicensedAndReturn =
            """
                sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                return-void
            """.trimIndent()

        InitializeLicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("aodNotify: PairIP license check disabled (LicenseClient.initializeLicenseCheck records OK and returns).")

        ProcessResponseFingerprint.method.addInstructions(0, "return-void")
        logger.info("aodNotify: PairIP license verdict handler disabled (LicenseClient.processResponse returns immediately).")

        StartPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("aodNotify: PairIP paywall launcher disabled (LicenseClient.startPaywallActivity returns immediately).")

        StartErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("aodNotify: PairIP error-dialog launcher disabled (LicenseClient.startErrorDialogActivity returns immediately).")
    }
}
