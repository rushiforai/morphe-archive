package app.syncit.patches.sync.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.getReference
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import app.syncit.patches.sync.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/syncit/extension/HideExpandButtonPatch;"

/** Draws a post in the list, compact and smaller card layouts. */
internal val compactHolderFingerprint = Fingerprint(
    definingClass =
        "Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/compact/CompactHolder;",
    name = "h",
    returnType = "V",
    parameters = listOf("Lxa/d;", "I"),
)

@Suppress("unused")
val hideExpandButtonPatch = patch(
    name = "Hide the card dropdown button",
    description = "Hides the expand chevron on the right side of each post in the list, compact " +
            "and smaller card layouts, and gives its width back to the post text."
) {
    compatibleWith(SYNC_FOR_REDDIT)

    dependsOn(sharedExtensionPatch)

    execute {
        listOf(
            "res/layout/holder_smaller_cards.xml",
            "res/layout/holder_compact.xml",
            "res/layout/holder_list.xml",
        ).forEach { path ->
            resourceXml(path).use { layout ->
                layout.elementByAttribute("android:id", "@id/holder_list_expand")
                    .setAttribute("android:visibility", "gone")
            }
        }

        // The holder still pads the text for the chevron it can no longer see. Trim that padding
        // right after the title is drawn, which every branch of the holder passes through.
        val method = compactHolderFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        val titleDrawIndex = instructions.indexOfFirst { instruction ->
            val reference = instruction.getReference<MethodReference>()
            reference?.definingClass ==
                    "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/posts/PostTitleTextView;" &&
                    reference.name == "G" &&
                    reference.returnType == "V"
        }
        check(titleDrawIndex >= 0) { "Could not find where the post title is drawn." }

        method.addInstructions(
            titleDrawIndex + 1,
            """
                iget-object p1, p0, Lcom/laurencedawson/reddit_sync/ui/viewholders/posts/compact/CompactHolder;->mTitleWrapper:Landroid/widget/LinearLayout;
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->reduceTextPadding(Landroid/widget/LinearLayout;)V
            """
        )
    }
}
