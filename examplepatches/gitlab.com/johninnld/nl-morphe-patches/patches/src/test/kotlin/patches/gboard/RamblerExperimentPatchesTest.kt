package patches.gboard

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Element

/** Mirrors the start of Gboard 18.6.3's res/xml/setting_rambler_voice_typing.xml. */
class RamblerExperimentPatchesTest {
    private val android = "http://schemas.android.com/apk/res/android"
    private val screen = """
        <PreferenceScreen xmlns:android="$android" android:title="@string/t" android:key="@string/k">
            <androidx.preference.PreferenceCategory>
                <SwitchPreferenceCompat android:key="@string/import_user_contacts" android:persistent="true"/>
                <Preference android:key="@string/rambler_dictionary"/>
            </androidx.preference.PreferenceCategory>
            <androidx.preference.PreferenceCategory>
                <Preference android:key="@string/feedback"/>
            </androidx.preference.PreferenceCategory>
        </PreferenceScreen>
    """.trimIndent()

    private fun parse(xml: String) = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
        .newDocumentBuilder().parse(xml.byteInputStream())

    @Test
    fun addsThePersistentFieldInItsOwnCardAtTheTop() {
        val document = parse(screen)
        addCustomInstructionPreference(document)
        val categories = document.getElementsByTagName("androidx.preference.PreferenceCategory")
        assertEquals(3, categories.length)
        val category = categories.item(0) as Element
        val children = (0 until category.childNodes.length).map(category.childNodes::item).filterIsInstance<Element>()
        assertEquals(1, children.size)
        val first = children.single()
        assertEquals("EditTextPreference", first.tagName)
        assertEquals(CUSTOM_INSTRUCTION_KEY, first.getAttributeNS(android, "key"))
        assertEquals("true", first.getAttributeNS(android, "persistent"))
        assertEquals("@string/morphe_rambler_custom_instruction_title", first.getAttributeNS(android, "title"))
        assertEquals(1, document.getElementsByTagName("EditTextPreference").length)
    }

    @Test
    fun refusesToAddItTwiceOrWithoutACategory() {
        val document = parse(screen)
        addCustomInstructionPreference(document)
        assertThrows(PatchException::class.java) { addCustomInstructionPreference(document) }
        val bare = parse("""<PreferenceScreen xmlns:android="$android"><Preference android:key="x"/></PreferenceScreen>""")
        assertThrows(PatchException::class.java) { addCustomInstructionPreference(bare) }
    }
}
