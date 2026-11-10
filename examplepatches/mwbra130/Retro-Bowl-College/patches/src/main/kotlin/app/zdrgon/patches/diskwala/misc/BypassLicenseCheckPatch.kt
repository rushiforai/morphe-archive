package app.zdrgon.patches.diskwala.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.diskwala.shared.Constants.COMPATIBILITY_DISKWALA
import java.util.logging.Logger

/**
 * DiskWala — Bypass PairIP license check (callee funnel stubs).
 *
 * The second layer of the launch fix (the first is "Bypass PairIP
 * application checks", which kills the funnel's only live call site;
 * the third, "Disable PairIP license activity", removes the block
 * activity from the manifest). This patch neutralizes the funnel
 * itself, so the block page cannot be reached even if some path —
 * dex, VM, or native — lands on LicenseClient.checkLicense without
 * going through the Application call site.
 *
 * The 27.3 flow (full map in Fingerprints.kt): checkLicense posts
 * getInstance(ctx).initializeLicenseCheck() to the main thread. With
 * licenseCheckState at CHECK_REQUIRED and the local installer branch
 * dead (localCheckEnabled is false and written nowhere), that binds
 * to Play's ILicensingService in com.android.vending and sends a
 * LicenseCheckV2 request. The answer lands in
 * processResponse(code, bundle):
 *   0 LICENSED     -> state becomes FULL_CHECK_OK (or
 *                     REPEATED_CHECK_REQUIRED with re-check metadata)
 *   2 NOT_LICENSED -> startPaywallActivity(): LicenseActivity opens
 *                     with the service-supplied PAYWALL_INTENT
 *                     PendingIntent, i.e. the Play Store listing —
 *                     the "Get this app from Play" block page seen
 *                     on-device with bundle v1.52.0.
 *   other          -> LicenseCheckException -> handleError -> the
 *                     same LicenseActivity as an error dialog.
 * handleTrialEnd resets the state to CHECK_REQUIRED and binds
 * afresh, bypassing initializeLicenseCheck; its only caller chain
 * is the caller-less TrialClient facade.
 *
 * Why the v1.52.0 installer spoof could not fix this: it rewrote
 * LicenseClient.performLocalInstallerCheck's own installer read
 * (Desktop-verified in the published bundle's output), but that
 * method is only called from the local branch, which never runs.
 *
 * Fix: reproduce the genuine success steady state at the funnel.
 * checkLicense and initializeLicenseCheck are replaced at entry
 * with "licenseCheckState = FULL_CHECK_OK; return" — FULL_CHECK_OK
 * is exactly the terminal value the real flow stores after a
 * LICENSED response with no repeated check due, and it is the value
 * every later reader keys on (checkTrialStatus maps it to
 * NOT_UNDER_TRIAL; the error-dialog gate stays closed while it is
 * set). No instance is created, nothing ever binds to Play's
 * licensing service, no repeated check is scheduled, and
 * LicenseActivity — whose only two launchers sit downstream of that
 * bind — can never open. handleTrialEnd returns immediately too.
 *
 * Defense in depth, downstream chokepoints are stubbed as well:
 *   processResponse          -> return immediately (the verdict
 *                               handler; code 2 is the only route
 *                               to the paywall).
 *   startPaywallActivity /
 *   startErrorDialogActivity -> return immediately (the only two
 *                               methods that can start
 *                               LicenseActivity).
 *   scheduleAppShutdown      -> return immediately, and the
 *                               exitAction Runnable (LicenseClient$1,
 *                               a bare System.exit(0)) is emptied,
 *                               so PairIP's delayed shutdown is dead
 *                               at both ends.
 *   LicenseActivity.onStart  -> finish() + return; even if the
 *                               activity were started, it displays
 *                               nothing.
 * All of these methods are plain dex with real bodies in 27.3 (not
 * VM-virtualized, none declared native). Required for ANY re-signed
 * DiskWala build to open, so it defaults on.
 */
@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends non-Play installs to a Play Store block page. Disables that check, its verdict handler, both block-page launchers, the delayed shutdown, and the block activity itself so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val setLicensedAndReturn =
            """
                sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->FULL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                return-void
            """.trimIndent()

        LicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("DiskWala: PairIP license check disabled (LicenseClient.checkLicense records FULL_CHECK_OK and returns).")

        InitializeLicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("DiskWala: PairIP license check disabled (LicenseClient.initializeLicenseCheck records FULL_CHECK_OK and returns).")

        HandleTrialEndFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP trial-end re-check disabled (LicenseClient.handleTrialEnd returns immediately).")

        ProcessResponseFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP license verdict handler disabled (LicenseClient.processResponse returns immediately).")

        StartPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP paywall launcher disabled (LicenseClient.startPaywallActivity returns immediately).")

        StartErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP error-dialog launcher disabled (LicenseClient.startErrorDialogActivity returns immediately).")

        ScheduleAppShutdownFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP delayed shutdown disabled (LicenseClient.scheduleAppShutdown returns immediately).")

        ExitActionFingerprint.method.addInstructions(0, "return-void")
        logger.info("DiskWala: PairIP exit action emptied (LicenseClient\$1.run returns immediately).")

        LicenseActivityOnStartFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent(),
        )
        logger.info("DiskWala: PairIP license activity neutralized (LicenseActivity.onStart finishes immediately).")
    }
}
