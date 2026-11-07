package app.ayufa.patches.youtube.shared

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val AYUFA_SETTINGS_SCREEN_KEY = "ayufa_settings_screen"

private val SCREEN_STRINGS_EN = mapOf(
    "ayufa_settings_screen_title" to "Ayufa patch settings",
    "ayufa_settings_screen_summary" to "Settings for Ayufa Patches."
)

private val SCREEN_STRINGS_JA = mapOf(
    "ayufa_settings_screen_title" to "Ayufaパッチ設定",
    "ayufa_settings_screen_summary" to "Ayufa Patches の設定です。"
)

/**
 * Declares switches on the dedicated "Ayufa patch settings" screen in
 * Morphe settings, using the official add-on preference mechanism: the
 * settings patch of the Morphe bundle merges `morphe_addon_prefs.xml`
 * into its preference files and removes the declaration afterwards. If
 * the Morphe settings patch is not applied, the declaration file is left
 * behind in the APK root, which is harmless, and the features simply
 * stay on.
 *
 * Safe to call from several patches: the screen is created only once,
 * and switches or strings that are already declared are skipped. (The
 * patches of this bundle target different YouTube versions, so in
 * practice only one of them is ever applied to a given APK.)
 *
 * The switches write to the "morphe_prefs" shared preferences, which the
 * extensions read at runtime, so toggling takes effect without
 * re-patching.
 */
internal fun ResourcePatchContext.declareAyufaSettingsSwitches(
    keys: List<String>,
    enStrings: Map<String, String>,
    jaStrings: Map<String, String>
) {
    editAddonPreferences { document ->
        addSwitches(document, keys)
    }

    addStrings("res/values/strings.xml", SCREEN_STRINGS_EN + enStrings)
    if (get("res/values-ja/strings.xml").exists()) {
        addStrings("res/values-ja/strings.xml", SCREEN_STRINGS_JA + jaStrings)
    }
}

/**
 * Declares a single-choice list preference on the same "Ayufa patch
 * settings" screen. [values] are the stored values; [enLabels] and
 * [jaLabels] are the labels shown for them, index-aligned with [values].
 * The choice is stored as a string in the "morphe_prefs" shared
 * preferences, like the switches.
 */
internal fun ResourcePatchContext.declareAyufaSettingsListPreference(
    key: String,
    values: List<String>,
    enLabels: List<String>,
    jaLabels: List<String>,
    defaultValue: String,
    enStrings: Map<String, String>,
    jaStrings: Map<String, String>
) {
    require(values.size == enLabels.size && values.size == jaLabels.size) {
        "List preference labels must align with values: $key"
    }
    editAddonPreferences { document ->
        addListPreference(document, key, defaultValue)
    }

    addStrings("res/values/strings.xml", SCREEN_STRINGS_EN + enStrings)
    if (get("res/values-ja/strings.xml").exists()) {
        addStrings("res/values-ja/strings.xml", SCREEN_STRINGS_JA + jaStrings)
    }

    addStringArray("res/values/arrays.xml", "${key}_values", values)
    addStringArray("res/values/arrays.xml", "${key}_entries", enLabels)
    if (get("res/values-ja/strings.xml").exists()) {
        addStringArray("res/values-ja/arrays.xml", "${key}_entries", jaLabels)
    }
}

/**
 * Declares a free-text (edit text) preference on the same "Ayufa patch
 * settings" screen. The value is stored as a string in the "morphe_prefs"
 * shared preferences, like the switches and lists. Used for values the
 * user types in directly (for example a number of minutes), which the
 * extension then parses and validates itself.
 */
internal fun ResourcePatchContext.declareAyufaSettingsEditTextPreference(
    key: String,
    defaultValue: String,
    enStrings: Map<String, String>,
    jaStrings: Map<String, String>
) {
    editAddonPreferences { document ->
        addEditTextPreference(document, key, defaultValue)
    }

    addStrings("res/values/strings.xml", SCREEN_STRINGS_EN + enStrings)
    if (get("res/values-ja/strings.xml").exists()) {
        addStrings("res/values-ja/strings.xml", SCREEN_STRINGS_JA + jaStrings)
    }
}

private fun ResourcePatchContext.editAddonPreferences(block: (Document) -> Unit) {
    if (!get("morphe_addon_prefs.xml").exists()) {
        get("morphe_addon_prefs.xml").writeText(
            "<morphe-add-on-preferences " +
                "xmlns:android=\"http://schemas.android.com/apk/res/android\"/>"
        )
    }
    document("morphe_addon_prefs.xml").use { document ->
        block(document)
    }
}

/**
 * Finds the Ayufa settings screen in the add-on document, creating it
 * (attached to the Morphe settings root screen) when missing.
 */
