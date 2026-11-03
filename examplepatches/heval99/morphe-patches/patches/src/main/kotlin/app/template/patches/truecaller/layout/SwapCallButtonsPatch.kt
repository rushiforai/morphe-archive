package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val swapCallButtonsPatch = bytecodePatch(
    name = "Swap call answer and decline buttons",
    description = "Puts the answer button on the left and the decline button on the right.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Each swipe button's modifier gets offset(x, y) right before its test tag is loaded: the
        // decline button -width / 3.5, the answer button +width / 3.5. Negating x on both moves
        // each to the other side. Offsets follow the layout direction, so right-to-left layouts are
        // mirrored the same way. The offset call is found by shape: a static
        // (Float, Float, Int, Modifier)Modifier call, Modifier being this composable's first
        // parameter type.
        val method = IncomingCallButtonsFingerprint.method
        val modifier = method.parameterTypes.firstOrNull()?.toString()
            ?: throw PatchException("The incoming call buttons composable has no parameters")
        val offsetParameters = listOf("F", "F", "I", modifier)

        // Highest index first, so the earlier index stays valid after the insert.
        for (tag in listOf("answerCallButton", "rejectCallButton")) {
            val instructions = method.instructions.toList()
            val tagIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && ((it as ReferenceInstruction).reference as StringReference).string == tag
            }
            val offsetIndex = (tagIndex - 1 downTo 0).firstOrNull { index ->
                val instruction = instructions[index]
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                instruction.opcode == Opcode.INVOKE_STATIC && call?.returnType == modifier &&
                    call.parameterTypes.map(CharSequence::toString) == offsetParameters
            } ?: throw PatchException("No offset modifier before the \"$tag\" swipe button")
            // offset's first argument is x; neg-float takes 4-bit registers (checked).
            val x = method.getInstruction<FiveRegisterInstruction>(offsetIndex).registerC
            method.requireNoBranchTargetAt(offsetIndex, "Swap call answer and decline buttons")
            method.addInstructionsChecked(offsetIndex, "neg-float v$x, v$x")
        }
    }
}
