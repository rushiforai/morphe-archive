package app.ytvr.patches.playability

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.ytvr.patches.shared.Constants.COMPATIBILITY_YOUTUBE_VR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeViewerDiscretionDialogPatch = bytecodePatch(
    name = "Remove viewer discretion dialog",
    description = "Removes the dialog that appears when opening a video that has been age-restricted " +
            "by accepting it automatically. This does not bypass the age restriction.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_VR)

    execute {
        // region Skip the confirm dialog and take the playable path for all videos.
        PlayabilityRouterFingerprint.let { fingerprint ->
            val moveResultMatch = fingerprint.instructionMatches[1]
            val register = fingerprint.method
                .getInstruction<OneRegisterInstruction>(moveResultMatch.index).registerA

            // Override the result of the inverted "is playable" check ("is NOT playable")
            // with false, so videos that require age or content confirmation continue
            // to the playable path instead of showing the dialog.
            fingerprint.method.addInstructions(moveResultMatch.index + 1, "const/4 v$register, 0x0")
        }
        // endregion

        // region Report the confirmation flags as set in player requests, so the server
        //        returns playable streams for age-restricted videos.
        val playabilityClass = PlayabilityRouterFingerprint.originalClassDef

        // Matches the method returning the adult content confirmation flag.
        Fingerprint(
            returnType = "Z",
            filters = listOf(
                fieldAccess(
                    definingClass = "Lqpu;",
                    name = "a",
                    type = "Z",
                    opcode = Opcode.IGET_BOOLEAN,
                )
            )
        ).match(playabilityClass).method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Matches the method returning the controversial content confirmation flag.
        Fingerprint(
            returnType = "Ljava/lang/Boolean;",
        ).match(playabilityClass).method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )
        // endregion
    }
}
