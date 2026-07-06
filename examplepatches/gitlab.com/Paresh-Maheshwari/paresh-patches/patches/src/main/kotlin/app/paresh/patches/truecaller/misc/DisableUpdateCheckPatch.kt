package app.paresh.patches.truecaller.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER

@Suppress("unused")
val disableUpdateCheckPatch = bytecodePatch(
    name = "Disable update check",
    description = "Disables the in-app update check."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        ShouldTriggerUpdateFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
