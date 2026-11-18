package patches.gboard

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Element

class RamblerSilenceStopPatchTest {
    private val android = "http://schemas.android.com/apk/res/android"
    private fun parse(xml: String) = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        .newDocumentBuilder().parse(xml.byteInputStream())
    private fun Element.children() = (0 until childNodes.length).map(childNodes::item).filterIsInstance<Element>()

    @Test
    fun addsTheChoiceInItsOwnCardAboveHelp() {
        val screen = parse("""
            <PreferenceScreen xmlns:android="$android">
                <androidx.preference.PreferenceCategory><EditTextPreference android:key="pref_key_rambler_custom_instruction"/></androidx.preference.PreferenceCategory>
                <androidx.preference.PreferenceCategory><Preference android:key="@string/feedback"/></androidx.preference.PreferenceCategory>
                <com.android.settingslib.widget.FooterPreference android:key="rambler_voice_typing_footer"/>
            </PreferenceScreen>
        """.trimIndent())
        addSilenceStopPreference(screen)
        val cards = screen.documentElement.children()
        assertEquals(4, cards.size)
        val choice = cards[1].children().single()
        assertEquals("ListPreference", choice.tagName)
        assertEquals(SILENCE_KEY, choice.getAttributeNS(android, "key"))
        assertEquals("3", choice.getAttributeNS(android, "defaultValue"))
        assertEquals("@string/feedback", cards[2].children().single().getAttributeNS(android, "key"))
        assertThrows(PatchException::class.java) { addSilenceStopPreference(screen) }
    }

    @Test
    fun addsMatchingEntriesAndValues() {
        val arrays = parse("<resources/>")
        addSilenceStopArrays(arrays)
        val (entries, values) = arrays.documentElement.children()
        assertEquals("morphe_rambler_silence_entries", entries.getAttribute("name"))
        assertEquals(listOf("0", "3", "5", "8", "10"), values.children().map { it.textContent })
        assertEquals(values.children().size, entries.children().size)
        assertEquals("@string/morphe_rambler_silence_off", entries.children().first().textContent)
    }
}
