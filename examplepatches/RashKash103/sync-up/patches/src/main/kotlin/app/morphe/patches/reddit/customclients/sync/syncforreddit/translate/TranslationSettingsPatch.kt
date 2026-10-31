package app.morphe.patches.reddit.customclients.sync.syncforreddit.translate

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val PREFERENCES = "com.laurencedawson.reddit_sync.ui.preferences"

private const val CATEGORY = "$PREFERENCES.defaults.CategoryHeaderPreference"
private const val CHECK_BOX = "$PREFERENCES.defaults.SyncCheckBoxPreference"
private const val LIST = "$PREFERENCES.defaults.SyncListPreference"
private const val ROW = "$PREFERENCES.defaults.SyncPreference"

/** A row of Sync's own kind that draws how much of an allowance is gone. */
private const val USAGE_ROW =
    "app.morphe.extension.syncforreddit.translate.UsagePreference"
private const val HEADER = "$PREFERENCES.HeaderPreference"
private const val ROOT_ROW = "$PREFERENCES.custom.RootPreference"

/**
 * Puts the translation settings among Sync's own, built from the same preferences Sync builds
 * its own screens from so that they are drawn by the app rather than beside it: the same rows,
 * the same headings, the same theme.
 */
private const val POST_MENU = "res/layout/dialog_bottom_post_more.xml"

private const val MATERIAL_ROW = "com.laurencedawson.reddit_sync.ui.views.core.MaterialRow"

private const val ROW_TITLE = "app:rowTitle"

/**
 * What the row should say. Sync says this and then names the service it used to use, which is
 * no longer necessarily the one doing the work.
 */
private const val TRANSLATE_ROW = "Translate text"

