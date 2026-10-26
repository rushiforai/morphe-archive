/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.misc.commenttools

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions

private const val EXTENSION = "Lapp/pixkk/extension/comment/CommentMenuCenter;"

/** The menu fragment's own `onViewCreated`, which keeps its framework name. */
internal object CommentMenuViewCreatedFingerprint : Fingerprint(
    definingClass = COMMENT_MENU_PANEL,
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

@Suppress("unused")
val commentMenuCenterPatch = bytecodePatch(
    name = "Centered comment menu",
    description = "Shows the menu a press and hold on a comment opens as a window in the middle " +
        "of the screen, as it used to be, instead of a sheet along the bottom.",
) {
    category("Comments")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // p0 is the fragment, p1 the view it has just made, before it is on screen.
        CommentMenuViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p1}, $EXTENSION->prepare(Ljava/lang/Object;Landroid/view/View;)V",
        )

        // The panel's one (List) sink runs as the rows arrive, once the sheet is on screen.
        CommentMenuListFingerprint.method.addInstructions(
            0,
            "invoke-static/range {p0 .. p0}, $EXTENSION->apply(Ljava/lang/Object;)V",
        )
    }
}
