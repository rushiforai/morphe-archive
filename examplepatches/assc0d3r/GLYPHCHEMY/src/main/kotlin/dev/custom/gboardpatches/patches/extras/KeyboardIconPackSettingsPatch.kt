package dev.custom.gboardpatches.patches.extras

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ICON_ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val ICON_SETTINGS_XML = "res/xml/setting_gesture.xml"

val keyboardIconPackSettingsPatch = resourcePatch(
    description = "Removes the dead icon-pack settings entries (the importer lives in Theme Builder)."
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = "18.8.0.1022711984-beta-arm64-v8a"),
                AppTarget(version = "18.8.1.1022711984-beta-arm64-v8a"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )

    execute {
        val settings = document(ICON_SETTINGS_XML)
        try {
            applyKeyboardIconPackSettings(settings)
        } finally {
            settings.close()
        }
    }
}

internal fun applyKeyboardIconPackSettings(document: Document) {
    val root = document.documentElement ?: return
    removeLegacyIconPackPreferences(root)
}

private fun removeLegacyIconPackPreferences(parent: Element) {
    val children = parent.childNodes
    for (index in children.length - 1 downTo 0) {
        val child = children.item(index) as? Element ?: continue
        val key = child.getAttributeNS(ICON_ANDROID_NS, "key")
        if (key == "pref_key_keyboard_icons_enabled" || key == "pref_key_keyboard_icon_pack_import") {
            parent.removeChild(child)
            continue
        }
        removeLegacyIconPackPreferences(child)
        if (
            child.tagName.endsWith("PreferenceCategory") &&
            child.getAttributeNS(ICON_ANDROID_NS, "title") == "Keyboard Icon Packs" &&
            !child.hasElementChildren()
        ) {
            parent.removeChild(child)
        }
    }
}

private fun Element.hasElementChildren(): Boolean {
    val children = childNodes
    for (index in 0 until children.length) {
        if (children.item(index) is Element) return true
    }
    return false
}
