package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val THEME_ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val THEME_SETTINGS_XML = "res/xml/setting_gesture.xml"
private const val THEME_MANIFEST = "AndroidManifest.xml"
private const val THEME_ACTIVITY = "dev.custom.gboardpatches.ui.KeyboardThemeStudioActivity"
private const val THEME_PREF_KEY = "pref_key_gboard_theme_studio"

val gboardThemeStudioSettingsPatch = resourcePatch(
    description = "Adds the native Gboard Theme Builder entry and activity."
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )

    execute {
        val settings = document(THEME_SETTINGS_XML)
        try {
            applyKeyboardIconPackSettings(settings)
            addThemeStudioPreference(settings)
        } finally {
            settings.close()
        }

        // The import activity is registered by keyboardIconPackSettingsPatch; registering it
        // here too would emit a duplicate <activity> element, which the package manager rejects.
        val manifest = document(THEME_MANIFEST)
        try {
            addThemeStudioActivity(manifest)
        } finally {
            manifest.close()
        }
    }
}

private fun addThemeStudioPreference(document: Document) {
    val root = document.documentElement ?: error("Gboard settings XML has no root element.")
    if (root.hasThemeStudioPreference()) return

    val category = document.createElement("androidx.preference.PreferenceCategory").apply {
        setAttributeNS(THEME_ANDROID_NS, "android:title", "Keyboard Themes")
    }
    category.appendChild(
        document.createElement("Preference").apply {
            setAttributeNS(THEME_ANDROID_NS, "android:persistent", "false")
            setAttributeNS(THEME_ANDROID_NS, "android:title", "Open Theme Builder")
            setAttributeNS(
                THEME_ANDROID_NS,
                "android:summary",
                "Create native themes, import compatible packages, and customize keys"
            )
            setAttributeNS(THEME_ANDROID_NS, "android:key", THEME_PREF_KEY)
        }
    )
    root.appendChild(category)
}

private fun Element.hasThemeStudioPreference(): Boolean {
    if (getAttributeNS(THEME_ANDROID_NS, "key") == THEME_PREF_KEY) return true
    val children = childNodes
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (child.hasThemeStudioPreference()) return true
    }
    return false
}

private fun addThemeStudioActivity(document: Document) {
    val application = document.getElementsByTagName("application").item(0) as? Element
        ?: error("AndroidManifest.xml application element not found.")

    val activities = application.getElementsByTagName("activity")
    val alreadyRegistered = (0 until activities.length).any { index ->
        val activity = activities.item(index) as? Element
        activity?.getAttributeNS(THEME_ANDROID_NS, "name") == THEME_ACTIVITY
    }
    if (alreadyRegistered) return

    application.appendChild(
        document.createElement("activity").apply {
            setAttributeNS(THEME_ANDROID_NS, "android:name", THEME_ACTIVITY)
            setAttributeNS(THEME_ANDROID_NS, "android:exported", "false")
            setAttributeNS(
                THEME_ANDROID_NS,
                "android:theme",
                "@android:style/Theme.Material.Light.NoActionBar"
            )
        }
    )
}
