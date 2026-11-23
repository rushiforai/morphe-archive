package app.ffn.patches.network

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.ffn.patches.shared.enableRequestFeature
import app.ffn.patches.shared.requestHooksPatch
import app.morphe.patcher.patch.patch

@Suppress("unused")
val mergeDuplicateRequestsPatch = patch(
    name = "Merge duplicate requests",
    description = "Sends identical API requests that are in flight at the same time only once, " +
        "and shares the response. The server answers one request at a time, so every duplicate removed " +
        "makes the rest of the app respond sooner.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    dependsOn(requestHooksPatch)

    execute {
        enableRequestFeature("isMergeEnabled")
    }
}
