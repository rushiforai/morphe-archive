// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixtenor

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.patch.BytecodePatchContext

/**
 * Fails unless the app still loads Tenor links' previews in comments and posts through the URL `ImageServer` answers:
 * `SpannableTextViewStringBuilder` asks `WebsitePreviewHelper` for it.
 */
internal fun BytecodePatchContext.checkTenorPreviews() {
    uniqueMethod("the Tenor link preview in SpannableTextViewStringBuilder", "tenor.com") {
        custom { isDeclaredIn(this, "SpannableTextViewStringBuilder.java") }
    }
    uniqueMethod("the image server URL in WebsitePreviewHelper", "https://ap.syncforreddit.com/image?url=") {
        custom { isDeclaredIn(this, "WebsitePreviewHelper.java") }
    }
}
