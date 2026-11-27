package app.template.patches.redditsync.hideonlinecounter.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/other/LargeToolbarDescription;->J(II)V
 * — builds the subreddit toolbar's "<subscribers> members  <online> online" spannable text
 * from the two raw counts.
 */
val largeToolbarDescriptionSetCountsFingerprint = fingerprint {
    returns("V")
    parameters("I", "I")
    custom { method, classDef ->
        classDef.type ==
            "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/other/LargeToolbarDescription;" &&
            method.name == "J"
    }
}
