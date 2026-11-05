package app.serajr.patches.navigationbar

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.serajr.patches.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val REPLY_COMPOSER = "Lcom/x/composer/minimal/b;"
private const val OUTER_SURFACE = "Landroidx/compose/foundation/p;->l("
private const val INNER_CLICKABLE = "Landroidx/compose/foundation/e0;->c("
private const val REPLY_HAZE = "Lcom/x/compose/core/m0;->e("

private val RENDER_CALLS = mapOf(
    "Lcom/x/ui/common/user/z;->l(" to 1,
    "Lcom/x/composer/minimal/b;->d(" to 1,
    "Landroidx/compose/animation/g;->i(" to 2,
    "Landroidx/compose/material3/x;->h(" to 1,
    "Landroidx/compose/animation/g;->h(" to 1
)

@Suppress("unused")
val hidePostReplyBarKeepHazePatch = bytecodePatch(
    name = "Hide Post Reply Bar (Keep Haze)",
    description = "Hides the post reply bar while preserving the native navigation bar Haze effect (Blur/Scrim).",
    default = false
) {
    compatibleWith(Constants.COMPATIBILITY_X)

    execute {
        // 1. Locate the reply composer by its signature (current X layout).
        var original: Method? = null
        classDefForEach { classDef ->
            if (classDef.type == REPLY_COMPOSER) {
                original = classDef.methods.singleOrNull { method ->
                    method.name == "e" && method.returnType == "V" &&
                        method.parameterTypes.size == 23 &&
                        method.parameterTypes[0].toString() == "Ldev/chrisbanes/haze/a1;" &&
                        method.parameterTypes[20].toString() == "Landroidx/compose/runtime/Composer;"
                }
            }
        }
        val target = requireNotNull(original) { "D3-H1: reply composer not found." }
        val composer = mutableClassDefBy(target.definingClass).methods.first {
            it.toString() == target.toString()
        }
        val code = requireNotNull(composer.implementation) { "D3-H1: missing method body." }
        val insns = code.instructions.toList()

        fun ref(index: Int): String? =
            (insns[index] as? ReferenceInstruction)?.reference?.toString()

        fun calls(prefix: String): List<Int> = insns.indices.filter { index ->
            insns[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                ref(index)?.startsWith(prefix) == true
        }

        fun resultRegister(index: Int): Int? =
            if (insns.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT)
                (insns[index + 1] as? OneRegisterInstruction)?.registerA
            else null

        // 2. Disable the six reply-control render calls without removing surrounding control flow.
        val replacements = mutableListOf<Pair<Int, String>>()
        RENDER_CALLS.forEach { (signature, count) ->
            val matches = calls(signature)
            require(matches.size == count) {
                "D3-H1: expected $count render calls for $signature, found ${matches.size}."
            }
            matches.forEach { replacements += it to "nop" }
        }

        // 3. Bypass the outer reply surface; no reply background is drawn.
        val outer = calls(OUTER_SURFACE).singleOrNull { index ->
            (insns[index] as? FiveRegisterInstruction)?.let { call ->
                call.registerC == 2 && call.registerD == 3 &&
                    call.registerE == 4 && call.registerF == 5 &&
                    call.registerG == 11 && resultRegister(index) == 2
            } == true
        } ?: error("D3-H1: outer reply surface not uniquely identified.")
        replacements += outer to "nop"
        replacements += (outer + 1) to "nop"

        // 4. Remove the reply click target, passing its input Modifier through.
        val clickable = calls(INNER_CLICKABLE).singleOrNull { index ->
            (insns[index] as? RegisterRangeInstruction)?.let { call ->
                call.startRegister == 16 && call.registerCount == 7 &&
                    resultRegister(index) == 6
            } == true
        } ?: error("D3-H1: reply clickable not uniquely identified.")
        replacements += clickable to "nop"
        replacements += (clickable + 1) to "move-object/from16 v6, v16"

        // 5. Bypass only the reply-specific Haze modifier; keep system nav Haze intact.
        val haze = calls(REPLY_HAZE).singleOrNull { index ->
            (insns[index] as? RegisterRangeInstruction)?.let { call ->
                call.startRegister == 16 && call.registerCount == 7 &&
                    resultRegister(index) == 6
            } == true
        } ?: error("D3-H1: reply Haze call not uniquely identified.")
        replacements += haze to "nop"
        replacements += (haze + 1) to "move-object/from16 v6, v16"

        // 6. Reject overlapping targets; apply replacements without deleting instructions.
        require(replacements.map { it.first }.distinct().size == replacements.size) {
            "D3-H1: conflicting instruction replacements."
        }
        replacements.sortedByDescending { it.first }.forEach { (index, smali) ->
            composer.replaceInstruction(index, smali)
        }
    }
}
