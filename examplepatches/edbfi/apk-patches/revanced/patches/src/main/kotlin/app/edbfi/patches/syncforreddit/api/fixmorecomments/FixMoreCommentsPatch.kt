// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixmorecomments

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixMoreCommentsPatch =
    bytecodePatch(
        name = "Fix View more comments",
        description = "Fixes \"View more\" not loading further comments.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(volleyHookPatch)

        apply {
            checkMoreCommentsRequest()
            enableInExtension("MoreComments")
        }
    }
