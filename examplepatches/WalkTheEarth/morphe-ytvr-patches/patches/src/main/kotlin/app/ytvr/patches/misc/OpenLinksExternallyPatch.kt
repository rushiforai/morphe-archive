package app.ytvr.patches.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Matches the helper that opens URLs either in the Meta system browser (on Quest)
 * or in an external app (any other device).
 *
 * The class and method names are obfuscated and expected to change between
 * app versions, so only the signature and distinguishing strings are matched.
 */
private val urlOpenerFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    strings = listOf("ovrweb"),
    filters = listOf(
        // The Quest device check that decides between the in-app and external browser.
        methodCall(
            definingClass = "Lfsf;",
            name = "c",
            returnType = "Z",
            opcode = Opcode.INVOKE_STATIC,
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    )
)

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links externally",
    description = "Opens links in an external app instead of the in-app browser.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    execute {
        urlOpenerFingerprint.let { fingerprint ->
            val moveResultMatch = fingerprint.instructionMatches[1]
            val register = fingerprint.method
                .getInstruction<OneRegisterInstruction>(moveResultMatch.index).registerA

            // Override the result of the Quest device check with false,
            // so links are always opened with an external intent.
            fingerprint.method.addInstructions(moveResultMatch.index + 1, "const/4 v$register, 0x0")
        }
    }
}
