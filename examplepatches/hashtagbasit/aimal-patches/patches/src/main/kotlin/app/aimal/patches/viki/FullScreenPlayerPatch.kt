package app.aimal.patches.viki

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val SIDE_PANEL = "Lapp/aimal/extension/viki/SidePanel;"

/**
 * Gives the video the whole screen on tablets and unfolded foldables.
 *
 * Viki treats any device whose smallest dimension is over 600dp as a tablet,
 * which an unfolded foldable is. On that layout it puts the player in a
 * horizontal chain at weight 0.65 and shows a comments panel beside it at 0.35,
 * so unfolding the device shrinks the video to two thirds of the width instead
 * of filling the larger screen.
 *
 * One instruction is injected, at the end of the activity's own
 * panel-visibility pass - the method `onConfigurationChanged` calls, so this
 * runs again on every fold and unfold, after the app has set its own
 * visibilities. The extension then hides the panel and the floating
 * timed-comment overlay, both looked up by resource name.
 *
 * Hiding is all that is needed: ConstraintLayout drops GONE views from a chain,
 * so the player's weight becomes the full width, and the player container
 * already measures itself to the full height on a tablet layout.
 *
 * On a phone this is a no-op, because the side panel is already GONE there.
 */
@Suppress("unused")
val fullScreenPlayerPatch = bytecodePatch(
    name = "Use the whole screen for video",
    description = "Hides the comments panel beside the player on tablets and unfolded foldables.",
    default = true,
) {
    compatibleWith(VIKI)

    extendWith("extensions/extension.mpe")

    execute {
        val updatePanels = VideoActivityUpdatePanelsFingerprint.methodOrNull
            ?: throw PatchException(
                "Could not find VideoActivity's panel-visibility method. Viki " +
                    "has probably reworked its player screen layout."
            )

        // Every return-void, not just the first, so an early exit path cannot
        // leave the panel on screen.
        //
        // Indices are collected up front and applied in reverse so the earlier
        // ones stay valid as instructions are inserted. And return-void is
        // matched rather than "the last instruction", because dex stores
        // fill-array-data payloads and catchall handlers after the code - the
        // tail of a method is often not reachable at all.
        val returnIndices = updatePanels.implementation!!.instructions
            .withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
            .map { (index, _) -> index }

        if (returnIndices.isEmpty()) {
            throw PatchException(
                "VideoActivity's panel-visibility method has no return-void to " +
                    "hook, so the panel would still cover the screen."
            )
        }

        // Range form because a large method can push p0 past the 4-bit register
        // limit of a plain invoke-static. p0 is the activity itself.
        returnIndices.asReversed().forEach { index ->
            updatePanels.addInstruction(
                index,
                "invoke-static/range { p0 .. p0 }, " +
                    "$SIDE_PANEL->hide(Landroid/app/Activity;)V"
            )
        }
    }
}
