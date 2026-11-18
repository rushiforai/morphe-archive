// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixmorecomments

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.patch.BytecodePatchContext

/** Fails unless the app's "View more" request still posts to the endpoint the extension answers. */
internal fun BytecodePatchContext.checkMoreCommentsRequest() {
    uniqueMethod("the more-comments request", "api/morechildren?always_show_media=1&profile_img=true") {
        custom { isDeclaredIn(this, "OAuthCommentsMoreRequest.java") }
    }
}
