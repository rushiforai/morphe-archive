// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.layout.markdownlinks

import app.edbfi.extension.rifisfun.reading.bindings.MarkdownLinks
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.before
import app.reseam.patch.method
import app.reseam.patch.patch

private val collectBodyLinks = method("collect rendered Reddit body links") {
    params("java.util.ArrayList", "java.util.ArrayList", "android.text.Spannable")
    returns(Type.Void)
    calls { owner("com.andrewshu.android.reddit.comments.spans.RedditBodyLinkSpan"); name("<init>") }
    calls { owner("android.text.style.URLSpan"); name("getURL") }
}

val fixMarkdownLinks = patch(RifPatchStrings.fixMarkdownLinks) {
    description(RifPatchStrings.fixMarkdownLinksDescription)
    compatibleWith(rifIsFun)
    execute {
        collectBodyLinks.before { MarkdownLinks.linkify(param(2)) }
    }
}
