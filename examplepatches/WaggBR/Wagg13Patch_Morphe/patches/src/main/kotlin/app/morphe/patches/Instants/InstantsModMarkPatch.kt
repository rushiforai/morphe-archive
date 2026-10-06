package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Adds a "Mod by Wagg13 - Morphed" row to Instants' About screen that opens the
 * author's Telegram channel.
 */
@Suppress("unused")
val instantsModMarkPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        val method = AboutSettingsScreenFingerprint.method
        val instructions = method.implementation!!.instructions

        // The About screen draws its header and its three link rows with composables that share
        // the signature (composer, modifier, String, Function0, int, int)V. Matching on that shape
        // instead of the obfuscated names keeps this independent of renames.
        val rowCalls = instructions.withIndex().filter { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@filter false
            val reference = (instruction as ReferenceInstruction).reference as? MethodReference
                ?: return@filter false
            val types = reference.parameterTypes.map { it.toString() }
            reference.returnType == "V" && types.size == 6 &&
                types[2] == "Ljava/lang/String;" &&
                types[3] == "Lkotlin/jvm/functions/Function0;" &&
                types[4] == "I" && types[5] == "I"
        }

        // Header + Terms of use + Third party notices + Privacy policy.
        check(rowCalls.size == 4) {
            "Instants: expected 4 About screen row calls, found ${rowCalls.size}"
        }

        val last = rowCalls.last()
        val ref = (last.value as ReferenceInstruction).reference as MethodReference
        val rowDescriptor =
            "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"

        // Repeats the last row's call with the same composer / modifier / changed registers
        // (v11..v16); only the text (v13) and the click action (v14) are replaced.
        method.addInstructions(
            last.index + 1,
            """
            const-string v13, "Mod by Wagg13 - Morphed"
            invoke-static {}, $MOD_MARK_HELPER->onClick()Ljava/lang/Object;
            move-result-object v14
            check-cast v14, Lkotlin/jvm/functions/Function0;
            invoke-static/range {v11 .. v16}, $rowDescriptor
            """.trimIndent(),
        )
    }
}
