package app.paresh.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideFamilyProtectionPatch = bytecodePatch(
    name = "Hide Family Protection button",
    description = "Hides the Family Protection button from the bottom navigation bar."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Return false for family protect feature check — tab won't be added
        FamilyProtectFeatureFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