internal val translationSettingsPatch = resourcePatch(
    description = "Adds a translation screen to Sync's settings.",
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

            array("sync_up_translate_services", "On this device", "DeepL", "Google Cloud")
            array("sync_up_translate_service_values", "device", "deepl", "google")

            array(
                "sync_up_translate_languages",
                "English (US)", "English (UK)", "Arabic", "Bulgarian", "Chinese (simplified)",
                "Czech", "Danish", "Dutch", "Estonian", "Finnish", "French", "German", "Greek",
                "Hungarian", "Indonesian", "Italian", "Japanese", "Korean", "Latvian",
                "Lithuanian", "Norwegian", "Polish", "Portuguese (Brazil)", "Portuguese",
                "Romanian", "Russian", "Slovak", "Slovenian", "Spanish", "Swedish", "Turkish",
                "Ukrainian",
            )
            array(
                "sync_up_translate_language_values",
                "en-US", "en-GB", "ar", "bg", "zh", "cs", "da", "nl", "et", "fi", "fr", "de",
                "el", "hu", "id", "it", "ja", "ko", "lv", "lt", "nb", "pl", "pt-BR", "pt-PT",
                "ro", "ru", "sk", "sl", "es", "sv", "tr", "uk",
            )

            array(
                "sync_up_translate_context",
                "None", "The post", "The post and the comments above it",
            )
            array("sync_up_translate_context_values", "none", "post", "thread")

            array(
                "sync_up_translate_keep",
                "A day", "A week", "A month", "Three months", "Forever",
            )
            array("sync_up_translate_keep_values", "1", "7", "30", "90", "0")
        }

        // An id for the screen, which is how Sync tells its screens apart. It has to be one no
        // screen of Sync's own uses, and the same one the extension answers to.
        document("res/values/integers.xml").use { document ->
            val resources = document.getElementsByTagName("resources").item(0) as Element
            val id = document.createElement("integer")
            id.setAttribute("name", "SYNC_UP_TRANSLATION")
            id.appendChild(document.createTextNode("8100"))
            resources.appendChild(id)
        }

        // The space to the side of the usage row, which holds a bar of the platform's own kind.
        get("res/layout/sync_up_usage.xml").writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:minWidth="96dp"
                android:paddingStart="8dp"
                android:paddingEnd="8dp">
                <ProgressBar
                    android:id="@+id/sync_up_usage_bar"
                    style="?android:attr/progressBarStyleHorizontal"
                    android:layout_width="96dp"
                    android:layout_height="wrap_content"
                    android:layout_gravity="center_vertical"
                    android:max="100"
                    android:progress="0" />
            </FrameLayout>
            """.trimIndent()
        )

        // A screen of its own, written where Sync keeps its own.
        get("res/xml/cat_translation.xml").writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <PreferenceScreen xmlns:android="http://schemas.android.com/apk/res/android"
                xmlns:app="http://schemas.android.com/apk/res-auto">
                <$HEADER app:title="Translation" />
            </PreferenceScreen>
            """.trimIndent()
        )

        document("res/xml/cat_translation.xml").use { document ->
            val screen = document.getElementsByTagName("PreferenceScreen").item(0) as Element

            fun category(title: String): Element {
                val category = document.createElement("PreferenceCategory")
                val heading = document.createElement(CATEGORY)
                heading.setAttribute("app:categoryTitle", title)
                category.appendChild(heading)
                screen.appendChild(category)
                return category
            }

            fun Element.row(tag: String, attributes: Map<String, String>) {
                val preference = document.createElement(tag)
                attributes.forEach { (name, value) -> preference.setAttribute(name, value) }
                appendChild(preference)
            }

            category("General").apply {
                row(
                    CHECK_BOX,
                    mapOf(
                        "android:key" to "sync_up_translate",
                        "android:title" to "Translate posts and comments",
                        "android:summary" to "Adds translation to the post and comment menus",
                        "android:defaultValue" to "true",
                    ),
                )
                row(
                    LIST,
                    mapOf(
                        "android:key" to "sync_up_translate_service",
                        "android:summary" to "%s",
                        "android:title" to "Translate with",
                        "android:entries" to "@array/sync_up_translate_services",
                        "android:entryValues" to "@array/sync_up_translate_service_values",
                        "android:defaultValue" to "device",
                    ),
                )
                row(
                    LIST,
                    mapOf(
                        "android:key" to "sync_up_translate_language",
                        "android:summary" to "%s",
                        "android:title" to "Translate into",
                        "android:entries" to "@array/sync_up_translate_languages",
                        "android:entryValues" to "@array/sync_up_translate_language_values",
                        "android:defaultValue" to "en-US",
                    ),
                )
            }

            category("DeepL").apply {
                row(
                    ROW,
                    mapOf(
                        "android:key" to "sync_up_translate_deepl_key",
                        "android:title" to "DeepL API key",
                        "android:summary" to "Not set",
                    ),
                )
                row(
                    USAGE_ROW,
                    mapOf(
                        "android:key" to "sync_up_translate_deepl_usage",
                        "android:title" to "DeepL usage",
                        "android:summary" to "Checking\u2026",
                        "android:widgetLayout" to "@layout/sync_up_usage",
                        "android:selectable" to "false",
                    ),
                )
                row(
                    LIST,
                    mapOf(
                        "android:key" to "sync_up_translate_deepl_context",
                        "android:summary" to "%s",
                        "android:title" to "Context sent with a comment",
                        "android:entries" to "@array/sync_up_translate_context",
                        "android:entryValues" to "@array/sync_up_translate_context_values",
                        "android:defaultValue" to "thread",
                    ),
                )
                row(
                    CHECK_BOX,
                    mapOf(
                        "android:key" to "sync_up_translate_deepl_instructions_on",
                        "android:title" to "Use custom instructions",
                        "android:defaultValue" to "false",
                    ),
                )
                row(
                    ROW,
                    mapOf(
                        "android:key" to "sync_up_translate_deepl_instructions",
                        "android:title" to "Custom instructions",
                        "android:summary" to "Not set",
                    ),
                )
            }

            category("Google Cloud").apply {
                row(
                    ROW,
                    mapOf(
                        "android:key" to "sync_up_translate_google_key",
                        "android:title" to "Google Cloud API key",
                        "android:summary" to "Not set",
                    ),
                )
            }

            category("Cache").apply {
                row(
                    LIST,
                    mapOf(
                        "android:key" to "sync_up_translate_keep",
                        "android:summary" to "%s",
                        "android:title" to "Keep translations for",
                        "android:entries" to "@array/sync_up_translate_keep",
                        "android:entryValues" to "@array/sync_up_translate_keep_values",
                        "android:defaultValue" to "30",
                    ),
                )
                row(
                    ROW,
                    mapOf(
                        "android:key" to "sync_up_translate_cache_clear",
                        "android:title" to "Clear the translation cache",
                        "android:summary" to "Empty",
                    ),
                )
            }
        }

        // The way in, beside the other screens about what is read.
        document("res/xml/cat_root.xml").use { document ->
            val headers = document.getElementsByTagName(CATEGORY)
            val content = (0 until headers.length)
                .map { headers.item(it) as Element }
                .firstOrNull { it.getAttribute("app:categoryTitle") == "Content" }
                ?.parentNode as? Element
                ?: throw PatchException("No Content section to put the translation screen in")

            val row = document.createElement(ROOT_ROW)
            row.setAttribute("android:title", "Translation")
            row.setAttribute("android:summary", "Read posts and comments in your own language")
            row.setAttribute("app:custom_icon", "@drawable/outline_translate_24")
            row.setAttribute("app:preference_ref", "@integer/SYNC_UP_TRANSLATION")
            content.appendChild(row)
        }

        // The row in a post's menu names the service Sync used to use, which is no longer
        // necessarily the one doing the work.
        document(POST_MENU).use { document ->
            val rows = document.getElementsByTagName(MATERIAL_ROW)
            (0 until rows.length)
                .map { rows.item(it) as Element }
                .filter { it.getAttribute(ROW_TITLE).startsWith(TRANSLATE_ROW) }
                .also {
                    if (it.isEmpty()) throw PatchException("No translate row in a post's menu")
                }
                .forEach { it.setAttribute(ROW_TITLE, TRANSLATE_ROW) }
        }
    }
}
