package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.gestures

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

private const val CHECK_BOX =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"

private const val LIST =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncListPreference"

/**
 * Adds the gesture settings to Sync's own settings screen, so that Sync's preference machinery
 * displays them and writes them where the extension reads them from. Building them in code is
 * not open to us: the preference library's method names are obfuscated, and only its class names
 * survive.
 */
internal val videoGestureSettingsPatch = resourcePatch(
    description = "Adds the video gesture settings to the Gestures category.",
) {
    execute {
        document("res/values/arrays.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element

            fun array(name: String, vararg items: String) {
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
                "sync_up_seek_entries",
                "Off", "Outside galleries", "Everywhere",
            )
            array("sync_up_seek_values", "0", "1", "2")
            array(
                "sync_up_seek_span_entries",
                "30 seconds", "1 minute", "90 seconds", "3 minutes", "5 minutes",
            )
            array("sync_up_seek_span_values", "30", "60", "90", "180", "300")
        }

        document("res/xml/cat_general.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val gestures = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "Gestures" }
                ?.parentNode as? Element
                ?: throw PatchException("No Gestures category to add the settings to")

            fun add(tag: String, attributes: Map<String, String>) {
                val preference = document.createElement(tag)
                attributes.forEach { (name, value) -> preference.setAttribute(name, value) }
                gestures.appendChild(preference)
            }

            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_video_double_tap",
                    "android:title" to "Double tap to play or pause",
                    "android:summary" to "In a video or GIF, where a double tap would zoom",
                    "android:defaultValue" to "true",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_video_seek",
                    "android:title" to "Drag sideways to seek",
                    "android:entries" to "@array/sync_up_seek_entries",
                    "android:entryValues" to "@array/sync_up_seek_values",
                    "android:defaultValue" to "1",
                ),
            )
            add(
                LIST,
                mapOf(
                    "android:key" to "sync_up_video_seek_span",
                    "android:title" to "Seek across a full drag",
                    "android:entries" to "@array/sync_up_seek_span_entries",
                    "android:entryValues" to "@array/sync_up_seek_span_values",
                    "android:defaultValue" to "90",
                ),
            )
            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_video_seek_precision",
                    "android:title" to "Change seek precision while dragging",
                    "android:summary" to
                        "Drag down while seeking for finer steps, up for larger ones",
                    "android:defaultValue" to "true",
                ),
            )
            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_video_seek_double_tap",
                    "android:title" to "Double tap before seeking",
                    "android:summary" to "Seek only after a double tap is held, not on any drag",
                    "android:defaultValue" to "false",
                ),
            )
            add(
                CHECK_BOX,
                mapOf(
                    "android:key" to "sync_up_video_volume",
                    "android:title" to "Double tap and drag for volume",
                    "android:summary" to "Up and down after a double tap, where it would zoom",
                    "android:defaultValue" to "true",
                ),
            )
        }
    }
}
