package app.finni.patches.telegraph.update

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * if (BuildVars.versionCode <= remoteConfig.getInt("tph_force_update_version")) show "update required" dialog.
 */
internal object ForcedUpdateVersionFingerprint : Fingerprint(
    filters = listOf(
        string("tph_force_update_version"),
        methodCall(parameters = listOf("Ljava/lang/String;"), returnType = "I", location = MatchAfterImmediately()),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

@Suppress("unused")
val removeForcedUpdatePatch = patch(
    name = "Remove forced update",
    description = "Removes the \"this version is no longer supported\" dialog that blocks the app " +
        "when the remote config marks the version as outdated.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        ForcedUpdateVersionFingerprint.matchAll().forEach { match ->
            val moveResult = match.instructionMatches.last().index
            val register = match.method.getInstruction<OneRegisterInstruction>(moveResult).registerA
            // Forced version 0 -> the version check never triggers.
            match.method.addInstruction(moveResult + 1, "const/4 v$register, 0x0")
        }
    }
}
