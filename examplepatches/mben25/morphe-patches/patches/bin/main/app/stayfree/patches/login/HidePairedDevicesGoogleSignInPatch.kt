package app.stayfree.patches.login

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val hidePairedDevicesGoogleSignInPatch = bytecodePatch(
    name = "Hide Google sign-in in Paired Devices",
    description = "Hides the \"Sign in with Google\" button from the Paired Devices section in " +
        "settings. Pairing with a code still works.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    execute {
        // Drop the button composable call. It sits alone inside its replace group
        // (D0(0x4558058c) … v(false)), so the group just ends up empty and Compose stays
        // balanced. The click lambda it would receive is still built and remembered, unused.
        // Between the string load and the button, the only void call taking a String is the
        // button itself (the rest are modifiers, remember/compare calls and the lambda <init>).
        PairedDevicesSectionFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val instructions = method.implementation!!.instructions.toList()
            val stringIndex = fingerprint.instructionMatches.first().index

            val buttonIndex = (stringIndex until fingerprint.instructionMatches.last().index).firstOrNull { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.INVOKE_STATIC &&
                    instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                ) return@firstOrNull false

                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                reference.returnType == "V" && "Ljava/lang/String;" in reference.parameterTypes
            } ?: throw PatchException("Sign in with Google button call not found")

            method.removeInstruction(buttonIndex)
        }
    }
}
