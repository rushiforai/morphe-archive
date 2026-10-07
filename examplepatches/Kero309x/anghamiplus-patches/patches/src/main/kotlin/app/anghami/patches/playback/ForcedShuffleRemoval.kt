package app.anghami.patches.playback

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceTrue
import app.anghami.patches.core.forceVoid
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Stops the player from forcing shuffle mode onto the user.
 *
 * Four separate guards have to fall for that, so the patch neutralises each of
 * them:
 *
 * 1. The queue's `shuffle()` entry point is turned into a no-op, which removes
 *    the direct call that flips the mode. A user initiated toggle does not pass
 *    through that method, so it keeps working.
 * 2. The server driven path is cut as well. When the backend hands over a queue
 *    with `shuffleOn` set, the two methods that copy the flag into the local
 *    playback state each contain a single `iget-boolean <reg>, ...
 *    ->shuffleOn:Z`, and that read is swapped for a constant `0` in the very
 *    same register. Because the replacement is one instruction for one
 *    instruction, no index shifts and the verifier stays happy.
 * 3. Picking a song stays on demand. `shouldPlayRadio(...)` is forced to
 *    `false`, so tapping an entry inside a playlist or album builds the normal
 *    queue at the tapped position instead of redirecting into a radio queue
 *    whose play mode is `shuffle`.
 * 4. The shuffle affordances stop being greyed out: the queue manager's
 *    "can shuffle the current queue" check is forced to `true`, which matters
 *    for the radio/live/automix overrides. The reported shuffle mode itself is
 *    left alone, so the toggle keeps showing the real state. The radio queue's
 *    upsell trigger is forced to `false`, so the "you are shuffled" dialog can
 *    never be armed.
 *
 * The two `shuffleOn` reads are found by scanning the method bodies rather than
 * by a fixed index. If the expected instruction is missing, or present more
 * than once, the patch fails with an explicit message instead of rewriting an
 * arbitrary instruction.
 */
@Suppress("unused")
val forcedShuffleRemovalPatch = bytecodePatch(
    name = "Disable Forced Shuffle",
    description = "Disables forced shuffle mode on playlists and radio, enabling full on-demand song selection.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        // Layer 1: the queue can no longer shuffle itself on demand.
        ForceShuffleSignature.method.forceVoid()
        // Layer 2: swap each `iget-boolean <reg>, ...;->shuffleOn:Z` for
        // `const/4 <reg>, 0`, keeping the register intact. The read is located
        // by scanning; an absent or ambiguous match aborts the patch.
        for ((fingerprint, register) in
            listOf(FillFromSyncDataSignature to "p2", SocketPayloadShuffleSignature to "v7")
        ) {
            val method = fingerprint.method
            val matches = method.implementation!!.instructions
                .mapIndexedNotNull { index, ins ->
                    // iget-boolean is format 22c (target + object registers).
                    if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                        (ins.reference as? FieldReference)?.name == "shuffleOn"
                    ) {
                        index
                    } else {
                        null
                    }
                }
            check(matches.size == 1) {
                "expected exactly 1 shuffleOn iget in ${fingerprint.javaClass.simpleName}, found ${matches.size}"
            }
            method.replaceInstructions(matches[0], "const/4 $register, 0x0")
        }
        // Layer 3: tapping a song never turns into a radio/shuffle queue.
        ShouldPlayRadioSignature.method.forceFalse()
        // Layer 4a: the queue, car mode and bottom sheet buttons stay enabled.
        CanShuffleCurrentQueueSignature.method.forceTrue()
        // Layer 4b: the shuffle upsell dialog is never armed.
        RadioShuffleMessageSignature.method.forceFalse()
    }
}

/** Targets `PlayQueue.shuffle()V`, the direct force path. */
object ForceShuffleSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "shuffle",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "setShuffleMode",
        ),
        opcode(Opcode.RETURN_VOID),
    )
)

/** Targets `PlayQueue.fillFromSyncData(...)V`, which copies the synced `shuffleOn` flag. */
object FillFromSyncDataSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "fillFromSyncData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/anghami/odin/playqueue/ServerPlayQueue;",
        "Ljava/util/List;",
    ),
    filters = listOf(
        string("infinite"),
    )
)

/** Targets `PlayQueue.updateFromSocketPayload(...)V`, the socket variant of the same copy. */
object SocketPayloadShuffleSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "updateFromSocketPayload",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("LXe/c;"),
    filters = listOf(
        string("told to shuffle, but something wrong with shuffled songs"),
    )
)

/** Targets the list screen predicate that decides whether a tap starts a radio queue. */
object ShouldPlayRadioSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "shouldPlayRadio",
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/ghost/pojo/Song;",
        "Lcom/anghami/ghost/pojo/section/Section;",
    ),
    filters = listOf(
        string("shuffle"),
    )
)

/** Targets `PlayQueueManager.canShuffleCurrentQueue()Z`, the UI gate for the shuffle buttons. */
object CanShuffleCurrentQueueSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueueManager;",
    name = "canShuffleCurrentQueue",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
            name = "canShuffle",
        ),
    )
)

/** Targets `RadioPlayQueue.shouldShowShuffleMessage()Z`, the upsell dialog trigger. */
object RadioShuffleMessageSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/RadioPlayQueue;",
    name = "shouldShowShuffleMessage",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("shuffle"),
    )
)
