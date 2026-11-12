package app.template.patches.shared.privacy

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ADVERTISING_INFO =
    "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"
private const val SETTINGS_SECURE = "Landroid/provider/Settings\$Secure;"
private const val ANDROID_ID = "android_id"

private val SETTINGS_GETTERS = setOf("getString", "getStringForUser")

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC,
    Opcode.INVOKE_STATIC_RANGE,
)

@Suppress("unused")
val blockAdvertisingAndDeviceIdsPatch = bytecodePatch(
    name = "Block advertising & device IDs",
    description = """
        Makes the Google advertising ID empty, marks ad tracking as limited, and
        blanks Android ID reads.

        Applies to any app. Features that rely on a stable device identifier may
        degrade or reset.
    """.trimIndent(),
    default = false,
) {
    val blockAdvertisingId by booleanOption(
        key = "blockAdvertisingId",
        default = true,
        title = "Block advertising ID",
        description = "Return an empty advertising ID and report limited ad tracking.",
    )
    val blockAndroidId by booleanOption(
        key = "blockAndroidId",
        default = true,
        title = "Block Android ID",
        description = "Return an empty string for Settings.Secure android_id reads.",
    )

    execute {
        val advertisingEnabled = blockAdvertisingId ?: true
        val androidIdEnabled = blockAndroidId ?: true
        if (!advertisingEnabled && !androidIdEnabled) return@execute

        var adId = 0
        var limitTracking = 0
        var androidId = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@forEachIndexed

                    when {
                        advertisingEnabled &&
                            reference.definingClass == ADVERTISING_INFO &&
                            reference.name == "getId" &&
                            reference.returnType == "Ljava/lang/String;" -> {
                            if (replaceResultWithString(instructions, index, replacements)) adId++
                        }

                        advertisingEnabled &&
                            reference.definingClass == ADVERTISING_INFO &&
                            reference.name == "isLimitAdTrackingEnabled" &&
                            reference.returnType == "Z" -> {
                            if (replaceResultWithBoolean(instructions, index, replacements)) limitTracking++
                        }

                        androidIdEnabled && isAndroidIdRead(instructions, index, reference) -> {
                            if (replaceResultWithString(instructions, index, replacements)) androidId++
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal(
            "Block advertising & device IDs: adId=$adId " +
                "limitTracking=$limitTracking androidId=$androidId.",
        )
    }
}

private fun replaceResultWithString(
    instructions: List<Instruction>,
    invokeIndex: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
        ?: return false
    if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) return false
    replacements[invokeIndex + 1] = "const-string v${moveResult.registerA}, \"\""
    return true
}

private fun replaceResultWithBoolean(
    instructions: List<Instruction>,
    invokeIndex: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val moveResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
        ?: return false
    if (moveResult.opcode != Opcode.MOVE_RESULT) return false
    replacements[invokeIndex + 1] = constValue(moveResult.registerA, 1)
    return true
}

private fun isAndroidIdRead(
    instructions: List<Instruction>,
    index: Int,
    reference: MethodReference,
): Boolean {
    if (reference.definingClass != SETTINGS_SECURE) return false
    if (reference.name !in SETTINGS_GETTERS) return false
    if (reference.returnType != "Ljava/lang/String;") return false
    if (reference.parameterTypes.size < 2) return false
    if (reference.parameterTypes[1].toString() != "Ljava/lang/String;") return false

    val keyRegister = argumentRegister(instructions[index], 1) ?: return false
    return stringLiteralForRegister(instructions, index, keyRegister) == ANDROID_ID
}

private fun stringLiteralForRegister(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
): String? {
    var inspected = 0

    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]

        if (instruction is OneRegisterInstruction && instruction.registerA == register) {
            return (instruction as? ReferenceInstruction)?.reference
                ?.let { it as? StringReference }
                ?.string
        }

        if (instruction.opcode == Opcode.MOVE_RESULT ||
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT ||
            instruction.opcode == Opcode.MOVE_RESULT_WIDE
        ) return null

        if (++inspected >= 8) return null
    }

    return null
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        3 -> instruction.registerF
        4 -> instruction.registerG
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
}
