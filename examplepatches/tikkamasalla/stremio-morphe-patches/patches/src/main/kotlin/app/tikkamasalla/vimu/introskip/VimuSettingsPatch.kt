package app.tikkamasalla.vimu.introskip

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val PREFS_XML = "res/xml/prefs.xml"
private const val ARRAYS_XML = "res/values/arrays.xml"
private const val STRINGS_XML = "res/values/strings.xml"

private const val ENABLED_KEY = "introskip_enabled"
private const val ANIME_KEY = "introskip_anime"
private const val MODE_KEY = "introskip_mode"
private const val RECAPS_KEY = "introskip_recaps"
private const val CREDITS_KEY = "introskip_credits"
private const val PREVIEWS_KEY = "introskip_previews"
private const val AUDIO_PRIMARY_KEY = "introskip_audio_primary"
private const val AUDIO_ANIME_KEY = "introskip_audio_anime"

private const val MODE_ENTRIES_ARRAY = "introskip_mode_entries"
private const val MODE_VALUES_ARRAY = "introskip_mode_values"
private const val CREDITS_ENTRIES_ARRAY = "introskip_credits_entries"
private const val CREDITS_VALUES_ARRAY = "introskip_credits_values"
private const val AUDIO_LANG_ENTRIES_ARRAY = "introskip_audio_lang_entries"
private const val AUDIO_LANG_VALUES_ARRAY = "introskip_audio_lang_values"

private val AUDIO_LANG_ENTRIES = listOf(
    "English",
    "Japanese",
    "Spanish",
    "French",
    "German",
    "Italian",
    "Portuguese",
    "Russian",
    "Korean",
    "Chinese",
    "Hindi",
    "Polish",
    "Turkish",
    "Arabic",
    "Dutch",
    "Ukrainian",
)

private val AUDIO_LANG_VALUES = listOf(
    "en",
    "ja",
    "es",
    "fr",
    "de",
    "it",
    "pt",
    "ru",
    "ko",
    "zh",
    "hi",
    "pl",
    "tr",
    "ar",
    "nl",
    "uk",
)

/**
 * Adds the eight Intro Skip preference rows to Vimu Settings:
 * - Skip intros (CheckBoxPreference, default true)
 * - Skip anime openings (AniSkip) (CheckBoxPreference, default true)
 * - Skip mode (ListPreference: Auto / Manual, default Auto)
 * - Skip recaps (CheckBoxPreference, default true)
 * - Skip credits (ListPreference: Auto / Button / Off, default Button)
 * - Skip previews (CheckBoxPreference, default false)
 * - Primary audio language (ListPreference: ISO-639-1, default English / "en")
 * - Anime audio language (ListPreference: ISO-639-1, default Japanese / "ja")
 *
 * Appends standard Preference rows to res/xml/prefs.xml and the mode arrays to
 * res/values/arrays.xml (falling back to res/values/strings.xml). All rows persist
 * in the default SharedPreferences file read by VimuIntroSkipPrefs.
 */
