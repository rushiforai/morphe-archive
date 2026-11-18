// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixgalleries

import app.edbfi.patches.rifisfun.RIF_IS_FUN
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.rifisfun.misc.requesthook.requestHookPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val fixGalleriesPatch =
    patch(
        name = "Fix galleries",
        description = "Fixes Reddit galleries and inline Reddit videos failing to load, including gallery images Reddit marks as failed.",
        default = true,
    ) {
        compatibleWith(RIF_IS_FUN)
        dependsOn(requestHookPatch)

        execute {
            checkGalleryRequest()
            extensionSwitch("Galleries").apply()
        }
    }

/**
 * Fails unless the app's gallery loader still asks `/api/info.json` for the gallery's post by its `t3_` name and parses
 * the reply as a listing of that post, the request and reply the extension's Galleries handler replaces.
 */
private fun checkGalleryRequest() {
    val loader = GalleryUrlFingerprint.matchSingle().originalMethod.definingClass
    GalleryPostNameFingerprint(loader).matchSingle()
    GalleryParserFingerprint(loader).matchSingle()
}
