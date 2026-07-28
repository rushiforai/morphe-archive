package app.template.patches.rustore.kaspersky

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val disableKasperskyScanPatch = bytecodePatch(
    name = "Disable background scan",
    description = "Disables the periodic Kaspersky background device scan.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        KasperskyScannerDtoIsPeriodicScanEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        KasperskyScannerWorkerEnqueuePeriodicFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
