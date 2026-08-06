package app.heinrich26.patches.example

import app.morphe.patcher.patch.bytecodePatch
import app.heinrich26.patches.shared.Constants.COMPATIBILITY_MT_CAPSULE
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val getProStatusPatch = bytecodePatch(
    name = "Unlock Pro",
    default = true
) {
    compatibleWith(COMPATIBILITY_MT_CAPSULE)

    execute {
        GetProStatusFingerprint.let {
            val beginIf = it.instructionMatches[1].index
            it.method.removeInstructions(beginIf, it.instructionMatches[2].index - beginIf + 1)

            val register = it.instructionMatches[0].getInstruction<OneRegisterInstruction>().registerA
            it.method.replaceInstruction(it.instructionMatches[0].index, "const/4 v$register, 0x1")
        }
    }
}
