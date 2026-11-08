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

// The New York Times 11.98.0 and 11.99.0 show "Continue with Google" and "Continue with
// Facebook" on its sign-in screen. Both buttons, the "OR" divider between
// them and email sign-in, and both sign-in flows are gated by one flag,
// webSSOEnabled, on the sign-in config (SubauthConfig, R8-renamed).
//
// The config's toString names each field, so the patch finds the flag's
// field from the literal before it. In 11.99.0 the compiler joins the label
// with the constant fields before it, so the literal ends with the label.
// Its getter (11.98.0) returns false, and the config's constructor
// (11.99.0, where the getter is gone) stores false in that field. Email, one-time
// code, registration and the paywall are unchanged.
internal object SubauthConfigToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    custom = { method, _ ->
        val strings = method.implementation?.instructions
            ?.filter { it.opcode == Opcode.CONST_STRING }
            ?.map { ((it as ReferenceInstruction).reference as StringReference).string }
            .orEmpty()
        "SubauthConfig(resources=" in strings && strings.any { it.endsWith(WEB_SSO_LABEL) }
    },
)

@Suppress("unused")
val removeSocialSignInPatch = bytecodePatch(
    name = "Remove social sign-in",
    description = "Removes the Continue with Google and Continue with Facebook sign-in options.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val toString = SubauthConfigToStringFingerprint.method
        val instructions = toString.implementation!!.instructions.toList()
        val labelIndex = instructions.indexOfFirst {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string.endsWith(WEB_SSO_LABEL)
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

        // 11.98.0 reads the flag through a getter: make it return false.
        var changes = 0
        SubauthConfigToStringFingerprint.classDef.methods
            .filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.IGET_BOOLEAN &&
                            ((it as ReferenceInstruction).reference as FieldReference).name == field.name
                    } == true
            }
            .forEach {
                it.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
                changes++
            }

        // 11.99.0 reads the field directly (the getter is gone): store false
        // wherever the config is built, so every reader sees the flag off.
        SubauthConfigToStringFingerprint.classDef.methods
            .filter { it.name == "<init>" }
            .forEach { constructor ->
                val code = constructor.implementation?.instructions?.toList() ?: return@forEach
                code.indices.reversed()
                    .filter { index ->
                        code[index].opcode == Opcode.IPUT_BOOLEAN &&
                            ((code[index] as ReferenceInstruction).reference as FieldReference).let {
                                it.definingClass == field.definingClass && it.name == field.name
                            }
                    }
                    .forEach { index ->
                        val source = (code[index] as TwoRegisterInstruction).registerA
                        constructor.addInstructions(index, "const/16 v$source, 0x0")
                        changes++
                    }
            }
        if (changes == 0) throw PatchException("webSSOEnabled getter or field write not found")
    }
}
