package app.noam.patches.spotify.localfiles.server

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.spotify.misc.settings.settingsPatch
import app.noam.patches.spotify.shared.Constants
import app.noam.patches.spotify.shared.instructionList
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val localFilesFromServerPatch = bytecodePatch(
    name = "Local files from a server",
    description = "Adds a Nextcloud or WebDAV folder as a source of local files. Its tracks appear " +
        "under Local Files and are streamed from the server instead of being stored on the device.",
    default = true,
) {
    compatibleWith(Constants.SPOTIFY_PACKAGE)

    dependsOn(settingsPatch)

    execute {
        RunQueryFingerprint.method.apply {
            val returnIndices = instructionList()
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .reversed()

            for (index in returnIndices) {
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructions(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, ${Constants.LOCAL_SERVER_HOOK_CLASS}->appendServerFiles([B)[B
                        move-result-object v$register
                    """,
                )
            }
        }

        StartListeningFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p0 .. p2 }, ${Constants.LOCAL_SERVER_HOOK_CLASS}->onStartListening(Ljava/lang/Object;J)V",
        )
    }
}
