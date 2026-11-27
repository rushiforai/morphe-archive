package app.syncit.patches.sync.comments

import app.morphe.patcher.Fingerprint

/**
 * Draws the header of a comment: author, time, score and the like.
 */
internal val commentHeaderFingerprint = Fingerprint(
    definingClass =
        "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/comments/CommentDescriptionTextView;",
    name = "G",
    returnType = "V",
    parameters = listOf("Lxa/d;", "Lya/c;", "Z"),
)
