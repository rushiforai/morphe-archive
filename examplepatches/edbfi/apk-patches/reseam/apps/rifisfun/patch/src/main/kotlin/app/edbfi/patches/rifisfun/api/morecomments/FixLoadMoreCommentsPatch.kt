// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.api.morecomments

import app.edbfi.extension.rifisfun.reading.bindings.MoreComments
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.before
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points

// The comment-sort enum is obfuscated in 5.6.22. Both signatures below take that same enum.
private const val COMMENT_SORT = "n2.q"

private val requestArguments = method("morechildren request arguments") {
    strings("link_id", "api_type", "children", "sort")
    returns("java.util.ArrayList")
    params("com.andrewshu.android.reddit.things.objects.ThreadThing", Type.String, "[Ljava/lang/String;", COMMENT_SORT)
}

private val requestConstructor = method("morechildren loader constructor") {
    name("<init>")
    calls(requestArguments)
    params("android.app.Activity", "com.andrewshu.android.reddit.things.objects.CommentThing",
        "com.andrewshu.android.reddit.things.objects.ThreadThing", COMMENT_SORT)
}

private val sendRequest = requestConstructor.points("initialize morechildren request") {
    invokeDirect {
        name("<init>")
        params("android.content.Context", "android.net.Uri", "java.util.List")
    }
}.single().captureArgumentAs("endpoint", 2).captureArgumentAs("form", 3)

val fixLoadMoreComments = patch(RifPatchStrings.fixLoadMoreComments) {
    description(RifPatchStrings.fixLoadMoreCommentsDescription)
    compatibleWith(rifIsFun)
    execute {
        sendRequest.before {
            capture("endpoint").assign(MoreComments.withQuery(capture("endpoint"), capture("form")))
            capture("form").assign(nullObject)
        }
    }
}
