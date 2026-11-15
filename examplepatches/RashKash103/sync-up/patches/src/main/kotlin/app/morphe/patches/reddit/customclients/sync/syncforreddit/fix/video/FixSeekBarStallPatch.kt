package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.video

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

@Suppress("unused")
val fixSeekBarStallPatch = bytecodePatch(
    name = "Fix the video position bar falling behind",
    description = "Moves the position bar under a video straight to where the video has " +
            "reached, instead of animating it there. The animation can be left unfinished for " +
            "seconds at a time, which leaves the bar sitting still while the video plays on.",
    default = true,
) {
    category("2. Media")

    compatibleWith(*SyncForRedditCompatible)

    execute {
        seekBarProgressFingerprint.method.apply {
            // The viewer asks for a new position about thirty times a second. From API 24 it
            // asks for an animated move, which hands the work to an eighty millisecond
            // animator, and each new ask replaces the animator the one before it started.
            // Where the animators are replaced faster than they are given a frame to run in,
            // none of them ever writes anything and the bar stays where it is until one
            // happens to survive long enough — which it then does in a single jump, catching
            // up the seconds it sat out. The clock beside it is plain text and keeps counting
            // throughout, so the bar alone appears to stop.
            //
            // Asking for the move without the animation writes the position directly, which
            // is what the app already does below API 24 — the instruction put here is the one
            // standing a few instructions further down, in the branch taken there.
            val animated = indexOfFirstInstructionOrThrow {
                (this as? ReferenceInstruction)?.reference.isAnimatedSeekBarProgress()
            }

            val call = getInstruction<FiveRegisterInstruction>(animated)
            replaceInstruction(
                animated,
                "invoke-virtual { v${call.registerC}, v${call.registerD} }, " +
                        "Landroid/widget/SeekBar;->setProgress(I)V",
            )
        }
    }
}
