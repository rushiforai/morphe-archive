package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.webvideocaster.shared.Constants.COMPATIBILITY_WEB_VIDEO_CASTER
import java.util.logging.Logger

/**
 * Web Video Caster — Bypass PairIP license check.
 *
 * Round 2 of the PairIP work. v1.35.3 (signature bypass) got the app
 * past the startup crash, but on-device it then landed on the Play
 * Store's "Get this app from Play" block page. That page is the
 * second PairIP layer, mapped here from the 6.1.0 dex:
 *
 * LicenseClient (classes2.dex) is PairIP's Play-licensing client.
 * The static LicenseClient.checkLicense(Context) is its only entry:
 * the PairIP Application's attachBaseContext calls it right after
 * SignatureCheck.verifyIntegrity, and LicenseContentProvider.onCreate
 * calls it again. A scan of all 7 dex files shows no other app class
 * even references LicenseClient / LicenseActivity / TrialClient, so
 * every launch path funnels through checkLicense. (PairIP's VM
 * bootstrap, StartupLauncher from the AppComponentFactory clinit,
 * never touches it in dex — and any VM-to-Java call would still land
 * on the patched method bodies below.)
 *
 * checkLicense posts getInstance(ctx).initializeLicenseCheck() to
 * the main thread. That method switches on the static
 * licenseCheckState (seeded CHECK_REQUIRED): the shipped dex never
 * enables the local installer branch (localCheckEnabled is read once
 * and written nowhere), so CHECK_REQUIRED binds straight to Play's
 * ILicensingService in com.android.vending and sends a
 * LicenseCheckV2 request. The answer lands in
 * processResponse(code, bundle):
 *   0 LICENSED     -> state becomes FULL_CHECK_OK (or
 *                     REPEATED_CHECK_REQUIRED with re-check metadata)
 *   2 NOT_LICENSED -> startPaywallActivity(): LicenseActivity opens
 *                     with the service-supplied PAYWALL_INTENT
 *                     PendingIntent, i.e. the Play Store listing,
 *                     which renders the "Get this app from Play"
 *                     block page for a copy Play didn't install.
 *                     This is the on-device v1.35.3 behaviour: Play's
 *                     licensing service deterministically answers
 *                     NOT_LICENSED for a re-signed, non-Play install.
 *   other          -> LicenseCheckException -> handleError -> the
 *                     same LicenseActivity as an error dialog.
 * A third trigger, handleTrialEnd, resets the state to
 * CHECK_REQUIRED and binds afresh, bypassing initializeLicenseCheck;
 * its only caller chain is the caller-less TrialClient facade.
 *
 * Fix: reproduce the genuine success steady state at the funnel.
 * checkLicense and initializeLicenseCheck are replaced at entry with
 * "licenseCheckState = FULL_CHECK_OK; return" — FULL_CHECK_OK is
 * exactly the terminal value the real flow stores after a LICENSED
 * response with no repeated check due, and it is the value every
 * later reader keys on (checkTrialStatus maps it to NOT_UNDER_TRIAL,
 * the error-dialog gate stays closed while it is set). No instance
 * is created, nothing ever binds to Play's licensing service, no
 * repeated check is scheduled, and LicenseActivity — whose only two
 * launchers sit downstream of that bind — can never open.
 * handleTrialEnd is made to return immediately as well, so the
 * trial-end path cannot reset the state and re-bind behind the
 * stubbed entry points. All three methods are plain dex with real
 * bodies (not VM-virtualized). Required for ANY re-signed WVC build
 * to open, with or without the premium unlock, so it defaults on.
 *
 * Round 3 (defense in depth): on-device, the block page persisted on
 * a fresh, current bundle with every patch enabled and the round-2
 * stubs verified in the output dex. A full execution-mode audit of
 * the stock app (all 8 dexes + the PairIP VM assets + the native
 * lib) found no independent paywall route — no other dex references
 * the license classes at all, the encrypted VM modules and
 * libpairipcore.so hold no LicenseActivity/paywall strings, and no
 * licensecheck method is VM-executed (VMRunner.invoke has exactly
 * five callers in classes2.dex, none of them license code) — so the
 * remaining work is to close every downstream dex chokepoint as
 * well, in case any path reaches the verdict machinery without
 * going through the stubbed entries:
 *   processResponse          -> return immediately (the verdict
 *                               handler; its only caller is the
 *                               service binder callback, and code 2
 *                               is the only route to the paywall).
 *   startPaywallActivity /
 *   startErrorDialogActivity -> return immediately (the only two
 *                               methods that can start LicenseActivity).
 *   scheduleAppShutdown      -> return immediately, and the
 *                               exitAction Runnable (LicenseClient$1)
 *                               it schedules is emptied too, so
 *                               PairIP's delayed System.exit shutdown
 *                               is dead at both ends.
 *   LicenseActivity.onStart  -> finish() + return (the activity has
 *                               no onCreate; even if started, it
 *                               displays nothing).
 * The companion resource patch "Disable PairIP license activity"
 * additionally sets android:enabled="false" on LicenseActivity in
 * the manifest, the one chokepoint no in-process code path — dex,
 * VM, or native — can bypass.
 *
 * Release note: the first v1.35.4 CI run compiled this patch green
 * but semantic-release lost a push race against another commit
 * landing on main mid-run, so the release is re-cut from this
 * comment-only revision.
 */
@Suppress("unused")
val bypassLicenseCheckPatch = bytecodePatch(
    name = "Bypass PairIP license check",
    description = "Required for re-signed builds: PairIP asks Google Play to license the app at startup and sends non-Play installs to a Play Store block page. Disables that check, its verdict handler, both block-page launchers, the delayed shutdown, and the block activity itself so the patched app can open.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEB_VIDEO_CASTER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val setLicensedAndReturn =
            """
                sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->FULL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                return-void
            """.trimIndent()

        LicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("Web Video Caster: PairIP license check disabled (LicenseClient.checkLicense records FULL_CHECK_OK and returns).")

        InitializeLicenseCheckFingerprint.method.addInstructions(0, setLicensedAndReturn)
        logger.info("Web Video Caster: PairIP license check disabled (LicenseClient.initializeLicenseCheck records FULL_CHECK_OK and returns).")

        HandleTrialEndFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP trial-end re-check disabled (LicenseClient.handleTrialEnd returns immediately).")

        // Round 3: downstream chokepoints, so the block page cannot be
        // reached even if some path lands in the verdict machinery
        // without passing through the stubbed entry points above.
        ProcessResponseFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP license verdict handler disabled (LicenseClient.processResponse returns immediately).")

        StartPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP paywall launcher disabled (LicenseClient.startPaywallActivity returns immediately).")

        StartErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP error-dialog launcher disabled (LicenseClient.startErrorDialogActivity returns immediately).")

        ScheduleAppShutdownFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP delayed shutdown disabled (LicenseClient.scheduleAppShutdown returns immediately).")

        ExitActionFingerprint.method.addInstructions(0, "return-void")
        logger.info("Web Video Caster: PairIP exit action emptied (LicenseClient\$1.run returns immediately).")

        LicenseActivityOnStartFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent(),
        )
        logger.info("Web Video Caster: PairIP license activity neutralized (LicenseActivity.onStart finishes immediately).")
    }
}
