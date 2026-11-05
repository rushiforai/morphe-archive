package semicoloncolonel.mobilestream.patches.whitehouse.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.filterJsRequests
import semicoloncolonel.mobilestream.patches.whitehouse.shared.Constants

// White House 47.7.8 loads each social feed from whitehouse.gov's own API,
// under /wp-json/whitehouse/v1/social/{feed}: truth, x, instagram, facebook,
// linkedin, and tiktok. The Wire comes from /wire, and the YouTube videos
// from /live, which the Live tab shares. The app's JavaScript requests go through a filter
// that sends the hidden feeds to an unreachable address, so they never load.
// The patch options choose which feeds are hidden.

private const val FEED_FILTER = "Lsemicoloncolonel/mobilestream/extension/whitehouse/FeedFilter;"

internal object HiddenFeedsFingerprint : Fingerprint(
    definingClass = FEED_FILTER,
    name = "hiddenFeeds",
    parameters = listOf(),
    returnType = "Ljava/lang/String;",
)

private val FEEDS = listOf(
    Triple("truth", "Truth Social", "Hide the Truth Social feed and Truth Social search."),
    Triple("x", "X", "Hide the X feed."),
    Triple("instagram", "Instagram", "Hide the Instagram feed."),
    Triple("facebook", "Facebook", "Hide the Facebook feed."),
    Triple("linkedin", "LinkedIn", "Hide the LinkedIn feed."),
    Triple("tiktok", "TikTok", "Hide the TikTok feed."),
    Triple("youtube", "YouTube", "Hide the YouTube feed. The Live tab's live streams and videos are hidden too, since they come from the same feed."),
    Triple("wire", "Wire", "Hide the Wire feed of White House posts and linked articles."),
)

@Suppress("unused")
val hideSocialFeedsPatch = bytecodePatch(
    name = "Hide social feeds",
    description = "Hides the social feeds you choose in the patch options.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    val options = FEEDS.map { (key, title, description) ->
        key to booleanOption(
            key = "hide_$key",
            default = true,
            title = title,
            description = description,
            required = true,
        )
    }

    execute {
        val hidden = options.filter { (_, option) -> option.value == true }.map { (key, _) -> key }
        if (hidden.isEmpty()) throw PatchException("Choose at least one feed to hide")

        HiddenFeedsFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "${hidden.joinToString(",")}"
                return-object v0
            """.trimIndent(),
        )

        filterJsRequests(FEED_FILTER)
    }
}
