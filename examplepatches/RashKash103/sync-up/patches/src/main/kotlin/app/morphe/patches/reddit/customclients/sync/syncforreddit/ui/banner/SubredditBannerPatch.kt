package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.banner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.reddit.customclients.sync.syncforreddit.http.interceptHttpRequests
import app.morphe.patcher.util.returnEarly

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/banner/SubredditBannerPatch;"

private const val STORE_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/banner/SubredditBanners;"

private const val ATTACH_METHOD = "attach(Landroid/view/View;)V"

private const val SHOWING_METHOD = "showing(Ljava/lang/String;)V"

/** The feed's own floating button, which is handed what the feed is about. */
private const val POSTS_FAB = "Lcom/laurencedawson/reddit_sync/ui/views/posts/PostsFab;"

/** The feed itself. */
private const val POSTS_FRAGMENT =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/posts/BasePostsFragment;"

@Suppress("unused")
val subredditBannerPatch = bytecodePatch(
    name = "Show a subreddit's banner on its feed",
    description = "Draws the banner a subreddit sets at the top of its posts, rather than only " +
            "on its About page.",
    default = true
) {
    dependsOn(sharedExtensionPatch, interceptHttpRequests, subredditBannerSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        // What the feed is about, taken where Sync hands it to its own button: every accessor
        // on the fragment itself is obfuscated, and this one is a plain parameter.
        Fingerprint(
            definingClass = POSTS_FAB,
            name = "Q",
            parameters = listOf("I", "Ljava/lang/String;"),
            returnType = "V",
        ).method.addInstructions(
            0,
            "invoke-static { p2 }, $STORE_CLASS_DESCRIPTOR->$SHOWING_METHOD"
        )

        // Where the feed's own view exists to put a strip above.
        Fingerprint(
            definingClass = POSTS_FRAGMENT,
            name = "o2",
            parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
            returnType = "V",
        ).method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->$ATTACH_METHOD"
        )
    }
}
