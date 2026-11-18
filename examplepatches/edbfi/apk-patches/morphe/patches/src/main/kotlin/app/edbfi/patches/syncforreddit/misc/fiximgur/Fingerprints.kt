// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.fiximgur

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.SourceStringsFingerprint
import app.edbfi.patches.syncforreddit.declaredIn
import app.edbfi.patches.syncforreddit.misc.extension.EXTENSION
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The app's Imgur requests and the URL each holds: album and single image through the mirror, the upload, the upload
 * switch it checks first, and album previews in comments and posts through its image server. Each must still hold the
 * URL the extension answers.
 */
internal val imgurRequestFingerprints =
    mapOf(
        "ExternalGallery.java" to "https://images.syncforreddit.com/a/",
        "SingleImage.java" to "https://images.syncforreddit.com/image/",
        "UploadImgurRequest.java" to "https://imgur-apiv3.p.rapidapi.com/3/image",
        "CheckUploadStatusRequest.java" to
            "https://raw.githubusercontent.com/laurencedawson/reddit-sync-development/master/api/upload.json",
        "SpannableTextViewStringBuilder.java" to "https://ap.syncforreddit.com/image?url=imgur-album-",
    ).map { (sourceFile, url) -> SourceStringsFingerprint(sourceFile, url) }

/**
 * `ImgurImageHelper` turns one path segment of an Imgur link into the ID: it cuts at `#`, `?`, `&`, `.` and `-`, and
 * logs "Error: " if that fails.
 */
internal object ImgurIdFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("Error: "),
    custom = declaredIn("ImgurImageHelper.java") { it.hasFlags(AccessFlags.PRIVATE, AccessFlags.STATIC) },
)

/** The extension method the "Imgur client ID" option goes in. */
internal object ClientIdOptionFingerprint : Fingerprint(
    definingClass = "$EXTENSION/Imgur;",
    name = "clientId",
    returnType = "Ljava/lang/String;",
)
