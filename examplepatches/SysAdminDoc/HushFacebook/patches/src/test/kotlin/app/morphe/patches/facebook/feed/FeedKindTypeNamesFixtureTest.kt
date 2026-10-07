/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.Fixtures
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

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
 * MULTI_ADS_TYPE.
 */
class FeedKindTypeNamesFixtureTest {
    private val names = listOf(
        "ThrowbackPromotionFeedUnit", "ThrowbackSectionHeaderFeedUnit", "ThrowbackPermalinkStoryFeedUnit",
        "GoodwillThrowbackFeedUnit", "FriendRequestsFeedUnit", "FriendsLocationsFeedUnit",
        "ClientTriggeredQPFeedUnit", "VibesRifuQuickPromotionFeedUnit", "SocialListPromptFeedUnit",
        "PaginatedGroupsPeopleYouMayInviteFeedUnit", "FBMultiAdsFeedUnit",
    )

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
}
