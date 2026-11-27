// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.otherdiscussions

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.method
import app.reseam.patch.patch

private const val SEEN_PREFIX = "seen###"

private val isDiscussion = method("Other discussions listing key check") {
    strings(SEEN_PREFIX)
    params(Type.String)
    returns(Type.Boolean)
    flags(AccessFlags.STATIC)
}

private val postsUrl = method("Posts request URL builder") {
    strings("submit.json?url=", "search.json?q=")
    paramCount(6)
    param(1, Type.String)
    param(2, Type.String)
    returns(Type.String)
    flags(AccessFlags.STATIC)
    calls(isDiscussion)
}

val fixOtherDiscussions = patch(SyncPatchStrings.fixOtherDiscussions) {
    description(SyncPatchStrings.fixOtherDiscussionsDescription)
    compatibleWith(syncForReddit)

    execute {
        postsUrl.method
        isDiscussion.method
        // Keep the stock title and listing controls. Convert the two keys only inside the request builder.
        postsUrl.before {
            for (index in 1..2) {
                val key = param(index)
                whenTrue(call(isDiscussion, key)) {
                    val link = key.callVirtual(Type.String, "substring", "(I)Ljava/lang/String;", int(SEEN_PREFIX.length))
                    whenFalse(link.callVirtual(Type.String, "isEmpty", "()Z")) {
                        key.assign(string("search######url%3A").callVirtual(
                            Type.String, "concat", "(Ljava/lang/String;)Ljava/lang/String;", link,
                        ))
                    }
                }
            }
        }
    }
}
