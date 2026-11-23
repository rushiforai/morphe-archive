package patches.deezer

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Test
import org.w3c.dom.Element

class Api9AttributeTypesTest {
    private fun attribute(xml: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray())).documentElement

    @Test fun scalarAndCombinedFormatMasksArePreservedForTheNativeEncoder() {
        for (format in listOf("float", "color", "reference", "string", "integer", "boolean",
            "dimension|reference", "integer|enum", "flags")) {
            val node = attribute("<attr name=\"sample\" format=\"$format\"/>")
            api9PrepareAttribute(node, emptyMap())
            assertEquals(if (format == "boolean") "bool" else format, node.getAttribute("formats"))
            assertFalse(node.hasAttribute("format"))
        }
    }

    @Test fun enumAndFlagIdsAreRelocatedWithoutChangingTheirNumericValues() {
        val node = attribute("""<attr name="sample" format="integer">
            <enum name="normal" value="0"/><flag name="bold" value="0x2"/>
        </attr>""")
        api9PrepareAttribute(node, mapOf(("id" to "normal") to "morphe_deezer_auto_normal",
            ("id" to "bold") to "morphe_deezer_auto_bold"))
        val enum = node.getElementsByTagName("enum").item(0) as Element
        val flag = node.getElementsByTagName("flag").item(0) as Element
        assertEquals("morphe_deezer_auto_normal", enum.getAttribute("name"))
        assertEquals("0", enum.getAttribute("value"))
        assertEquals("morphe_deezer_auto_bold", flag.getAttribute("name"))
        assertEquals("0x2", flag.getAttribute("value"))
        assertEquals("integer", node.getAttribute("formats"))
    }

    @Test fun conflictingDialectsFailRatherThanGuessingAType() {
        val node = attribute("<attr name=\"sample\" format=\"float\" formats=\"color\"/>")
        assertThrows(IllegalStateException::class.java) { api9PrepareAttribute(node, emptyMap()) }
    }

    @Test fun themeNormalizationTouchesParsedValuesNotTheXmlDeclaration() {
        val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(
            """<?xml version="1.0" encoding="utf-8"?><resources><style name="sample" parent="@style/parent"><item name="android:textAppearance">?android:textAppearanceButton</item></style></resources>""".toByteArray()))
        api9RewriteDocumentReferences(doc, mapOf(("style" to "parent") to "morphe_deezer_auto_parent"))
        assertEquals("1.0", doc.xmlVersion)
        assertEquals("@style/morphe_deezer_auto_parent", (doc.getElementsByTagName("style").item(0) as Element).getAttribute("parent"))
        assertEquals("?android:attr/textAppearanceButton", doc.getElementsByTagName("item").item(0).textContent)
    }
}
