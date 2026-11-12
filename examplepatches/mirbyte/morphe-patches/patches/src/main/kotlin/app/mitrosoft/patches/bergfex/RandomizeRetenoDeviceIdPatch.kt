package app.mitrosoft.patches.bergfex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val RETENO_DEVICE_ID_MANAGER = "Lyp4;"

private fun Instruction.isSettingsSecureGetString() =
    opcode == Opcode.INVOKE_STATIC &&
        ((this as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == "Landroid/provider/Settings\$Secure;" && it.name == "getString"
        } == true

@Suppress("unused")
val randomizeRetenoDeviceIdPatch = bytecodePatch(
    name = "Randomize Reteno device ID (currently no effect, kept for future reference)",
    description = "Replaces the ANDROID_ID read in the Reteno device ID with a random UUID generated on each launch, " +
        "so the device ID cannot link sessions or accounts. Reteno does not initialize in the current build, " +
        "so this has no effect as of now.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        val method = mutableClassDefBy(RETENO_DEVICE_ID_MANAGER).methods.first { it.name == "a" }
        val index = method.implementation!!.instructions.indexOfFirst { it.isSettingsSecureGetString() }
        method.replaceInstruction(index, "invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;")
        method.addInstructions(
            index + 1,
            """
                move-result-object v3
                invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;
            """,
        )
    }
}
