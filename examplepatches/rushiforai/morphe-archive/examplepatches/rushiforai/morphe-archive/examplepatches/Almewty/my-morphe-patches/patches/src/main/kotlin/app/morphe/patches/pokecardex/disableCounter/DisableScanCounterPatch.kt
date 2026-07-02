package app.morphe.patches.pokecardex.disableCounter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableScanCounterPatch = bytecodePatch(
    name = "Disable scan counter",
    description = "Disables the scan counter increment, preventing the scan count from increasing",
) {
    compatibleWith("com.application.pokecardex"("8.7.2"))

    execute {
        // Find the method that increments the scan counter
        DisableCounterFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
