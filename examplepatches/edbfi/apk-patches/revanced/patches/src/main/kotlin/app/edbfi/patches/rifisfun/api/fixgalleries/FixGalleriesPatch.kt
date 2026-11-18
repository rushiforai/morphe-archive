// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixgalleries

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.rifisfun.misc.requesthook.requestHookPatch
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixGalleriesPatch =
    bytecodePatch(
        name = "Fix galleries",
        description = "Fixes Reddit galleries and inline Reddit videos failing to load, including gallery images Reddit marks as failed.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(requestHookPatch)

        apply {
            checkGalleryRequest()
            extensionSwitch("Galleries").apply()
        }
    }
