package mightymich.morphe.patches.com.bigwinepot.nwdn.international

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Experimental)",
    description = "Unlocks Remini premium by forcing 'isFreeUser' to true. WARNING: May cause crashes or unexpected behavior.",
    default = false
) {
    compatibleWith(ReminiCompatibility.REMINI)

    val isFreeUserFingerprint = Fingerprint(
        filters = listOf(
            string("isFreeUser")
        )
    )

    execute {
        isFreeUserFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("Method has no implementation.")

            var replaced = false
            for (i in instructions.indices) {
                val instruction = instructions[i]
                if (instruction is ReferenceInstruction) {
                    val ref = instruction.reference
                    if (ref is TypeReference && ref.type == "Ljava/lang/Boolean;") {
                        if (instruction.opcode.name == "CHECK_CAST") {
                            val register = (instruction as OneRegisterInstruction).registerA
                            method.replaceInstruction(
                                i,
                                "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
                            )
                            replaced = true
                            break
                        }
                    }
                }
            }

            if (!replaced) {
                throw PatchException("Could not find CHECK_CAST for Boolean in method with 'isFreeUser'.")
            }
        }
    }
}
