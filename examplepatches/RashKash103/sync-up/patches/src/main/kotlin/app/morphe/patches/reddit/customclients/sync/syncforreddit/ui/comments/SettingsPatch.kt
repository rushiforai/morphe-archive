package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.comments

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

private const val CHECK_BOX =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"

private const val LIST =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncListPreference"

/** The heights a picture can be held to, in dp. */
private val HEIGHTS = listOf(100, 150, 200, 250, 300, 400, 500)

/** The shares of a comment's width a picture can be held to. */
private val SHARES = listOf(100, 75, 50, 25)

/**
 * Adds the settings to the comments settings. They belong just as well beside Sync's own inline
 * linking options, but this is about comments and that is where they were looked for.
 */
internal val inlineCommentMediaSettingsPatch = resourcePatch(
    description = "Adds the inline media settings to the comments General category.",
) {
    execute {
        document("res/values/arrays.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element

            fun array(name: String, items: List<String>) {
                val array = document.createElement("string-array")
                array.setAttribute("name", name)
                items.forEach {
                    val item = document.createElement("item")
                    item.appendChild(document.createTextNode(it))
                    array.appendChild(item)
                }
                resources.appendChild(array)
            }

            array(
                "sync_up_inline_media_size_entries",
                listOf("Its own size", "The same width", "The same height"),
            )
            array("sync_up_inline_media_size_values", listOf("0", "1", "2"))

            array(
                "sync_up_inline_media_share_entries",
                SHARES.map { if (it == 100) "The whole width" else "$it% of the width" },
            )
            array("sync_up_inline_media_share_values", SHARES.map { it.toString() })

            array("sync_up_inline_media_height_entries", HEIGHTS.map { "$it dp" })
            array("sync_up_inline_media_height_values", HEIGHTS.map { it.toString() })
        }

        document("res/xml/cat_comments.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val category = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "General" }
                ?.parentNode as? Element
                ?: throw PatchException("No General category in comments to add the setting to")

            fun add(tag: String, attributes: Map<String, String>) {
                val preference = document.createElement(tag)
                attributes.forEach { (name, value) -> preference.setAttribute(name, value) }
                category.appendChild(preference)
            }

            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_inline_comment_media",
                    "android:title" to "Show media in comments where it sits",
                    "android:summary" to
                        "Draw every picture and video linked in a comment rather than a chip",
                    "android:defaultValue" to "false",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_inline_media_size",
                    "android:title" to "Media size",
                    "android:entries" to "@array/sync_up_inline_media_size_entries",
                    "android:entryValues" to "@array/sync_up_inline_media_size_values",
                    "android:defaultValue" to "0",
                    "android:summary" to "%s",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_inline_media_max_width",
                    "android:title" to "Largest media size",
                    "android:entries" to "@array/sync_up_inline_media_share_entries",
                    "android:entryValues" to "@array/sync_up_inline_media_share_values",
                    "android:defaultValue" to "100",
                    "android:summary" to "%s, where media is drawn at its own size",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_inline_media_width",
                    "android:title" to "Media width",
                    "android:entries" to "@array/sync_up_inline_media_share_entries",
                    "android:entryValues" to "@array/sync_up_inline_media_share_values",
                    "android:defaultValue" to "100",
                    "android:summary" to "%s, where media is drawn the same width",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_inline_media_height",
                    "android:title" to "Media height",
                    "android:entries" to "@array/sync_up_inline_media_height_entries",
                    "android:entryValues" to "@array/sync_up_inline_media_height_values",
                    "android:defaultValue" to "200",
                    "android:summary" to "%s, where media is drawn the same height",
                ),
            )
        }
    }
}
