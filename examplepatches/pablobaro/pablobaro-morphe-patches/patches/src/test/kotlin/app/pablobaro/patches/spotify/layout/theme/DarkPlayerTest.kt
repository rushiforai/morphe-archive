package app.pablobaro.patches.spotify.layout.theme

import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class DarkPlayerTest {
    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xml.byteInputStream())

    @Test
    fun `replaces the solid color and keeps the rest of the shape`() {
        val document = parse(
            """
                <shape xmlns:android="http://schemas.android.com/apk/res/android">
                    <solid android:color="@color/gray_15"/>
                    <corners android:radius="8dp"/>
                </shape>
            """.trimIndent(),
        )

        assertTrue(document.replaceSolidColor(0xFF121212.toInt()))

        val solid = document.getElementsByTagName("solid").item(0) as Element
        val corners = document.getElementsByTagName("corners").item(0) as Element
        assertEquals("#FF121212", solid.getAttribute("android:color"))
        assertEquals("8dp", corners.getAttribute("android:radius"))
    }

    @Test
    fun `reports a shape without a solid color`() {
        assertFalse(parse("<shape><corners/></shape>").replaceSolidColor(0))
        assertFalse(parse("<shape><solid/></shape>").replaceSolidColor(0))
    }
}
