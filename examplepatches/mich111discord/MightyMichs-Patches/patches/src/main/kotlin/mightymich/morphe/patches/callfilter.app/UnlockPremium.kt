package mightymich.morphe.patches.callfilter.app

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium (Experimental)",
    description = "Unlocks Callfilter.app premium by forcing the 'isSubscribed' check to return true. WARNING: May cause crashes or unexpected behavior.",
    default = false
) {
    compatibleWith(CallFilterCompatibility.CALL_FILTER)

    // 1. Fingerprint: locate the method that uses the string "isSubscribed".
    //    This string is the key used in SharedPreferences to check subscription status.
    val isSubscribedFingerprint = Fingerprint(
        filters = listOf(
            string("isSubscribed")
        )
    )

    execute {
        isSubscribedFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val instructions = method.implementation?.instructions?.toList()
                ?: throw PatchException("Method has no implementation.")

            // 2. Find the const-string "isSubscribed" instruction.
            var stringIndex = -1
            for (i in instructions.indices) {
                val instruction = instructions[i]
                if (instruction is ReferenceInstruction) {
                    val ref = instruction.reference
                    if (ref is StringReference && ref.string == "isSubscribed") {
                        stringIndex = i
                        break
                    }
                }
            }

            if (stringIndex == -1) {
                throw PatchException("Could not find 'isSubscribed' string.")
            }

            // 3. Find the getBoolean invoke after the string, then the move-result after it.
            var moveResultIndex = -1
            var moveResultRegister = -1

            for (i in (stringIndex + 1) until instructions.size) {
                val instruction = instructions[i]
                if (instruction is ReferenceInstruction) {
                    val ref = instruction.reference
                    if (ref is MethodReference &&
                        ref.name == "getBoolean" &&
                        ref.definingClass == "Landroid/content/SharedPreferences;"
                    ) {
                        // 4. The move-result should be immediately after getBoolean.
                        if (i + 1 < instructions.size) {
                            val next = instructions[i + 1]
                            if (next.opcode.name == "MOVE_RESULT" &&
                                next is OneRegisterInstruction
                            ) {
                                moveResultIndex = i + 1
                                moveResultRegister = next.registerA
                                break
                            }
                        }
                    }
                }
            }

            if (moveResultIndex == -1 || moveResultRegister == -1) {
                throw PatchException("Could not find getBoolean/move-result for 'isSubscribed'.")
            }

            // 5. Replace the move-result with const/4 vX, 0x1 (true).
            //    This forces the subscription check to always return true.
            method.replaceInstruction(
                moveResultIndex,
                "const/4 v$moveResultRegister, 0x1"
            )
        }
    }
}
