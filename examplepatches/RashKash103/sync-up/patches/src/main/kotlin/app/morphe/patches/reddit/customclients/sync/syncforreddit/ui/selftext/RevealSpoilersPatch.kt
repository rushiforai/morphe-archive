package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.selftext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/Spoilers;"

private const val REVEAL_METHOD = "reveal(Ljava/lang/Object;Landroid/view/View;)Z"

private const val REVEALED_METHOD = "revealed(Ljava/lang/Object;)Z"

/** The span Sync hides a spoiler with, which paints it in the colour it sits on. */
private const val SPOILER_SPAN_CLASS = "Lmb/k;"

@Suppress("unused")
val revealSpoilersPatch = bytecodePatch(
    name = "Fix revealing spoilers",
    description = "Opens a spoiler where it sits when it is tapped, which Sync otherwise answers " +
            "with \"Missing post information\".",
    default = true
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // The tap. Answered before anything else, because what Sync does with it reads a kind
        // the post need not be and markers the body no longer carries. Where this answers false
        // the original runs untouched, so leaving the patch out changes nothing.
        //
        // In front of the first instruction rather than anywhere later: that instruction is
        // where the register the view arrived in is taken for something else.
        Fingerprint(
            definingClass = SPOILER_SPAN_CLASS,
            name = "onClick",
            parameters = listOf("Landroid/view/View;"),
            returnType = "V",
        ).method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static       { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->$REVEAL_METHOD
                move-result         v0
                if-eqz              v0, :sync
                return-void
                """,
                ExternalLabel("sync", getInstruction<Instruction>(0)),
            )
        }

        // The painting. A spoiler that has been opened is drawn as the words it is, which is
        // what this method is otherwise there to prevent.
        Fingerprint(
            definingClass = SPOILER_SPAN_CLASS,
            name = "updateDrawState",
            parameters = listOf("Landroid/text/TextPaint;"),
            returnType = "V",
        ).method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static       { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$REVEALED_METHOD
                move-result         v0
                if-eqz              v0, :hide
                return-void
                """,
                ExternalLabel("hide", getInstruction<Instruction>(0)),
            )
        }
    }
}
