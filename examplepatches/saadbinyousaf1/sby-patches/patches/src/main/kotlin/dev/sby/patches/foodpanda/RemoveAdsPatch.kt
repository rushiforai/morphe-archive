// © https://saadbinyousaf.dev/ © //
package dev.sby.patches.foodpanda

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.sby.patches.shared.Constants.COMPATIBILITY_FOODPANDA

// © https://saadbinyousaf.dev/ © //
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes foodpanda's adtech banner ads (order-tracking, home, discovery, reels) " +
        "and suppresses the forced PandaMart cross-sell / grocery upsell popup.",
) {
    compatibleWith(COMPATIBILITY_FOODPANDA)

    // © https://saadbinyousaf.dev/ © //
    execute {
        creativesGetterFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """,
        )

        // © https://saadbinyousaf.dev/ © //
        val sheet = crossSellSheetFingerprint.matchOrNull()?.method ?: return@execute
        val insns = sheet.instructions
        val boolIndex = insns.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference != null &&
                reference.definingClass == "Ljava/lang/Boolean;" &&
                reference.name == "booleanValue"
        }
        if (boolIndex < 0) return@execute

        for (index in boolIndex + 1 until insns.size) {
            if (insns[index].opcode == Opcode.IF_EQZ) {
                val register = (insns[index] as OneRegisterInstruction).registerA
                sheet.addInstructions(index, "const/4 v$register, 0x0")
                return@execute
            }
        }
    }
}
// © https://saadbinyousaf.dev/ © //
