package app.morphe.patches.reddit.customclients.sync.syncforreddit.feed

import app.morphe.patcher.Fingerprint

private const val FEED_CLASS =
    "Lcom/laurencedawson/reddit_sync/ui/fragments/posts/VerticalPostsFragment;"

/**
 * Where the feed's place is written down as the screen is left behind. It is the only method of
 * the feed that takes nothing, returns nothing and names the key the place is kept under.
 */
internal val feedSavesOnStopFingerprint = Fingerprint(
    definingClass = FEED_CLASS,
    parameters = emptyList(),
    returnType = "V",
    strings = listOf("SyncRecyclerView"),
)

/** Where the feed's place is written down as the screen itself is taken apart. */
internal val feedSavesOnDestroyFingerprint = Fingerprint(
    definingClass = FEED_CLASS,
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    strings = listOf("Saving live posts state: ", "Saving cached posts state: "),
)

/**
 * Where a freshly loaded list of posts is handed to the feed, and where the place written down
 * earlier is given back to the list. Both of those are announced, which is what anchors this.
 */
internal val feedTakesCursorFingerprint = Fingerprint(
    definingClass = FEED_CLASS,
    parameters = listOf("Landroid/database/Cursor;"),
    returnType = "V",
    strings = listOf("Restoring stop instance", "Restoring destroy instance"),
)
