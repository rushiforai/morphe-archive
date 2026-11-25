package dev.custom.gboardpatches.patches.keyboard

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SETTING_PREFERENCES_XML = "res/xml/setting_preferences.xml"
private const val ARRAYS_XML = "res/values/arrays.xml"
const val PREF_KEY_APP_PROFILE_PACKAGE = "pref_key_app_profile_package"
const val PREF_KEY_APP_PROFILE_INCOGNITO = "pref_key_app_profile_incognito"
const val PREF_KEY_APP_PROFILE_NO_SUGGESTIONS = "pref_key_app_profile_no_suggestions"
const val PREF_KEY_APP_PROFILE_TOOLBAR = "pref_key_app_profile_toolbar"
const val PREF_KEY_APP_PROFILE_THEME = "pref_key_app_profile_theme"
const val PREF_KEY_APP_PROFILE_KEYBOARD_HEIGHT = "pref_key_app_profile_keyboard_height"
const val PREF_KEY_APP_PROFILE_SAVED_RULES = "pref_key_app_profile_saved_rules"
const val PREF_KEY_APP_PROFILE_REMOVE_RULE = "pref_key_app_profile_remove_rule"
private const val PREF_KEY_APP_PROFILE_CATEGORY = "pref_key_app_profiles_category"

/** Gboard's own screen for the toolbar keys and the keyboard height. */
private const val TOOLBAR_SETTINGS_FRAGMENT =
    "com.google.android.apps.inputmethod.latin.preference.PreferencesSettingsFragment"

/**
 * Theme specs Gboard itself stores in {@code additional_keyboard_theme}. The empty value means
 * "leave Gboard's theme alone", which is what an unset profile field does.
 */
private val THEME_ENTRIES = listOf(
    "Keep Gboard's theme",
    "Silk (follow system)",
    "Silk light",
    "Silk dark",
    "Material 3 light",
    "Material 3 dark",
    "Follow system - light",
    "Follow system - dark",
)
private val THEME_VALUES = listOf(
    "",
    "system_auto:",
    "silk:light",
    "silk:dark",
    "silk:material3_light",
    "silk:material3_dark",
    "system_auto:light",
    "system_auto:dark",
)

/**
 * A keyboard height is a theme spec too: Gboard stores it in the same
 * {@code additional_keyboard_theme} preference, so the choice is written as an ordinary theme.
 */
private val HEIGHT_ENTRIES = listOf(
    "Keep Gboard's height",
    "33 mm",
    "35 mm",
    "37 mm",
    "39 mm",
    "47 mm",
    "48 mm",
    "49 mm",
    "52 mm",
)
private val HEIGHT_VALUES = listOf(
    "",
    "keyboard_height_33_mm",
    "keyboard_height_35_mm",
    "keyboard_height_37_mm",
    "keyboard_height_39_mm",
    "keyboard_height_47_mm",
    "keyboard_height_48_mm",
    "keyboard_height_49_mm",
    "keyboard_height_52_mm",
)

/**
 * Adds the per-app profile rule fields to Gboard's own Preferences screen: one package field and
 * the incognito / no-suggestions toggles that apply to it, the toolbar/theme/height fields that
 * go with it, and a rule list that keeps several packages at once.
 *
 * The fields are ordinary preferences, so the existing settings screen stores them without any new
 * code path; [dev.custom.gboardpatches.keyboard.AppProfileRuntime] reads the same three keys when
 * the keyboard activates, which is what makes a rule here live. An empty package field means "no
 * rule", so the feature can be turned off from the same screen that turns it on.
 */
val appProfileSettingsPatch = resourcePatch(
    description = "Adds the per-app profile package field and stack of toggles to Gboard " +
        "Preferences, so a profile rule can be created from the keyboard's own settings.",
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true),
            ),
        ),
    )

    execute {
        // The lists below are the only fields that need resources: a ListPreference reads its
        // entries from string arrays, and Gboard ships its values as resources.arsc entries.
        decode("res/values*/*.xml")
        if (!get(ARRAYS_XML).isFile) {
            get(ARRAYS_XML).writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources/>\n")
        }
        document(ARRAYS_XML).use(::addAppProfileArrays)
        val document = document(SETTING_PREFERENCES_XML)
        try {
            applyAppProfileSettings(document)
        } finally {
            document.close()
        }
    }
}

