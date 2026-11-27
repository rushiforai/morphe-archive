package app.syncit.patches.sync.comments

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import app.syncit.patches.sync.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/syncit/extension/CommentActivityBadges;"

@Suppress("unused")
val commentActivityPatch = patch(
    name = "Show commenter's top subreddits",
    description = "Adds a line under each comment with the three subreddits the commenter is " +
            "most active in, worked out from their recent public activity on Project Arctic " +
            "Shift. Answers are cached per author; comments without a cache entry ask the " +
            "archive in the background."
) {
    compatibleWith(SYNC_FOR_REDDIT)

    dependsOn(sharedExtensionPatch)

    execute {
        val method = commentHeaderFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // The header is drawn once the builder is finished. Annotate right after that.
        val drawIndex = instructions.indexOfFirst { instruction ->
            val reference = instruction.getReference<MethodReference>()
            reference?.definingClass == "Loc/b;" &&
                    reference.name == "F" &&
                    reference.parameterTypes.isEmpty() &&
                    reference.returnType == "V"
        }
        check(drawIndex >= 0) { "Could not find where the comment header is drawn." }

        method.addInstructions(
            drawIndex + 1,
            """
                invoke-virtual {p1}, Lxa/d;->e()Ljava/lang/String;
                move-result-object v0
                invoke-static {p0, v0}, $EXTENSION_CLASS_DESCRIPTOR->annotate(Landroid/widget/TextView;Ljava/lang/String;)V
            """
        )
    }
}
