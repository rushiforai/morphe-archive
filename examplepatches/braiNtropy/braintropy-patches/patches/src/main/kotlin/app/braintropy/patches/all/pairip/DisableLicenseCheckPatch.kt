package app.braintropy.patches.all.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger

/**
 * The single entry point of the Pairip license check. Pairip classes are
 * injected by Google Play Automatic Integrity Protection with unobfuscated
 * names into every protected app. Called from
 * com.pairip.application.Application.attachBaseContext (and from
 * LicenseContentProvider.onCreate where declared). No-op'ing it disables
 * the entire check; all failure paths (paywall redirect, error dialog)
 * live behind it.
 */
private object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Custom-trial end trigger. Unlike everything else it bypasses checkLicense
 * and connects to the licensing service directly, so it needs its own no-op.
 * Only reachable in apps that use Pairip's custom trial feature.
 */
private object StopTrialFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "stopTrial",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch(
    name = "Disable Pairip license check",
    description = "Disables Google's Play Store license check. Works on degoogled devices; " +
        "does not bypass Play Integrity.",
    default = false
) {
    category("License")

    execute {
        val checkLicense = LicenseCheckFingerprint.methodOrNull ?: return@execute Logger
            .getLogger(this::class.java.name)
            .warning("Could not find the Pairip license check. No changes applied.")

        checkLicense.addInstructions(0, "return-void")
        StopTrialFingerprint.methodOrNull?.addInstructions(0, "return-void")
    }
}