private fun ayufaScreen(document: Document): Element {
    val root = document.documentElement
    val existingScreens = root.getElementsByTagName("PreferenceScreen")
    for (i in 0 until existingScreens.length) {
        val element = existingScreens.item(i) as? Element ?: continue
        if (element.getAttribute("android:key") == AYUFA_SETTINGS_SCREEN_KEY) {
            return element
        }
    }

    val screen = document.createElement("PreferenceScreen")
    screen.setAttribute("android:key", AYUFA_SETTINGS_SCREEN_KEY)
    screen.setAttribute("android:title", "@string/ayufa_settings_screen_title")
    screen.setAttribute("android:summary", "@string/ayufa_settings_screen_summary")

    // A screen declaration without a key or position is added to the
    // Morphe settings root screen.
    val wrapper = document.createElement("screen")
    wrapper.appendChild(screen)
    root.appendChild(wrapper)
    return screen
}

private fun addSwitches(document: Document, keys: List<String>) {
    val ayufaScreen = ayufaScreen(document)

    val existingKeys = mutableSetOf<String>()
    val existingSwitches = ayufaScreen.getElementsByTagName("SwitchPreference")
    for (i in 0 until existingSwitches.length) {
        val element = existingSwitches.item(i) as? Element ?: continue
        existingKeys += element.getAttribute("android:key")
    }
    for (key in keys) {
        if (key !in existingKeys) {
            ayufaScreen.appendChild(switchPreference(document, key))
        }
    }
}

private fun addListPreference(document: Document, key: String, defaultValue: String) {
    val ayufaScreen = ayufaScreen(document)

    val existingLists = ayufaScreen.getElementsByTagName("ListPreference")
    for (i in 0 until existingLists.length) {
        val element = existingLists.item(i) as? Element ?: continue
        if (element.getAttribute("android:key") == key) {
            return
        }
    }

    val preference = document.createElement("ListPreference")
    preference.setAttribute("android:key", key)
    preference.setAttribute("android:title", "@string/${key}_title")
    preference.setAttribute("android:summary", "@string/${key}_summary")
    preference.setAttribute("android:entries", "@array/${key}_entries")
    preference.setAttribute("android:entryValues", "@array/${key}_values")
    preference.setAttribute("android:defaultValue", defaultValue)
    ayufaScreen.appendChild(preference)
}

private fun addEditTextPreference(document: Document, key: String, defaultValue: String) {
    val ayufaScreen = ayufaScreen(document)

    val existing = ayufaScreen.getElementsByTagName("EditTextPreference")
    for (i in 0 until existing.length) {
        val element = existing.item(i) as? Element ?: continue
        if (element.getAttribute("android:key") == key) {
            return
        }
    }

    val preference = document.createElement("EditTextPreference")
    preference.setAttribute("android:key", key)
    preference.setAttribute("android:title", "@string/${key}_title")
    preference.setAttribute("android:summary", "@string/${key}_summary")
    preference.setAttribute("android:defaultValue", defaultValue)
    ayufaScreen.appendChild(preference)
}

/**
 * Appends a string-array resource, creating the arrays file when the
 * target APK does not have one and skipping names that already exist.
 */
private fun ResourcePatchContext.addStringArray(
    path: String,
    name: String,
    items: List<String>
) {
    if (!get(path).exists()) {
        get(path).writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources/>\n")
    }
    document(path).use { document ->
        val root = document.documentElement
        val nodes = root.getElementsByTagName("string-array")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            if (element.getAttribute("name") == name) {
                return@use
            }
        }
        val array = document.createElement("string-array")
        array.setAttribute("name", name)
        for (item in items) {
            val itemElement = document.createElement("item")
            itemElement.textContent = item
            array.appendChild(itemElement)
        }
        root.appendChild(array)
    }
}

private fun switchPreference(document: Document, key: String): Element {
    val preference = document.createElement("SwitchPreference")
    preference.setAttribute("android:key", key)
    preference.setAttribute("android:title", "@string/${key}_title")
    preference.setAttribute("android:summary", "@string/${key}_summary")
    preference.setAttribute("android:defaultValue", "true")
    return preference
}

/**
 * Appends string resources, skipping names that already exist.
 */
private fun ResourcePatchContext.addStrings(
    path: String,
    strings: Map<String, String>
) {
    document(path).use { document ->
        val root = document.documentElement
        val existing = mutableSetOf<String>()
        val nodes = root.getElementsByTagName("string")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            existing += element.getAttribute("name")
        }
        for ((name, value) in strings) {
            if (name in existing) {
                continue
            }
            val element = document.createElement("string")
            element.setAttribute("name", name)
            element.textContent = value
            root.appendChild(element)
        }
    }
}
