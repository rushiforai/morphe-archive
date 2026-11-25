package patches.gboard

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Mirrors Gboard 18.6.3's Rambler, older Rambler and Voice typing settings screens. */
class VoiceDictionarySettingsTest {
    private val android = "http://schemas.android.com/apk/res/android"
    private fun flag(value: String) = """<extra android:name="hide_if_flag_is_false" android:value="$value"/>"""
    private val rambler = """
        <PreferenceScreen xmlns:android="$android" android:title="@string/rambler" android:key="@string/header">
            <androidx.preference.PreferenceCategory>
                <EditTextPreference android:key="pref_key_rambler_custom_instruction"/>
                <SwitchPreferenceCompat android:icon="@drawable/contacts" android:key="@string/import_user_contacts">${flag("show_rambler_dict_settings=false")}</SwitchPreferenceCompat>
                <com.google.android.apps.inputmethod.latin.preference.OverrideFlagPreference android:key="enable_user_contact_biasing=false">${flag("show_personal_dict_biasing_settings_toggle=false")}</com.google.android.apps.inputmethod.latin.preference.OverrideFlagPreference>
                <Preference android:icon="@drawable/list" android:key="@string/rambler_dictionary" android:fragment="com.google.android.apps.inputmethod.latin.preference.VoiceCorrectionListFragment">${flag("show_rambler_dict_settings=false")}</Preference>
                <Preference android:key="@string/clear_all">${flag("show_clear_all_corrected_words_settings=false")}</Preference>
            </androidx.preference.PreferenceCategory>
            <androidx.preference.PreferenceCategory>
                <Preference android:key="@string/pref_key_jetson_feedback"/>
            </androidx.preference.PreferenceCategory>
            <com.android.settingslib.widget.FooterPreference android:title="@string/footer" android:key="rambler_voice_typing_footer">${flag("show_rambler_dict_settings=false")}</com.android.settingslib.widget.FooterPreference>
        </PreferenceScreen>
    """.trimIndent()
    private val older = """
        <PreferenceScreen xmlns:android="$android" android:title="@string/rambler" android:key="@string/header">
            <Preference android:key="@string/clear_all"/>
            <androidx.preference.PreferenceCategory><Preference android:key="@string/pref_key_jetson_feedback"/></androidx.preference.PreferenceCategory>
        </PreferenceScreen>
    """.trimIndent()
    private val voice = """
        <PreferenceScreen xmlns:android="$android">
            <ColoredBackgroundSwitchPreference android:key="@string/enable_voice_input"/>
            <Preference android:key="morphe_parakeet_voice_typing"/>
            <PreferenceCategory android:title="@string/dictation_type"><Preference android:key="@string/dictation_type_jetson"/></PreferenceCategory>
            <PreferenceCategory><SwitchPreferenceCompat android:key="@string/use_bluetooth_mic"/></PreferenceCategory>
        </PreferenceScreen>
    """.trimIndent()

    private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        .newDocumentBuilder().parse(xml.byteInputStream())
    private fun Element.children() = (0 until childNodes.length).map(childNodes::item).filterIsInstance<Element>()
    private fun Element.key() = getAttributeNS(android, "key")

    @Test
    fun movesTheDictionaryEntriesAndKeepsCustomInstructionsUnderRambler() {
        val ramblerScreen = parse(rambler)
        val dictionary = parse(older)
        moveDictionaryEntries(ramblerScreen, dictionary)

        val left = ramblerScreen.documentElement.children()
        assertEquals(listOf("androidx.preference.PreferenceCategory", "androidx.preference.PreferenceCategory"), left.map { it.tagName })
        assertEquals(listOf("pref_key_rambler_custom_instruction"), left[0].children().map { it.key() })
        assertEquals(listOf("@string/pref_key_jetson_feedback"), left[1].children().map { it.key() })

        val root = dictionary.documentElement
        assertEquals(VOICE_DICTIONARY_KEY, root.key())
        assertEquals("@string/morphe_voice_dictionary_title", root.getAttributeNS(android, "title"))
        val (category, footer) = root.children()
        assertEquals(
            listOf("@string/import_user_contacts", "enable_user_contact_biasing=false", "@string/rambler_dictionary", "@string/clear_all"),
            category.children().map { it.key() },
        )
        assertEquals("@string/morphe_voice_dictionary_footer", footer.getAttributeNS(android, "title"))
    }

    @Test
    fun dropsTheEmptiedCategoryWithoutCustomInstructions() {
        val ramblerScreen = parse(rambler.replace("""<EditTextPreference android:key="pref_key_rambler_custom_instruction"/>""", ""))
        moveDictionaryEntries(ramblerScreen, parse(older))
        val left = ramblerScreen.documentElement.children()
        assertEquals(1, left.size)
        assertEquals(listOf("@string/pref_key_jetson_feedback"), left[0].children().map { it.key() })
    }

    @Test
    fun refusesWhenTheCorrectionListIsGone() {
        val withoutList = rambler.replace("VoiceCorrectionListFragment", "SomethingElse")
        assertThrows(PatchException::class.java) { moveDictionaryEntries(parse(withoutList), parse(older)) }
    }

    @Test
    fun addsTheEntryAboveDictationTypeWithItsScreenExtra() {
        val screen = parse(voice)
        addVoiceDictionaryEntry(screen, "@drawable/list")
        val children = screen.documentElement.children()
        assertEquals(VOICE_DICTIONARY_KEY, children[2].key())
        assertEquals("@string/dictation_type", children[3].getAttributeNS(android, "title"))
        val entry = children[2]
        assertTrue(entry.getAttributeNS(android, "fragment").endsWith(".JetsonVoiceSettingsFragment"))
        assertEquals("@drawable/list", entry.getAttributeNS(android, "icon"))
        val extra = entry.children().single()
        assertEquals(SCREEN_EXTRA, extra.getAttributeNS(android, "name"))
        assertEquals(SCREEN_VOICE_DICTIONARY, extra.getAttributeNS(android, "value"))
        assertThrows(PatchException::class.java) { addVoiceDictionaryEntry(screen, "") }
    }
}
