package app.stayfree.patches.ui

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hideTextsPatch = bytecodePatch(
    name = "Hide texts",
    description = "Hides the instruction text on the \"Pair with code\" screen: \"Select the app " +
        "you want to pair your Android app with:\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // "Select the app you want to pair …": drop the Text call and the Spacer call after it.
        // A removed composable call is a removed self-contained group, so this stays balanced too.
        val method = PairWithCodeSelectTextFingerprint.method
        val stringIndex = PairWithCodeSelectTextFingerprint.instructionMatches.first().index
        val drawCalls = method.implementation!!.instructions.withIndex()
            .filter { (index, instruction) ->
                index > stringIndex &&
                    (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).returnType == "V"
            }
            .take(2)
            .map { it.index }
            .toList()
        if (drawCalls.size != 2) throw PatchException("Pair-with-code Text/Spacer calls not found")
        drawCalls.forEach { method.replaceInstruction(it, "nop") }
    }
}
