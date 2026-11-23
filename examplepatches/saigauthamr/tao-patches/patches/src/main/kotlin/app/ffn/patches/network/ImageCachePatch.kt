package app.ffn.patches.network

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.ffn.patches.shared.enableRequestFeature
import app.ffn.patches.shared.requestHooksPatch
import app.morphe.patcher.patch.patch

@Suppress("unused")
val imageCachePatch = patch(
    name = "Cache images",
    description = "Keeps story covers and avatars on the device for 7 days instead of downloading them " +
        "again every time they are shown. Images use the same one-at-a-time server queue as everything else, " +
        "so this also makes stories and lists load sooner.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    dependsOn(requestHooksPatch)

    execute {
        enableRequestFeature("isImageCacheEnabled")
    }
}
