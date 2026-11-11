package app.template.patches.reddit.filters

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.reddit.shared.injectListingChildrenFilter

/**
 * Hide live streams — Reddit (com.reddit.frontpage)
 *
 * Drops live/broadcast post rows. Detection is conservative: a non-empty
 * websocket playback URL, a live update/thread GraphQL typename, or a
 * `/live/` permalink. Regular posts whose title merely mentions "live" are
 * kept. Off by default.
 */
@Suppress("unused")
val redditHideLiveStreamsPatch = bytecodePatch(
    name = "Hide live streams",
    description = "Hides live streams and broadcasts in feeds and listings. " +
        "Client-side only; off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        injectListingChildrenFilter(
            helperMethod = "hideLiveStreams",
            logTag = "Hide live streams",
        )
    }
}
