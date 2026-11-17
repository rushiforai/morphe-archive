package app.zdrgon.patches.forscanlite.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.forscanlite.shared.Constants.COMPATIBILITY_FORSCAN_LITE

/**
 * FORScan Lite — Enable license.
 *
 * The app is activated with an FSLA code that FORScan's server
 * validates (POST to forscan.org/api/activationv3.php with the
 * code and the device's android_id). On success the server's
 * response is stored as FS_LICENSE_KEY next to an encrypted
 * valid-until timestamp (activation + 60 days). At startup, one
 * method — SplashScreenActivityLite.p() — reads that state and
 * returns 1 (proceed into the app), 0 (revalidate online or show
 * the activation dialog), or -1 (error). The stored key's content
 * is never parsed or verified anywhere in the app: it is only
 * presence-checked at this gate and sent verbatim to the revoke
 * endpoint if the user revokes. No feature code reads the license
 * state at all — the splash gate is the entire enforcement.
 *
 * This patch pins the gate to return 1 at entry: the same outcome
 * a licensed install reaches once its stored window has run out.
 * No server response or license key is fabricated — nothing is
 * stored and the activation server is never called; the app just
 * always takes its own licensed branch. (The in-app "revoke
 * activation" entry has nothing to revoke in a patched build.)
 */
@Suppress("unused")
val enableLicensePatch = bytecodePatch(
    name = "Enable license",
    description = "Opens the full app without an activation code. FORScan Lite checks " +
        "your license once at startup against its server; this patch pins that startup " +
        "check to its licensed outcome, so the activation dialog never appears and no " +
        "activation request is sent. FORScan Lite 1.5.31 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FORSCAN_LITE)

    execute {
        // Return code 1 is the gate's own "licensed, proceed"
        // outcome — proven from the method's branches and from the
        // validator task, whose success code is also 1 and leads
        // to the same app loader.
        LicenseGateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
