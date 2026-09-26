package app.plyrs1.patches.com_garnesapps_strukpom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPOM

@Suppress("unused")
val hideGiftButtonPatch = bytecodePatch(
    name = "Hide Gift Button",
    description = "Hides the gift / donation button in the top action bar of the main menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPOM)
    dependsOn(brandCreditPatch)

    execute {
        // In MenuActivity.onCreateOptionsMenu(Menu):
        // Return false directly at instruction index 0 to suppress inflating menu_hadiah.
        // Returning false causes the options menu to not be displayed.
        MenuActivityCreateOptionsMenuFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
