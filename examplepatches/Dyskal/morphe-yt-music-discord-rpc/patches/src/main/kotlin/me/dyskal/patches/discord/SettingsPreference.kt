package me.dyskal.patches.discord

import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

internal const val ADD_ON_PREFERENCES = "morphe_addon_prefs.xml"
internal const val MORPHE_TEXT_PREFERENCE = "app.morphe.extension.shared.settings.preference.ResettableEditTextPreference"
internal const val MORPHE_LIST_PREFERENCE = "app.morphe.extension.shared.settings.preference.CustomDialogListPreference"
private object ResourceAnchor
internal fun discordNoticesText(): String = requireNotNull(
    ResourceAnchor.javaClass.getResourceAsStream("/discord/notices.txt")
) { "Missing bundled Discord notices" }.bufferedReader(Charsets.UTF_8).use { it.readText() }

/** Reuse Morphe's themed components through the official add-on merge. */
internal fun addDiscordPreferences(document: Document) {
    val root = document.documentElement
    require(root.tagName == "morphe-add-on-preferences") { "Unexpected Morphe add-on declaration root" }
    val alreadyAdded = document.getElementsByTagName("PreferenceScreen")
    if ((0 until alreadyAdded.length).any {
        (alreadyAdded.item(it) as Element).getAttribute("android:key") == "dyskal_discord_rpc_settings"
    }) return

    val template = requireNotNull(ResourceAnchor.javaClass.getResourceAsStream("/discord/preferences.xml")) {
        "Missing bundled Discord preferences"
    }.use {
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(it)
    }
    root.appendChild(document.importNode(template.documentElement, true))
}
