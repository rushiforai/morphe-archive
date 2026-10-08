/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.Fixtures
import app.morphe.RepoFiles
import app.morphe.patches.facebook.feed.reels.categoryNames
import app.morphe.patches.facebook.shared.FEED_STORY_CATEGORY
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The type names the feed filter goes by for kinds with no model class on every build, still known to
 * every Facebook build the bundle declares: Memories, friend requests and friends' locations, the
 * promotions and prompts the suggested posts switch takes by name, and the multi-ad carousel.
 *
 * Most of these kinds have no model class of their own. A served unit comes as a shared model, and a
 * tag the model has no case for answers `getTypeName()` from the tree (`BaseModel` hands it to
 * native code), which is the GraphQL type name. Facebook reads that name into a type tag through a
 * `(String, ...)I` table, so a name still in that table is one the feed can still serve. A name a
 * shared model answers with a literal of its own counts too: on 581 friend requests left the table,
 * and `LX/40I;->getTypeName()` answers it (read 2026-10-06, the table is `LX/2Y0`). The names match
 * FeedFilter's MEMORIES_TYPES, FRIEND_REQUESTS_TYPE, FRIENDS_LOCATIONS_TYPE, SUGGESTED_TYPES and
 * MULTI_ADS_TYPE. SuggestedShowsFeedUnit is in the table on all three (581 `LX/2Y0;->A1d`, 580
 * `LX/2OO;->A1e`, 577 `LX/2Oi;->A1j`, read 2026-10-07).
 *
 * The story categories the "Suggested for you" switch takes, FeedFilter's SUGGESTED_CATEGORIES, are
 * held the same way: each declared build's GraphQLFeedStoryCategory still builds them.
 */
class FeedKindTypeNamesFixtureTest {
    private val names = listOf(
        "ThrowbackPromotionFeedUnit", "ThrowbackSectionHeaderFeedUnit", "ThrowbackPermalinkStoryFeedUnit",
        "GoodwillThrowbackFeedUnit", "FriendRequestsFeedUnit", "FriendsLocationsFeedUnit",
        "ClientTriggeredQPFeedUnit", "VibesRifuQuickPromotionFeedUnit", "SocialListPromptFeedUnit",
        "PaginatedGroupsPeopleYouMayInviteFeedUnit", "SuggestedShowsFeedUnit", "FBMultiAdsFeedUnit",
    )

    /** FeedFilter.SUGGESTED_CATEGORIES, read from its source so the two can't drift apart. */
    private val suggestedCategories: List<String> by lazy {
        val filter = File(RepoFiles.root, "extensions/facebook/src/main/java/app/morphe/extension/facebook/feed/FeedFilter.java")
        val array = Regex("""SUGGESTED_CATEGORIES\s*=\s*\{([^}]*)\}""").find(filter.readText())
            ?: throw AssertionError("FeedFilter.java has no SUGGESTED_CATEGORIES array")
        Regex(""""([A-Z_]+)"""").findAll(array.groupValues[1]).map { it.groupValues[1] }.toList()
    }

    private fun isTagTable(method: Method) =
        method.returnType == "I" && method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;"

    private fun isTypeName(method: Method) =
        method.name == "getTypeName" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;"

    @Test
    fun `every declared build still knows each kind's type name`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                for (name in names) {
                    val readers = FixtureDex.classesHolding(bundle, name).flatMap { it.methods }.filter { method ->
                        holdsString(method, name) && (isTagTable(method) || isTypeName(method))
                    }
                    assertTrue("${bundle.name}: neither a type table nor a getTypeName() reads $name", readers.isNotEmpty())
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `every declared build still builds the suggested story categories`() {
        assertEquals(listOf("INJECTED_STORY", "TRENDING"), suggestedCategories)
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val category = FixtureDex.classes(bundle, setOf(FEED_STORY_CATEGORY))[FEED_STORY_CATEGORY]
                    ?: throw AssertionError("${bundle.name} has no GraphQLFeedStoryCategory")
                val names = categoryNames(category)
                // The control: the categories the other feed rules match are read the same way.
                assertTrue("${bundle.name}: ${names.size} names", names.containsAll(listOf("SPONSORED", "ENGAGEMENT")))
                assertEquals("${bundle.name}: suggested categories missing", emptyList<String>(),
                    suggestedCategories.filterNot(names::contains))
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
