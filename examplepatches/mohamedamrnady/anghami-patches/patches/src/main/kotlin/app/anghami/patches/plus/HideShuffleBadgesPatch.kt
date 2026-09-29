package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Hides PLAYS IN SHUFFLE badges everywhere (headers, cards, rows).
 *
 * - 3 header models' getHasShuffleBadge() -> false, so
 *   setShuffleBadgeView() sets the ShuffleBadgeGroup GONE
 *   (ConstraintLayout Group, collapses cleanly).
 * - Card/row badges: every isShuffleMode read becomes const/4 (register
 *   taken from the matched instruction). LinkModel.setSubtitleView has TWO
 *   reads — the loop replaces every match, so it lists once and both swap.
 *
 * Purely cosmetic; shuffle playback behavior is covered by "Unforce
 * shuffle". See ShuffleBadgesFingerprints.kt.
 */
@Suppress("unused")
val hideShuffleBadgesPatch = bytecodePatch(
    name = "Hide shuffle badges",
    description = "Hides PLAYS IN SHUFFLE badges on playlist/album headers, feed cards, and rows. Cosmetic only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        ShuffleBadgeBaseFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        ShuffleBadgePlaylistFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        ShuffleBadgeAlbumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        for (fingerprint in listOf(
            LinkNewCardBindFingerprint, StoreCarouselSubBindFingerprint,
            PlaylistRowSubtitleFingerprint, AlbumRowSubtitleFingerprint,
            PlaylistCardDrawableFingerprint, AlbumCardDrawableFingerprint,
            LinkCardDrawableFingerprint, LinkModelSubtitleFingerprint,
        )) {
            val cardBind = fingerprint.method
            val shuffleGets = cardBind.implementation!!.instructions
                .mapIndexedNotNull { index, ins ->
                    if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                        (ins.reference as? FieldReference)?.name == "isShuffleMode"
                    ) {
                        index to ins.registerA
                    } else {
                        null
                    }
                }
            check(shuffleGets.isNotEmpty()) {
                "expected at least 1 isShuffleMode iget in ${fingerprint.name}, found none"
            }
            for ((index, reg) in shuffleGets) {
                cardBind.replaceInstructions(index, "const/4 v$reg, 0x0")
            }
        }
    }
}
