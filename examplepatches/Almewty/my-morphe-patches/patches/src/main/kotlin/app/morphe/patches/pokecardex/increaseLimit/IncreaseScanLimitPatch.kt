package app.morphe.patches.pokecardex.increaseLimit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val increaseScanLimitPatch = bytecodePatch(
    name = "Increase scan limit",
    description = "Increases the free scan limit from 30 to 50 scans",
) {
    compatibleWith("com.application.pokecardex"("8.7.2"))

    execute {
        // Find the method that returns the scan limit
        IncreaseScanLimitFingerprint.method.addInstructions(
            0, // insert at the beginning
            """
                const/16 v0, 0x32
                return v0
            """
        )
    }
}