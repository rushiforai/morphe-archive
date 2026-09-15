/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko gates this on its settings UI. Here it is always on.
 */

package app.ahmedyarub.patches.instagram.links

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val sanitizeShareLinksPatch = bytecodePatch(
    name = "Sanitize share links",
    description = "Removes tracking parameters from links shared out of the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(instagramExtensionPatch)

    execute {
        hookShareLinks("sanitizeUrl")
    }
}
