package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.PatchException
import javax.xml.parsers.DocumentBuilder
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.parsers.ParserConfigurationException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test
import org.xml.sax.SAXParseException

class ResourceXmlTest {
    private class AndroidFactory : DocumentBuilderFactory() {
        var builders = 0

        override fun newDocumentBuilder(): DocumentBuilder {
            builders++
            return newInstance().apply { isNamespaceAware = this@AndroidFactory.isNamespaceAware }
                .newDocumentBuilder()
        }

        override fun setFeature(name: String, value: Boolean) {
            throw ParserConfigurationException(name)
        }

        override fun getFeature(name: String): Boolean = throw ParserConfigurationException(name)
        override fun setAttribute(name: String, value: Any) = throw IllegalArgumentException(name)
        override fun getAttribute(name: String): Any = throw IllegalArgumentException(name)
    }

    @Test fun `parses resources when desktop parser flags are unavailable`() {
        val factory = AndroidFactory()
        assertThrows(ParserConfigurationException::class.java) {
            factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        }
        val document = parseResourceXml("""<resources><public type="id" name="toggle" id="0x7f010001"/></resources>""",
            factory = factory)
        assertEquals("toggle", document.getElementsByTagName("public").item(0).attributes.getNamedItem("name").nodeValue)
    }

    @Test fun `preserves namespaced settings and qualified layout attributes`() {
        val source = """<TextView xmlns:android="http://schemas.android.com/apk/res/android" android:id="@id/title"/>"""
        val settings = parseResourceXml(source, true, AndroidFactory()).documentElement
        assertEquals("@id/title", settings.getAttributeNS("http://schemas.android.com/apk/res/android", "id"))
        val layout = parseResourceXml(source, false, AndroidFactory()).documentElement
        assertEquals("@id/title", layout.getAttribute("android:id"))
    }

    @Test fun `rejects DTD and entity declarations before creating a parser`() {
        for (source in listOf(
            """<!DOCTYPE resources SYSTEM "https://example.invalid/resource.dtd"><resources/>""",
            """<!DOCTYPE resources [<!ENTITY content SYSTEM "file:///private">]><resources>&content;</resources>""",
            """<!DOCTYPE resources [<!ENTITY content "value">]><resources>&content;</resources>""",
            """<!ENTITY content "value"><resources/>""",
        )) {
            val factory = AndroidFactory()
            assertThrows(PatchException::class.java) { parseResourceXml(source, factory = factory) }
            assertEquals(0, factory.builders)
        }
    }

    @Test fun `accepts predefined escapes and rejects malformed XML`() {
        assertEquals("A & B", parseResourceXml("<string>A &amp; B</string>", factory = AndroidFactory()).documentElement.textContent)
        assertThrows(SAXParseException::class.java) { parseResourceXml("<resources>", factory = AndroidFactory()) }
    }
}
