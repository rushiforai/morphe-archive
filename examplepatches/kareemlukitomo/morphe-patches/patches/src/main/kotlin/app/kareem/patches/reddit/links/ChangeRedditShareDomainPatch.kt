package app.kareem.patches.reddit.links

import app.kareem.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.kareem.patches.shared.replaceStringLiterals
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val CUSTOM_DOMAIN = "https://redlib.kareem.one"

private val REDDIT_SHARE_REPLACEMENTS =
    linkedMapOf(
        "https://www.reddit.com" to CUSTOM_DOMAIN,
        "https://www.reddit.com/" to "$CUSTOM_DOMAIN/",
        "https://www.reddit.com/r/" to "$CUSTOM_DOMAIN/r/",
        "https://www.reddit.com/u/" to "$CUSTOM_DOMAIN/u/",
        "https://www.reddit.com/user/" to "$CUSTOM_DOMAIN/user/",
        "https://www.reddit.com/u/{username}/comments" to "$CUSTOM_DOMAIN/u/{username}/comments",
        "https://www.reddit.com/user/{username}/comments" to "$CUSTOM_DOMAIN/user/{username}/comments",
        "https://reddit.com" to CUSTOM_DOMAIN,
        "https://reddit.com/" to "$CUSTOM_DOMAIN/",
        "https://reddit.com/r/" to "$CUSTOM_DOMAIN/r/",
        "https://reddit.com/u/" to "$CUSTOM_DOMAIN/u/",
        "https://reddit.com/user/" to "$CUSTOM_DOMAIN/user/",
        "https://reddit.com/u/{username}/comments" to "$CUSTOM_DOMAIN/u/{username}/comments",
        "https://reddit.com/user/{username}/comments" to "$CUSTOM_DOMAIN/user/{username}/comments",
        "https://reddit.com%s" to "$CUSTOM_DOMAIN%s",
        "https://www.reddit.com/comments/{link_id}" to "$CUSTOM_DOMAIN/comments/{link_id}",
        "https://www.reddit.com/comments/{link_id}/" to "$CUSTOM_DOMAIN/comments/{link_id}/",
        "https://www.reddit.com/comments/{link_id}/{title}" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}",
        "https://www.reddit.com/comments/{link_id}/{title}/" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/",
        "https://www.reddit.com/comments/{link_id}/{title}/{comment}" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/{comment}",
        "https://www.reddit.com/comments/{link_id}/{title}/{comment}/" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/{comment}/",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}",
        "https://www.reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}/",
        "https://reddit.com/comments/{link_id}" to "$CUSTOM_DOMAIN/comments/{link_id}",
        "https://reddit.com/comments/{link_id}/" to "$CUSTOM_DOMAIN/comments/{link_id}/",
        "https://reddit.com/comments/{link_id}/{title}" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}",
        "https://reddit.com/comments/{link_id}/{title}/" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/",
        "https://reddit.com/comments/{link_id}/{title}/{comment}" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/{comment}",
        "https://reddit.com/comments/{link_id}/{title}/{comment}/" to "$CUSTOM_DOMAIN/comments/{link_id}/{title}/{comment}/",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}",
        "https://reddit.com/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}/" to "$CUSTOM_DOMAIN/{prefix}/{subreddit_name}/comments/{link_id}/{title}/{comment}/",
        "https://redd.it/{link_id}" to "$CUSTOM_DOMAIN/comments/{link_id}",
        "https://reddit.com/tb/{link_id}" to "$CUSTOM_DOMAIN/tb/{link_id}",
    )

@Suppress("unused")
val changeRedditShareDomainPatch =
    bytecodePatch(
        name = "Change Reddit share domain",
        description = "Rewrites generated Reddit share links to redlib.kareem.one.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)

        execute {
            val replacementCount = replaceStringLiterals(REDDIT_SHARE_REPLACEMENTS)
            if (replacementCount == 0) {
                throw PatchException("Could not rewrite any Reddit share-link strings")
            }
        }
    }
