package app.zdrgon.patches.contentcam.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.contentcam.shared.Constants.COMPATIBILITY_CONTENTCAM
import java.util.logging.Logger

/**
 * ContentCam — Bypass PairIP license check.
 *
 * This build carries PairIP only as its licensecheck SDK
 * (com.pairip.application.Application + com.pairip.licensecheck.*,
 * no native core, no VM, no StartupLauncher). At every cold start
 * the manifest Application's attachBaseContext calls
 * LicenseClient.checkLicense, and LicenseContentProvider.onCreate
 * calls it too; both funnel into initializeLicenseCheck. From
 * CHECK_REQUIRED it first runs a local installer check (the
 * installer must be com.android.vending — a Morphe Manager or SAI
 * install fails it), then binds Google Play's licensing service
 * (checkLicenseV2). The verdict lands in processResponse: LICENSED
 * records FULL_CHECK_OK; NOT_LICENSED opens PairIP's
 * LicenseActivity (the Play Store block page) via
 * startPaywallActivity; errors go through startErrorDialogActivity
 * (the same activity as an error dialog). Both launchers also arm
 * a 30-second app shutdown. A re-signed build cannot be left to
 * whatever Play answers.
 *
 * Fix, at the funnel: initializeLicenseCheck is replaced at entry
 * with "licenseCheckState = FULL_CHECK_OK; return" — FULL_CHECK_OK
 * is exactly the terminal value the real flow stores after a
 * LICENSED response (this SDK version has no "OK" value), and the
 * error gate (lambda$handleError$0) returns early when it sees it.
 * Nothing ever runs the installer check or binds to Play's
 * licensing service, and LicenseActivity — whose only two
 * launchers sit downstream of that bind — can never open, so the
 * shutdown timer is never armed either.
 *
 * Defense in depth, the downstream chokepoints are stubbed as
 * well: processResponse (the verdict handler; code 2 is the only
 * route to the paywall) and both LicenseActivity launchers return
 * immediately. All four methods are plain dex with real bodies in
 * 2.8.0. Required for any re-signed ContentCam build to open
 * reliably, so it defaults on.
 */
@Suppress("unused")
val bypassPairipLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends unlicensed installs to a Play Store block page. Disables that check, its verdict handler and both block-page launchers so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONTENTCAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val setLicensedAndReturn =
            """
                sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->FULL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                return-void
            """.trimIndent()

        InitializeLicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("ContentCam: PairIP license check disabled (LicenseClient.initializeLicenseCheck records FULL_CHECK_OK and returns).")

        ProcessResponseFingerprint.method.addInstructions(0, "return-void")
        logger.info("ContentCam: PairIP license verdict handler disabled (LicenseClient.processResponse returns immediately).")

        StartPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("ContentCam: PairIP paywall launcher disabled (LicenseClient.startPaywallActivity returns immediately).")

        StartErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("ContentCam: PairIP error-dialog launcher disabled (LicenseClient.startErrorDialogActivity returns immediately).")
    }
}
