// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixotherdiscussions

import app.edbfi.patches.syncforreddit.SYNC_PACKAGE
import app.edbfi.patches.syncforreddit.SYNC_VERSION
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.edbfi.patches.syncforreddit.misc.extension.extensionPatch
import app.revanced.patcher.extensions.addInstructions
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.patch.PatchException
import app.revanced.patcher.patch.bytecodePatch

@Suppress("unused")
val fixOtherDiscussionsPatch =
    bytecodePatch(
        name = "Fix Other discussions",
        description = "Fixes \"Other discussions\" failing to load, by searching Reddit for the link instead.",
    ) {
        compatibleWith(SYNC_PACKAGE(SYNC_VERSION))
        dependsOn(extensionPatch)

        apply {
            // Reddit blocks the endpoints that list a link's posts (submit.json?url=, api/info?url=), but its search
            // still finds them with url:<link>. Turning the key into a search key lets the app's own search code build
            // the request: on oauth.reddit.com with the token, its sort, paging and NSFW setting, and a listing the
            // parser reads as it is. The listing keeps its "Other discussions" key and title.
            val method = postsUrlMethod()
            if (method.instructions.first().location.labels.isNotEmpty()) throw PatchException("${method.name} starts at a label")
            // The keys are p1 and p2, which may be above v15: only the range form reaches those.
            method.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION/OtherDiscussions;->asSearch(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                    invoke-static/range { p2 .. p2 }, $EXTENSION/OtherDiscussions;->asSearch(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p2
                """,
            )
        }
    }
