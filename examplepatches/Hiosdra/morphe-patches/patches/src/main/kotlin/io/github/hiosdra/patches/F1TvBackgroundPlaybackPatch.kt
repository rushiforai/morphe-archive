package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private fun f1TvMethodFingerprint(
    methodName: String,
    calledClass: String,
    calledMethod: String,
) = Fingerprint(
    definingClass = BASE_PLAYER_ACTIVITY,
    name = methodName,
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(methodCall(definingClass = calledClass, name = calledMethod)),
)

private const val TILED_PLAYER_FACTORY =
    "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayerFactoryMobile;"
private const val TILED_PLAYER = "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayer;"

private val f1TvTiledPlayerConstructorFingerprint = Fingerprint(
    definingClass = TILED_PLAYER_FACTORY,
    name = "createPlayer",
    returnType = TILED_PLAYER,
    parameters = listOf(
        "Landroidx/appcompat/app/AppCompatActivity;",
        "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayer\$ViewsHolder;",
    ),
    filters = listOf(methodCall(definingClass = TILED_PLAYER, name = "<init>")),
)

@Suppress("unused")
val f1TvBackgroundPlaybackPatch = bytecodePatch(
    name = "F1 TV - Background playback",
    description = "Keeps Bitmovin playback alive and enables Tiledmedia background audio for F1 TV multiview.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        // PlayerSwitcher.onPause() calls PlayerView.onPause(), which stops Bitmovin
        // playback. Removing this lifecycle call is also what makes PiP seamless.
        val onPause = f1TvMethodFingerprint("onPause", PLAYER_SWITCHER, "onPause")
        val pauseMatch = onPause.matchOrNull()
            ?: error("F1 TV BasePlayerActivity.onPause() -> PlayerSwitcher.onPause() was not found")
        check(pauseMatch.instructionMatches.size == 1) {
            "Expected one PlayerSwitcher.onPause() call, found ${pauseMatch.instructionMatches.size}"
        }
        pauseMatch.method.removeInstruction(pauseMatch.instructionMatches.single().index)

        // onStop() tears down both player views and detaches the playback use case.
        // Leave the activity lifecycle intact, but keep the playback graph attached.
        val onStop = f1TvMethodFingerprint("onStop", PLAYER_SWITCHER, "onStop")
        val stopMatch = onStop.matchOrNull()
            ?: error("F1 TV BasePlayerActivity.onStop() -> PlayerSwitcher.onStop() was not found")
        check(stopMatch.instructionMatches.size == 1) {
            "Expected one PlayerSwitcher.onStop() call, found ${stopMatch.instructionMatches.size}"
        }
        stopMatch.method.removeInstruction(stopMatch.instructionMatches.single().index)

        val detach = f1TvMethodFingerprint("onStop", PLAYBACK_USE_CASE, "detach")
        val detachMatch = detach.matchOrNull()
            ?: error("F1 TV BasePlayerActivity.onStop() -> PlaybackUseCase.detach() was not found")
        check(detachMatch.instructionMatches.size == 1) {
            "Expected one PlaybackUseCase.detach() call, found ${detachMatch.instructionMatches.size}"
        }
        detachMatch.method.removeInstruction(detachMatch.instructionMatches.single().index)

        // Tiledmedia's own background-audio session is configured only when both
        // F1's PiP setting and Android's PiP capability are enabled. The generic
        // Bitmovin lifecycle hooks above do not affect this separate player path.
        // Force only the TiledPlayer constructor's background-audio argument;
        // its own MediaPlaybackService and MediaSession then handle background audio.
        val tiledPlayer = f1TvTiledPlayerConstructorFingerprint.matchOrNull()
            ?: error("F1 TV TiledPlayerFactoryMobile.createPlayer() was not found")
        check(tiledPlayer.instructionMatches.size == 1) {
            "Expected one TiledPlayer constructor call, found ${tiledPlayer.instructionMatches.size}"
        }
        val constructorIndex = tiledPlayer.instructionMatches.single().index
        val constructorCall = tiledPlayer.method.implementation!!.instructions
            .elementAt(constructorIndex) as? RegisterRangeInstruction
            ?: error("F1 TV TiledPlayer constructor call was not an invoke-range instruction")
        check(constructorCall.registerCount == 14) {
            "Expected 14 TiledPlayer constructor registers, found ${constructorCall.registerCount}"
        }
        val backgroundAudioRegister = constructorCall.startRegister + 11
        check(backgroundAudioRegister <= 15) {
            "TiledPlayer background-audio register v$backgroundAudioRegister cannot use const/4"
        }
        tiledPlayer.method.addInstructions(
            constructorIndex,
            "const/4 v$backgroundAudioRegister, 0x1",
        )
    }
}
