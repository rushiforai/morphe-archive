package app.anghami.patches.player

import app.anghami.patches.player.QueuePillColorsFingerprint
import app.anghami.patches.player.RemoveHighlightFingerprint
import app.anghami.patches.player.SongHighlightFingerprint
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Primary accent = 0x7f06002f (`app_color`: pink day / lime night stock,
 * Monet dynamic on v31+ when the Monet patch remaps the brand slots). */

/**
 * Player: accent now-playing row + readable pills + readable unselected rows.
 *
 * Const swaps, no new branches (label-safe):
 *
 * - Pills (`playerfeed/c.m0`): the single `const white` feeding both the
 *   pill text int and the icon tint becomes `primaryText` (plain theme
 *   text, user call — no accent on shuffle/enhance/save), and the `const
 *   black_20_transparent` background becomes `window_background_color`
 *   (white day / dark night — the grey wash was the day complaint).
 *   Border stays null ("don't touch"), so the XML theme border survives.
 * - Now-playing (`SongRowModel.setSongHighlight`): the shared
 *   `const dark_3` (near-black title/subtitle — invisible on the dark
 *   night player) becomes `app_color`, so title, subtitle, drag/delete
 *   icons, equalizer and video badge all follow the primary accent in both
 *   modes. The `#b3ffffff` row wash (ugly light-grey band at night) is
 *   zeroed to transparent — the accent text + equalizer carry the
 *   highlight.
 * - Unselected rows (`SongRowModel.removeSongHighlight`): the non-inverse
 *   title/icon `const app_color` (pink title on white in day mode) becomes
 *   `primaryText`, so unselected rows read as normal theme text (black
 *   day) while ONLY the playing row carries the accent. Inverse (night)
 *   keeps stock white; subtitle already used `secondaryText` and stays.
 *
 * Note: `SongRowModel` is shared by every song list in the app, so the
 * highlight change applies everywhere, not just the player queue.
 */
@Suppress("unused")
val playerQueueAccentPatch = bytecodePatch(
    name = "Player: accent now-playing + pills",
    description = "Paints the now-playing queue row with the primary accent (pink day / lime night stock, Monet dynamic). Shuffle/enhance/save pills and unselected rows stay on theme text. Removes the grey highlight wash.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)
    category("Experimental")

    execute {
        // --- Pills: white -> primaryText (text + icon tint), grey wash -> theme bg. ---
        val m0 = QueuePillColorsFingerprint.method
        val m0Insns = m0.implementation!!.instructions
        val whiteConsts = m0Insns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f0601fe
            ) {
                index
            } else {
                null
            }
        }
        check(whiteConsts.size == 1) {
            "expected exactly 1 white const in playerfeed/c.m0, found ${whiteConsts.size}"
        }
        m0.replaceInstructions(whiteConsts[0], "const v1, 0x7f060598")
        val pillBgConsts = m0Insns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f060046
            ) {
                index
            } else {
                null
            }
        }
        check(pillBgConsts.size == 1) {
            "expected exactly 1 black_20 const in playerfeed/c.m0, found ${pillBgConsts.size}"
        }
        m0.replaceInstructions(pillBgConsts[0], "const v0, 0x7f060679")

        // --- Now-playing: dark_3 -> app_color. ---
        val hl = SongHighlightFingerprint.method
        val hlInsns = hl.implementation!!.instructions
        val darkConsts = hlInsns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f060117
            ) {
                index
            } else {
                null
            }
        }
        check(darkConsts.size == 1) {
            "expected exactly 1 dark_3 const in setSongHighlight, found ${darkConsts.size}"
        }
        hl.replaceInstructions(darkConsts[0], "const v1, 0x7f06002f")

        // --- Unselected rows: app_color -> primaryText (title + drag/delete
        // icons share one const via move v1,v2). Inverse (night) keeps white,
        // subtitle keeps secondaryText, equalizer keeps its app_color bar. ---
        val rm = RemoveHighlightFingerprint.method
        val rmInsns = rm.implementation!!.instructions
        val appConsts = rmInsns.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f06002f
            ) {
                index
            } else {
                null
            }
        }
        check(appConsts.size == 1) {
            "expected exactly 1 app_color const in removeSongHighlight, found ${appConsts.size}"
        }
        rm.replaceInstructions(appConsts[0], "const v2, 0x7f060598")

        // --- Equalizer: nothing to do. `setBarColor(I)` resolves the id
        // itself via `ContextCompat.getColor` (proven by the
        // `NotFoundException` a resolved color caused), so the const swap
        // above already gives it accent bars. Just assert the call site. ---
        val barCalls = hlInsns.mapIndexedNotNull { index, ins ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Lcom/anghami/ui/view/EqualizerView;" &&
                ref.name == "setBarColor"
            ) {
                index
            } else {
                null
            }
        }
        check(barCalls.size == 1) {
            "expected exactly 1 EqualizerView.setBarColor in setSongHighlight, found ${barCalls.size}"
        }

        // --- Highlight wash: song_row_highlight_color -> transparent. ---
        // Sequence: const v1, <wash>; getColor; move-result v1;
        // setBackgroundColor. Zero the const and drop the resolve.
        val washConsts = hl.implementation!!.instructions.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.CONST &&
                (ins as? Instruction31i)?.narrowLiteral == 0x7f06060b
            ) {
                index
            } else {
                null
            }
        }
        check(washConsts.size == 1) {
            "expected exactly 1 highlight-wash const in setSongHighlight, found ${washConsts.size}"
        }
        val washIndex = washConsts[0]
        val afterWash = hl.implementation!!.instructions
        check(afterWash[washIndex + 1].opcode == Opcode.INVOKE_DIRECT &&
            afterWash[washIndex + 2].opcode == Opcode.MOVE_RESULT) {
            "expected getColor + move-result after wash const, found " +
                "${afterWash[washIndex + 1].opcode} / ${afterWash[washIndex + 2].opcode}"
        }
        hl.removeInstruction(washIndex + 2)
        hl.removeInstruction(washIndex + 1)
        hl.replaceInstructions(washIndex, "const v1, 0x0")
    }
}
