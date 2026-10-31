package app.morphe.patches.reddit.customclients.sync.syncforreddit.http.comments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patcher.util.returnEarly

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/comments/PlayCommentVideoPatch;"

private const val VIDEO_ID_METHOD = "redditVideoId(Ljava/lang/String;)Ljava/lang/String;"

@Suppress("unused")
val playCommentVideoPatch = bytecodePatch(
    name = "Show videos posted in comments",
    description = "Draws a video posted in a comment in the comment, and plays it when tapped.",
    default = true
) {
    dependsOn(sharedExtensionPatch, interceptHttpRequests)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // Sync reads the id out of a Reddit video address by taking off the endings it knows,
        // and it does not know the ones Reddit uses now, so it reads the file as the video.
        // Everything it builds from that points nowhere, the playlist it plays included. Answer
        // with the id where the address is one of these, and leave Sync to its own reckoning
        // where it is not.
        videoIdFingerprint.method.addInstructionsWithLabels(
            0,
            """
            invoke-static       { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$VIDEO_ID_METHOD
            move-result-object  v0
            if-eqz              v0, :not_a_video
            return-object       v0
            """,
            ExternalLabel("not_a_video", videoIdFingerprint.method.getInstruction(0)),
        )
    }
}
