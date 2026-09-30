package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Unforces shuffle on four layers.
 *
 * 1. shuffle()V no-op: kills the PlayQueueManager.shuffleCurrent() force path.
 *    Manual toggle is unaffected (toggleShuffle -> setShuffleMode directly).
 * 2. Server-sync neutralization (the actual free-account force path): the
 *    server sends shuffleOn=true and fillFromSyncData / updateFromSocketPayload
 *    copy it into isShuffleMode without calling shuffle(). Each hook's
 *    `iget-boolean <reg>, ServerPlayQueue;->shuffleOn` is REPLACED with
 *    `const/4 <reg>, 0x0` (same register, single-instruction swap — no index
 *    shift, no verifier risk).
 * 3. Pick-a-song redirect kill: shouldPlayRadio(song, section) is forced
 *    false, so tapping a song in a playlist/album builds the normal
 *    on-demand queue at the tapped index instead of a RadioPlayQueue with
 *    playmode="shuffle" (free `song.playMode=="shuffle"`, or any
 *    `section.playMode=="shuffle"` regardless of Plus).
 * 4. Queue-screen greyed button: PlayQueueManager.canShuffleCurrentQueue()
 *    is forced true. The queue/car/bottom-sheet buttons gate on
 *    `canShuffle && isPlus` (isPlus already true via Unlock-Local-Plus);
 *    the only remaining false source was the Radio/Live/Automix
 *    `canShuffle()==false` overrides. `isShuffleMode()` still reports real
 *    state, so the toggle visual stays truthful.
 * 5. Shuffle upsell dialog disarm: RadioPlayQueue.shouldShowShuffleMessage()
 *    (the only true override; base is false) is forced false, so
 *    maybeShowShuffleMessage() can never pop the free-user shuffle dialog.
 *
 * Replacement targets are located by scanning for the IGET_BOOLEAN on the
 * shuffleOn field; the patch fails loudly if the pattern is absent or
 * ambiguous instead of patching the wrong instruction.
 *
 * Interplay (not duplicated here): Unlock-Local-Plus forces isPlus/isPlusUser
 * (covers shouldPlayRadio's song branch, queueRestrictionsEnabled's Plus
 * branch, playPlayQueue's restricted-song branch, the buttons' isPlus
 * branch); Unlock-Restrictions forces skipLimitReached/queueRestrictions
 * off (covers shouldForceRelatedMode and the moveToSong skip gate).
 */
@Suppress("unused")
val unforceShufflePatch = bytecodePatch(
    name = "Unforce shuffle",
    description = "No-ops PlayQueue.shuffle(), forces server shuffleOn=false at both sync points, disables the pick-a-song radio redirect, enables shuffle buttons, and disarms the shuffle upsell dialog. Manual shuffle toggle keeps working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        ForceShuffleFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
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
        // Pick-a-song stays on-demand (never redirect to a radio/shuffle queue).
        ShouldPlayRadioFingerprint.method.addInstructions(
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
    }
}