val vimuSettingsPatch = resourcePatch(
    name = "Intro Skip settings row (Vimu)",
    description = "Adds the Intro Skip settings to Vimu Settings. Runs with the Intro Skip (Vimu) patch.",
    default = true,
) {
    compatibleWith(Constants.VIMU_COMPATIBILITY)

    execute {
        val valuesDoc = try {
            document(ARRAYS_XML)
        } catch (_: Throwable) {
            document(STRINGS_XML)
        }
        valuesDoc.use { doc ->
            ensureStringArray(doc, MODE_ENTRIES_ARRAY, listOf("Auto", "Manual"))
            ensureStringArray(doc, MODE_VALUES_ARRAY, listOf("auto", "manual"))
            ensureStringArray(doc, CREDITS_ENTRIES_ARRAY, listOf("Auto", "Button", "Off"))
            ensureStringArray(doc, CREDITS_VALUES_ARRAY, listOf("auto", "button", "off"))
            ensureStringArray(doc, AUDIO_LANG_ENTRIES_ARRAY, AUDIO_LANG_ENTRIES)
            ensureStringArray(doc, AUDIO_LANG_VALUES_ARRAY, AUDIO_LANG_VALUES)
        }

        document(PREFS_XML).use { doc ->
            val root = doc.documentElement

            if (!hasPreferenceKey(doc, ENABLED_KEY)) {
                root.appendChild(
                    createCheckBox(
                        doc = doc,
                        key = ENABLED_KEY,
                        title = "Skip intros",
                        summary = "Skip intros and recaps during playback",
                        defaultValue = "true",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, ANIME_KEY)) {
                root.appendChild(
                    createCheckBox(
                        doc = doc,
                        key = ANIME_KEY,
                        title = "Skip anime openings (AniSkip)",
                        summary = "Use AniSkip to find anime openings and recaps",
                        defaultValue = "true",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, MODE_KEY)) {
                root.appendChild(
                    createListPreference(
                        doc = doc,
                        key = MODE_KEY,
                        title = "Skip mode",
                        summary = "Auto skips immediately; Manual shows a Skip button",
                        entriesArray = MODE_ENTRIES_ARRAY,
                        valuesArray = MODE_VALUES_ARRAY,
                        defaultValue = "auto",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, RECAPS_KEY)) {
                root.appendChild(
                    createCheckBox(
                        doc = doc,
                        key = RECAPS_KEY,
                        title = "Skip recaps",
                        summary = "Also skip episode recaps",
                        defaultValue = "true",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, CREDITS_KEY)) {
                root.appendChild(
                    createListPreference(
                        doc = doc,
                        key = CREDITS_KEY,
                        title = "Skip credits",
                        summary = "Auto skips immediately; Button shows a Skip button; Off disables",
                        entriesArray = CREDITS_ENTRIES_ARRAY,
                        valuesArray = CREDITS_VALUES_ARRAY,
                        defaultValue = "button",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, PREVIEWS_KEY)) {
                root.appendChild(
                    createCheckBox(
                        doc = doc,
                        key = PREVIEWS_KEY,
                        title = "Skip previews",
                        summary = "Skip preview segments too",
                        defaultValue = "false",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, AUDIO_PRIMARY_KEY)) {
                root.appendChild(
                    createListPreference(
                        doc = doc,
                        key = AUDIO_PRIMARY_KEY,
                        title = "Primary audio language",
                        summary = "Preferred audio language for movies and TV shows",
                        entriesArray = AUDIO_LANG_ENTRIES_ARRAY,
                        valuesArray = AUDIO_LANG_VALUES_ARRAY,
                        defaultValue = "en",
                    ),
                )
            }

            if (!hasPreferenceKey(doc, AUDIO_ANIME_KEY)) {
                root.appendChild(
                    createListPreference(
                        doc = doc,
                        key = AUDIO_ANIME_KEY,
                        title = "Anime audio language",
                        summary = "Preferred audio language for anime playback",
                        entriesArray = AUDIO_LANG_ENTRIES_ARRAY,
                        valuesArray = AUDIO_LANG_VALUES_ARRAY,
                        defaultValue = "ja",
                    ),
                )
            }

            println("Vimu settings row: ensured Intro Skip preferences in $PREFS_XML.")
        }
    }
}

private fun hasPreferenceKey(doc: Document, targetKey: String): Boolean {
    val nodes = doc.getElementsByTagName("*")
    for (i in 0 until nodes.length) {
        val attrs = nodes.item(i).attributes ?: continue
        val key = attrs.getNamedItem("android:key")?.nodeValue
            ?: attrs.getNamedItemNS(ANDROID_NS, "key")?.nodeValue
        if (key == targetKey) return true
    }
    return false
}

private fun createCheckBox(
    doc: Document,
    key: String,
    title: String,
    summary: String,
    defaultValue: String,
): Element {
    val row = doc.createElement("CheckBoxPreference")
    row.setAttributeNS(ANDROID_NS, "android:key", key)
    row.setAttributeNS(ANDROID_NS, "android:title", title)
    row.setAttributeNS(ANDROID_NS, "android:summary", summary)
    row.setAttributeNS(ANDROID_NS, "android:defaultValue", defaultValue)
    return row
}

private fun createListPreference(
    doc: Document,
    key: String,
    title: String,
    summary: String,
    entriesArray: String,
    valuesArray: String,
    defaultValue: String,
): Element {
    val row = doc.createElement("ListPreference")
    row.setAttributeNS(ANDROID_NS, "android:key", key)
    row.setAttributeNS(ANDROID_NS, "android:title", title)
    row.setAttributeNS(ANDROID_NS, "android:summary", summary)
    row.setAttributeNS(ANDROID_NS, "android:entries", "@array/$entriesArray")
    row.setAttributeNS(ANDROID_NS, "android:entryValues", "@array/$valuesArray")
    row.setAttributeNS(ANDROID_NS, "android:defaultValue", defaultValue)
    return row
}

private fun ensureStringArray(doc: Document, name: String, items: List<String>) {
    val root = doc.documentElement
    val existing = root.getElementsByTagName("string-array")
    for (i in 0 until existing.length) {
        val attr = existing.item(i).attributes?.getNamedItem("name")?.nodeValue
        if (attr == name) return
    }
    val array = doc.createElement("string-array")
    array.setAttribute("name", name)
    for (value in items) {
        val item = doc.createElement("item")
        item.textContent = value
        array.appendChild(item)
    }
    root.appendChild(array)
}
