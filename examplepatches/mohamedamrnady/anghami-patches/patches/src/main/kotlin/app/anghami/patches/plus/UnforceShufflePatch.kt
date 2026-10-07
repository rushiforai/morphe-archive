package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Unforces shuffle (v1 scope) and kills the server radio paths.
 *
 * 1. Server-sync neutralization (the actual free-account force path): the
 *    server sends shuffleOn=true and fillFromSyncData / updateFromSocketPayload
 *    copy it into isShuffleMode without calling shuffle(). Each hook's
 *    `iget-boolean <reg>, ServerPlayQueue;->shuffleOn` is REPLACED with
 *    `const/4 <reg>, 0x0` (same register, single-instruction swap — no index
 *    shift, no verifier risk).
 * 2. Pick-a-song redirect kill: shouldPlayRadio(song, section) is forced
 *    false, so tapping a song in a playlist/album builds the normal
 *    on-demand queue at the tapped index instead of a RadioPlayQueue with
 *    playmode="shuffle" (free `song.playMode=="shuffle"`, or any
 *    `section.playMode=="shuffle"` regardless of Plus).
 * 3. Queue-screen greyed button: PlayQueueManager.canShuffleCurrentQueue()
 *    is forced true. The queue/car/bottom-sheet buttons gate on
 *    `canShuffle && isPlus` (isPlus already true via Unlock-Local-Plus);
 *    the only remaining false source was the Radio/Live/Automix
 *    `canShuffle()==false` overrides. `isShuffleMode()` still reports real
 *    state, so the toggle visual stays truthful.
 * 4. Shuffle upsell dialog disarm: RadioPlayQueue.shouldShowShuffleMessage()
 *    (the only true override; base is false) is forced false, so
 *    maybeShowShuffleMessage() can never pop the free-user shuffle dialog.
 *
 * Deliberately NOT hooked: `PlayQueue.shuffle()`V. The v1 no-op is not
 * restored because the "Header Play + Shuffle" patch routes its Shuffle
 * button through `shuffle()` (`c.play` v3-gate from `playFromHeader(true)`,
 * `k5/f$a` p1-gate from the same tap) — no-op'ing it would break the header
 * Shuffle button. Every remaining call site is gated on an explicit user
 * request, so there is no automatic path left to kill.
 *
 * Also present (re-added 2026-10-05 after the v1 restore re-opened the
 * server radio paths — skipping/picking songs played ~1s then jumped to a
 * server-built queue): `shouldPlayRelated`->false (server "related" markings
 * never divert header Play / tap-a-song into an expanding `SongPlayqueue`),
 * the `maybeExpandQueue` top-up guard (non-empty song/radio queues refuse
 * server top-ups; empty queues still initial-load so search taps work), and
 * the local-authoritative index nop in `updateFromSocketPayload` (stale
 * socket echoes no longer rewrite the live position after a skip; flags
 * still sync). None of the three touches `shuffle()` or the header buttons.
 *
 * Never reports shuffle: `fillSyncData`'s `if isShuffleMode():
 * shuffleOn=true + shuffledSongs=copy` block has both iputs nopped, so
 * every client->server payload (diff-PUTs, POSTs) reads unshuffled with no
 * shuffled order — the server keeps serving on-demand content and never
 * enforces shuffle-session skip limits. This restores 1.2.0's
 * server-visible behavior (its `shuffle()` no-op meant shuffle could never
 * turn on to be reported) while the Shuffle button and toggles keep working
 * locally. Both Diff sides are built by this same method, so no phantom
 * diffs; local `isShuffleMode`/`shuffledSongs` are untouched.
 *
 * Replacement targets are located by scanning for the IGET_BOOLEAN on the
 * shuffleOn field; the patch fails loudly if the pattern is absent or
 * ambiguous instead of patching the wrong instruction.
 *
 * Interplay (not duplicated here): Unlock-Local-Plus forces isPlus/isPlusUser
 * (covers shouldPlayRadio's song branch, queueRestrictionsEnabled's Plus
 * branch, playPlayQueue's restricted-song branch, the buttons' isPlus
 * branch); Unlock-Playback-Limits forces skipLimitReached/queueRestrictions
 * off (covers shouldForceRelatedMode and the moveToSong skip gate).
 */
@Suppress("unused")
val unforceShufflePatch = bytecodePatch(
    name = "Unforce shuffle",
    description = "Forces server shuffleOn=false at both sync points, never reports shuffle to the server, disables the pick-a-song radio redirect, enables shuffle buttons, and disarms the shuffle upsell dialog. Manual shuffle toggle and the header Shuffle button keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        // Replace the single `iget-boolean <reg>, ...;->shuffleOn:Z` with
        // `const/4 <reg>, 0` (same register, single-instruction swap). The
        // target is located by scan; fail loudly if absent or ambiguous.
        for ((fingerprint, register) in
            listOf(FillFromSyncDataFingerprint to "p2", SocketPayloadShuffleFingerprint to "v7")
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
                "expected exactly 1 shuffleOn iget in ${fingerprint.name}, found ${matches.size}"
            }
            method.replaceInstructions(matches[0], "const/4 $register, 0x0")
        }
        // Local-authoritative index: nop the unconditional
        // `iget vX, p1, ServerPlayQueue;->index` -> `iput vX, p0,
        // PlayQueue;->index` copy in updateFromSocketPayload (same method as
        // the socket shuffle hook above). Located by pattern: the server-
        // side iget is the only `index` iget off ServerPlayQueue (the rest
        // read the local field), and the very next instruction must be its
        // iput — fail loudly otherwise. Label-safe: neither instruction
        // carries a branch label (both sit between `if-nez :cond_3` and the
        // bounds check). The OOB-clamp below then validates the LOCAL index
        // (always in range — we just set it) instead of the server's.
        run {
            val method = SocketPayloadShuffleFingerprint.method
            val insns = method.implementation!!.instructions
            val gets = insns.mapIndexedNotNull { index, ins ->
                if ((ins.opcode == Opcode.IGET || ins.opcode == Opcode.IGET_OBJECT) &&
                    ins is Instruction22c &&
                    (ins.reference as? FieldReference)?.name == "index" &&
                    (ins.reference as? FieldReference)?.definingClass ==
                    "Lcom/anghami/odin/playqueue/ServerPlayQueue;"
                ) {
                    index
                } else {
                    null
                }
            }
            check(gets.size == 1) {
                "expected exactly 1 ServerPlayQueue.index iget, found ${gets.size}"
            }
            val next = insns[gets[0] + 1]
            check(next.opcode == Opcode.IPUT && next is Instruction22c &&
                (next.reference as? FieldReference)?.name == "index"
            ) {
                "expected PlayQueue.index iput right after the server iget"
            }
            method.replaceInstructions(gets[0] + 1, "nop")
        }
        // Never report shuffle (2026-10-05): nop the `if isShuffleMode():
        // shuffleOn=true + shuffledSongs=copy` block's two iputs in
        // fillSyncData (same method that builds every client->server payload
        // AND both Diff sides). Fresh ServerPlayQueue fields keep their
        // defaults (false/null), so the server always sees an unshuffled
        // session and keeps serving on-demand content. Located by scan —
        // exactly 1 shuffleOn iput + 1 shuffledSongs iput in this method;
        // fail loudly otherwise. Label-safe: both sit inside the if-block
        // interior (between `if-eqz :cond_0` and its target), carrying no
        // branch labels; the dead ArrayList copy above the second nop is
        // harmless. Local isShuffleMode/shuffledSongs untouched.
        run {
            val method = SyncReportFingerprint.method
            val insns = method.implementation!!.instructions
            fun findSingle(field: String, opcode: Opcode): Int {
                val matches = insns.mapIndexedNotNull { index, ins ->
                    if (ins.opcode == opcode && ins is Instruction22c &&
                        (ins.reference as? FieldReference)?.name == field &&
                        (ins.reference as? FieldReference)?.definingClass ==
                        "Lcom/anghami/odin/playqueue/ServerPlayQueue;"
                    ) {
                        index
                    } else {
                        null
                    }
                }
                check(matches.size == 1) {
                    "expected exactly 1 ServerPlayQueue.$field write in fillSyncData, found ${matches.size}"
                }
                return matches[0]
            }
            method.replaceInstructions(
                findSingle("shuffleOn", Opcode.IPUT_BOOLEAN), "nop"
            )
            method.replaceInstructions(
                findSingle("shuffledSongs", Opcode.IPUT_OBJECT), "nop"
            )
        }
        // Pick-a-song stays on-demand (never redirect to a radio/shuffle queue).
        ShouldPlayRadioFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        // Related-marked taps stay on-demand too (never build the expanding
        // SongPlayqueue). Sole private def; v0 is dead at index 0, same
        // shape as shouldPlayRadio above.
        ShouldPlayRelatedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        // Shuffle buttons (queue screen, car mode, bottom sheet) never grey out.
        CanShuffleCurrentQueueFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        // Never arm the "you're shuffled" upsell dialog.
        RadioShuffleMessageFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        // Expansion top-up guard (NOT a blanket kill: empty queues load
        // their initial data through here, e.g. search taps). Index-0
        // prepend (.locals 4: v0-v2 free at entry, p1 = callback); labels
        // use the noexpand_ prefix, same pattern as the header patch's
        // :keep_playlist_secondary prepend.
        QueueExpansionFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/anghami/odin/playqueue/PlayQueue;->getSongs()Ljava/util/List;
                move-result-object v1
                invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
                move-result v1
                if-eqz v1, :noexpand_allow
                instance-of v0, p0, Lcom/anghami/odin/playqueue/SongPlayqueue;
                if-nez v0, :noexpand_isradio
                goto :noexpand_block
                :noexpand_isradio
                instance-of v0, p0, Lcom/anghami/odin/playqueue/RadioPlayQueue;
                if-eqz v0, :noexpand_allow
                :noexpand_block
                new-instance v0, Ljava/lang/Throwable;
                const-string v1, "song/radio top-up blocked"
                invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V
                invoke-interface {p1, v0}, Lcom/anghami/odin/playqueue/PlayQueue${'$'}ExpansionCallback;->onExpansionFailed(Ljava/lang/Throwable;)V
                return-void
                :noexpand_allow
            """
        )
    }
}
