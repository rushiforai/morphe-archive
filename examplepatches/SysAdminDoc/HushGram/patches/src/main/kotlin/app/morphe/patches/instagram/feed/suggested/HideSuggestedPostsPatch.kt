/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.feed.suggested

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.feed.filterParsedFeedItems
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val PATCH = "Hide suggested posts"
internal const val SUGGESTIONS_FILTER =
    "$EXTENSION_PACKAGE/feed/FeedSuggestions;->filter(Ljava/lang/Object;)Ljava/lang/Object;"

/** The feed item kinds of suggested accounts, shops, hashtags and lists, which FeedSuggestions drops. */
internal val ACCOUNT_UNITS = listOf(
    "SUGGESTED_USERS", "SUGGESTED_TOP_ACCOUNTS", "SUGGESTED_PRODUCERS", "SUGGESTED_PRODUCERS_V2",
    "SUGGESTED_CLOSE_FRIENDS", "SUGGESTED_BUSINESSES", "SUGGESTED_SHOPS", "SUGGESTED_HASHTAGS",
    "SUGGESTED_SHAREABLE_LISTS", "FOLLOW_CHAIN_USERS", "TYA_SUGGESTIONS_IN_FEED_UNIT",
)

/** The kind of a single suggested post or reel ("explore_story" in the feed's JSON). */
internal const val SUGGESTED_POST = "EXPLORE_STORY"

/** Threads' units: its posts, and the accounts, communities, live chats and game threads it suggests. */
internal val THREADS_UNITS = listOf(
    "THREADS_IN_FEED_UNIT", "TIFU_IN_EXPLORE", "EOF_TIFU", "KICKSTART_FEED_UNIT",
    "COMMUNITIES_IN_FEED_UNIT", "SMSL_IN_FEED_UNIT", "LIVE_CHAT_IN_FEED_UNIT", "SPORT_GAME_IN_FEED_UNIT",
)

@Suppress("unused")
val hideSuggestedPostsPatch = bytecodePatch(
    name = "Hide suggested posts",
    description = "Removes the posts and reels from accounts you don't follow that Instagram puts in your home feed " +
        "as Suggested for you, the rows of accounts, shops and hashtags it suggests you follow, and the posts " +
        "and accounts from Threads it mixes in. Each has its own switch. Posts from accounts you follow stay.",
) {
    category("Feed")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        filterSuggestedFeedItems()
        endEmptiedFeed(findFeedEnd())
        endFollowingAtItsCard()
        enableStatus("feedSuggestions")
    }
}

/**
 * Passes each feed item Instagram's static parse helper answers through FeedSuggestions. On 449
 * that helper reads the home feed's page loads and its cache of recommended posts, and not
 * Explore's grid.
 */
internal fun BytecodePatchContext.filterSuggestedFeedItems() =
    filterParsedFeedItems(PATCH, SUGGESTIONS_FILTER, ACCOUNT_UNITS + SUGGESTED_POST + THREADS_UNITS)
