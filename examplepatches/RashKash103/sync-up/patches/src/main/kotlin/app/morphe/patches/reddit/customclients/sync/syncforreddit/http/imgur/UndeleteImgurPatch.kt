package app.morphe.patches.reddit.customclients.sync.syncforreddit.http.imgur

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patcher.util.returnEarly

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/imgur/UndeleteImgurPatch;"

@Suppress("unused")
val undeleteImgurPatch = bytecodePatch(
    name = "Automatically undelete Imgur media",
    description = "Loads Imgur images and videos that no longer exist from the Wayback Machine.",
    default = true
) {
    dependsOn(sharedExtensionPatch, interceptHttpRequests)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)
    }
}
