package app.sqzass.patches.all.monetization

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.sqzass.patches.shared.forceInvokeResult
import app.sqzass.patches.shared.methodReferenceOf
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import java.util.logging.Logger

private val logger = Logger.getLogger("MockPlayBillingPatch")

private const val BILLING_CLIENT = "Lcom/android/billingclient/api/BillingClient;"

// BillingResponseCode.OK.
private const val BILLING_OK = 0

private val CONSUME_METHODS = setOf("acknowledgePurchase", "consumeAsync", "endConnection")

private fun isBillingClientCall(instruction: Instruction, name: String, returnType: String): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == BILLING_CLIENT &&
        reference.name == name &&
        reference.returnType == returnType
}

private fun isConsumeCall(instruction: Instruction): Boolean {
    val reference = methodReferenceOf(instruction) ?: return false
    return reference.definingClass == BILLING_CLIENT &&
        reference.name in CONSUME_METHODS &&
        reference.returnType == "V"
}

@Suppress("unused")
val mockPlayBillingPatch = bytecodePatch(
    name = "Mock Play Billing client",
    description = "Mocks Play Billing client state: reports the client ready, feature checks as supported, and suppresses acknowledge, consume, and disconnect calls. Purchase query results cannot be fabricated without an extension.",
    default = false,
) {
    category("Monetization")

    val forceReadyOption = booleanOption(
        key = "forceBillingReady",
        default = true,
        title = "Force Billing Ready",
        description = "Force BillingClient.isReady to report true.",
    )
    val forceSupportedOption = booleanOption(
        key = "forceFeatureSupported",
        default = true,
        title = "Force Feature Supported",
        description = "Force BillingClient.isFeatureSupported to report OK.",
    )
    val suppressConsumeOption = booleanOption(
        key = "suppressConsumeCalls",
        default = true,
        title = "Suppress Consume Calls",
        description = "Nop acknowledgePurchase, consumeAsync, and endConnection calls.",
    )

    execute {
        val forceReady = forceReadyOption.value == true
        val forceSupported = forceSupportedOption.value == true
        val suppressConsume = suppressConsumeOption.value == true
        if (!forceReady && !forceSupported && !suppressConsume) {
            logger.info("All options disabled.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method ->
                method.implementation?.instructions?.let { raw ->
                    val instructions = raw.toList()
                    (forceReady && instructions.any { isBillingClientCall(it, "isReady", "Z") }) ||
                        (forceSupported && instructions.any { isBillingClientCall(it, "isFeatureSupported", "I") }) ||
                        (suppressConsume && instructions.any(::isConsumeCall))
                } == true
            },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices) {
                val instruction = instructions[index]
                if (forceReady && isBillingClientCall(instruction, "isReady", "Z") &&
                    forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x1" }
                ) {
                    count++
                } else if (forceSupported && isBillingClientCall(instruction, "isFeatureSupported", "I") &&
                    forceInvokeResult(instructions, index) { register -> "const/4 v$register, 0x$BILLING_OK" }
                ) {
                    count++
                } else if (suppressConsume && isConsumeCall(instruction)) {
                    replaceInstruction(index, "nop")
                    count++
                }
            }
            count
        }

        logger.info("Applied $patched Play Billing mock replacements.")
    }
}
