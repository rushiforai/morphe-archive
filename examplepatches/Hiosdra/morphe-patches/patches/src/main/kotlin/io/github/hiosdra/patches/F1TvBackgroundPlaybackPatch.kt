package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch

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

@Suppress("unused")
val f1TvBackgroundPlaybackPatch = bytecodePatch(
    name = "F1 TV - Background playback",
    description = "Keeps the F1 TV player alive when the activity goes to the background or the screen turns off.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        // PlayerSwitcher.onPause() calls PlayerView.onPause(), which stops Bitmovin
        // playback. Removing this lifecycle call is also what makes PiP seamless.
        val onPause = f1TvMethodFingerprint("onPause", PLAYER_SWITCHER, "onPause")
        onPause.matchOrNull()?.let { match ->
            match.method.removeInstruction(match.instructionMatches.first().index)
        }

        // onStop() tears down both player views and detaches the playback use case.
        // Leave the activity lifecycle intact, but keep the playback graph attached.
        val onStop = f1TvMethodFingerprint("onStop", PLAYER_SWITCHER, "onStop")
        onStop.matchOrNull()?.let { match ->
            match.method.removeInstruction(match.instructionMatches.first().index)
        }

        val detach = f1TvMethodFingerprint("onStop", PLAYBACK_USE_CASE, "detach")
        detach.matchOrNull()?.let { match ->
            match.method.removeInstruction(match.instructionMatches.first().index)
        }
    }
}
