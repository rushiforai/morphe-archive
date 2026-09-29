package app.plyrs1.patches.com_habitrpg_android_habitica

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_HABITICA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val selfHostedServerPatch = bytecodePatch(
    name = "Self-Hosted Server Support",
    description = "Always shows the custom server settings button on the login screen, " +
            "enabling connection to self-hosted Habitica backends without a secret gesture.",
    default = true
) {
    compatibleWith(COMPATIBILITY_HABITICA)

    execute {
        val method = AuthenticationViewModelInitFingerprint.method
        val instructions = method.instructions

        // Find iput-object targeting _serverSettingsRevealed
        val serverSettingsIndex = instructions.indexOfFirst {
            it is ReferenceInstruction && (it.reference as? FieldReference)?.name == "_serverSettingsRevealed"
        }
        require(serverSettingsIndex != -1) { "Could not find _serverSettingsRevealed field assignment" }

        // Walk backward to the invoke-static call creating the StateFlow
        var invokeIndex = -1
        for (i in serverSettingsIndex - 1 downTo 0) {
            val inst = instructions[i]
            if (inst.opcode == Opcode.INVOKE_STATIC) {
                invokeIndex = i
                break
            }
        }
        require(invokeIndex != -1) { "Could not find invoke-static before _serverSettingsRevealed" }

        val invokeInst = instructions[invokeIndex]
        val targetRegister = if (invokeInst is FiveRegisterInstruction) {
            "v${invokeInst.registerC}"
        } else {
            "p1"
        }

        // Overwrite register with Boolean.TRUE immediately before StateFlow creation
        method.addInstructions(
            invokeIndex,
            """
                sget-object $targetRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            """
        )
    }
}
