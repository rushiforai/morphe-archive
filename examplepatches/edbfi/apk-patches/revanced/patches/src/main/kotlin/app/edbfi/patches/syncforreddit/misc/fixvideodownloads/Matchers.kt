// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixvideodownloads

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.custom
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType

/** `RedditVideoRequest` reads a v.redd.it DASH manifest into the video and audio URLs a download muxes. */
internal fun BytecodePatchContext.manifestParserMethod() = uniqueMethod("the DASH manifest parser", "DASH_audio", "AdaptationSet") {
    name("parseNetworkResponse")
    returnType("Lcom/android/volley/Response;")
    parameterTypes("Lcom/android/volley/NetworkResponse;")
    custom { isDeclaredIn(this, "RedditVideoRequest.java") }
}
