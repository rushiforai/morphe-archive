package app.noam.patches.chesscom.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.indexOfFirstOrThrow
import com.android.tools.smali.dexlib2.Opcode

internal object MainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/chess/MainApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** Gives the extension the app's context and lets it follow which screen is open. */
internal val extensionHookPatch = bytecodePatch(
    description = "Connects the Morphe extension to the app.",
) {
    extendWith(Constants.EXTENSION_FILE)

    execute {
        MainApplicationOnCreateFingerprint.method.apply {
            val superCall = indexOfFirstOrThrow(description = "super.onCreate()") {
                it.opcode == Opcode.INVOKE_SUPER
            }
            addInstruction(
                superCall + 1,
                "invoke-static { p0 }, ${Constants.UTILS}->onApplicationCreate(Landroid/app/Application;)V",
            )
        }
    }
}
