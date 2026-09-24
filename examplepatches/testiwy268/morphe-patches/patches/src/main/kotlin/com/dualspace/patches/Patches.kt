@file:Suppress("unused")

package com.dualspace.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

val dualSpacePremiumPatch = bytecodePatch(
    name = "Dualspace Premium Unlock",
    description = "Complete premium unlock for Dualspace. Bypasses purchase validation " +
            "and forces ACTIVE subscription status, unlocking all premium features without a purchase.",
    default = true
) {
    compatibleWith("com.xunijun.app.gp")

    execute {
        val my1Class = classDefBy("Lcom/xunijun/app/gp/my1;")

        // Bypass purchase state check
        val fingerprint = Fingerprint(
            strings = listOf("Payment platform returned an unsupported purchase state.")
        )

        fingerprint.match(my1Class).method.apply {
            val impl = implementation!!
            val targetString = "Payment platform returned an unsupported purchase state."

            for (idx in impl.instructions.indices.reversed()) {
                val instr = impl.instructions[idx]
                if (instr !is ReferenceInstruction) continue
                val ref = instr.reference
                if (ref !is StringReference || ref.string != targetString) continue

                val ifEqIndex = idx - 2
                val ifEqInstr = getInstruction<BuilderOffsetInstruction>(ifEqIndex)
                val gotoInstr = BuilderInstruction10t(Opcode.GOTO, ifEqInstr.target)
                replaceInstruction(ifEqIndex, gotoInstr)
            }
        }

        // Force premium status
        val fallbackFingerprint = Fingerprint(
            strings = listOf("state_has_ever_subscribed", "state_last_product_id")
        )
        val fallbackMethod = fallbackFingerprint.match(my1Class).method

        val replaceFieldNames = setOf("X", "k0", "l0")
        val toReplace = mutableListOf<Pair<Int, String>>()

        fallbackMethod.implementation!!.instructions.forEachIndexed { index, instr ->
            if (instr.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
            val refInstr = instr as? ReferenceInstruction ?: return@forEachIndexed
            val ref = refInstr.reference as? FieldReference ?: return@forEachIndexed
            if (ref.definingClass != "Lcom/xunijun/app/gp/cx4;") return@forEachIndexed
            if (ref.name !in replaceFieldNames) return@forEachIndexed

            val reg = (instr as OneRegisterInstruction).registerA
            toReplace.add(
                index to
                        "sget-object v$reg, Lcom/xunijun/app/gp/cx4;->Y:Lcom/xunijun/app/gp/cx4;"
            )
        }

        for ((idx, smali) in toReplace.reversed()) {
            fallbackMethod.replaceInstruction(idx, smali)
        }
    }
}
