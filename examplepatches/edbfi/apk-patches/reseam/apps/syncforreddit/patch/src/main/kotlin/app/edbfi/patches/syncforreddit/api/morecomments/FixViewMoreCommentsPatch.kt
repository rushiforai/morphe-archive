// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.morecomments

import app.edbfi.extension.syncforreddit.comments.bindings.CommentRequest
import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.addMethod
import app.reseam.patch.classTarget
import app.reseam.patch.method
import app.reseam.patch.patch

private val requestConstructor = method("More comments request constructor") {
    name("<init>")
    strings("api/morechildren?always_show_media=1&profile_img=true", "link_id", "children", "api_type")
}

private val requestClass = classTarget("More comments request") {
    requestConstructor.method.classDef
}

val fixViewMoreComments = patch(SyncPatchStrings.fixViewMoreComments) {
    description(SyncPatchStrings.fixViewMoreCommentsDescription)
    compatibleWith(syncForReddit)

    execute {
        val request = requestClass.classDef
        val parent = checkNotNull(request.superclass)
        check(request.method("getMethod", "()I") == null)
        check(request.method("getUrl", "()Ljava/lang/String;") == null)

        requestClass.addMethod("getMethod", "()I") {
            returnValue(int(0))
        }
        requestClass.addMethod("getUrl", "()Ljava/lang/String;") {
            val url = thisObject.callSuper(parent, "getUrl", "()Ljava/lang/String;")
            val params = thisObject.callSuper(parent, "getParams", "()Ljava/util/Map;")
            returnValue(CommentRequest.withQuery(url, params))
        }
    }
}
