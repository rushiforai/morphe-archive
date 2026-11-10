package app.zdrgon.patches.pikaspot.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.pikaspot.shared.Constants.COMPATIBILITY_PIKASPOT
import java.util.logging.Logger

/**
 * Pika Spot — Bypass PairIP license check.
 *
 * This build carries PairIP only as its licensecheck SDK (9 dex
 * classes in classes2.dex, no native core, no VM). Two triggers
 * call LicenseClient.checkLicense(Context) at process start: the
 * manifest LicenseContentProvider.onCreate and
 * com.pairip.application.Application.attachBaseContext;
 * checkLicense posts the funnel that runs
 * initializeLicenseCheck, which binds Google Play's licensing
 * service (checkLicenseV2). The verdict lands in
 * processResponse(code, bundle):
 *   LICENSED     -> licenseCheckState records FULL_CHECK_OK
 *   NOT_LICENSED -> startPaywallActivity: LicenseActivity opens
 *                   the Play Store block page and the app closes
 *   errors       -> handleError -> startErrorDialogActivity —
 *                   except when the recorded state is already
 *                   FULL_CHECK_OK, the value the error gate reads
 *                   first.
 * A re-signed build cannot be left to whatever Play answers.
 *
 * Fix, at the funnel: initializeLicenseCheck is replaced at
 * entry with "licenseCheckState = FULL_CHECK_OK; return" —
 * FULL_CHECK_OK is exactly the terminal value the real flow
 * stores after a LICENSED response, and it is the value the
 * error gate keys on (this SDK generation's constant; the
 * aodNotify generation calls it OK). Nothing ever binds to
 * Play's licensing service, and LicenseActivity — whose only
 * two launchers in the app are the two methods below — can
 * never open. The SDK's trial machinery has no callers outside
 * LicenseClient and is driven only from inside this funnel, so
 * it never starts.
 *
 * Defense in depth, the downstream chokepoints are stubbed as
 * well: processResponse (the verdict handler; NOT_LICENSED is
 * the only route to the paywall) and both LicenseActivity
 * launchers return immediately. Required for any re-signed
 * Pika Spot build to open reliably, so it defaults on.
 */
@Suppress("unused")
val bypassPairipLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends unlicensed installs to a Play Store block page. Disables that check, its verdict handler and both block-page launchers so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PIKASPOT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val setLicensedAndReturn =
            """
                sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->FULL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                return-void
            """.trimIndent()

        InitializeLicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("Pika Spot: PairIP license check disabled (LicenseClient.initializeLicenseCheck records FULL_CHECK_OK and returns).")

        ProcessResponseFingerprint.method.addInstructions(0, "return-void")
        logger.info("Pika Spot: PairIP license verdict handler disabled (LicenseClient.processResponse returns immediately).")

        StartPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("Pika Spot: PairIP paywall launcher disabled (LicenseClient.startPaywallActivity returns immediately).")

        StartErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("Pika Spot: PairIP error-dialog launcher disabled (LicenseClient.startErrorDialogActivity returns immediately).")
    }
}
