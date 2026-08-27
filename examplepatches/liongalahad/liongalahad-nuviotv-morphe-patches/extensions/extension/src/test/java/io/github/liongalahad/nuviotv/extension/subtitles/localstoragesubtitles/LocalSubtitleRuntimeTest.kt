package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles

import java.io.File
import com.nuvio.tv.domain.model.Subtitle
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

class LocalSubtitleRuntimeTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

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

    @Test fun `recomposition rebuilds one local section without growing the count`() {
        val movie = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "und", File("Movie.srt"), 1_000L, movie
        )
        val ordinary = Subtitle("english", "https://example.test/en.srt", "en", "Addon", null)

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            val first = LocalSubtitleRuntime.mergeSubtitles(listOf(ordinary))
            val second = LocalSubtitleRuntime.mergeSubtitles(first)

            assertEquals(first.size, second.size)
            assertEquals(1, second.count { it === ordinary })
            assertEquals(2, second.count {
                it is Subtitle && it.lang == LocalSubtitleRuntime.LOCAL_LANGUAGE_KEY
            })
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `active local subtitle is the only selected option`() {
        val movie = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val storedFile = File("/data/user/0/com.nuvio.tv/files/Movie.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "und", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "und\nMovie.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val otherLocal = FakeSubtitle(
            id = "und\nOther.srt",
            url = "file:///data/user/0/com.nuvio.tv/files/Other.srt"
        )
        val english = FakeSubtitle(
            id = "english", url = "https://example.test/en.srt", lang = "en", addonName = "Addon"
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(imported))

            assertTrue(LocalSubtitleRuntime.selectableOptionState(false, imported))
            assertFalse(LocalSubtitleRuntime.selectableOptionState(true, otherLocal))
            assertFalse(LocalSubtitleRuntime.selectableOptionState(true, english))
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `saved local selection suppresses stale native tick before track restore`() {
        val contentId = "movie-a"
        val movie = LocalSubtitleRuntime.contentKeyForTesting(contentId, null, null)
        val storedFile = temporaryFolder.newFile("Restored.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Restored.srt", "en", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "en\nRestored.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val english = FakeSubtitle(
            id = "english", url = "https://example.test/en.srt", lang = "en", addonName = "Addon"
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            val firstController = Any()
            LocalSubtitleRuntime.observeController(firstController)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, null, null, imported))

            // A replacement playback controller clears transient state before Nuvio restores
            // its tracks. Content observation must recover the saved local choice early enough
            // for the first subtitle-menu composition to suppress the stale English tick.
            LocalSubtitleRuntime.observeController(Any())
            assertFalse(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            LocalSubtitleRuntime.observeContentIdentity(contentId, null, null)

            assertFalse(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            assertTrue(LocalSubtitleRuntime.selectableOptionState(false, imported))
            assertFalse(LocalSubtitleRuntime.selectableOptionState(true, english))
            assertNotNull(LocalSubtitleRuntime.restoredSubtitle(Any(), contentId, null, null))
            assertTrue(LocalSubtitleRuntime.importedSelectionActiveForTesting())
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `saved local subtitle restore is single shot per controller and content`() {
        val contentId = "movie-a"
        val movie = LocalSubtitleRuntime.contentKeyForTesting(contentId, null, null)
        val storedFile = temporaryFolder.newFile("Movie.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "und", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "und\nMovie.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val controller = Any()

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, null, null, imported))
            LocalSubtitleRuntime.clearImportedSelection()

            assertNotNull(LocalSubtitleRuntime.restoredSubtitle(controller, contentId, null, null))
            assertNull(LocalSubtitleRuntime.restoredSubtitle(controller, contentId, null, null))
            assertTrue(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `manual local selection prevents track update from selecting it twice`() {
        val contentId = "movie-a"
        val movie = LocalSubtitleRuntime.contentKeyForTesting(contentId, null, null)
        val storedFile = temporaryFolder.newFile("Manual.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Manual.srt", "und", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "und\nManual.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val controller = Any()

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            LocalSubtitleRuntime.observeController(controller)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, null, null, imported))

            assertNull(LocalSubtitleRuntime.restoredSubtitle(controller, contentId, null, null))
            assertTrue(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `handled restore keeps stale native reconciliation blocked`() {
        val contentId = "episode-a"
        val episode = LocalSubtitleRuntime.contentKeyForTesting(contentId, 1, 2)
        val storedFile = temporaryFolder.newFile("Handled.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Handled.srt", "en", storedFile, 1_000L, episode
        )
        val imported = FakeSubtitle(
            id = "en\nHandled.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val controller = Any()

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, episode)
            LocalSubtitleRuntime.observeController(controller)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, 1, 2, imported))

            assertNull(LocalSubtitleRuntime.restoredSubtitle(controller, contentId, 1, 2))
            assertTrue(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `saved local subtitle restores after previous controller is released`() {
        val contentId = "episode-a"
        val episode = LocalSubtitleRuntime.contentKeyForTesting(contentId, 1, 2)
        val storedFile = temporaryFolder.newFile("Episode.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Episode.srt", "en", storedFile, 1_000L, episode
        )
        val imported = FakeSubtitle(
            id = "en\nEpisode.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, episode)
            // Persist the prior choice while its old controller reference is no longer live.
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, 1, 2, imported))

            val restored = LocalSubtitleRuntime.restoredSubtitle(Any(), contentId, 1, 2)

            assertNotNull(restored)
            assertTrue(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            assertTrue(LocalSubtitleRuntime.selectableOptionState(false, imported))
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
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

    @Test fun `local selection blocks stale automatic restore until an explicit addon choice`() {
        val movie = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val storedFile = File("/data/user/0/com.nuvio.tv/files/Movie.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "und", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "und\nMovie.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )
        val addon = FakeSubtitle(
            id = "123",
            url = "https://example.test/subtitle.srt",
            lang = "en",
            addonName = "OpenSubtitles"
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(imported))
            assertTrue(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            assertTrue(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())

            assertTrue(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(addon))
            assertTrue(LocalSubtitleRuntime.importedSelectionActiveForTesting())

            assertFalse(LocalSubtitleRuntime.rememberImportedSelection("movie-a", null, null, addon))
            assertFalse(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            assertFalse(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())
            assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(addon))
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `active imported subtitle text is read from its exact private file`() {
        val contentId = "movie-a"
        val movie = LocalSubtitleRuntime.contentKeyForTesting(contentId, null, null)
        val storedFile = temporaryFolder.newFile("Movie.srt")
        val text = "1\n00:00:01,000 --> 00:00:03,000\nLocal subtitle\n"
        storedFile.writeText(text, Charsets.UTF_8)
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "en", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "en\nMovie.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, null, null, imported))
            assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(imported))

            assertEquals(text, LocalSubtitleRuntime.localSubtitleText(imported.url))
            assertNull(LocalSubtitleRuntime.localSubtitleText("file:///private/Other.srt"))
            assertNull(LocalSubtitleRuntime.localSubtitleText("https://example.test/subtitle.srt"))
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `local subtitle reader removes a UTF-16 byte order mark`() {
        val contentId = "movie-a"
        val movie = LocalSubtitleRuntime.contentKeyForTesting(contentId, null, null)
        val storedFile = temporaryFolder.newFile("Movie-utf16.srt")
        val text = "1\n00:00:01,000 --> 00:00:03,000\nUnicode subtitle\n"
        storedFile.writeBytes(byteArrayOf(0xff.toByte(), 0xfe.toByte()) + text.toByteArray(Charsets.UTF_16LE))
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie-utf16.srt", "en", storedFile, 1_000L, movie
        )
        val imported = FakeSubtitle(
            id = "en\nMovie-utf16.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movie)
            assertTrue(LocalSubtitleRuntime.rememberImportedSelection(contentId, null, null, imported))
            assertFalse(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(imported))

            assertEquals(text, LocalSubtitleRuntime.localSubtitleText(imported.url))
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
    }

    @Test fun `stale local row from another movie cannot be selected`() {
        val movieA = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val movieB = LocalSubtitleRuntime.contentKeyForTesting("movie-b", null, null)
        val storedFile = File("/data/user/0/com.nuvio.tv/files/Movie.srt")
        val stored = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.srt", "und", storedFile, 1_000L, movieA
        )
        val staleRow = FakeSubtitle(
            id = "und\nMovie.srt",
            url = LocalSubtitleRuntime.storedFileUrlForTesting(storedFile)
        )

        try {
            LocalSubtitleRuntime.setImportStateForTesting(stored, movieB)
            assertTrue(LocalSubtitleRuntime.rejectImportedSubtitleForMpv(staleRow))
            assertFalse(LocalSubtitleRuntime.importedSelectionActiveForTesting())
            assertFalse(LocalSubtitleRuntime.shouldBlockNuvioSubtitleSelection())
        } finally {
            LocalSubtitleRuntime.setImportStateForTesting(null, null)
        }
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

    @Test fun `movie import is visible only for its owning movie`() {
        val movieA = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val movieB = LocalSubtitleRuntime.contentKeyForTesting("movie-b", null, null)
        val imported = LocalSubtitleRuntime.ImportedSubtitle(
            "Movie.en.srt",
            "en",
            File("Movie.en.srt"),
            1_000L,
            movieA
        )

        assertTrue(LocalSubtitleRuntime.belongsToContent(imported, movieA))
        assertFalse(LocalSubtitleRuntime.belongsToContent(imported, movieB))
    }

    @Test fun `missing playback identity cannot become a shared import owner`() {
        assertEquals("", LocalSubtitleRuntime.contentKeyForTesting(null, null, null))
        assertEquals("", LocalSubtitleRuntime.contentKeyForTesting("  ", 1, 2))
    }

    @Test fun `series import is isolated to the exact season and episode`() {
        val episode = LocalSubtitleRuntime.contentKeyForTesting("series-a", 1, 2)
        val nextEpisode = LocalSubtitleRuntime.contentKeyForTesting("series-a", 1, 3)
        val otherSeason = LocalSubtitleRuntime.contentKeyForTesting("series-a", 2, 2)
        val imported = LocalSubtitleRuntime.ImportedSubtitle(
            "Series.S01E02.en.srt",
            "en",
            File("Series.S01E02.en.srt"),
            1_000L,
            episode
        )

        assertTrue(LocalSubtitleRuntime.belongsToContent(imported, episode))
        assertFalse(LocalSubtitleRuntime.belongsToContent(imported, nextEpisode))
        assertFalse(LocalSubtitleRuntime.belongsToContent(imported, otherSeason))
    }

    @Test fun `same filename can be imported independently for different videos`() {
        val movieA = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val movieB = LocalSubtitleRuntime.contentKeyForTesting("movie-b", null, null)
        val imported = LocalSubtitleRuntime.ImportedSubtitle(
            "English.srt",
            "en",
            File("stored-English.srt"),
            1_000L,
            movieA
        )

        assertTrue(LocalSubtitleRuntime.sameImportSlot(imported, "english.SRT", movieA))
        assertFalse(LocalSubtitleRuntime.sameImportSlot(imported, "English.srt", movieB))
    }

    @Test fun `legacy import stays hidden until claimed by its saved content`() {
        val movieA = LocalSubtitleRuntime.contentKeyForTesting("movie-a", null, null)
        val movieB = LocalSubtitleRuntime.contentKeyForTesting("movie-b", null, null)
        val imported = LocalSubtitleRuntime.ImportedSubtitle(
            "Legacy.srt",
            "und",
            File("Legacy.srt"),
            1_000L,
            ""
        )

        assertFalse(LocalSubtitleRuntime.belongsToContent(imported, movieA))
        assertTrue(LocalSubtitleRuntime.claimOwnerIfUnassigned(imported, movieA))
        assertTrue(LocalSubtitleRuntime.belongsToContent(imported, movieA))
        assertFalse(LocalSubtitleRuntime.belongsToContent(imported, movieB))
        assertFalse(LocalSubtitleRuntime.claimOwnerIfUnassigned(imported, movieB))
    }

    @Test fun `supported language names remain human readable`() {
        assertTrue(LocalSubtitleRuntime.displayLanguage("en").contains("English", ignoreCase = true))
        assertTrue(LocalSubtitleRuntime.displayLanguage("it").contains("Italian", ignoreCase = true))
        assertEquals("Unknown language", LocalSubtitleRuntime.displayLanguage("und"))
    }
}
