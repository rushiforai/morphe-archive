package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.spotify.COMPATIBILITY_SPOTIFY

private const val PLAYBACK_SETTINGS = "Lp/mf71;"
private const val SET_SHUFFLE = "Lp/qet0;->r(Z)V"

/**
 * Forces the shuffle flag in Spotify's SetShuffleState request to false. The Premium upsell is
 * gone, but the Free app still submits "shuffle on" to the native player; this changes that
 * request so normal play order is requested instead.
 */
@Suppress("unused")
val forceShuffleOffPatch = bytecodePatch(
    name = "Force play order",
    description = "Sends shuffle=false in the app's SetShuffleState request so albums and playlists " +
        "play in order. The native player may still apply a server restriction; shuffle-on is " +
        "sacrificed while this patch is enabled.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val owner = mutableClassDefBy(PLAYBACK_SETTINGS)
        val method = owner.methods.singleOrNull { candidate ->
            candidate.name == "a" && candidate.returnType.startsWith("Lio/reactivex") &&
                candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Z", "Z", "Z")
        } ?: throw IllegalStateException("Spotify SetShuffleState request changed")

        val index = method.implementation!!.instructions.withIndex().firstOrNull { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction.getReference<MethodReference>()?.toString() == SET_SHUFFLE
        }?.index ?: throw IllegalStateException("Spotify shuffle request call changed")

        val call = method.getInstruction(index) as FiveRegisterInstruction
        val shuffleRegister = call.registerD
        method.addInstructions(index, "const/4 v$shuffleRegister, 0x0")
    }
}
