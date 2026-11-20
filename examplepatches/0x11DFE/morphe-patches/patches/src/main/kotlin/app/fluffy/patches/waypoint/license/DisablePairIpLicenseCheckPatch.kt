package app.fluffy.patches.waypoint.license

import app.fluffy.patches.shared.Constants.COMPATIBILITY_WAYPOINT
import app.fluffy.patches.waypoint.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disablePairIpLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = "Empties com.pairip.licensecheck.LicenseClient.checkLicense so PairIP does " +
        "not kill the re-signed APK. Works on any app that ships this class.",) {
    compatibleWith(COMPATIBILITY_WAYPOINT)

    execute {
        val licenseClient = sequenceOf(
            "Lcom/pairip/licensecheck/LicenseClient;",
            "Lcom/pairip/licensecheck3/LicenseClient;",
        ).mapNotNull { runCatching { mutableClassDefBy(it) }.getOrNull() }
            .firstOrNull()
            ?: throw IllegalStateException("PairIP LicenseClient class not found")

        licenseClient.methods
            .first { it.name == "checkLicense" && it.returnType == "V" }
            .apply {
                clearBody()
                addInstructions(0, "return-void")
            }
    }
}
