package app.ckzombies.patches.sound

import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION = "Lapp/ckzombies/extension"
private const val SND_CACHE = "$EXTENSION/SndCache;"
private const val SHIM_PLAYER = "$EXTENSION/ShimPlayer;"
private const val ACTIVITY = "Lcom/glu/platform/android/GluPlatformActivity;"
private const val LISTENER = "Lcom/glu/platform/android/GluPlatformActivity\$1;"
private const val MEDIA_PLAYER = "Landroid/media/MediaPlayer;"

/**
 * The engine asks for a player once per sound event, and the method builds a whole `MediaPlayer`
 * and prepares it synchronously, which is the hitch on every shot.
 */
internal object InitialiseSoundEventFingerprint : Fingerprint(
    definingClass = ACTIVITY,
    name = "InitialiseSoundEvent",
    returnType = MEDIA_PLAYER,
    parameters = listOf("Ljava/lang/String;", "J"),
    filters = listOf(
        methodCall(definingClass = MEDIA_PLAYER, name = "setDataSource"),
        methodCall(definingClass = MEDIA_PLAYER, name = "setOnCompletionListener"),
        methodCall(definingClass = MEDIA_PLAYER, name = "prepare"),
    ),
)

/**
 * Routes the game's sounds through a `SoundPool`.
 *
 * `MediaPlayer` is not final and the engine only calls six methods on what it gets back, none of
 * them final, so a subclass satisfies the JNI signature and the engine's cached method ids
 * dispatch into the overrides. Three changes to `InitialiseSoundEvent`:
 *
 * 1. a fast path at the top, which returns a player for a sound the cache already holds, with a
 *    fresh completion listener for this event id
 * 2. the `MediaPlayer` it builds otherwise becomes a `ShimPlayer`, which is kept prepared and
 *    rewound instead of rebuilt, and handed out again at full volume, as a new one would be
 * 3. the prepared player is handed to the cache, which decodes the sample in the background and
 *    serves every later request from the pool
 *
 * A sound whose duration cannot be read is never given to `SoundPool`, since the engine needs a
 * completion callback and `SoundPool` has none. It stays on the prepared-player tier, which is
 * also what happens below API 10, where `MediaMetadataRetriever` does not exist.
 */
@Suppress("unused")
val soundCachePatch = bytecodePatch(
    name = "Smooth sound",
    description = "Removes the stutter while firing, caused by the game building a new audio player for every sound.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    extendWith("extensions/extension.mpe")

    execute {
        val method = InitialiseSoundEventFingerprint.method
        val prepare = InitialiseSoundEventFingerprint.instructionMatches[2].index

        // 3, first, because inserting above it would move the index: hand the prepared player
        // to the cache. prepare() is called on the player, so its register is the call's first.
        val player = method.getInstruction<FiveRegisterInstruction>(prepare).registerC
        method.addInstructions(prepare + 1, "invoke-static {v$player}, $SND_CACHE->put($SHIM_PLAYER)V")

        // 2: what the method builds when the cache has nothing becomes a ShimPlayer.
        val newInstance = (0 until prepare).lastOrNull {
            val instruction = method.getInstruction(it)
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as ReferenceInstruction).reference as TypeReference).type == MEDIA_PLAYER
        } ?: throw PatchException("InitialiseSoundEvent: no MediaPlayer is built here")
        if (method.getInstruction<OneRegisterInstruction>(newInstance).registerA != player) {
            throw PatchException("InitialiseSoundEvent: the player is built into another register")
        }
        if (method.getInstruction(newInstance + 1).opcode != Opcode.INVOKE_DIRECT) {
            throw PatchException("InitialiseSoundEvent: the constructor does not follow new-instance")
        }
        method.replaceInstruction(newInstance, "new-instance v$player, $SHIM_PLAYER")
        method.replaceInstruction(
            newInstance + 1,
            "invoke-direct {v$player, p1}, $SHIM_PLAYER-><init>(Ljava/lang/String;)V",
        )

        // 1: the fast path, which falls through to the instruction the method used to start with.
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static {p1}, $SND_CACHE->get(Ljava/lang/String;)$MEDIA_PLAYER
                move-result-object v$player
                if-eqz v$player, :build_it
                new-instance v2, $LISTENER
                invoke-direct {v2, p0, p2, p3}, $LISTENER-><init>(${ACTIVITY}J)V
                invoke-virtual {v$player, v2}, $MEDIA_PLAYER->setOnCompletionListener(Landroid/media/MediaPlayer${'$'}OnCompletionListener;)V
                return-object v$player
            """,
            ExternalLabel("build_it", method.getInstruction(0)),
        )
    }
}
