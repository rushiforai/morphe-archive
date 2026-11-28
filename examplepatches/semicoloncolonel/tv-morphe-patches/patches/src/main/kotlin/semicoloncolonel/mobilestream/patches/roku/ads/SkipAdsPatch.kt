package semicoloncolonel.mobilestream.patches.roku.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.roku.shared.Constants

private const val SCRIPT_NAME = "ms-no-ads.js"
private const val SCRIPT_TAG = "<script type='text/javascript' src='$SCRIPT_NAME'></script>"

// The Roku Channel (Android TV) inserts every ad on the client. The web app
// posts to /api/v3/playback, and the JSON reply carries an adPolicy (VAST URLs
// for the bumper, pre-roll, and mid-rolls) plus the mid-roll break times. The
// player then asks saaf.sr.roku.com for each pod. The app's own ad-free shape
// is { noAds: true, adBreaks: [] }, which makes getAdBreaks() return nothing.
//
// The web app itself is downloaded at launch, so it cannot be patched in the
// APK. The local index.html loads first, though, and a script placed before
// the loader wraps fetch and XMLHttpRequest. The wrapper rewrites only the
// playback reply: it swaps adPolicy for the ad-free shape and clears
// playbackMedia.adBreaks. The stream URL and DRM are unchanged.
@Suppress("unused")
val skipAdsPatch = resourcePatch(
    name = "Skip ads",
    description = "Removes the Roku bumper, pre-roll, and mid-roll ads from videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val script = object {}.javaClass.classLoader.getResourceAsStream("roku/no-ads.js")
            ?: throw PatchException("roku/no-ads.js is missing from the patches")
        get("assets/www/$SCRIPT_NAME").writeBytes(script.use { it.readBytes() })

        val index = get("assets/www/index.html")
        if (!index.exists()) throw PatchException("assets/www/index.html not found")
        val html = index.readText()
        if (SCRIPT_TAG in html) return@execute
        // Before _resources.js, the first local script, so the wrapper is in
        // place before the loader downloads the web app.
        val anchor = "<script type='text/javascript' src='_resources.js'></script>"
        if (anchor !in html) throw PatchException("The _resources.js script tag was not found in index.html")
        index.writeText(html.replace(anchor, "$SCRIPT_TAG\n        $anchor"))
    }
}
