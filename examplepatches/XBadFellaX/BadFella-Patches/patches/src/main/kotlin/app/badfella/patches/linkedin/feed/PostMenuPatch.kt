package app.badfella.patches.linkedin.feed

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val postMenuPatch = bytecodePatch(
    name = "Post menu items",
    description = "Adds Copy text, Download photos and videos, and Save document as PDF to the ⋯ menu of posts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    // The menu is edited and the posts are remembered in the SDUI component hook.
    dependsOn(sduiComponentFilterPatch)

    execute { markIncluded("isPostMenuIncluded") }
}
