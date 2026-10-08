package patches.safar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * Safar is wrapped with Google Play's PairIP automatic integrity/licensing protection
 * (com.pairip.licensecheck.*). On a re-signed (sideloaded) build, Play's licensing service reports the
 * app as not legitimately acquired, so PairIP blocks it — either the "Get this app from Play" paywall or
 * a "Something went wrong" error dialog — and then kills the process.
 *
 * In LicenseClient, every block funnels through exactly two methods, and nothing else reaches the
 * blocking UI or the app-kill:
 *   - startPaywallActivity(PendingIntent): launches LicenseActivity as the PAYWALL ("get from Play").
 *   - startErrorDialogActivity(): launches LicenseActivity as the ERROR_DIALOG ("something went wrong");
 *     this is where handleError(...) (the universal error sink) ends up.
 * Both, and only these two, first call scheduleAppShutdown() (the sole caller of the process-kill) and
 * then startActivity(...). So stubbing both to return immediately removes the paywall, the error dialog,
 * and the scheduled shutdown at once — the app proceeds normally whatever the licensing verdict is.
 *
 * PairIP's class/method names are the library's own and un-obfuscated, so these anchor cleanly. PairIP's
 * VMRunner code protection is independent and does not cover these license classes (plain smali).
 */
internal val startPaywallActivityFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    custom = { m, c -> c.type == "Lcom/pairip/licensecheck/LicenseClient;" && m.name == "startPaywallActivity" },
)

internal val startErrorDialogActivityFingerprint = Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { m, c -> c.type == "Lcom/pairip/licensecheck/LicenseClient;" && m.name == "startErrorDialogActivity" },
)

@Suppress("unused")
val bypassLicensePatch = bytecodePatch(
    name = "Bypass license verification",
    description = "Bypasses Google Play's PairIP license check so a re-signed Safar build runs instead " +
        "of being blocked by the \"Get this app from Play\" paywall or a \"Something went wrong\" dialog.",
) {
    compatibleWith(COMPATIBILITY_SAFAR)

    execute {
        // Neutralise the only two methods that launch the blocking LicenseActivity (and schedule the
        // app shutdown): the app is never blocked or killed regardless of the licensing verdict.
        startPaywallActivityFingerprint.method.addInstructions(0, "return-void")
        startErrorDialogActivityFingerprint.method.addInstructions(0, "return-void")
    }
}
