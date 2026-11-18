package patches.spotify.ui

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.spotify.COMPATIBILITY_SPOTIFY

private const val NOW_PLAYING_MODEL = "Lp/oq10;"
private const val PLAYER_STATE = "Lcom/spotify/player/model/PlayerState;"
private const val PLAYER_QUEUE = "Lcom/spotify/player/model/PlayerQueue;"
private const val PEEK_NEXT_GATE = "Lp/rnn1;->u(Lcom/spotify/player/model/PlayerState;)Z"

/**
 * Spotify builds the media-session queue from `PlayerQueue.nextTracks()` only when
 * `PlayerState.restrictions().disallowPeekingNextReasons()` is empty and the peek gate allows it.
 * A Free account sets that restriction, so the queue is replaced with an empty one even though the
 * player has upcoming tracks. Skip both gate branches around the queue builder so the car's Up next
 * receives the player's real list. This is opt-in because it also enters the queue builder when
 * Spotify has no queue yet during startup.
 */
@Suppress("unused")
val spotifyAndroidAutoUpNextPatch = bytecodePatch(
    name = "Android Auto Up next",
    description = "Publishes the player's real upcoming tracks to the media session on accounts " +
        "whose peek-next restriction would otherwise hide the car's Up next list.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val method = mutableClassDefBy(NOW_PLAYING_MODEL).methods.single { candidate ->
            candidate.name == "m" &&
                candidate.implementation != null &&
                candidate.parameterTypes.map(CharSequence::toString).take(2) ==
                listOf(PLAYER_STATE, PLAYER_QUEUE)
        }
        val instructions = method.implementation!!.instructions.toList()

        // Each gate reads the peek-next restriction, then the DJ gate. Both branches jump to the
        // empty queue. Nop them so the real queue builder is always reached.
        val gates = instructions.indices.filter { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@filter false
            instruction.getReference<MethodReference>()?.toString() == PEEK_NEXT_GATE
        }
        check(gates.size == 2) { "Spotify peek-next gate changed" }

        var patched = 0
        gates.forEach { gate ->
            val branch = (gate + 1 until minOf(instructions.size, gate + 5))
                .firstOrNull { instructions[it].opcode == Opcode.IF_NEZ }
                ?: throw IllegalStateException("Spotify queue peek gate changed")
            method.replaceInstruction(branch, "nop")
            patched++

            val restrictionBranch = (gate - 1 downTo maxOf(0, gate - 10))
                .firstOrNull { instructions[it].opcode == Opcode.IF_EQZ }
                ?: throw IllegalStateException("Spotify queue empty gate changed")
            method.replaceInstruction(restrictionBranch, "nop")
            patched++
        }
        check(patched == 4) { "Spotify queue gates changed" }
    }
}
