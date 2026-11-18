// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixtenor

import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.imageclient.imageClientHookPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val fixTenorPatch =
    patch(
        name = "Fix Tenor previews",
        description = "Fixes previews of Tenor links in comments and posts staying blank.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(imageClientHookPatch)

        execute {
            TenorPreviewFingerprint.matchSingle()
            WebsitePreviewUrlFingerprint.matchSingle()
            enableInExtension("Tenor")
        }
    }
