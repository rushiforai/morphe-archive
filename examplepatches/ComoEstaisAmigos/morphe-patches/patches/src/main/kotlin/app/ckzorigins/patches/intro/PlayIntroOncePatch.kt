package app.ckzorigins.patches.intro

import app.ckzorigins.patches.mono.gluBackupPatch
import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

private const val INTRO_ONCE = "Lapp/ckzombies/extension/IntroOnce;"
internal const val VIDEO_PLAYER = "Lcom/unity3d/player/VideoPlayer;"

internal object VideoPlayerOnCreateFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object VideoPlayerFinishFingerprint : Fingerprint(
    definingClass = VIDEO_PLAYER,
    name = "finish",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Unity's intro (`assets/Movies/CKZ2_1024x600.3gp`) is `VideoPlayer`. Tap, a key, and the
 * clip ending all call `finish()`. `IntroOnce` marks that, and the next launch `finish()`s
 * from `onCreate` before the surface starts the player.
 */
@Suppress("unused")
val playIntroOncePatch = patch(
    name = "Play intro once",
    description = "Plays the intro video on the first launch after installing, and skips it after that.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = VideoPlayerOnCreateFingerprint.method
        val code = onCreate.implementation
            ?: throw PatchException("VideoPlayer.onCreate has no code")
        val superIndex = code.instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
        if (superIndex < 0) {
            throw PatchException("VideoPlayer.onCreate has no invoke-super")
        }
        // v0 already holds the orientation const 4 across super. v1 is free until getIntent.
        if (code.registerCount < 4) {
            throw PatchException("VideoPlayer.onCreate has no spare local for skip")
        }

        VideoPlayerFinishFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $INTRO_ONCE->markSeen(Landroid/content/Context;)V",
        )
        onCreate.addInstructionsWithLabels(
            superIndex + 1,
            """
                invoke-static {p0}, $INTRO_ONCE->skip(Landroid/content/Context;)Z
                move-result v1
                if-eqz v1, :play
                invoke-virtual {p0}, $VIDEO_PLAYER->finish()V
                return-void
            """,
            ExternalLabel("play", onCreate.getInstruction(superIndex + 1)),
        )
    }
}
