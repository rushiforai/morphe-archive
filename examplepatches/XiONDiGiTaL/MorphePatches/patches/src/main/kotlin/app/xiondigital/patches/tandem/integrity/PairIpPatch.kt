package app.xiondigital.patches.tandem.integrity

import app.morphe.patcher.patch.bytecodePatch
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APK
import app.xiondigital.patches.tandem.shared.Constants.COMPATIBILITY_TANDEM_APKM
import app.xiondigital.patches.tandem.shared.replaceBodyWithFinish
import app.xiondigital.patches.tandem.shared.replaceBodyWithReturnVoid

/**
 * Lets a patched, re-signed Tandem build start at all.
 *
 * Tandem 6.38.0 is protected with PairIP. Its manifest declares `com.pairip.application.Application`
 * as the app class, and that class's `attachBaseContext` runs two checks before Tandem's own
 * initialisation:
 *
 * 1. `SignatureCheck.verifyIntegrity(context)` hashes the installed APK's signing certificate and
 *    throws `SignatureTamperedException("Apk signature is invalid.")` when it does not match one of
 *    the expected values. Any re-signed APK fails this, so the process dies before the first
 *    activity — including with no patches applied beyond the re-sign itself.
 * 2. `LicenseClient.checkLicense(context)` binds Play's licensing service, which a sideloaded build
 *    cannot satisfy.
 *
 * Both methods are pure checks: they return nothing, keep no state that other code depends on, and
 * are not used by anything else in the APK. Replacing their bodies with `return-void` removes the
 * two gates without touching Tandem's startup, its network layer or its account handling.
 *
 * Skipping the checks is not enough on its own, because the licence flow is not only a check — it
 * also has a screen and a kill switch:
 *
 * - `LicenseClient.startPaywallActivity(PendingIntent)` fires the store listing carried by Play's
 *   licensing response and then closes the app: the user is thrown into Google Play and back out
 *   of Tandem at launch.
 * - `LicenseClient.startErrorDialogActivity()` is the same for a soft failure.
 * - `LicenseClient.scheduleAppShutdown()` arms a 30-second delayed exit, so a run that looks
 *   healthy at first still terminates.
 * - `LicenseActivity.onStart()` renders whichever of the two the intent asks for. It is finished
 *   here because the licence runtime PairIP decrypts at startup is not visible to a dex
 *   fingerprint, so this is the one place that stays reachable from any caller.
 *
 * PairIP's method-level protection (`VMRunner`, `StartupLauncher`) is deliberately left intact, so
 * the classes it decrypts at runtime are still loaded normally.
 *
 * The same flow exists in 6.12.0 under different names — `LicenseClient.connectToLicensingService()`
 * connects the client, `LicenseClient.checkLicenseInternal(IBinder)` handles the response and
 * `LicenseActivity.showPaywallAndCloseApp()` is what puts Play's listing on screen — so those are
 * emptied too when a build declares them.
 *
 * A device test on 2026-11-04 showed these stubs are not enough on their own: the launch still
 * reaches Play's licence paywall and dies inside `libpairipcore.so`. See
 * `Tandem/DEVICE-TEST.md` for the measurement, including the attempts that were tried and did not
 * help.
 */
@Suppress("unused")
val bypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP checks",
    description = "Skips PairIP's APK signature and Play licence checks, which otherwise stop a " +
        "re-signed build from starting. Required for any patched Tandem build to run.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TANDEM_APK, COMPATIBILITY_TANDEM_APKM)

    execute {
        // Present in both inspected builds, so these two have to match. The signature gate is what
        // kills a re-signed APK outright; the activity is the one screen the licence flow can put
        // in front of the user.
        PairIpVerifyIntegrityFingerprint.method.replaceBodyWithReturnVoid()
        PairIpLicenseActivityStartFingerprint.method.replaceBodyWithFinish()

        // The licence plumbing is not stable across PairIP versions: 6.38.0 has
        // `checkLicense(Context)`, `startPaywallActivity`, `startErrorDialogActivity` and
        // `scheduleAppShutdown`, while 6.12.0 has `connectToLicensingService()` and
        // `showPaywallAndCloseApp()` instead. Each one is emptied when the build still declares it
        // and skipped when it does not, so one bundle covers both builds without either of them
        // failing on a method the other one renamed.
        listOf(
            PairIpLicenseCheckFingerprint,
            PairIpLicensePaywallFingerprint,
            PairIpLicenseErrorDialogFingerprint,
            PairIpLicenseShutdownFingerprint,
            PairIpLicenseServiceConnectFingerprint,
            PairIpLicensePaywallActivityFingerprint,
        ).forEach { fingerprint ->
            fingerprint.methodOrNull?.replaceBodyWithReturnVoid()
        }
    }
}
