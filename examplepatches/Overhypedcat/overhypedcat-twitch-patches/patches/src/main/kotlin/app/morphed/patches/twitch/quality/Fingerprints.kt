package app.morphed.patches.twitch.quality

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val MEDIA_PLAYER = "Lcom/amazonaws/ivs/player/MediaPlayer;"

/** The React Native player hands its list of qualities to its Options (and the rest of the app). */
object EmitQualitiesFingerprint : Fingerprint(
    definingClass = "Lcom/twitchrn/player/IvsPlayerController;",
    name = "emitQualities",
    returnType = "V",
    parameters = listOf(),
)

/**
 * The native player's state listener (an IVS Player.Listener in Twitch's player core). On READY it hands its
 * MediaPlayer to a static helper (the stream is loaded, its qualities known): found by that call.
 */
object NativeStateChangedFingerprint : Fingerprint(
    name = "onStateChanged",
    returnType = "V",
    parameters = listOf("Lcom/amazonaws/ivs/player/Player\$State;"),
    custom = { method, classDef ->
        classDef.type.startsWith("Ltv/twitch/android/shared/player/core/") &&
            readyPlayerCall(method) >= 0
    },
)

/** The index of the call that hands the player (its first argument) to a static helper, or -1. */
internal fun readyPlayerCall(method: com.android.tools.smali.dexlib2.iface.Method): Int {
    val instructions = method.implementation?.instructions?.toList() ?: return -1
    return instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_STATIC &&
            it.getReference<MethodReference>()?.parameterTypes?.firstOrNull()?.toString() == MEDIA_PLAYER
    }
}
