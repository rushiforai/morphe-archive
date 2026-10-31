package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.fab

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.returnEarly

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/fab/ExtraFabActions;"

private const val ATTACH_METHOD = "attach(Landroid/view/View;Ljava/lang/String;)V"

/** The feed's own floating button. */
private const val POSTS_FAB = "Lcom/laurencedawson/reddit_sync/ui/views/posts/PostsFab;"

@Suppress("unused")
val extraFabActionsPatch = bytecodePatch(
    name = "More actions on the floating button",
    description = "Puts up to four of Sync's own actions beside the feed's floating button.",
    default = true
) {
    dependsOn(sharedExtensionPatch, extraFabActionsSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // Where Sync settles what its own button is for, and the only place what the feed is
        // showing is handed to it. Injected at the top, since the parameters are reused as
        // scratch registers further down.
        Fingerprint(
            definingClass = POSTS_FAB,
            name = "Q",
            parameters = listOf("I", "Ljava/lang/String;"),
            returnType = "V",
        ).method.addInstructions(
            0,
            "invoke-static { p0, p2 }, $EXTENSION_CLASS_DESCRIPTOR->$ATTACH_METHOD"
        )
    }
}
