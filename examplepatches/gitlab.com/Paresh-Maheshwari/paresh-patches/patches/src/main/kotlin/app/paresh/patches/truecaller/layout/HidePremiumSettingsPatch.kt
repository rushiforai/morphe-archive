package app.paresh.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val hidePremiumSettingsPatch = bytecodePatch(
    name = "Hide Premium from settings",
    description = "Hides the Premium options from the settings and user details pages."
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Hide premium item from settings categories page
        SettingsPremiumVisibilityFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val indicesToPatch = mutableListOf<Pair<Int, Int>>()

            for (i in instructions.indices) {
                val inst = instructions[i]
                if (inst.opcode == Opcode.IGET_BOOLEAN) {
                    val ref = (inst as ReferenceInstruction).reference.toString()
                    if (ref.contains("Lfh2/m0;->a:Z")) {
                        val destReg = (inst as TwoRegisterInstruction).registerA
                        indicesToPatch.add(i to destReg)
                    }
                }
            }

            for ((index, reg) in indicesToPatch.reversed()) {
                replaceInstruction(index, "const/4 v$reg, 0x0")
            }
        }

        // Hide "Premium member" block from user details/settings page (Compose UI)
        PremiumBlockComposeFingerprint.method.addInstructions(0, "return-void")
    }
}
