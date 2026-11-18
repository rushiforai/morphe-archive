// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.api.fixmorecomments

import app.edbfi.patches.rifisfun.RIF_PACKAGE
import app.edbfi.patches.rifisfun.RIF_VERSION
import app.edbfi.patches.rifisfun.misc.extension.extensionSwitch
import app.edbfi.patches.rifisfun.misc.requesthook.requestHookPatch
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixMoreCommentsPatch =
    bytecodePatch(
        name = "Fix load more comments",
        description = "Fixes \"load more comments\" not loading further comments.",
    ) {
        compatibleWith(RIF_PACKAGE(RIF_VERSION))
        dependsOn(requestHookPatch)

        apply {
            checkMoreCommentsRequest()
            extensionSwitch("MoreComments").apply()
        }
    }
