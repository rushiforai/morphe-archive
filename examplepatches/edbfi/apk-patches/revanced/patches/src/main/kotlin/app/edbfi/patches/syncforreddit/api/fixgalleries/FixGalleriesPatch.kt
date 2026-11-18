// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixgalleries

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixGalleriesPatch =
    bytecodePatch(
        name = "Fix galleries",
        description = "Fixes Reddit galleries failing to open.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(volleyHookPatch)

        apply {
            checkGalleryRequest()
            enableInExtension("Galleries")
        }
    }
