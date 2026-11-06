package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.ResourcePatchContext
import dev.twitchpatches.patches.twitch.shared.*
import org.w3c.dom.Element
import org.w3c.dom.Document
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import java.io.StringWriter

internal val uiResourceIds = mutableMapOf<String, Long>()
internal val uiViewTypes = linkedMapOf<String, String>()
private const val VIEW_PACKAGE = "dev.twitchpatches.extension.ui.views."

internal fun ResourcePatchContext.prepareUiViewResources() {
    uiResourceIds.clear()
    uiViewTypes.clear()
    val symbols = parseResourceXml(get("res/values/public.xml").readText()).getElementsByTagName("public")
    for (index in 0 until symbols.length) {
        val symbol = symbols.item(index) as Element
        uiResourceIds[symbol.getAttribute("type") + "/" + symbol.getAttribute("name")] =
            symbol.getAttribute("id").removePrefix("0x").toLong(16)
    }
    val layouts = mapOf(
        "player_control_overlay" to mapOf("create_clip_text_button" to "classic_controls_hide_clip",
            "cast_button" to "classic_controls_hide_cast", "share_button" to "classic_controls_hide_share"),
        "player_control_overlay_widget" to mapOf("create_clip_button_compose_view" to "classic_controls_hide_clip",
            "media_route_button" to "classic_controls_hide_cast", "share_button" to "classic_controls_hide_share"),
        "profile_card_no_divider" to mapOf("subscribe_button" to "classic_support_hide_subscribe"),
        "follow_subscribe_button_view" to mapOf("sub_button_container" to "classic_support_hide_subscribe"),
        "one_chat_layout" to mapOf("bits_button" to "classic_support_hide_bits",
            "one_chat_hype_train_landscape_container" to "hide_hype_trains"),
        "player_metadata_view_extended" to mapOf("extended_subscribe_button_container" to "classic_support_hide_subscribe"),
        "bottom_player_control_overlay_widget" to mapOf("subscribe_button_container" to "classic_support_hide_subscribe"),
        "player_view" to mapOf("theatre_overlay_subscribe_button_container" to "classic_support_hide_subscribe"),
        "chat_header" to mapOf("extension_button_container" to "hide_channel_extensions", "leaderboards_icon" to "hide_leaderboards"),
        "chat_view_delegate" to mapOf("leaderboards_extensions_container" to "hide_channel_extensions",
            "leaderboards_container" to "hide_leaderboards"),
    )
    layouts.forEach { (name, controls) ->
        val file = get("res/layout/$name.xml")
        file.writeText(rewriteUiLayout(file.readText(), controls, uiViewTypes, name))
    }
    val extensions = get("res/layout/extension_entry_point_icons.xml")
    extensions.writeText(rewriteUiRoot(extensions.readText(), "hide_channel_extensions", "LinearLayout", uiViewTypes, "extension_entry_point_icons"))
    val icon = get("res/layout/extension_entry_point_single_icon.xml")
    icon.writeText(rewriteUiRoot(icon.readText(), "hide_channel_extensions", "FrameLayout", uiViewTypes, "extension_entry_point_single_icon"))
    val train = get("res/layout/hype_train_container_layout.xml")
    train.writeText(rewriteUiRoot(train.readText(), "hide_hype_trains", "FrameLayout", uiViewTypes, "hype_train_container_layout"))
}

internal fun rewriteUiLayout(source: String, controls: Map<String, String>, types: MutableMap<String, String>, name: String): String {
    val document = parseResourceXml(source)
    controls.forEach { (id, key) ->
        val nodes = document.getElementsByTagName("*")
        val element = (0 until nodes.length).map { nodes.item(it) as Element }.filter {
            it.getAttribute("android:id") == "@id/$id"
        }.uniqueHook("UI $name/$id")
        replaceUiView(document, element, key, types)
    }
    return serializeUiLayout(document)
}

internal fun rewriteUiRoot(source: String, key: String, wrapper: String, types: MutableMap<String, String>, name: String): String {
    val document = parseResourceXml(source)
    val root = document.documentElement
    require(root.tagName == if (wrapper == "FrameLayout") "FrameLayout" else "LinearLayout") { "UI settings: $name root changed." }
    replaceUiView(document, root, key, types, wrapper)
    return serializeUiLayout(document)
}

private fun replaceUiView(document: Document, element: Element, key: String, types: MutableMap<String, String>, wrapper: String? = null) {
    val base = when (element.tagName) {
        "FrameLayout", "LinearLayout", "ImageView", "ImageButton" -> "android.widget.${element.tagName}"
        else -> element.tagName
    }
    val replacement = VIEW_PACKAGE + (wrapper ?: base.substringAfterLast('.'))
    require(types[replacement] == null || types[replacement] == base) { "UI settings: conflicting view superclass for $replacement." }
    types[replacement] = base
    val view = document.createElement(replacement)
    for (index in 0 until element.attributes.length) {
        val attribute = element.attributes.item(index)
        view.setAttribute(attribute.nodeName, attribute.nodeValue)
    }
    while (element.hasChildNodes()) view.appendChild(element.firstChild)
    view.setAttribute("android:tag", "twitchpatches_ui:$key")
    element.parentNode.replaceChild(view, element)
}

private fun serializeUiLayout(document: Document): String {
    val output = StringWriter()
    TransformerFactory.newInstance().newTransformer().transform(DOMSource(document), StreamResult(output))
    return output.toString()
}
