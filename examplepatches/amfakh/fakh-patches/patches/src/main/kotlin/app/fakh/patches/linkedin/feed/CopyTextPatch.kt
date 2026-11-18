package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.markIncluded
import app.morphe.patcher.patch.patch

@Suppress("unused")
val copyTextPatch = patch(
    name = "Copy text",
    description = "Adds Copy text to the ⋯ menu of posts and comments. Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")

    dependsOn(postMenuPatch)

    execute {
        markIncluded("isCopyTextIncluded")
    }
}
