package app.template.patches.shared.web
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal WebView file-access lockdown: flips literal `true` args of
// WebSettings.setAllowFileAccess / setAllowFileAccessFromFileURLs /
// setAllowUniversalAccessFromFileURLs / setAllowContentAccess to false.
// Fail-safe (literal args only). Patcher forces universal default=false.

private const val WEB_SETTINGS = "Landroid/webkit/WebSettings;"

private val FILE_ACCESS_METHODS = setOf(
    "setAllowFileAccess",
    "setAllowFileAccessFromFileURLs",
    "setAllowUniversalAccessFromFileURLs",
    "setAllowContentAccess",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val webViewFileAccessPatch = bytecodePatch(
    name = "WebView: disable local file access",
    description = """
        Disables WebView local file access (file://, content://, universal/file-URL
        access) in every app, so web content cannot read the app's private files.

        Applies to any app. Safe.
    """.trimIndent(),
    default = false, // universal patches are forced to default=false by the patcher
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
                    if (reference.definingClass != WEB_SETTINGS ||
                        reference.name !in FILE_ACCESS_METHODS ||
                        reference.returnType != "V"
                    ) return@forEachIndexed

                    val valueRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                    val literal = literalForRegister(instructions, index, valueRegister)
                        ?: return@forEachIndexed
                    if (literal.second == 1) {
                        replacements[literal.first] = constValue(valueRegister, 0)
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (i, smali) -> method.replaceInstruction(i, smali) }
                    patched += replacements.size
                }
            }
        }

        logUniversal("WebView file access: $patched call site(s) forced to false.")
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

private fun literalForRegister(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
): Pair<Int, Int>? {
    var inspected = 0
    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]
        if (instruction is OneRegisterInstruction && instruction.registerA == register) {
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral ?: return null
            return index to literal
        }
        if (instruction.opcode == Opcode.MOVE_RESULT ||
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT ||
            instruction.opcode == Opcode.MOVE_RESULT_WIDE
        ) return null
        if (++inspected >= 8) return null
    }
    return null
}
