package app.template.patches.alza

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ALZA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val alzaPriceHistoryPatch = bytecodePatch(
    name = "Alza Hlídač shopů Price History (CZ / SK)",
    description = "Displays inline price history chart from Hlídač shopů in product detail screen for Czech Republic and Slovakia (alza.cz / alza.sk). Includes compact/large mode replacing HomeCredit installments and settings in Menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ALZA)

    extendWith("extensions/extension.mpe")

    execute {
        with(AlzaHookManager) {
            // 1. Enable patch at app startup and fragment create
            injectApplicationInit(
                """
                    invoke-static {}, ${AlzaHookManager.EXTENSION_CLASS}->enablePriceHistoryPatch()V
                """
            )
            injectGodFragmentInit(
                """
                    invoke-static {}, ${AlzaHookManager.EXTENSION_CLASS}->enablePriceHistoryPatch()V
                """
            )

            // 2. Hook ProductPrices.getAlternativePrice to allow Compact Mode to eliminate HomeCredit / installments cleanly
            val altPriceMethod = ProductPricesGetAlternativePriceFingerprint.method
            val altInstructions = altPriceMethod.implementation!!.instructions
            val returnIdx = altInstructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (returnIdx != -1) {
                val returnInstruction = altInstructions[returnIdx] as OneRegisterInstruction
                val returnReg = returnInstruction.registerA
                altPriceMethod.addInstructions(
                    returnIdx,
                    """
                        invoke-static {p0, v$returnReg}, ${AlzaHookManager.EXTENSION_CLASS}->filterAlternativePrice(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$returnReg
                        check-cast v$returnReg, ${altPriceMethod.returnType}
                    """
                )
            }

            // 3. Ensure shared hooks
            ensureProductParamsHooked()
            ensurePriceSectionHooked()
            ensureSettingsHooked()
        }
    }
}
