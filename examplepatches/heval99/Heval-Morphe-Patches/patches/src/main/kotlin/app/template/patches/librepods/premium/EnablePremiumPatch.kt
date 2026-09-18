package app.template.patches.librepods.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LIBREPODS
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the 'Advanced device settings' features (Personalized Volume, Adaptive Audio, " +
        "accessibility configs, hearing protection, etc.) that LibrePods gates behind the Play Store " +
        "'Unlock advanced features' one-time purchase. The patch forces the premium entitlement " +
        "(PlayBillingProvider's _isPremium StateFlow) to always be true."
) {
    compatibleWith(COMPATIBILITY_LIBREPODS)

    execute {
        val processPurchases = ProcessPurchasesFingerprint.methodOrNull
            ?: throw PatchException("Failed to resolve PlayBillingProvider.processPurchases")

        val instructions = processPurchases.implementation?.instructions?.toList()
            ?: throw PatchException("processPurchases has no instruction implementation")

        // Locate the single boxed write-back `Integer.valueOf-style` wrap:
        //     invoke-static {vX}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        // whose result lands in `_isPremium.value`. Forcing vX to 1 here makes the
        // StateFlow emit true unconditionally, unlocking every gated screen.
        val indexOfValueOf = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/lang/Boolean;" &&
                    reference.name == "valueOf" &&
                    reference.returnType == "Ljava/lang/Boolean;"
            }
        }
        if (indexOfValueOf < 0) {
            throw PatchException("Boolean.valueOf write-back not found in processPurchases")
        }

        val valueOfInstruction = instructions[indexOfValueOf]
        val booleanRegister: Int = when (valueOfInstruction) {
            // invoke-static {vX}, ... -> registers carried by 35c format.
            is FiveRegisterInstruction -> {
                if (valueOfInstruction.registerCount != 1) {
                    throw PatchException(
                        "Unexpected Boolean.valueOf register count: ${valueOfInstruction.registerCount}"
                    )
                }
                valueOfInstruction.registerC
            }
            is OneRegisterInstruction -> valueOfInstruction.registerA
            else -> throw PatchException("Unexpected Boolean.valueOf format: ${valueOfInstruction.opcode}")
        }

        // The boxed value is handed straight to _isPremium (a MutableStateFlow) via
        // Lqy2->j(Object, Object)Z, so forcing the register here makes the flow emit true.
        processPurchases.addInstructions(
            indexOfValueOf,
            "const/4 v$booleanRegister, 0x1",
        )
    }
}