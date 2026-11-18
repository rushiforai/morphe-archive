// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.api.fixgalleries

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.patch.BytecodePatchContext

/** Fails unless the app's gallery request still asks the endpoint the extension answers. */
internal fun BytecodePatchContext.checkGalleryRequest() {
    uniqueMethod("the gallery request", "https://oauth.reddit.com/api/info.json?id=t3_") {
        custom { isDeclaredIn(this, "OAuthGalleryRequest.java") }
    }
}
