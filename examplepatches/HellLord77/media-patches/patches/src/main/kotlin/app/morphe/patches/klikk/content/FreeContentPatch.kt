package app.morphe.patches.klikk.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikk.shared.Constants.COMPATIBILITY_KLIKK
import app.morphe.patches.klikk.shared.patches.models.videos.isPaidPatch
import app.morphe.patches.klikk.shared.patches.models.videos.isSubscribedPatch

@Suppress("unused")
val freeContentPatch = bytecodePatch(
    name = "Free content",
    description = "Mark all content as free.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKK)

    dependsOn(isPaidPatch, isSubscribedPatch)
}