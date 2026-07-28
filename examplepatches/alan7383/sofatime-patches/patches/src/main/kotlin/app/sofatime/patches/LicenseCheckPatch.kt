package app.sofatime.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sofatime.shared.Constants.SOFATIME_COMPATIBILITY

@Suppress("unused")
val licenseCheckPatch = bytecodePatch(
    name = "SofaTime License Check Bypass",
    description = "Bypasses PairIP license verification.",
) {
    compatibleWith(SOFATIME_COMPATIBILITY)

    execute {
        Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "checkLicense",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "V"
        ).method.addInstructions(
            0,
            """
                return-void
            """
        )

        Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "initializeLicenseCheck",
            returnType = "V"
        ).method.addInstructions(
            0,
            """
                return-void
            """
        )

        Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
            name = "onCreate",
            returnType = "Z"
        ).method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

    }
}
