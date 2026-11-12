package app.template.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val BILLING_CLIENT = "Lcom/android/billingclient/api/BillingClient;"

private val PURCHASE_FLOW_METHODS = setOf(
    "launchBillingFlow",
    "launchPriceConfirmationFlow",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_OBJECT,
    Opcode.MOVE_RESULT_WIDE,
)

@Suppress("unused")
val blockPlayBillingPromptsPatch = bytecodePatch(
    name = "Block Play Billing purchase prompts",
    description = """
        Removes Google Play Billing purchase-flow calls whose return value is unused,
        so the purchase sheet does not open.

        Applies to any app using Play Billing. This does not unlock paid features or
        fake purchases. Best effort: flows that consume the returned BillingResult
        are skipped.
    """.trimIndent(),
    default = false,
) {
    val blockPurchaseFlows by booleanOption(
        key = "blockPurchaseFlows",
        default = true,
        title = "Block purchase flows",
        description = "Remove Play Billing purchase-flow calls when their result is unused.",
    )

    execute {
        val billingEnabled = blockPurchaseFlows ?: true
        if (!billingEnabled) return@execute

        var removed = 0
        var skipped = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed
                    if (reference.definingClass != BILLING_CLIENT) return@forEachIndexed
                    if (reference.name !in PURCHASE_FLOW_METHODS) return@forEachIndexed

                    if (isResultUnused(instructions, index)) {
                        replacements[index] = "nop"
                        removed++
                    } else {
                        skipped++
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal("Block Play Billing prompts: removed=$removed skipped=$skipped.")
    }
}

private fun isResultUnused(instructions: List<Instruction>, invokeIndex: Int): Boolean =
    instructions.getOrNull(invokeIndex + 1)?.opcode !in MOVE_RESULT_OPCODES
