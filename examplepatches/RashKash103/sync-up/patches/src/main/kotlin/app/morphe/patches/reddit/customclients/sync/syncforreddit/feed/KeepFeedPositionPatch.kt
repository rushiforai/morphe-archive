package app.morphe.patches.reddit.customclients.sync.syncforreddit.feed

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/feed/FeedPosition;"

private const val REMEMBER_METHOD = "remember(Ljava/lang/Object;)V"

private const val REMEMBER_INTO_METHOD = "remember(Ljava/lang/Object;Landroid/os/Bundle;)V"

private const val BEFORE_METHOD = "before(Ljava/lang/Object;)V"

@Suppress("unused")
val keepFeedPositionPatch = bytecodePatch(
    name = "Keep your place in a feed",
    description = "Returns a feed to the post you were on rather than to the top, where posts " +
            "have been cleared out of the cache while you were reading.",
    default = true,
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // The fragment is handed over as it is, and what is wanted is read off it there rather
        // than taken out of registers here, since neither method keeps the list in one.
        //
        // Where the screen is being taken apart the bundle it is being saved into is handed over
        // as well. That is the one that comes back when the screen is rebuilt — which is how the
        // feed comes to be restored at all after a long read — and a note left anywhere else
        // would not survive with it.
        feedSavesOnStopFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$REMEMBER_METHOD",
        )

        feedSavesOnDestroyFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->$REMEMBER_INTO_METHOD",
        )

        // Where the new list of posts is taken on. The call goes at the very start, before
        // the old list is let go of, and arranges from there to put the feed back once the new
        // one is in place.
        //
        // Nothing is injected near the end of this method on purpose. It holds a single return
        // but several ways of reaching it — where the feed already had posts it jumps from the
        // middle straight to that return, which is every time but the first — and the branches
        // that skip the restore were retargeted onto anything placed in front of it.
        feedTakesCursorFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$BEFORE_METHOD",
        )
    }
}
