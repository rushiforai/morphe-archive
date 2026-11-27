// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.layout.thumbnails

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.method
import app.reseam.patch.patch

internal val postThumbnail = method("Post thumbnail URL helper") {
    params("org.json.JSONObject")
    returns(Type.String)
    strings("thumbnail", "url", "thumbs.redditmedia.com")
}

val fixPostThumbnails = patch(SyncPatchStrings.fixPostThumbnails) {
    description(SyncPatchStrings.fixPostThumbnailsDescription)
    compatibleWith(syncForReddit)

    execute {
        postThumbnail.after {
            whenNotNull(result) {
                result.assign(
                    result.callVirtual(
                        "java.lang.String",
                        "replace",
                        "(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;",
                        string("&amp;"),
                        string("&"),
                    ),
                )
            }
        }
    }
}
