package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

/**
 * The app is protected by Google's PairIP license checker
 * (com.pairip.licensecheck, classes2.dex). Even with the local installer
 * check defeated, the client still binds to the Play licensing service and
 * runs *repeated* license checks while the app is open; a failed check pops
 * LicenseActivity (error dialog / paywall) and schedules an app shutdown 30s
 * later — which is how a patched build still "detects" it is patched.
 *
 * The kill chain in 2.1.6:
 *   pairip Application.attachBaseContext
 *     -> LicenseContentProvider.onCreate / LicenseClient.checkLicense(Context)
 *        -> initializeLicenseCheck -> bindToLicensingService
 *        -> onServiceConnected -> checkLicenseInternal -> processResponse
 *        -> (failure) startErrorDialogActivity / startPaywallActivity
 *        -> scheduleAppShutdown (exitAction after 30s)
 *
 * Neutering the three entry points below severs the whole chain:
 *  1. LicenseClient.checkLicense(Context)V  — no check is ever started
 *  2. LicenseClient.stopTrial(Context)V     — trial expiry path, same UI
 *  3. performLocalInstallerCheck()Z stays forced-true for any direct callers
 *
 * The licensing service binding is never established, so processResponse /
 * scheduleRepeatedLicenseCheck / LicenseActivity are never reached.
 */
@Suppress("unused")
val bypassPlayStoreRedirectPatch = bytecodePatch(
    name = "Bypass Play Store redirect",
    description = "Disables the PairIP license check entirely (initial + repeated checks and the trial path) so a sideloaded or patched build is never flagged, and no Play Store redirect or shutdown happens.",
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        // 1. Never start the license check.
        LicenseClientCheckLicenseFingerprint.method.addInstruction(0, "return-void")

        // 2. Never run the trial-expiry path (also drives the same UI).
        LicenseClientStopTrialFingerprint.method.addInstruction(0, "return-void")

        // 3. Direct install-source probes still report "from Play".
        LicenseClientPerformLocalInstallerCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
