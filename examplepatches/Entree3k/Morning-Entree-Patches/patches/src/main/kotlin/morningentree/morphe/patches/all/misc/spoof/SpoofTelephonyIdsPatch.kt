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
val spoofTelephonyIdsPatch = bytecodePatch(
    name = "Spoof telephony IDs",
    description = "Spoofs IMEI, MEID, subscriber ID, SIM serial, and line number reads.",
    default = false,
) {
    val imei by stringOption(
        key = "universalImei",
        default = "356938035643809",
        title = "IMEI",
        description = "Value returned for getDeviceId / getImei.",
        required = true,
    )
    val meid by stringOption(
        key = "universalMeid",
        default = "A000004E4F4F50",
        title = "MEID",
        description = "Value returned for getMeid.",
        required = true,
    )
    val subscriberId by stringOption(
        key = "universalSubscriberId",
        default = "310260000000000",
        title = "Subscriber ID",
        description = "Value returned for getSubscriberId (IMSI).",
        required = true,
    )
    val simSerial by stringOption(
        key = "universalSimSerial",
        default = "89014103211118510720",
        title = "SIM serial",
        description = "Value returned for getSimSerialNumber.",
        required = true,
    )
    val lineNumber by stringOption(
        key = "universalLineNumber",
        default = "+15551234567",
        title = "Line number",
        description = "Value returned for getLine1Number.",
        required = true,
    )

    execute {
        val values = mapOf(
            "getDeviceId" to (imei ?: "356938035643809"),
            "getImei" to (imei ?: "356938035643809"),
            "getMeid" to (meid ?: "A000004E4F4F50"),
            "getSubscriberId" to (subscriberId ?: "310260000000000"),
            "getSimSerialNumber" to (simSerial ?: "89014103211118510720"),
            "getLine1Number" to (lineNumber ?: "+15551234567"),
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
