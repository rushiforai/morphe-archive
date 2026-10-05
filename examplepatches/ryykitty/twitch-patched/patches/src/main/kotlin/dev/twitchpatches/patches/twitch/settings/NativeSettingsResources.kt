package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import dev.twitchpatches.patches.twitch.shared.parseResourceXml
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val TYPOGRAPHY = "tv.twitch.android.core.ui.kit.principles.typography."
private const val ANDROID = "http://schemas.android.com/apk/res/android"

internal val nativeSettingsResourcesPatch = resourcePatch {
    execute {
        validateSettingsLayout(get("res/layout/toggle_menu_recycler_item.xml").readText(), mapOf(
            "menu_item_title" to "${TYPOGRAPHY}TitleSmall",
            "menu_item_description" to "${TYPOGRAPHY}BodySmall",
            "toggle" to "androidx.appcompat.widget.SwitchCompat",
        ), setOf("settings_section_footer"))
        validateSettingsLayout(get("res/layout/settings_section_footer.xml").readText(),
            mapOf("section_summary" to "TextView"))
        validateSettingsLayout(get("res/layout/recycler_header_item.xml").readText(),
            mapOf("header_text" to "TextView"))
        validateSettingsSymbols(get("res/values/public.xml").readText(), setOf(
            "color" to "background_base", "color" to "background_body", "color" to "text_base",
            "dimen" to "space_16", "drawable" to "ic_arrow_left",
            "style" to "Theme.Twitch.ToolBarTitle", "font" to "roobert_semibold",
        ))
    }
}

internal fun validateSettingsLayout(source: String, expected: Map<String, String>, includes: Set<String> = emptySet()) {
    val elements = parseResourceXml(source, namespaceAware = true).elements()
    expected.forEach { (id, tag) ->
        val matches = elements.filter { it.getAttributeNS(ANDROID, "id").substringAfter('/') == id }
        if (matches.size != 1 || matches.single().tagName != tag)
            throw PatchException("Native settings layout changed: expected one $tag with id/$id.")
    }
    includes.forEach { name ->
        if (elements.count { it.tagName == "include" && it.getAttribute("layout") == "@layout/$name" } != 1)
            throw PatchException("Native settings layout changed: expected one include of layout/$name.")
    }
}

internal fun validateSettingsSymbols(source: String, required: Set<Pair<String, String>>) {
    val symbols = parseResourceXml(source, namespaceAware = true).elements().filter { it.tagName == "public" }
        .map { it.getAttribute("type") to it.getAttribute("name") }.toSet()
    val missing = required - symbols
    if (missing.isNotEmpty()) throw PatchException("Native settings resources missing: ${missing.joinToString { "${it.first}/${it.second}" }}.")
}

private fun Document.elements(): List<Element> {
    val nodes = getElementsByTagName("*")
    return (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
}
