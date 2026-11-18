package app.afterglow.patches.morphe

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val UPSTREAM_SETTINGS_KEY = "morphe_settings_root"
private const val AFTERGLOW_SETTINGS_KEY = "ytafterglow_settings"
private const val ADDITIONAL_FEATURES_TITLE = "Additional features"
internal var morpheSettingsBridgeRequested = false

/**
 * Upstream addResourcesPatch depends on this helper. Patcher finalizes in reverse
 * execution order, so this finalizer sees completed upstream preference XML and strings.
 * Keep this in a separate file from the main bridge: initializing upstream resources
 * must not initialize a bridge that depends back on upstream settings.
 */
internal val morpheSettingsBridgeResourcesPatch = resourcePatch {
    execute {
        // The bundle can be reused to patch another APK in the same host process.
        morpheSettingsBridgeRequested = false
    }
    finalize {
        if (morpheSettingsBridgeRequested) {
            var settingsFiles = 0
            for (path in listOf("res/xml/settings_fragment.xml", "res/xml/settings_fragment_cairo.xml")) {
                if (!get(path, false).exists()) continue
                document(path).use { document -> removeUpstreamSettingsEntry(document) }
                settingsFiles++
            }
            require(settingsFiles > 0) { "No native settings file for the Afterglow settings bridge" }

            // Upstream owns all feature resources and controls. Rename only the titles,
            // leaving its About screen, credits and notices intact.
            var titles = 0
            get("res", false).listFiles().orEmpty()
                .filter { it.isDirectory && it.name.startsWith("values") }
                .forEach { directory ->
                    val path = "res/${directory.name}/strings.xml"
                    if (get(path, false).exists()) document(path).use { document ->
                        titles += renameUpstreamSettingsTitles(document)
                    }
                }
            require(titles >= 2) { "Missing upstream settings title resources" }
        }
    }
}

/** Remove only upstream's root shortcut, preserving the Afterglow row and native settings. */
internal fun removeUpstreamSettingsEntry(document: Document) {
    val all = document.getElementsByTagName("*")
    val entries = (0 until all.length).mapNotNull { all.item(it) as? Element }
    require(entries.count { it.getAttribute("android:key") == AFTERGLOW_SETTINGS_KEY } == 1) {
        "Expected exactly one Afterglow settings entry before removing the upstream shortcut"
    }
    val shortcuts = entries.filter { it.getAttribute("android:key") == UPSTREAM_SETTINGS_KEY }
    require(shortcuts.size == 1) { "Expected exactly one upstream settings shortcut" }
    shortcuts.forEach { entry ->
        val parent = entry.parentNode
        parent.removeChild(entry)
        if (parent is Element && parent.tagName.endsWith("PreferenceCategory")
            && parent.getAttribute("android:title") == "@string/morphe_settings_title"
            && (0 until parent.childNodes.length).none { parent.childNodes.item(it) is Element }) {
            parent.parentNode.removeChild(parent)
        }
    }
}

internal fun renameUpstreamSettingsTitles(document: Document): Int {
    val strings = document.getElementsByTagName("string")
    var changed = 0
    for (index in 0 until strings.length) {
        val string = strings.item(index) as Element
        if (string.getAttribute("name") in setOf("morphe_settings_title", "morphe_settings_submenu_title")) {
            string.textContent = ADDITIONAL_FEATURES_TITLE
            changed++
        }
    }
    return changed
}
