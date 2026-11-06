package app.template.patches.shared.misc
import app.template.patches.shared.logUniversal

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Universal "Strip logging" patch: NOPs every invoke-static to
// android.util.Log.v/d/i/w/e/wtf/println; when the int result is captured by
// move-result, the move-result becomes const/4 vX, 0. Fail-safe; the patcher
// forces universal patches to default=false.

private const val LOG_CLASS = "Landroid/util/Log;"

private val LOG_METHODS = setOf("v", "d", "i", "w", "e", "wtf", "println")

@Suppress("unused")
val stripLoggingPatch = bytecodePatch(
    name = "Strip logging (android.util.Log)",
    description = """
        Removes all android.util.Log calls from the app, so logcat cannot leak
        URLs, tokens, PII or debug output produced by the app.

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
                    if (instruction.opcode != Opcode.INVOKE_STATIC &&
                        instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                    ) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    if (reference.definingClass != LOG_CLASS) return@forEachIndexed
                    if (reference.name !in LOG_METHODS || reference.returnType != "I") return@forEachIndexed

                    replacements[index] = "nop"
                    // Count every Log call once, independent of whether its int result
                    // is captured by a following move-result.
                    patched++

                    val next = instructions.getOrNull(index + 1)
                    if (next is OneRegisterInstruction && next.opcode == Opcode.MOVE_RESULT) {
                        replacements[index + 1] = constValue(next.registerA, 0)
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal("Strip logging: $patched Log call site(s) removed.")
    }
}
