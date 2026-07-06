package app.paresh.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val hideAssistantTabPatch = bytecodePatch(
    name = "Hide Assistant tab",
    description = "Hides the Assistant tab from the bottom navigation bar."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Return false for assistant feature check — tab won't be added
        AssistantFeatureFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
