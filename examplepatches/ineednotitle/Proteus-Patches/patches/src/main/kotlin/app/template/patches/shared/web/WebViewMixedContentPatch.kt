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

// Universal WebView mixed-content lockdown: rewrites literal
// WebSettings.setMixedContentMode(...) to 1 (MIXED_CONTENT_NEVER_ALLOW).
// Android defines ALWAYS_ALLOW = 0, NEVER_ALLOW = 1, COMPATIBILITY_MODE = 2 —
// using 2 here would silently select compatibility mode instead of blocking.
// Fail-safe (literal args only); default = false.

private const val WEB_SETTINGS = "Landroid/webkit/WebSettings;"
private const val MIXED_CONTENT_NEVER_ALLOW = 1

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val webViewMixedContentPatch = bytecodePatch(
    name = "WebView: block mixed content (HTTPS pages load HTTP subresources)",
    description = """
        Forces WebSettings.setMixedContentMode to NEVER_ALLOW, so HTTPS pages in the
        app's WebViews cannot load plaintext HTTP subresources.

        Applies to any app. May break legacy web content inside the app.
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
                    if (reference.definingClass != WEB_SETTINGS ||
                        reference.name != "setMixedContentMode" ||
                        reference.returnType != "V"
                    ) return@forEachIndexed

                    val valueRegister = argumentRegister(instruction, 1) ?: return@forEachIndexed
                    val literal = literalForRegister(instructions, index, valueRegister)
                        ?: return@forEachIndexed
                    if (literal.second != MIXED_CONTENT_NEVER_ALLOW) {
                        replacements[literal.first] = constValue(valueRegister, MIXED_CONTENT_NEVER_ALLOW)
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

        logUniversal("WebView mixed content: $patched call site(s) forced to NEVER_ALLOW.")
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
