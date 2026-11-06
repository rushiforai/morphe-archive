package app.ayufa.patches.youtube.shared

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val AYUFA_SETTINGS_SCREEN_KEY = "ayufa_settings_screen"

private val SCREEN_STRINGS_EN = mapOf(
    "ayufa_settings_screen_title" to "Ayufa patch settings",
    "ayufa_settings_screen_summary" to "Settings for Ayufa YouTube Patches."
)

private val SCREEN_STRINGS_JA = mapOf(
    "ayufa_settings_screen_title" to "Ayufaパッチ設定",
    "ayufa_settings_screen_summary" to "Ayufa YouTube Patches の設定です。"
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
    if (!get("morphe_addon_prefs.xml").exists()) {
        get("morphe_addon_prefs.xml").writeText(
            "<morphe-add-on-preferences " +
                "xmlns:android=\"http://schemas.android.com/apk/res/android\"/>"
        )
    }
    document("morphe_addon_prefs.xml").use { document ->
        addSwitches(document, keys)
    }

    addStrings("res/values/strings.xml", SCREEN_STRINGS_EN + enStrings)
    if (get("res/values-ja/strings.xml").exists()) {
        addStrings("res/values-ja/strings.xml", SCREEN_STRINGS_JA + jaStrings)
    }
}

private fun addSwitches(document: Document, keys: List<String>) {
    val root = document.documentElement

    // Find the Ayufa settings screen if another patch already declared it.
    var ayufaScreen: Element? = null
    val existingScreens = root.getElementsByTagName("PreferenceScreen")
    for (i in 0 until existingScreens.length) {
        val element = existingScreens.item(i) as? Element ?: continue
        if (element.getAttribute("android:key") == AYUFA_SETTINGS_SCREEN_KEY) {
            ayufaScreen = element
            break
        }
    }

    if (ayufaScreen == null) {
        ayufaScreen = document.createElement("PreferenceScreen")
        ayufaScreen.setAttribute("android:key", AYUFA_SETTINGS_SCREEN_KEY)
        ayufaScreen.setAttribute("android:title", "@string/ayufa_settings_screen_title")
        ayufaScreen.setAttribute("android:summary", "@string/ayufa_settings_screen_summary")

        // A screen declaration without a key or position is added to the
        // Morphe settings root screen.
        val screen = document.createElement("screen")
        screen.appendChild(ayufaScreen)
        root.appendChild(screen)
    }

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
