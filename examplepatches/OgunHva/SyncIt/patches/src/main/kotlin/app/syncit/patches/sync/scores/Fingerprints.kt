package app.syncit.patches.sync.scores

import app.morphe.patcher.Fingerprint

/**
 * Builds the statistics line of a post in a feed, score included.
 *
 * @see app.syncit.patches.sync.scores.scoreColorPatch
 */
internal val postStatsFingerprint = Fingerprint(
    definingClass = "Lq8/e;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lya/a;", "Loc/c;", "Lxa/d;", "Z"),
)

/**
 * Builds a comment's header, which includes the comment's own score.
 */
internal val commentScoreFingerprint = Fingerprint(
    definingClass = "Lq8/e;",
    name = "d",
    returnType = "V",
    parameters = listOf("Loc/c;", "Landroid/widget/TextView;", "Lxa/d;", "Lxa/d;", "Z"),
)

/**
 * Builds a post's header, which ends with the post's score and comment count.
 */
internal val postHeaderFingerprint = Fingerprint(
    definingClass = "Lq8/e;",
    name = "g",
    returnType = "V",
    parameters = listOf("Loc/c;", "Landroid/widget/TextView;", "Lxa/d;", "I", "Z", "Z", "Z", "Z"),
)
