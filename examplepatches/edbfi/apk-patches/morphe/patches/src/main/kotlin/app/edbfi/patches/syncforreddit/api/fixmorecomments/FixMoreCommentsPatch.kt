// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixmorecomments

import app.edbfi.patches.syncforreddit.SYNC_FOR_REDDIT
import app.edbfi.patches.syncforreddit.misc.extension.enableInExtension
import app.edbfi.patches.syncforreddit.misc.volley.volleyHookPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.matchSingle

@Suppress("unused")
val fixMoreCommentsPatch =
    patch(
        name = "Fix View more comments",
        description = "Fixes \"View more\" not loading further comments.",
        default = true,
    ) {
        compatibleWith(SYNC_FOR_REDDIT)
        dependsOn(volleyHookPatch)

        execute {
            MoreCommentsRequestFingerprint.matchSingle()
            enableInExtension("MoreComments")
        }
    }
