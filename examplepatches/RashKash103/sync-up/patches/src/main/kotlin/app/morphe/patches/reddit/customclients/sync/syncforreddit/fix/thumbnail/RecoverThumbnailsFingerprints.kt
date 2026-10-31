package app.morphe.patches.reddit.customclients.sync.syncforreddit.fix.thumbnail

import app.morphe.patcher.Fingerprint

internal const val POST_MODEL = "Lxa/d;"

/**
 * Binds a post to the thumbnail shown beside it in a feed, and is handed the post itself, which
 * is the only place the preview address and the link it was made from are both in reach.
 */
internal val postThumbnailBindFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/posts/simple/PostThumbnailView;",
    parameters = listOf(POST_MODEL),
    returnType = "V",
)

/**
 * Binds a post to the larger image a card shows, which is a different view from the thumbnail
 * beside a compact post and takes the post from a field rather than a parameter. Identified by
 * the two traces it leaves while working out how tall the image should be.
 */
internal val cardMediaBindFingerprint = Fingerprint(
    strings = listOf("Calculated: ", "Calculated 2: "),
)
