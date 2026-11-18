// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.fixvideodownloads

import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint

/** `RedditVideoRequest` reads a v.redd.it DASH manifest into the video and audio URLs a download muxes. */
internal object ManifestParserFingerprint : Fingerprint(
    name = "parseNetworkResponse",
    returnType = "Lcom/android/volley/Response;",
    parameters = listOf("Lcom/android/volley/NetworkResponse;"),
    strings = listOf("DASH_audio", "AdaptationSet"),
    custom = declaredIn("RedditVideoRequest.java"),
)
