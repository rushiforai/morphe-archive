// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixtenor

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.imageclient.imageClientHookPatch
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixTenorPatch =
    bytecodePatch(
        name = "Fix Tenor previews",
        description = "Fixes previews of Tenor links in comments and posts staying blank.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(imageClientHookPatch)

        apply {
            checkTenorPreviews()
            enableInExtension("Tenor")
        }
    }
