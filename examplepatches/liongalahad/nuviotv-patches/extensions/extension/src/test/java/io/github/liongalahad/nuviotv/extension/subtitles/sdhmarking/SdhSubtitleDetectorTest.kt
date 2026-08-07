package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking

import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class SdhSubtitleDetectorTest {
    data class FakeSubtitle(val id: String, val url: String, val lang: String)
    data class FakeOption(val title: String, val addonSubtitle: FakeSubtitle?)
    data class FakeRenderer(val option: FakeOption)
    @Before fun setUp() {
        MorpheSettingsRuntime.setSdhMarkingEnabled(ApplicationProvider.getApplicationContext(), true)
        SdhSubtitleMarker.clearForTests()
        SdhMarkingRefreshState.resetForTests()
    }

    @After fun tearDown() {
        MorpheSettingsRuntime.setSdhMarkingEnabled(ApplicationProvider.getApplicationContext(), false)
        SdhSubtitleMarker.clearForTests()
    }

    @Test fun `repeated annotation evidence is detected`() {
        val sample = """
            1
            00:00:01,000 --> 00:00:02,000
            [door closes]

            2
            00:00:03,000 --> 00:00:04,000
            JOHN: Where are you?

            3
            00:00:05,000 --> 00:00:06,000
            ♪ tense music ♪
        """.trimIndent()

        val twentyBracketedAnnotations = (1..20).joinToString("\n") { "[door closes]" }
        val evidence = SdhSubtitleDetector.inspect(twentyBracketedAnnotations)
        assertTrue(evidence.isSdh)
        assertTrue(evidence.signalLines >= 3)
        assertEquals(20, evidence.bracketedAnnotations)
    }

    @Test fun `one incidental bracket or parenthesis is insufficient`() {
        assertFalse(SdhSubtitleDetector.isSdh("I saw him [yesterday].\nThis is ordinary dialogue."))
        assertFalse(SdhSubtitleDetector.isSdh("(I meant every word.)"))
    }

    @Test fun `three weak parentheses without enough score remain unmarked`() {
        assertFalse(SdhSubtitleDetector.isSdh("(one)\n(two)\n(three)"))
    }

    @Test fun `nineteen strong bracketed annotations remain unmarked`() {
        val sample = (1..19).joinToString("\n") { "[door closes]" }

        val evidence = SdhSubtitleDetector.inspect(sample)
        assertEquals(19, evidence.bracketedAnnotations)
        assertFalse(evidence.isSdh)
    }

    @Test fun `music note lyrics without brackets are not SDH`() {
        val note = '\u266A'
        val sample = (1..25).joinToString("\n") { "$note Song lyric $note" }

        val evidence = SdhSubtitleDetector.inspect(sample)
        assertTrue(evidence.score >= 4)
        assertEquals(0, evidence.bracketedAnnotations)
        assertFalse(evidence.isSdh)
    }

    @Test fun `speaker labels without brackets are not SDH`() {
        val sample = (1..25).joinToString("\n") { "SPEAKER: Ordinary dialogue." }

        assertFalse(SdhSubtitleDetector.isSdh(sample))
    }

    @Test fun `one bracketed annotation plus other signals is insufficient`() {
        val note = '\u266A'
        val sample = "[door closes]\nSPEAKER: Dialogue.\n$note Song lyric $note"

        assertFalse(SdhSubtitleDetector.isSdh(sample))
    }

    @Test fun `metadata tokens append one SDH suffix`() {
        assertEquals(
            "English SDH",
            SdhSubtitleMarker.markTitle("English", "English (SDH)", "eng", "2")
        )
        assertEquals(
            "English SDH",
            SdhSubtitleMarker.markTitle("English SDH", "SDH", "eng", "2")
        )
    }

    @Test fun `generic words containing hi are not metadata matches`() {
        assertFalse(SdhSubtitleMarker.isExplicitSdh("Chinese", "this-track", "English"))
    }

    @Test fun `non English metadata and addon titles are not marked`() {
        assertEquals("Spanish", SdhSubtitleMarker.markTitle("Spanish", "SDH", "spa", "2"))
        SdhSubtitleMarker.recordDetectionForTests("sub-es", "https://example.test/es.srt", true)
        assertEquals(
            "Spanish",
            SdhSubtitleMarker.markAddonTitle("Spanish", "sub-es", "https://example.test/es.srt")
        )
    }

    @Test fun `recorded addon detection marks the normal language title`() {
        SdhSubtitleMarker.recordDetectionForTests("sub-1", "https://example.test/one.srt", true)
        assertEquals(
            "English SDH",
            SdhSubtitleMarker.markAddonTitle("English", "sub-1", "https://example.test/one.srt")
        )
    }

    @Test fun `refresh epoch changes without altering a cached title result`() {
        SdhSubtitleMarker.recordDetectionForTests("sub-1", "https://example.test/one.srt", true)
        val before = SdhMarkingRefreshState.observe()

        SdhMarkingRefreshState.invalidate()

        assertEquals(before + 1, SdhMarkingRefreshState.observe())
        assertEquals(
            "English SDH",
            SdhSubtitleMarker.markAddonTitle("English", "sub-1", "https://example.test/one.srt")
        )
    }

    @Test fun `an already built option title uses the latest detection`() {
        val subtitle = FakeSubtitle("sub-1", "https://example.test/one.srt", "eng")
        val option = FakeOption("English", subtitle)
        SdhSubtitleMarker.beginOptionRendering(FakeRenderer(option))
        assertEquals("English", SdhSubtitleMarker.markCurrentOptionTitle(option.title))

        SdhSubtitleMarker.recordDetectionForTests(subtitle.id, subtitle.url, true)

        assertEquals("English SDH", SdhSubtitleMarker.markCurrentOptionTitle(option.title))
    }

    @Test fun `English language code works when the displayed language name is localized`() {
        assertEquals(
            "Inglés SDH",
            SdhSubtitleMarker.markAddonTitle(
                "Inglés",
                FakeSubtitle("English-SDH", "https://example.test/en.srt", "eng")
            )
        )
    }

    @Test fun `off preserves titles`() {
        MorpheSettingsRuntime.setSdhMarkingEnabled(ApplicationProvider.getApplicationContext(), false)
        assertEquals("English", SdhSubtitleMarker.markTitle("English", "SDH", "eng", "2"))
    }
}