/** The two choices and the heights they offer, as Gboard-readable string arrays. */
internal fun addAppProfileArrays(arrays: Document) {
    val root = arrays.documentElement ?: return
    fun array(name: String, items: List<String>) = arrays.createElement("string-array").apply {
        setAttribute("name", name)
        items.forEach { item -> appendChild(arrays.createElement("item").apply { textContent = item }) }
    }
    fun has(name: String) = root.getElementsByTagName("string-array").let { nodes ->
        (0 until nodes.length).any { (nodes.item(it) as Element).getAttribute("name") == name }
    }
    if (!has("morphe_app_profile_theme_entries")) {
        root.appendChild(array("morphe_app_profile_theme_entries", THEME_ENTRIES))
        root.appendChild(array("morphe_app_profile_theme_values", THEME_VALUES))
        root.appendChild(array("morphe_app_profile_height_entries", HEIGHT_ENTRIES))
        root.appendChild(array("morphe_app_profile_height_values", HEIGHT_VALUES))
    }
}

internal fun applyAppProfileSettings(document: Document) {
    val root = document.documentElement ?: return
    if (findByKey(root, PREF_KEY_APP_PROFILE_PACKAGE) != null) {
        return
    }

    val category = document.createElement("androidx.preference.PreferenceCategory").apply {
        setAndroidAttribute("title", "Per-app profiles")
        setAndroidAttribute("key", PREF_KEY_APP_PROFILE_CATEGORY)
        setAndroidAttribute("persistent", "false")
    }

    category.appendChild(
        document.createElement("EditTextPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "App package")
            setAndroidAttribute(
                "summary",
                "Rule for the app you are using. Leave empty to turn profiles off. " +
                    "com.example matches one app, com.example* matches every app starting " +
                    "with it, and #text, #email, #url, #number, #phone, #date, #time, " +
                    "#datetime, #secure (a password or PIN field) or #terminal (a field with no " +
                    "type, such as a terminal prompt; #other still matches it too) can follow the " +
                    "package to limit the rule " +
                    "to that kind of field. A rule that names a field class also keeps " +
                    "suggestions off there, and keeps a #secure or #terminal field out of " +
                    "learning too; email, URL and the numeric pad areas keep learning.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_PACKAGE)
            setAndroidAttribute("defaultValue", "")
        },
    )

    category.appendChild(
        document.createElement("SwitchPreferenceCompat").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Incognito (no learning)")
            setAndroidAttribute(
                "summary",
                "For the app above: Gboard stops learning from what you type there and keeps " +
                    "it out of the personal dictionary and clipboard history.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_INCOGNITO)
            setAndroidAttribute("defaultValue", "false")
        },
    )

    category.appendChild(
        document.createElement("SwitchPreferenceCompat").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "No suggestions")
            setAndroidAttribute(
                "summary",
                "For the app above: the suggestion strip stays empty while that app is in focus.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_NO_SUGGESTIONS)
            setAndroidAttribute("defaultValue", "false")
        },
    )

    // A toolbar order is picked, not typed: this opens Gboard's own screen, whose editor writes
    // access_points_showing_order - the same preference the profile writes through mog.p.
    category.appendChild(
        document.createElement("PreferenceScreen").apply {
            setAndroidAttribute("persistent", "false")
            setAndroidAttribute("title", "Toolbar order")
            setAndroidAttribute(
                "summary",
                "Opens Gboard's own screen for the toolbar keys and the keyboard height. The " +
                    "order Gboard keeps there (access_points_showing_order) is the order this app " +
                    "uses unless you give it a different one below.",
            )
            setAndroidAttribute("fragment", TOOLBAR_SETTINGS_FRAGMENT)
        },
    )

    category.appendChild(
        document.createElement("EditTextPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Toolbar order for this app")
            setAndroidAttribute(
                "summary",
                "For the app above: the toolbar keys to show, in order, separated by ; " +
                    "(for example emoji;clipboard;search). Written through Gboard's own toolbar " +
                    "editor, so the stock toolbar settings show the same order. Leave empty to " +
                    "keep the toolbar as it is.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_TOOLBAR)
            setAndroidAttribute("defaultValue", "")
        },
    )

    category.appendChild(
        document.createElement("ListPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Theme")
            setAndroidAttribute(
                "summary",
                "For the app above: the theme Gboard uses there, stored in Gboard's own " +
                    "additional_keyboard_theme preference. A height chosen below replaces it, " +
                    "because Gboard keeps the theme and the height in that one preference.",
            )
            setAndroidAttribute("dialogTitle", "Theme for this app")
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_THEME)
            setAndroidAttribute("defaultValue", "")
            setAndroidAttribute("entries", "@array/morphe_app_profile_theme_entries")
            setAndroidAttribute("entryValues", "@array/morphe_app_profile_theme_values")
        },
    )

    category.appendChild(
        document.createElement("ListPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Keyboard height")
            setAndroidAttribute(
                "summary",
                "For the app above: how tall the keyboard is, a keyboard_height theme written " +
                    "to Gboard's additional_keyboard_theme preference. Leave it on Gboard's height " +
                    "to use the height set in Gboard's own screen.",
            )
            setAndroidAttribute("dialogTitle", "Keyboard height for this app")
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_KEYBOARD_HEIGHT)
            setAndroidAttribute("defaultValue", "")
            setAndroidAttribute("entries", "@array/morphe_app_profile_height_entries")
            setAndroidAttribute("entryValues", "@array/morphe_app_profile_height_values")
        },
    )

    // Several rules at once: the list is mirrored into the rule table by the runtime, so the
    // single rule above keeps working and the two never need separate screens.
    category.appendChild(
        document.createElement("EditTextPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Saved rules")
            setAndroidAttribute(
                "summary",
                "One rule per line, package=tokens with the same tokens as above, for example:\n" +
                    "com.bank=incognito\n" +
                    "com.example*#email=no_suggestions,theme:silk:dark\n" +
                    "org.chat=toolbar:emoji;clipboard,height:keyboard_height_47_mm\n" +
                    "A package on its own line, without =, clears that rule. Keep as many rules " +
                    "here as you need; the single rule above still works for its own app.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_SAVED_RULES)
            setAndroidAttribute("defaultValue", "")
        },
    )

    category.appendChild(
        document.createElement("EditTextPreference").apply {
            setAndroidAttribute("persistent", "true")
            setAndroidAttribute("title", "Remove a saved rule")
            setAndroidAttribute(
                "summary",
                "Package (or prefix) to drop from the list above. The field empties itself once " +
                    "the rule is gone.",
            )
            setAndroidAttribute("key", PREF_KEY_APP_PROFILE_REMOVE_RULE)
            setAndroidAttribute("defaultValue", "")
        },
    )

    val footer = allElements(root).firstOrNull { it.tagName.endsWith("FooterPreference") }
    if (footer != null && footer.parentNode === root) {
        root.insertBefore(category, footer)
    } else {
        root.appendChild(category)
    }
}

private fun allElements(root: Element): List<Element> {
    val found = mutableListOf<Element>()
    fun walk(node: Element) {
        found.add(node)
        val children = node.childNodes
        for (index in 0 until children.length) {
            val child = children.item(index)
            if (child is Element) walk(child)
        }
    }
    walk(root)
    return found
}

private fun findByKey(root: Element, key: String): Element? =
    allElements(root).firstOrNull { it.getAndroidAttribute("key") == key }

private fun Element.getAndroidAttribute(localName: String): String {
    val namespaced = getAttributeNS(ANDROID_NS, localName)
    if (namespaced.isNotEmpty()) return namespaced
    val direct = getAttribute("android:$localName")
    if (direct.isNotEmpty()) return direct
    for (index in 0 until attributes.length) {
        val attribute = attributes.item(index)
        if (attribute.localName == localName || attribute.nodeName.substringAfterLast(':') == localName) {
            return attribute.nodeValue ?: ""
        }
    }
    return ""
}

private fun Element.setAndroidAttribute(localName: String, value: String) {
    setAttributeNS(ANDROID_NS, "android:$localName", value)
}