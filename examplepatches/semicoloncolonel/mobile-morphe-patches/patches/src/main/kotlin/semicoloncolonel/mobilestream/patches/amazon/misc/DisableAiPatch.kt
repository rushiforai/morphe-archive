package semicoloncolonel.mobilestream.patches.amazon.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.amazon.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Amazon Shopping 32.19.0.100 gates Rufus, its AI shopping assistant, with
// weblabs (RUFUS_* for the shell, tab, search and Shoptalk entry points,
// VS_LENS_ASK_RUFUS_* for the camera lens), and the Amazon Pay AI assistant
// with A2I_APAY_AI_ASSISTANT_*. Every treatment the app reads goes through
// IMobileWeblab, either getTreatmentAssignment() or
// getTreatmentAndRecordTrigger(). Several of its implementations have no
// spare register for a gate, so the app's calls to those two methods are
// rewritten instead, and AiFeatureFilter answers the control treatment "C"
// for the AI weblabs. Every other weblab is read as usual.
//
// Not covered: Rufus prompts that Amazon's web pages draw themselves.
// ─────────────────────────────────────────────────────────────────────────────

private const val MOBILE_WEBLAB = "Lcom/amazon/weblab/mobile/IMobileWeblab;"
private const val EXTENSION_PACKAGE = "Lsemicoloncolonel/mobilestream/extension/"

private val REPLACEMENTS = mapOf(
    "getTreatmentAssignment" to "$AI_FILTER->amazonTreatmentAssignment(Ljava/lang/Object;)Ljava/lang/String;",
    "getTreatmentAndRecordTrigger" to "$AI_FILTER->amazonTreatmentAndRecordTrigger(Ljava/lang/Object;)Ljava/lang/Object;",
)

private fun Instruction.weblabReplacement(): String? {
    if (opcode != Opcode.INVOKE_INTERFACE && opcode != Opcode.INVOKE_INTERFACE_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    if (reference.definingClass != MOBILE_WEBLAB || reference.parameterTypes.isNotEmpty()) return null
    return REPLACEMENTS[reference.name]
}

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Rufus, Amazon's AI shopping assistant, in the app's tabs, search, " +
        "and camera lens, and the AI assistant in Amazon Pay. Rufus prompts that Amazon's web " +
        "pages show inside the app may still appear. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // Collect first, mutate after: mutableClassDefBy swaps the class map entry.
        val targets = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            if (classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.weblabReplacement() != null } == true
                }
            ) {
                targets += classDef.type
            }
        }

        var rewritten = 0
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                // Snapshot: replaceInstruction mutates the live list.
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val replacement = instruction.weblabReplacement() ?: return@forEachIndexed
                    // The receiver is the only register, and becomes the static call's argument.
                    val smali = when (instruction) {
                        is FiveRegisterInstruction -> "invoke-static { v${instruction.registerC} }, $replacement"
                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister} }, $replacement"
                        else -> return@forEachIndexed
                    }
                    method.replaceInstruction(index, smali)
                    rewritten++
                }
            }
        }
        if (rewritten == 0) throw PatchException("No IMobileWeblab treatment calls found")
    }
}
