package app.template.patches.siagatani

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.siagatani.Constants.SIAGA_TANI

@Suppress("unused")
val disableMockLocationDetectionPatch = bytecodePatch(
    name = "Disable mock location detection",
    description = "Bypasses mock location detection so fake GPS works without root.",
    default = true
) {
    compatibleWith(SIAGA_TANI)

    execute {
        MockLocationCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        MockLocationCheckBridgeFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
