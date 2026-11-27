// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.video.youtube

import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.point

private const val RIF_PACKAGE = "com.andrewshu.android.reddit"
private const val OLD_ORIGIN = "https://www.youtube.com"

private val playerOptionsConstructor = method("YouTube iframe options constructor") {
    name("<init>")
    params()
    returns(Type.Void)
    strings("origin", OLD_ORIGIN, "enablejsapi", "iv_load_policy")
}

val fixYouTubePlayer = patch(RifPatchStrings.fixYoutubePlayer) {
    description(RifPatchStrings.fixYoutubePlayerDescription)
    compatibleWith(rifIsFun)

    execute {
        // This option supplies both the iframe origin and the local player's WebView base URL.
        playerOptionsConstructor.point { string(OLD_ORIGIN) }
            .captureAs("origin", Type.String)
            .after { capture("origin").assign(string("https://$RIF_PACKAGE")) }
    }
}
