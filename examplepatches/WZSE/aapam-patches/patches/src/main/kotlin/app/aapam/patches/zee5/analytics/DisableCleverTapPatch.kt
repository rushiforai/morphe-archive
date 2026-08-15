package app.aapam.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.aapam.patches.zee5.shared.CleverTapInitFingerprint
import app.aapam.patches.zee5.shared.Constants

@Suppress("unused")
val disableCleverTapPatch = bytecodePatch(
    name = "Disable CleverTap",
    description = "Prevents the CleverTap analytics SDK from initializing, " +
        "stopping behavioral tracking and advertising-id (GAID) collection.",
) {
    compatibleWith(Constants.COMPATIBILITY_ZEE5_TV)

    execute {
        CleverTapInitFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
