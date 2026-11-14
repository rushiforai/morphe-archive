package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui

/**
 * The actions Sync will actually carry out, by the number it knows each one by.
 *
 * Read from the jump table that answers what an action is called, not from the order the names
 * appear in the code, which is the reverse of it.
 *
 * Two of the numbers are missing on purpose. What carries an action out is a run of comparisons,
 * and it compares against every number but 0 and 14 — Hide read, which the floating button does
 * by itself, and Sort, which has a name and an icon and a place in Sync's own list but is never
 * dispatched and so does nothing at all.
 *
 * Shared by everything of ours that offers one of these, so that the numbers are written down
 * once: the floating button's extra actions and the navigation bar's buttons both store the
 * number from here, and a list that disagreed with Sync's own would carry out the wrong action
 * rather than fail.
 */
internal val SYNC_ACTIONS = listOf(
    1 to "Saved", 2 to "Profile", 3 to "Submit", 4 to "Change view", 5 to "Random",
    6 to "Random NSFW", 7 to "Dark mode", 8 to "Friends", 9 to "Settings", 10 to "Data saving",
    11 to "Filters", 12 to "Recents", 13 to "Toggle account", 15 to "Refresh", 16 to "About",
    17 to "Sync", 18 to "Search", 19 to "Watched", 20 to "Swipe mode", 21 to "Inbox",
    22 to "Explore", 23 to "Dark overlay", 24 to "Scroll to top",
)
