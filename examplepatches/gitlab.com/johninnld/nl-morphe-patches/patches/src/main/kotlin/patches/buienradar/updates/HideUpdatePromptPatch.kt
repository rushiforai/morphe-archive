package patches.buienradar.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR
import patches.buienradar.shared.Constants.originalInput
import patches.shared.uniqueMatch

private object UpdatePromptDecision : Fingerprint(
    parameters = listOf("I"),
    returnType = "V",
    strings = listOf("APP_UPDATE_TIMES"),
)

@Suppress("unused")
val hideUpdatePromptPatch = bytecodePatch(
    name = "Hide update prompt",
    description = "Skips the startup update prompt and continues into Buienradar.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)
    dependsOn(originalInput)

    execute {
        val method = UpdatePromptDecision.uniqueMatch().method
        val (index, instruction) = method.instructions.withIndex().single { (_, candidate) ->
            candidate.opcode == Opcode.IF_GE
        }
        val branch = instruction as BuilderInstruction22t
        val resetCounter = (branch.target.location.instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        check(method.instructions[index + 1].opcode == Opcode.NEW_INSTANCE &&
            resetCounter?.parameterTypes?.map { it.toString() } == listOf("J", "Ljava/lang/String;") &&
            resetCounter.returnType == "V"
        ) { "Unexpected Buienradar update prompt decision" }

        // Take the stock continuation that resets the prompt counter and leaves the splash screen.
        method.implementation!!.replaceInstruction(index, BuilderInstruction20t(Opcode.GOTO_16, branch.target))
    }
}
