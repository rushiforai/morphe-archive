// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixgalleries

import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val fixGalleriesPatch =
    patch(
        name = "Fix galleries",
        description = "Fixes Reddit galleries failing to open.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(volleyHookPatch)

        execute {
            GalleryRequestFingerprint.matchSingle()
            enableInExtension("Galleries")
        }
    }
