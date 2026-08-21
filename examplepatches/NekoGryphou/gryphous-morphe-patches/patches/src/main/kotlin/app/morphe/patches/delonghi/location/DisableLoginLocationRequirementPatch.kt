package app.morphe.patches.delonghi.location

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.delonghi.shared.COMPATIBILITY_DELONGHI_COMFORT
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val disableLoginLocationRequirementPatch = bytecodePatch(
    name = "Disable login location requirement",
    description = "Allows login and registration without granting location permission.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DELONGHI_COMFORT)

    execute {
        // Suppress the startup fragment's fine-location permission prompt.
        StartupLocationRequestFingerprint.method.addInstructions(0, "return-void")

        // Preserve the rest of each button handler while making its local permission
        // branch continue through the normal login or registration path.
        listOf(LoginLocationGateFingerprint, RegisterLocationGateFingerprint).forEach { fingerprint ->
            val moveResult = fingerprint.instructionMatches.last()
            val register = moveResult.getInstruction<OneRegisterInstruction>().registerA
            fingerprint.method.replaceInstruction(moveResult.index, "const/4 v$register, 0x1")
        }
    }
}
