package app.template.patches.sai

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_SAI
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val saiPremiumPatch = patch(
    name = "Unlock SAI Premium",
    description = "Activates SAI Premium by forcing the local entitlement check to true in all three places that read it (ck0, fk0, dk0). Verified on SAI 2.4.3.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SAI)

    execute {
        // NOTE on method: v1.0.6 used addInstructionsWithLabels to insert a
        // const before branch targets (:cond_0 in fk0.h, :goto_0 in dk0).
        // The patcher reported success but premium still did not activate,
        // while the identical insertions done by hand (smali edit) DO work.
        // Experienced Morphe authors avoid addInstructions entirely and use
        // only replaceInstruction (same-size, no offset shift, no label to
        // move). So fk0 and dk0 now REPLACE the const that sets the boolean
        // to 0 with one that sets it to 1 -- a 1-code-unit for 1-code-unit
        // swap, so nothing shifts and no label is involved at all.
        // ck0 keeps a plain addInstructions before the as6 <init>(Z): that
        // call is NOT a branch target, so a plain insert there is safe, and
        // ck0's v1 is reused as a loop counter elsewhere, so its init const
        // must not be replaced.

        // 1) ck0.invoke: force the boolean passed to Finished(hasActiveEntitlement=...).
        // The <init>(Z)V call is filter index 2; its boolean argument is in v1 (SAI 2.4.3).
        // The <init> is not a branch target, so a plain insert before it runs on every path.
        SaiPremiumCk0Fingerprint.let {
            val initIndex = it.instructionMatches[2].index
            it.method.addInstructions(
                initIndex,
                """
                    const/4 v1, 0x1
                """
            )
        }

        // 2) fk0.h: force the boolean wrapped by Boolean.valueOf and published to the UI.
        // Replace the init `const/4 v1, 0x0` with `const/4 v1, 0x1`.
        // v1 is only the entitlement boolean in this method (not a loop counter),
        // so starting it at 1 makes valueOf wrap TRUE on every path.
        // (MutableMethod has no `instructions` property; they live on its implementation.)
        SaiPremiumFk0Fingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("fk0.h: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is OneRegisterInstruction && instr.registerA == 1 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 0
            }
            require(constIndex >= 0) { "fk0.h: const/4 v1, 0x0 not found" }
            it.method.replaceInstruction(constIndex, "const/4 v1, 0x1")
        }

        // 3) dk0.invoke: force the boolean so it takes the premium branch.
        // Replace the `const/4 v3, 0x0` at :cond_0 (the not-premium path) with
        // `const/4 v3, 0x1`. The premium path already sets v3=1, so after this
        // both paths leave v3=1 and the `if-eqz v3` after the h call takes premium.
        SaiPremiumDk0Fingerprint.let {
            val instructions = it.method.implementation?.instructions
                ?: error("dk0.invoke: no implementation")
            val constIndex = instructions.indexOfFirst { instr ->
                instr.opcode == Opcode.CONST_4 &&
                    instr is OneRegisterInstruction && instr.registerA == 3 &&
                    instr is NarrowLiteralInstruction && instr.narrowLiteral == 0
            }
            require(constIndex >= 0) { "dk0.invoke: const/4 v3, 0x0 not found" }
            it.method.replaceInstruction(constIndex, "const/4 v3, 0x1")
        }
    }
}
