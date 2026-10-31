package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.banner

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

private const val CHECK_BOX =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"

/** Adds the setting to the posts settings, which is where the feed's own options are. */
internal val subredditBannerSettingsPatch = resourcePatch(
    description = "Adds the banner setting to the posts View tweaks category.",
) {
    execute {
        document("res/xml/cat_posts.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val category = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "View tweaks" }
                ?.parentNode as? Element
                ?: throw PatchException("No View tweaks category to add the setting to")

            val preference = document.createElement(CHECK_BOX)
            mapOf(
                "android:key" to "sync_up_subreddit_banner",
                "android:title" to "Show a subreddit's banner",
                "android:summary" to "Draw the banner it sets at the top of its posts",
                "android:defaultValue" to "true",
            ).forEach { (name, value) -> preference.setAttribute(name, value) }
            category.appendChild(preference)
        }
    }
}
