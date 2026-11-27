// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.layout.replyeditor

import app.edbfi.extension.rifisfun.reading.bindings.ReplyEditor
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.after
import app.reseam.patch.method
import app.reseam.patch.patch

val keepTypedTextInView = patch(RifPatchStrings.keepTypedTextInView) {
    description(RifPatchStrings.keepTypedTextInViewDescription)
    compatibleWith(rifIsFun)
    execute {
        val editorId = checkNotNull(resources.id("id", "reply_body"))
        val maximumLengthId = checkNotNull(resources.id("integer", "comment_markdown_max_length"))
        val replyView = method("inflate reply dialog") {
            params("android.view.LayoutInflater", "android.view.ViewGroup", "android.os.Bundle")
            returns("android.view.View")
            literals(maximumLengthId.toLong())
            calls {
                owner("com.andrewshu.android.reddit.comments.reply.MarkdownButtonBarView")
                name("setTargetEditText")
            }
        }
        replyView.after { ReplyEditor.watch(result, int(editorId.toInt())) }
    }
}
