package app.template.patches.crex.premium

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CREX
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Premium and removes ads. FanCode streams stay locked."
) {
    compatibleWith(COMPATIBILITY_CREX)

    execute {
        // 1. MyApplication's "ads eligible" getter (today is after the stored expiry date) is
        // false: the subscription never expires.
        AdsEligibleFingerprint.method.returnEarly(false)

        // 2. HomeActivity's cached copy of the same check. The static flag it stores is read by
        // the home tabs, matches and series screens; it starts true in <clinit> and the expiry
        // check refreshes it from onCreate/onResume, so both writes are forced to false.
        val homeCheck = HomeExpiryCheckFingerprint
        val flag = homeCheck.method
            .getInstruction<ReferenceInstruction>(homeCheck.instructionMatches.last().index)
            .reference as FieldReference
        if (flag.definingClass != HOME_ACTIVITY || flag.type != "Z") {
            throw PatchException("HomeActivity expiry check stores an unexpected field: $flag")
        }
        homeCheck.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                sput-boolean v0, ${flag.definingClass}->${flag.name}:${flag.type}
                return-void
            """.trimIndent()
        )

        val clinit = homeCheck.classDef.methods.firstOrNull { it.name == "<clinit>" }
            ?: throw PatchException("HomeActivity has no <clinit>")
        val defaultStores = clinit.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.SPUT_BOOLEAN &&
                ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == flag.definingClass && it.name == flag.name
                }
        }.map { it.index }
        if (defaultStores.isEmpty()) throw PatchException("HomeActivity.<clinit> never sets ${flag.name}")
        // Descending, so an insert never shifts an index still to be visited.
        defaultStores.sortedDescending().forEach { index ->
            val register = clinit.getInstruction<OneRegisterInstruction>(index).registerA
            // const/16 takes any 8-bit register; const/4 would fail above v15.
            clinit.addInstructionChecked(index, "const/16 v$register, 0x0")
        }
    }
}
