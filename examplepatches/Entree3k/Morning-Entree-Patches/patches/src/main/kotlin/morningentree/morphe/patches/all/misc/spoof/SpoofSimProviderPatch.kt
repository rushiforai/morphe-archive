package morningentree.morphe.patches.all.misc.spoof

import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TELEPHONY_MANAGER = "Landroid/telephony/TelephonyManager;"

private fun String.escapeSmali() = replace("\\", "\\\\").replace("\"", "\\\"")

// Based on Rushi's patch

@Suppress("unused")
val spoofSimProviderPatch = bytecodePatch(
    name = "Spoof SIM provider",
    description = "Spoofs TelephonyManager SIM/network provider values.",
    default = false,
) {
    val iso by stringOption(
        key = "universalSimCountryIso",
        default = "us",
        title = "Country ISO",
        description = "Value returned for getSimCountryIso / getNetworkCountryIso.",
        required = true,
    )
    val operator by stringOption(
        key = "universalSimOperator",
        default = "310260",
        title = "Operator code",
        description = "MCC+MNC returned for getSimOperator / getNetworkOperator.",
        required = true,
    )
    val operatorName by stringOption(
        key = "universalSimOperatorName",
        default = "T-Mobile",
        title = "Operator name",
        description = "Value returned for getSimOperatorName / getNetworkOperatorName.",
        required = true,
    )

    execute {
        val values = mapOf(
            "getSimCountryIso" to (iso ?: "us"),
            "getNetworkCountryIso" to (iso ?: "us"),
            "getSimOperator" to (operator ?: "310260"),
            "getNetworkOperator" to (operator ?: "310260"),
            "getSimOperatorName" to (operatorName ?: "T-Mobile"),
            "getNetworkOperatorName" to (operatorName ?: "T-Mobile"),
        )

        classDefForEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.instructionsOrNull?.toList() ?: return@forEach
                instructions.forEachIndexed { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != TELEPHONY_MANAGER ||
                        reference.returnType != "Ljava/lang/String;"
                    ) return@forEachIndexed
                    val value = values[reference.name] ?: return@forEachIndexed
                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                        ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed
                    method.replaceInstruction(
                        index + 1,
                        "const-string v${moveResult.registerA}, \"${value.escapeSmali()}\"",
                    )
                }
            }
        }
    }
}
