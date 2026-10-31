package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.notes

import app.morphe.patcher.Fingerprint

internal const val HEADER_BUILDER_CLASS = "Loc/c;"
internal const val POST_MODEL = "Lxa/d;"

/**
 * Builds the line under a comment's author, where its score, its age and Sync's own
 * "(last edited …)" go. Told apart from the one that does the same for a post by taking a second
 * model, the comment's parent.
 */
internal val commentHeaderFingerprint = Fingerprint(
    parameters = listOf(
        HEADER_BUILDER_CLASS,
        "Landroid/widget/TextView;",
        POST_MODEL,
        POST_MODEL,
        "Z",
    ),
    returnType = "V",
    strings = listOf(" (last edited "),
)

/**
 * Builds the line under a post's author, where its subreddit, score and age go. Told apart from
 * the one that does the same for a comment by taking the tab it is being drawn for rather than
 * a second model.
 */
internal val postHeaderFingerprint = Fingerprint(
    parameters = listOf(
        HEADER_BUILDER_CLASS,
        "Landroid/widget/TextView;",
        POST_MODEL,
        "I", "Z", "Z", "Z", "Z",
    ),
    returnType = "V",
    strings = listOf(" (last edited "),
)
