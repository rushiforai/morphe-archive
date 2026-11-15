package app.southstar21.patches.instagram.layout.consciousgate

import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.misc.extension.markPatchIncluded
import app.southstar21.patches.instagram.misc.extension.sharedExtensionPatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/consciousgate/ConsciousGatePatch;"

@Suppress("unused")
val consciousGatePatch = bytecodePatch(
    name = "Conscious gate",
    description = "Gives the home feed, Reels, Explore and stories a daily time budget. In the last 15 seconds they frost over and can only be scrolled, " +
            "then a gate closes them until the next day. Searching for people, messages and profiles keep working. " +
            "Off until you switch it on in the settings.",
    default = false
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    // The extension finds the home feed by its class name and runs from the shared
    // main activity hook, so no other hooks are needed.
    dependsOn(sharedExtensionPatch)

    execute {
        markPatchIncluded(EXTENSION_CLASS)
    }
}
