package semicoloncolonel.mobilestream.patches.nytimes.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants

private const val WEB_SSO_LABEL = ", webSSOEnabled="

// The New York Times 11.98.0 shows "Continue with Google" and "Continue with
// Facebook" on its sign-in screen. Both buttons, the "OR" divider between
// them and email sign-in, and both sign-in flows are gated by one flag,
// webSSOEnabled, on the sign-in config (SubauthConfig, R8-renamed to pzl).
//
// The config's toString names each field, so the patch finds the flag's
// field from the literal before it, then turns off the getter that returns
// that field. Email, one-time code, registration and the paywall are
// unchanged.
internal object SubauthConfigToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("SubauthConfig(resources=", WEB_SSO_LABEL),
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Removes the Continue with Google and Continue with Facebook options from " +
        "The New York Times app. Email sign-in still works.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val toString = SubauthConfigToStringFingerprint.method
        val instructions = toString.implementation!!.instructions.toList()
        val labelIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == WEB_SSO_LABEL
        }
        // toString loads every field up front and copies it through other
        // registers before appending it after its label (iget-boolean v15,
        // then v19, then v1 in 11.98.0). Follow the copies back from the
        // label to the field read.
        val moves = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
        var index = (labelIndex + 1 until instructions.size).first {
            instructions[it].opcode == Opcode.IGET_BOOLEAN || instructions[it].opcode in moves
        }
        while (instructions[index].opcode in moves) {
            val source = (instructions[index] as TwoRegisterInstruction).registerB
            index = (index - 1 downTo 0).first {
                val instruction = instructions[it]
                (instruction.opcode == Opcode.IGET_BOOLEAN || instruction.opcode in moves) &&
                    (instruction as TwoRegisterInstruction).registerA == source
            }
        }
        val field = (instructions[index] as ReferenceInstruction).reference as FieldReference

        SubauthConfigToStringFingerprint.classDef.methods
            .filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_BOOLEAN &&
                            ((it as ReferenceInstruction).reference as FieldReference).name == field.name
                    } == true
            }
            .ifEmpty { throw PatchException("webSSOEnabled getter not found") }
            .forEach { it.addInstructions(0, "const/4 v0, 0x0\nreturn v0") }
    }
}
