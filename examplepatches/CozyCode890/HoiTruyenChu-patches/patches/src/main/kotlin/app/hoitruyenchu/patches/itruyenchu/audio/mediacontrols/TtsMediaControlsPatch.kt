package app.hoitruyenchu.patches.itruyenchu.audio.mediacontrols

import app.hoitruyenchu.patches.itruyenchu.audio.tts.ttsReliabilityPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_TTS_MEDIA_SESSION
import app.hoitruyenchu.patches.itruyenchu.shared.CreateClientBuilderFingerprint
import app.hoitruyenchu.patches.itruyenchu.shared.OKHTTP_CLIENT_BUILDER
import app.hoitruyenchu.patches.itruyenchu.shared.ReactInstanceLoadJSBundleFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val ttsMediaControlsPatch = patch(
    name = "TTS media controls",
    description = "The media widget / lock screen shows the TTS reading instead of the silent 6 s file " +
            "of the voice bar: playing or paused, the position in the chapter (line x/y). Its play / pause " +
            "and next / previous buttons work like the voice bar's buttons (next / previous chapter), and " +
            "the previous chapter button of the voice bar, which did nothing, opens the previous chapter.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    // The reading state lives in TtsController.
    dependsOn(ttsReliabilityPatch)

    execute {
        // 1. The MediaSession is built with a player that shows the TTS reading.
        SetActivePlayerInternalFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                if (it.opcode != Opcode.INVOKE_DIRECT) return@indexOfFirst false
                val ref = (it as ReferenceInstruction).reference as MethodReference
                ref.definingClass == MEDIA_SESSION_BUILDER && ref.name == "<init>" &&
                        ref.parameterTypes.map { p -> p.toString() } == listOf("Landroid/content/Context;", MEDIA3_PLAYER)
            }
            if (index < 0) throw PatchException("MediaSession.Builder(context, player) not found")
            val player = getInstruction<FiveRegisterInstruction>(index).registerE
            addInstructions(
                index,
                """
                    invoke-static { p0, v$player }, $EXTENSION_TTS_MEDIA_SESSION->wrap(Ljava/lang/Object;$MEDIA3_PLAYER)$MEDIA3_PLAYER
                    move-result-object v$player
                """,
            )
        }

        // 2. expo-audio removes the next / previous commands from what controllers may send: allow them.
        AudioSessionOnConnectFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                if (it.opcode != Opcode.INVOKE_VIRTUAL) return@indexOfFirst false
                val ref = (it as ReferenceInstruction).reference as MethodReference
                ref.definingClass == ACCEPTED_RESULT_BUILDER && ref.name == "setAvailablePlayerCommands"
            }
            if (index < 0) throw PatchException("setAvailablePlayerCommands not found")
            val commands = getInstruction<FiveRegisterInstruction>(index).registerD
            addInstructions(
                index,
                """
                    invoke-static { v$commands }, $EXTENSION_TTS_MEDIA_SESSION->allowSkip($PLAYER_COMMANDS)$PLAYER_COMMANDS
                    move-result-object v$commands
                """,
            )
        }

        // 2b. Title / artwork updates refresh the widget.
        PostOrStartForegroundNotificationFingerprint.method.addInstruction(
            0,
            "invoke-static { }, $EXTENSION_TTS_MEDIA_SESSION->onNotificationUpdate()V",
        )

        // 3. The chapter texts are captured to know where the reading is in the chapter.
        CreateClientBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_OBJECT }
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstruction(
                        index,
                        "invoke-static { v$register }, $EXTENSION_TTS_MEDIA_SESSION->" +
                                "onCreateClientBuilder($OKHTTP_CLIENT_BUILDER)V",
                    )
                }
        }

        // 4. The buttons are carried out by the voice bar (JS script evaluated after the app bundle).
        ReactInstanceLoadJSBundleFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            instructions.indices.reversed()
                .filter { instructions[it].opcode == Opcode.RETURN_VOID }
                .forEach { index ->
                    addInstruction(
                        index,
                        "invoke-static { p0 }, $EXTENSION_TTS_MEDIA_SESSION->afterMainBundle(Ljava/lang/Object;)V",
                    )
                }
        }
    }
}
