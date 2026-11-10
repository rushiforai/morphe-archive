package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.swipe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/swipe/SwipeBack;"

private const val SHOW_METHOD = "showWhatIsBehind(Landroid/app/Activity;)Z"

private const val STOP_METHOD = "stopShowingIt(Landroid/app/Activity;)Z"

/**
 * Offers the supported call before Sync reaches for the hidden one, and leaves Sync's own attempt
 * in place behind it for the platforms where it still works.
 *
 * <p>The answer has to go somewhere, and nothing is free at the top of a method. What is free is
 * whatever the method writes into before it ever reads it, and both of these open by filling a
 * register — one with a class, the other with a builder — so that register is borrowed. It is
 * written again by the instruction this returns to, so nothing downstream can tell.
 */
private fun MutableMethod.offerOurOwnFirst(method: String) {
    val first = getInstruction<Instruction>(0)
    val free = (first as? OneRegisterInstruction)?.registerA
        ?: throw PatchException(
            "$name does not open by filling a register, so there is none to answer in",
        )

    addInstructionsWithLabels(
        0,
        """
        invoke-static       { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$method
        move-result         v$free
        if-eqz              v$free, :the_way_it_was
        return-void
        """,
        ExternalLabel("the_way_it_was", first),
    )
}

@Suppress("unused")
val swipeBackPatch = bytecodePatch(
    name = "Show the feed while a post is swiped away",
    description = "Draws the screen behind a post as it is dragged aside, which is otherwise " +
            "left black.",
    default = true
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        becomeTranslucentFingerprint.method.offerOurOwnFirst(SHOW_METHOD)
        becomeOpaqueFingerprint.method.offerOurOwnFirst(STOP_METHOD)
    }
}
