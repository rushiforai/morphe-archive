/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.misc.commenttools

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstructions

private const val EXTENSION = "Lapp/pixkk/extension/comment/CommentMenuRows;"

@Suppress("unused")
val commentMenuRowsPatch = bytecodePatch(
    name = "Comment menu rows",
    description = "Lets you pick which rows the menu a press and hold on a comment opens shows. " +
        "The rows are read from the menu itself as it opens, so nothing is fixed in the patch: " +
        "the list in the Pixkk Patches settings holds every row the menu has shown.",
) {
    category("Comments")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // The panel's one (List) sink: p0 is the panel, p1 the finished rows.
        CommentMenuListFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p1}, $EXTENSION->items(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
