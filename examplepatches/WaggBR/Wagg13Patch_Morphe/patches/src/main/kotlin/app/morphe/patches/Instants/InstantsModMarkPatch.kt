package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ABOUT_TRACE_PREFIX =
    "com.instagram.moonshot.ui.settings.screen.MoonshotAboutSettingsScreen.<anonymous> ("

private fun Instruction.stringOrNull(): String? =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
        ((this as ReferenceInstruction).reference as? StringReference)?.string
    } else {
        null
    }

/**
 * Adds a "Mod by Wagg13 - Morphed" row to Instants' About screen that opens the
 * author's Telegram channel. Part of [instantsModPatch].
 */
val instantsModMarkPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(instantsActivityPatch)

    execute {
        val method = AboutSettingsScreenFingerprint.method
        val instructions = method.implementation!!.instructions

        // The About screen is one case of a large settings lambda. Its code starts at its Compose
        // trace string and ends at the next screen's trace string.
        val titleIndex = instructions.indexOfFirst { it.stringOrNull()?.startsWith(ABOUT_TRACE_PREFIX) == true }
        check(titleIndex >= 0) { "Instants: About screen trace not found" }

        // The screen draws its header and its three link rows with composables that share the
        // signature (composer, modifier, String, Function0, int, int)V, called with a register range.
        // Matching on that shape keeps this independent of the obfuscated names.
        val rowCalls = ArrayList<Int>()
        for (index in titleIndex + 1 until instructions.size) {
            val instruction = instructions[index]
            if (instruction.stringOrNull()?.contains(".kt:") == true) break
            if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) continue
            val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
            val types = reference.parameterTypes.map { it.toString() }
            if (reference.returnType == "V" && types.size == 6 &&
                types[2] == "Ljava/lang/String;" && types[3] == "Lkotlin/jvm/functions/Function0;" &&
                types[4] == "I" && types[5] == "I"
            ) {
                rowCalls += index
            }
        }

        // Header + Terms of use + Third party notices + Privacy policy.
        check(rowCalls.size == 4) {
            "Instants: expected 4 About screen row calls, found ${rowCalls.size}"
        }

        val lastIndex = rowCalls.last()
        val ref = (instructions[lastIndex] as ReferenceInstruction).reference as MethodReference
        val rowDescriptor =
            "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"

        // Repeats the last row's call with the same composer / modifier / changed registers
        // (the call's register range: composer, modifier, text, action, changed, default); only the
        // text and the click action are replaced.
        val start = (instructions[lastIndex] as RegisterRangeInstruction).startRegister
        val text = start + 2
        val action = start + 3
        method.addInstructions(
            lastIndex + 1,
            """
            const-string v$text, "Mod by Wagg13 - Morphed"
            invoke-static {}, $MOD_MARK_HELPER->onClick()Ljava/lang/Object;
            move-result-object v$action
            check-cast v$action, Lkotlin/jvm/functions/Function0;
            invoke-static/range {v$start .. v${start + 5}}, $rowDescriptor
            """.trimIndent(),
        )
    }
}
