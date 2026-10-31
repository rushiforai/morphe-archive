package app.morphe.patches.reddit.customclients.sync.syncforreddit.http.undelete

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.notes.notesInTheHeaderPatch
import app.morphe.patcher.util.returnEarly

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/undelete/UndeleteRedditPatch;"

@Suppress("unused")
val undeleteRedditPatch = bytecodePatch(
    name = "Automatically undelete Reddit content",
    description = "Restores the text of removed posts and comments, and the names of deleted " +
            "authors, from Project Arctic Shift.",
    default = true
) {
    dependsOn(sharedExtensionPatch, interceptHttpRequests, notesInTheHeaderPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)
    }
}
