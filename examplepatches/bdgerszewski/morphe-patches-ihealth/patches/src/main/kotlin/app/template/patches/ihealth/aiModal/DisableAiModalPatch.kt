package app.template.patches.ihealth.aiModal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_IHEALTH

@Suppress("unused")
val disableAiModalPatch = bytecodePatch(
    name = "Disable AI motivational modal",
    description = "Prevents the AI-generated motivational modal from appearing after a blood pressure reading.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IHEALTH)

    execute {
        BpIncentiveIsShowDialogFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
