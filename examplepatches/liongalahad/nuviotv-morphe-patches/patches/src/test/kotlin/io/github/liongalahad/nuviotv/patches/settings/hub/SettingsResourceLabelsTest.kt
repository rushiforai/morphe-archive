package io.github.liongalahad.nuviotv.patches.settings.hub

import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals

class SettingsResourceLabelsTest {
    @Test fun `localized Experience labels are branded and unrelated strings survive`() {
        for (qualifier in listOf("values", "values-it", "values-de", "values-fr", "values-b+es+419", "values-pt-rBR", "values-ja", "values-ko", "values-zh-rTW", "values-b+zh+Hant")) {
            val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
                ByteArrayInputStream("""<resources><string name="settings_experience">Esperienza</string><string name="settings_experience_subtitle">Old</string><string name="unrelated">Keep</string></resources>""".toByteArray()))
            SettingsResourceLabels.transform(document, qualifier, "test")
            val strings = document.getElementsByTagName("string")
            assertEquals("Morphe", strings.item(0).textContent)
            if (qualifier == "values-it") assertEquals("Impostazioni delle patch  •  test", strings.item(1).textContent)
            if (qualifier == "values-b+es+419") assertEquals("Ajustes de los parches  •  test", strings.item(1).textContent)
            if (qualifier == "values-pt-rBR") assertEquals("Definições dos patches  •  test", strings.item(1).textContent)
            if (qualifier.contains("zh")) assertEquals("修補程式設定  •  test", strings.item(1).textContent)
            assertEquals("Keep", strings.item(2).textContent)
        }
    }
}
