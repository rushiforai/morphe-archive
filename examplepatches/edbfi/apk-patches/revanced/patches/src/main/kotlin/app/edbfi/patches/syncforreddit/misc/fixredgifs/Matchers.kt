// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixredgifs

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext

/** The three Volley requests the app makes to Redgifs, in order, and the URL each holds. */
private val REDGIFS_REQUESTS =
    mapOf(
        "OAuthRedgifTokenRequest.java" to "https://api.redgifs.com/v2/oauth/client",
        "GrabIpRequest.java" to "https://api.redgifs.com/info",
        "GrabRedgifRequest.java" to "https://api.redgifs.com/v2/gifs/",
    )

/** Fails unless each of the app's Redgifs requests still holds the URL the extension answers. */
internal fun BytecodePatchContext.checkRedgifsRequests() {
    REDGIFS_REQUESTS.forEach { (sourceFile, url) ->
        uniqueMethod("the Redgifs request in $sourceFile", url) {
            custom { isDeclaredIn(this, sourceFile) }
        }
    }
}

/** Fails unless Enhanced autoplay still plays Redgifs through the URL the extension resolves. */
internal fun BytecodePatchContext.checkAutoplayUrl() {
    uniqueMethod("Enhanced autoplay's Redgifs URL", "https://ap.syncforreddit.com/image?url=redgifs-") {
        custom { isDeclaredIn(this, "SimpleExoPlayerTextureView.java") }
    }
}

/** `ExoplayerFactorySingleton`'s constructor builds the video sources every player in the app reads from. */
internal fun BytecodePatchContext.videoSourcesMethod() = uniqueMethod("the video sources in ExoplayerFactorySingleton") {
    name("<init>")
    parameterTypes()
    custom { isDeclaredIn(this, "ExoplayerFactorySingleton.java") }
}
