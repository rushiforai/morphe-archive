package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.lightbox

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val CATEGORY_HEADER =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.CategoryHeaderPreference"

private const val CHECK_BOX =
    "com.laurencedawson.reddit_sync.ui.preferences.defaults.SyncCheckBoxPreference"

/**
 * Adds the setting to Sync's own screen, so that Sync's preference machinery displays it and
 * writes it where the extension reads it from.
 */
internal val transparentAlphaSettingsPatch = resourcePatch(
    description = "Adds the transparency setting to the Deepzoom category.",
) {
    execute {
        document("res/xml/cat_images.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY_HEADER)
            val category = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "Deepzoom" }
                ?.parentNode as? Element
                ?: throw PatchException("No Deepzoom category to add the setting to")

            val preference = document.createElement(CHECK_BOX)
            mapOf(
                "android:key" to "sync_up_lightbox_alpha",
                "android:title" to "Keep transparency",
                "android:summary" to
                    "Draw the see-through parts of a picture as the background behind it",
                "android:defaultValue" to "true",
            ).forEach { (name, value) -> preference.setAttribute(name, value) }
            category.appendChild(preference)
        }
    }
}
