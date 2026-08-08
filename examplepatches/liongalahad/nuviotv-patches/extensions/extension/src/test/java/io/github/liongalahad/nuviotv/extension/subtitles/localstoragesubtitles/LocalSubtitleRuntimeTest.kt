package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class LocalSubtitleRuntimeTest {
    data class FakeSubtitle(
        val id: String,
        val url: String,
        val lang: String = LocalSubtitleRuntime.LOCAL_LANGUAGE_KEY,
        val addonName: String = LocalSubtitleRuntime.LOCAL_SOURCE_LABEL
    )

    class FakeRailItem(private val key: String) {
        fun a(): String = key
    }

    @Test fun `TTML metadata takes priority over filename`() {
        assertEquals(
            "it",
            LocalSubtitleRuntime.inferLanguageCode(
                "Movie.en.ttml",
                "<tt xmlns=\"http://www.w3.org/ns/ttml\" xml:lang=\"it\"><body/></tt>"
            )
        )
    }

    @Test fun `ASS declared language is detected`() {
        assertEquals(
            "en",
            LocalSubtitleRuntime.inferLanguageCode(
                "subtitle.ass",
                "[Script Info]\nLanguage: eng\n[V4+ Styles]"
            )
        )
    }

    @Test fun `language tokens are inferred conservatively from filenames`() {
        assertEquals("en", LocalSubtitleRuntime.inferLanguageCode("Movie.Name.en.srt", ""))
        assertEquals("it", LocalSubtitleRuntime.inferLanguageCode("Movie_Name_ita.vtt", ""))
        assertEquals("en", LocalSubtitleRuntime.inferLanguageCode("Movie.Name (eng-hi).srt", ""))
        assertEquals(
            "und",
            LocalSubtitleRuntime.inferLanguageCode(
                "Widows.Bay.S01E02.1080p.WEB.h264-GRACE (SDH).srt",
                "They're so beautiful, Tom."
            )
        )
        assertEquals(
            "und",
            LocalSubtitleRuntime.inferLanguageCode(
                "Widows.Bay.S01E02.1080p.WEB.h264-GRACE.srt",
                "They're so beautiful, Tom."
            )
        )
    }

    @Test fun `explicit metadata can still declare Southern Kurdish`() {
        assertEquals(
            "sdh",
            LocalSubtitleRuntime.inferLanguageCode(
                "subtitle.srt",
                "Language: sdh\n"
            )
        )
    }

    @Test fun `import refresh epoch advances`() {
        LocalSubtitleRefreshState.resetForTests()
        val before = LocalSubtitleRefreshState.observe()

        LocalSubtitleRefreshState.invalidate()

        assertEquals(before + 1, LocalSubtitleRefreshState.observe())
    }

    @Test fun `pending import refresh rebuilds the frozen addon session list once`() {
        val field = LocalSubtitleRuntime::class.java.getDeclaredField("sessionAddonListRefreshPending")
        field.isAccessible = true
        field.setBoolean(null, true)

        assertTrue(LocalSubtitleRuntime.refreshSessionAddonList(false))
        assertFalse(LocalSubtitleRuntime.refreshSessionAddonList(false))
        assertTrue(LocalSubtitleRuntime.refreshSessionAddonList(true))
    }

    @Test fun `local UI labels preserve SDH and expose only the filename`() {
        val subtitle = FakeSubtitle(
            id = "en\nMovie.Name.en.srt",
            url = "file:///data/user/0/com.nuvio.tv/cache/Movie.Name.en.srt"
        )

        assertEquals("Local Storage", LocalSubtitleRuntime.rewriteLanguageLabel("!LOCAL", "!local"))
        assertEquals("English", LocalSubtitleRuntime.rewriteOptionTitle("!LOCAL", subtitle))
        assertEquals("English SDH", LocalSubtitleRuntime.rewriteOptionTitle("!LOCAL SDH", subtitle))
        assertEquals("Movie.Name.en.srt", LocalSubtitleRuntime.rewriteOptionMeta(subtitle.id, subtitle))
        assertEquals("en", LocalSubtitleRuntime.playbackLanguage("!local", subtitle))
        assertEquals(2, LocalSubtitleRuntime.adjustLanguageCount("!local", 3))
    }

    @Test fun `picker action is not treated as an imported subtitle`() {
        val action = FakeSubtitle(id = "!local", url = "")
        val imported = FakeSubtitle(id = "und\nMovie.srt", url = "file:///private/Movie.srt")

        assertEquals("Choose subtitle file", LocalSubtitleRuntime.rewriteOptionTitle("!LOCAL", action))
        assertEquals("", LocalSubtitleRuntime.rewriteOptionMeta(action.id, action))
        assertFalse(LocalSubtitleRuntime.isImportedSubtitle(action))
        assertFalse(LocalSubtitleRuntime.selectableOptionState(true, action))
        assertTrue(LocalSubtitleRuntime.selectableOptionState(true, imported))
        assertFalse(LocalSubtitleRuntime.selectableOptionState(false, imported))
    }

    @Test fun `local storage is placed directly after none`() {
        val none = FakeRailItem("__off__")
        val english = FakeRailItem("en")
        val italian = FakeRailItem("it")
        val local = FakeRailItem("!local")

        assertEquals(
            listOf(none, local, english, italian),
            LocalSubtitleRuntime.prioritizeLanguageRail(listOf(none, english, italian, local))
        )
    }

    @Test fun `ordinary addon subtitles remain unchanged`() {
        val addon = FakeSubtitle(
            id = "123",
            url = "https://example.test/subtitle.srt",
            lang = "en",
            addonName = "OpenSubtitles"
        )

        assertEquals("English", LocalSubtitleRuntime.rewriteOptionTitle("English", addon))
        assertEquals("123", LocalSubtitleRuntime.rewriteOptionMeta("123", addon))
        assertEquals("en", LocalSubtitleRuntime.playbackLanguage("en", addon))
        assertFalse(LocalSubtitleRuntime.isImportedSubtitle(addon))
    }

    @Test fun `local selection suppresses stale restore until another choice`() {
        val imported = FakeSubtitle(
            id = "und\nMovie.srt",
            url = "file:///data/user/0/com.nuvio.tv/cache/Movie.srt"
        )
        val addon = FakeSubtitle(
            id = "123",
            url = "https://example.test/subtitle.srt",
            lang = "en",
            addonName = "OpenSubtitles"
        )

        assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(imported))
        assertTrue(LocalSubtitleRuntime.importedSelectionActiveForTesting())
        assertTrue(LocalSubtitleRuntime.shouldSuppressTrackPreferenceRestore())
        assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(addon))
        assertFalse(LocalSubtitleRuntime.importedSelectionActiveForTesting())
        assertFalse(LocalSubtitleRuntime.shouldSuppressTrackPreferenceRestore())
    }

    @Test fun `reopened local section starts from the language rail`() {
        assertTrue(LocalSubtitleRuntime.preferLanguageRailFocus("!local"))
        assertFalse(LocalSubtitleRuntime.preferLanguageRailFocus("en"))
        assertFalse(LocalSubtitleRuntime.preferLanguageRailFocus("__off__"))
    }

    @Test fun `private imports expire after seven unused days`() {
        val day = 24L * 60L * 60L * 1000L
        val importedAt = 1_000_000L

        assertFalse(LocalSubtitleRuntime.isExpiredForTesting(importedAt, importedAt + 7L * day - 1L))
        assertTrue(LocalSubtitleRuntime.isExpiredForTesting(importedAt, importedAt + 7L * day))
        assertFalse(LocalSubtitleRuntime.isExpiredForTesting(importedAt, importedAt - day))
    }

    @Test fun `supported language names remain human readable`() {
        assertTrue(LocalSubtitleRuntime.displayLanguage("en").contains("English", ignoreCase = true))
        assertTrue(LocalSubtitleRuntime.displayLanguage("it").contains("Italian", ignoreCase = true))
        assertEquals("Unknown language", LocalSubtitleRuntime.displayLanguage("und"))
    }
}
