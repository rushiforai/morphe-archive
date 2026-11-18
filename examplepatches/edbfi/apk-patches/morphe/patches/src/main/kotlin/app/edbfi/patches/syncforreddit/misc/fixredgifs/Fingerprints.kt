// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.fixredgifs

import app.edbfi.patches.syncforreddit.SourceStringsFingerprint
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint

/** The three Volley requests the app makes to Redgifs, in order, each of which must still hold the URL the extension answers. */
internal val redgifsRequestFingerprints =
    mapOf(
        "OAuthRedgifTokenRequest.java" to "https://api.redgifs.com/v2/oauth/client",
        "GrabIpRequest.java" to "https://api.redgifs.com/info",
        "GrabRedgifRequest.java" to "https://api.redgifs.com/v2/gifs/",
    ).map { (sourceFile, url) -> SourceStringsFingerprint(sourceFile, url) }

/** Enhanced autoplay, which must still play Redgifs through the URL the extension resolves. */
internal object AutoplayUrlFingerprint :
    SourceStringsFingerprint("SimpleExoPlayerTextureView.java", "https://ap.syncforreddit.com/image?url=redgifs-")

/** `ExoplayerFactorySingleton`'s constructor builds the video sources every player in the app reads from. */
internal object VideoSourcesFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf(),
    custom = declaredIn("ExoplayerFactorySingleton.java"),
)
