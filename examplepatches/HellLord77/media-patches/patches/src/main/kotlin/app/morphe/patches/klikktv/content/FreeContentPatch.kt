package app.morphe.patches.klikktv.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikktv.shared.Constants.COMPATIBILITY_KLIKKTV
import app.morphe.patches.klikktv.shared.patches.model.videos.isPaidPatch
import app.morphe.patches.klikktv.shared.patches.model.videos.isSubscribedPatch

@Suppress("unused")
val freeContentPatch = bytecodePatch(
    name = "Free content",
    description = "Mark all content as free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKKTV)

    dependsOn(isPaidPatch, isSubscribedPatch)
}