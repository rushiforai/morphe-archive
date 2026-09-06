package io.github.liongalahad.nuviotv.extension.settings

import java.util.Locale
import org.junit.Assert.*
import org.junit.Test

class MorpheTranslationsTest {
    @Test fun `regional languages resolve and locale changes are not cached`() {
        MorpheTranslations.register(arrayOf(arrayOf("Test setting", "Prueba", "Prova", "Test", "Essai", "Teste", "テスト", "테스트", "简体", "繁體")))
        assertEquals("Prueba", MorpheTranslations.text("Test setting", Locale.forLanguageTag("es-419")))
        assertEquals("Prova", MorpheTranslations.text("Test setting", Locale.ITALIAN))
        assertEquals("Test", MorpheTranslations.text("Test setting", Locale.GERMAN))
        assertEquals("Essai", MorpheTranslations.text("Test setting", Locale.CANADA_FRENCH))
        assertEquals("Teste", MorpheTranslations.text("Test setting", Locale.forLanguageTag("pt-BR")))
        assertEquals("Teste", MorpheTranslations.text("Test setting", Locale.forLanguageTag("pt-PT")))
        assertEquals("テスト", MorpheTranslations.text("Test setting", Locale.JAPANESE))
        assertEquals("테스트", MorpheTranslations.text("Test setting", Locale.KOREAN))
        assertEquals("简体", MorpheTranslations.text("Test setting", Locale.SIMPLIFIED_CHINESE))
        for (tag in listOf("zh-TW", "zh-HK", "zh-MO", "zh-Hant", "zh-Hant-CN")) {
            assertEquals(tag, "繁體", MorpheTranslations.text("Test setting", Locale.forLanguageTag(tag)))
        }
        assertEquals("简体", MorpheTranslations.text("Test setting", Locale.forLanguageTag("zh-Hans-HK")))
        assertEquals("Test setting", MorpheTranslations.text("Test setting", Locale.forLanguageTag("sv")))
        assertEquals("Morphe", MorpheTranslations.text("Morphe", Locale.ITALIAN))
    }

    @Test fun `registration copies arrays so a provider cannot mutate another lookup`() {
        val row = arrayOf("Immutable setting", "ES", "IT", "DE", "FR", "PT", "JA", "KO", "ZH", "HANT")
        MorpheTranslations.register(arrayOf(row))
        row[2] = "changed"
        assertEquals("IT", MorpheTranslations.text("Immutable setting", Locale.ITALIAN))
    }
}
