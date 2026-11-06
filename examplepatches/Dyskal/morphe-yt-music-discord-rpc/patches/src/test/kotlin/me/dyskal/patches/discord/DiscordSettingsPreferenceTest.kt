package me.dyskal.patches.discord

import org.w3c.dom.Element
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class DiscordSettingsPreferenceTest {
    @Test
    fun `add-on declaration targets Morphe Misc and uses its themed preference components`() {
        val xml = """<morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android"><screen key="other"><Preference android:key="other_addon"/></screen></morphe-add-on-preferences>"""
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(xml.toByteArray()))
        addDiscordPreferences(document)
        assertEquals(2, document.documentElement.childNodes.length)
        val target = document.documentElement.lastChild as Element
        assertEquals("morphe_settings_music_screen_9_misc", target.getAttribute("key"))
        val screen = target.getElementsByTagName("PreferenceScreen").item(0) as Element
        assertEquals("PreferenceScreen", screen.tagName)
        assertEquals("dyskal_discord_rpc_settings", screen.getAttribute("android:key"))
        assertEquals(1, screen.getElementsByTagName(MORPHE_TEXT_PREFERENCE).length)
        assertEquals(0, screen.getElementsByTagName("EditTextPreference").length)
        assertEquals(1, screen.getElementsByTagName("SwitchPreference").length)
        assertEquals(1, screen.getElementsByTagName(MORPHE_LIST_PREFERENCE).length)
        assertEquals(0, screen.getElementsByTagName("ListPreference").length)
        assertEquals(0, screen.getElementsByTagName("intent").length)
        val rows = (0 until screen.childNodes.length).mapNotNull { screen.childNodes.item(it) as? Element }
        assertEquals(listOf("application_id", "connect", "cancel", "enabled", "headline", "disconnect", "about", "status")
            .map { "dyskal_discord_$it" }, rows.map { it.getAttribute("android:key") })
        assertTrue(rows.all { it.getAttribute("android:title").isNotEmpty() })
        assertEquals("number", rows.first().getAttribute("android:inputType"))
        assertEquals("Discord application ID", rows.first().getAttribute("android:dialogTitle"))
        assertEquals("false", rows.last().getAttribute("android:selectable"))
        for (i in 0 until screen.childNodes.length) {
            val row = screen.childNodes.item(i) as? Element ?: continue
            assertEquals("false", row.getAttribute("android:persistent"))
        }
        addDiscordPreferences(document)
        assertEquals(2, document.documentElement.childNodes.length)
        assertEquals("other_addon", ((document.documentElement.firstChild as Element).firstChild as Element).getAttribute("android:key"))
    }

    @Test
    fun `unexpected declaration schema fails clearly`() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
            .parse(ByteArrayInputStream("<resources/>".toByteArray()))
        assertFailsWith<IllegalArgumentException> { addDiscordPreferences(document) }
    }
}
