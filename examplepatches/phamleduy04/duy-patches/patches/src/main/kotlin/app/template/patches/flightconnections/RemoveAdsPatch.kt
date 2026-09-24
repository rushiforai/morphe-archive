package app.template.patches.flightconnections

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FLIGHTCONNECTIONS

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes interstitial and banner ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FLIGHTCONNECTIONS)

    execute {
        MainActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                sput-boolean v0, Lcom/flightconnections/MainActivity;->H0:Z
            """,
        )
    }
}
