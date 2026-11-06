package app.template.patches.shared.privacy
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Universal "Hide developer options & USB debugging" patch.
// Forces Settings getInt/getLong reads of adb_enabled /
// development_settings_enabled / adb_wifi_enabled / wireless_debugging_enabled
// to 0, and SystemProperties ro.debuggable / service.adb.root to "0", at
// literal-key call sites only. Fail-safe; default = false.

private val SETTINGS_CLASSES = setOf(
    "Landroid/provider/Settings\$Global;",
    "Landroid/provider/Settings\$Secure;",
    "Landroid/provider/Settings\$System;",
)

private val ADB_SETTINGS_KEYS = setOf(
    "adb_enabled",
    "development_settings_enabled",
    "adb_wifi_enabled",
    "wireless_debugging_enabled",
)

private val ADB_PROPERTY_KEYS = setOf(
    "ro.debuggable",
    "service.adb.root",
)

private const val SYSTEM_PROPERTIES_CLASS = "Landroid/os/SystemProperties;"
private const val LOOKAHEAD = 6

@Suppress("unused")
val hideDeveloperOptionsPatch = bytecodePatch(
    name = "Hide developer options & USB debugging",
    description = """
        Makes the app think Developer Options, USB (ADB) debugging and wireless
        debugging are disabled, by forcing the settings reads apps use for these
        checks to return "off" / "0".

        Applies to any app. Only affects what the app itself sees.
    """.trimIndent(),
    default = false,
) {
    execute {
        var settingsSitesPatched = 0
        var propertySitesPatched = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    val key = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string ?: return@forEachIndexed
                    val keyRegister = (instruction as? OneRegisterInstruction)?.registerA
                        ?: return@forEachIndexed

                    when {
                        key in ADB_SETTINGS_KEYS -> {
                            val end = minOf(index + LOOKAHEAD, instructions.size)
                            for (j in index + 1 until end) {
                                val reference = (instructions[j] as? ReferenceInstruction)?.reference
                                    as? MethodReference ?: continue
                                if (reference.definingClass !in SETTINGS_CLASSES) continue
                                if (reference.name != "getInt" && reference.name != "getLong") continue
                                // Settings.getInt(ContentResolver, String[, int]) takes the
                                // key as argument 1. Only patch when this call really reads
                                // the key we just loaded — never a nearby unrelated setting.
                                if (argumentRegister(instructions[j], 1) != keyRegister) continue

                                val moveResult = instructions.getOrNull(j + 1) as? OneRegisterInstruction
                                    ?: break
                                when (moveResult.opcode) {
                                    Opcode.MOVE_RESULT -> {
                                        replacements[j + 1] = constValue(moveResult.registerA, 0)
                                        settingsSitesPatched++
                                    }
                                    Opcode.MOVE_RESULT_WIDE -> {
                                        val register = moveResult.registerA
                                        replacements[j + 1] =
                                            constValue(register, 0) + "\n" + constValue(register + 1, 0)
                                        settingsSitesPatched++
                                    }
                                    else -> {}
                                }
                                break
                            }
                        }

                        key in ADB_PROPERTY_KEYS -> {
                            val end = minOf(index + LOOKAHEAD, instructions.size)
                            for (j in index + 1 until end) {
                                val reference = (instructions[j] as? ReferenceInstruction)?.reference
                                    as? MethodReference ?: continue
                                if (reference.definingClass != SYSTEM_PROPERTIES_CLASS ||
                                    reference.name != "get" ||
                                    reference.parameterTypes.firstOrNull() != "Ljava/lang/String;"
                                ) continue
                                // SystemProperties.get(String) takes the key as argument 0.
                                if (argumentRegister(instructions[j], 0) != keyRegister) continue

                                val moveResult = instructions.getOrNull(j + 1) as? OneRegisterInstruction
                                    ?: break
                                if (moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                                    replacements[j + 1] = "const-string v${moveResult.registerA}, \"0\""
                                    propertySitesPatched++
                                }
                                break
                            }
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) ->
                            if (smali.contains('\n')) method.replaceInstructions(index, smali)
                            else method.replaceInstruction(index, smali)
                        }
                }
            }
        }

        logUniversal(
            "Hide developer options: $settingsSitesPatched settings read(s) forced to 0, " +
                "$propertySitesPatched system property read(s) forced to \"0\".",
        )
    }
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
}
