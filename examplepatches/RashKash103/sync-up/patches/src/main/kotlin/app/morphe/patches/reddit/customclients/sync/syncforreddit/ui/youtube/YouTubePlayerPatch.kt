package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/youtube/YouTubeFallback;"

/**
 * Stands in for a method whose whole job is to say what to do when the player would not start.
 *
 * <p>The body goes rather than being jumped over. Dead instructions left behind a return verify
 * on their own terms, and the ones here read fields and call into the player library for no
 * reason at all; taking them out is both smaller and the honest description of what is meant.
 */
private fun MutableMethod.standInWith(call: String) {
    removeInstructions(0, implementation!!.instructions.count())
    addInstructions(
        0,
        """
        invoke-static       { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$call
        return-void
        """,
    )
}

@Suppress("unused")
val youTubePlayerPatch = bytecodePatch(
    name = "Play a YouTube video where Sync's player cannot",
    description = "Plays the video in a web view when Sync's YouTube player fails to start, " +
            "which it now always does: the player asks the official YouTube app for a service " +
            "Google has removed. Covers the player in a link's sheet and the full screen one.",
    default = true,
) {
    category("2. Media")

    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // The sheet's player hid the frame it was going to draw in, so the video was simply
        // absent. The listener carries the frame, the id and the moment to start at.
        embeddedPlayerFailedFingerprint.method.standInWith("instead(Ljava/lang/Object;)V")

        // The full screen player put up the library's own offer to get or update the YouTube
        // app — which cannot help, since the service it wants is not in any version of it any
        // more — and then turned Sync's own YouTube link handling off.
        fullScreenPlayerFailedFingerprint.method
            .standInWith("insteadFullScreen(Landroid/app/Activity;)V")
    }
}
