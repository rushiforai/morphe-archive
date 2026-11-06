package app.template.patches.shared.privacy
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal "Empty telephony identifiers" patch.
// Replaces the move-result-object of TelephonyManager ID getters
// (getDeviceId/getImei/getMeid/getSubscriberId/getLine1Number/getSimSerialNumber/
// getDeviceSoftwareVersion) with const-string "". Fail-safe; default = false.

private const val TELEPHONY_MANAGER = "Landroid/telephony/TelephonyManager;"

private val ID_GETTERS = setOf(
    "getDeviceId",
    "getImei",
    "getMeid",
    "getSubscriberId",
    "getLine1Number",
    "getSimSerialNumber",
    "getDeviceSoftwareVersion",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val emptyTelephonyIdsPatch = bytecodePatch(
    name = "Empty telephony identifiers (IMEI, phone number, SIM)",
    description = """
        Makes TelephonyManager device-identifier getters (IMEI, device ID, phone
        number, subscriber ID, SIM serial, software version) return an empty string
        to the app.

        Applies to any app. Features that need the real IMEI/number may degrade.
    """.trimIndent(),
    default = false,
) {
    execute {
        var patched = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != TELEPHONY_MANAGER) return@forEachIndexed
                    if (reference.name !in ID_GETTERS || reference.returnType != "Ljava/lang/String;") {
                        return@forEachIndexed
                    }

                    val moveResult = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                    if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) return@forEachIndexed

                    replacements[index + 1] = "const-string v${moveResult.registerA}, \"\""
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                    patched += replacements.size
                }
            }
        }

        logUniversal("Empty telephony IDs: $patched call site(s) now return \"\".")
    }
}
