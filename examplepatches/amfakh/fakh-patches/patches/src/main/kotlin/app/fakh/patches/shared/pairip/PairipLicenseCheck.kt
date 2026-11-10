package app.fakh.patches.shared.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `com.pairip.licensecheck.LicenseClient.checkLicense(Context)`, called from
 * `com.pairip.application.Application.attachBaseContext` and `LicenseContentProvider.onCreate`. It asks the Play
 * licensing service about the install and closes the app, or opens a "Get this app from Play" screen, when the
 * response fails to verify. A repackaged APK always fails it.
 */
private val checkLicenseFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/pairip/licensecheck/") && method.name == "checkLicense"
    },
)

/** Makes Pairip's license check return at once. Apps that carry it depend on this patch. */
val pairipLicenseCheckPatch = bytecodePatch {
    execute {
        checkLicenseFingerprint.method.addInstructions(0, "return-void")
    }
}
