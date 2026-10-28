package app.originisland.patches.shared.pauseonfold

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.originisland.patches.shared.Constants.COMPATIBILITY_LASTWAVE
import app.originisland.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.originisland.patches.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.originisland.patches.shared.mediasession.MediaSessionSetPlaybackStateFingerprint
import app.originisland.patches.shared.mediasession.indicesOfCalls
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/originisland/extension/PauseOnFoldPatch;"
private const val MEDIA_SESSION_CLASS = "Landroid/media/session/MediaSession;"

@Suppress("unused")
val pauseOnFoldPatch = bytecodePatch(
    name = "Pause on fold",
    description = "Pauses what plays when a foldable phone is closed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE, COMPATIBILITY_YOUTUBE_MUSIC, COMPATIBILITY_LASTWAVE)

    extendWith("extensions/extension.mpe")

    execute {
        // The patch listens to the hinge of the phone while a session of the app plays.
        MediaSessionSetPlaybackStateFingerprint.matchAll().forEach { match ->
            match.method.apply {
                if (definingClass.startsWith("Lapp/originisland/extension/")) return@forEach

                // Reversed, so the indices of the remaining calls stay valid.
                indicesOfCalls(MEDIA_SESSION_CLASS, "setPlaybackState").reversed().forEach { index ->
                    val instruction = getInstruction<FiveRegisterInstruction>(index)

                    addInstructions(
                        index,
                        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
                                "$EXTENSION_CLASS->onSetPlaybackState(" +
                                "${MEDIA_SESSION_CLASS}Landroid/media/session/PlaybackState;)V"
                    )
                }
            }
        }
    }
}
