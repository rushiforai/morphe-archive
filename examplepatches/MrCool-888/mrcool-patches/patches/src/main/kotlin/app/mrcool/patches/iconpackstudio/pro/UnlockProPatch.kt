/**
 * Adapted from De-Vanced's Icon Pack Studio patch
 * https://github.com/RookieEnough/De-Vanced
 * which in turn forked ReVanced Patches (GPL-3.0)
 * https://github.com/ReVanced/revanced-patches
 */

package app.mrcool.patches.iconpackstudio.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.mrcool.patches.iconpackstudio.iconPackStudio
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlocks Pro features and Pro community packs, and removes the Get Pro upsell."
) {
    compatibleWith(iconPackStudio)

    execute {
        // The check ORs the lifetime, subscription, and FX pack purchase flags.
        // Force it to report the paid state; the original stores are untouched.
        CheckProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )

        // The community header hides the Get Pro pill only when the billing flow
        // reports premium access. That flow is not patched, so force the value it
        // feeds into the header state instead.
        CommunityHeaderFingerprint.apply {
            val index = method.instructions.indexOfFirst {
                it is Instruction22c && it.opcode == Opcode.IGET_BOOLEAN &&
                    it.reference.toString() == "Ldh0;->c:Z"
            }
            if (index < 0) throw PatchException("Premium access flag not found in the community header")
            val register = (method.instructions[index] as Instruction22c).registerA
            method.replaceInstruction(index, "const/4 v$register, 0x1")
        }

        // Pro packs show "This setup requires Pro" and disable Download through
        // this check. Report every pack as unlocked.
        PackRequiresProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
    }
}
