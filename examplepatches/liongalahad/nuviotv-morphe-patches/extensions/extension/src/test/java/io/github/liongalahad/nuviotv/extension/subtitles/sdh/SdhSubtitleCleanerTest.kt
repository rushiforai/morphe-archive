package io.github.liongalahad.nuviotv.extension.subtitles.sdh

import android.graphics.Color
import android.graphics.Bitmap
import android.text.SpannableString
import android.text.Spanned
import android.text.style.ForegroundColorSpan
import androidx.media3.common.text.Cue
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class SdhSubtitleCleanerTest {
    private var sessionOwner: Any? = null

    @Before fun resetPreference() = setMode(SdhCleanupMode.OFF)
    @After fun cleanUpPreference() = setMode(SdhCleanupMode.OFF)

    @Test fun `default and off mode preserve source identity`() {
        val source: CharSequence =
            "[door closes] JOHN: Hello.\nj This is my song j\nj You can sing along j"
        val cues = listOf(Cue.Builder().setText(source).build())
        assertSame(cues, SdhCueTransformer.clean(cues))
        assertSame(source, cues.single().text)
    }

    @Test fun `standalone sounds and no-dialogue annotations are suppressed`() {
        listOf("[door closes]", "[NO DIALOGUE]", "[no discernible speech]", "[panting]")
            .forEach { assertNull(it, SdhSubtitleCleaner.clean(it)) }
    }

    @Test fun `inline multiple full-width and parenthetical annotations are removed`() {
        assertEquals("Don't move.", cleaned("[whispers] Don't move."))
        assertEquals("Hello.", cleaned("[door opens] [footsteps]\nHello."))
        assertEquals("Come in.", cleaned("［door closes］ Come in."))
        assertEquals("Stay here.", cleaned("(whispering) Stay here."))
        assertEquals("Stay here.", cleaned("(in Italian) Stay here."))
    }

    @Test fun `complete bracketed and parenthetical blocks span line boundaries`() {
        assertNull(SdhSubtitleCleaner.clean("[test test\ntest]"))
        assertNull(SdhSubtitleCleaner.clean("［test test\r\ntest］"))
        assertEquals(
            "Before after.",
            cleaned("Before [sound continues\nacross lines] after.")
        )
        assertEquals("Stay here.", cleaned("(speaking very\nsoftly) Stay here."))
        assertEquals("Hello.", cleaned("[outer [nested] annotation] Hello."))
        assertEquals("Hello.", cleaned("[${"long ".repeat(30)}annotation] Hello."))
    }

    @Test fun `enabled mode removes every complete bracketed and parenthetical block`() {
        assertEquals(
            "Keep outside.",
            cleaned("[literal spoken content] Keep (every important word) outside.")
        )
        assertEquals("Hello.", cleaned("[an unknown annotation!] (door closes) Hello."))
    }

    @Test fun `speaker labels and qualifiers are removed`() {
        assertEquals("Where are you?", cleaned("JOHN: Where are you?"))
        assertEquals("Where are you?", cleaned("JOHN (ON PHONE): Where are you?"))
        assertEquals("- Yep.\n- Outside.", cleaned("- [Tom] Yep.\n- SARAH: Outside."))
    }

    @Test fun `music descriptions are removed while lyrics remain`() {
        assertNull(SdhSubtitleCleaner.clean("♪ tense instrumental music ♪"))
        assertNull(SdhSubtitleCleaner.clean("♫ MUSIC PLAYING ♫"))
        assertEquals("♪ Hello darkness, my old friend ♪", cleaned("♪ Hello darkness, my old friend ♪"))
    }

    @Test fun `repeated isolated wrappers are inferred and normalized on retained lyrics`() {
        assertEquals(
            "♪ Hello darkness, my old friend ♪\n♪ You know that I remember ♪",
            cleaned("j Hello darkness, my old friend j\nj You know that I remember j")
        )
        assertEquals(
            "♪ This is my song ♪\n♪ You can sing along ♪",
            cleaned("j' This is my song j'\nj’ You can sing along j’")
        )
        assertEquals(
            "♪ This is my song ♪\n♪ You can sing along ♪\n♪ The chorus returns ♪",
            cleaned(
                "¤ This is my song ¤\n" +
                    "¤ You can sing along ¤\n" +
                    "¤ The chorus returns ¤"
            )
        )
        assertEquals("I told you I", cleaned("I told you I"))
        assertEquals(
            "♪ This is my song ♪\n♪ You can sing along ♪",
            cleaned("j This is my song j\nk You can sing along k")
        )
        assertEquals("A complete sentence A", cleaned("A complete sentence A"))
        assertEquals(
            "ab First line AB\nAb Second line aB",
            cleaned("ab First line AB\nAb Second line aB")
        )
        assertEquals(
            "♪ First line ♪\n♪ Second line ♪\n♪ Third line ♪",
            cleaned("ab First line AB\nAb Second line aB\naB Third line ab")
        )
    }

    @Test fun `inferred wrappers follow cleanup mode semantics`() {
        val descriptions = "j tense music playing j\nj soft instrumental music j"
        assertNull(SdhSubtitleCleaner.clean(descriptions, SdhCleanupMode.KEEP_LYRICS))
        assertNull(SdhSubtitleCleaner.clean(
            "j This is my song j\nj You can sing along j",
            SdhCleanupMode.REMOVE_LYRICS
        ))
    }

    @Test fun `normalize-only mode changes music markers without removing subtitle text`() {
        val corruptedNote = "\u00E2\u2122\u00AA"
        assertEquals(
            "[door closes] JOHN: Hello.\n♪ tense music ♪\n♪ This is my song ♪\n♪ You can sing along ♪",
            SdhSubtitleCleaner.clean(
                "[door closes] JOHN: Hello.\n" +
                    "$corruptedNote tense music $corruptedNote\n" +
                    "j This is my song j\n" +
                    "j You can sing along j",
                SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS
            )?.toString()
        )
    }

    @Test fun `marker-only legacy glyph cues become music notes`() {
        listOf(
            "JJJ" to "♪♪♪",
            "j'" to "♪",
            "j’" to "♪",
            "¤¤" to "♪♪"
        ).forEach { (source, expected) ->
            assertEquals(
                source,
                expected,
                SdhSubtitleCleaner.clean(source, SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)?.toString()
            )
        }
        listOf("A", "I", "...", "?!").forEach { source ->
            assertEquals(
                source,
                source,
                SdhSubtitleCleaner.clean(source, SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)?.toString()
            )
        }
        assertNull(SdhSubtitleCleaner.clean("JJJ", SdhCleanupMode.KEEP_LYRICS))
        assertNull(SdhSubtitleCleaner.clean("JJJ", SdhCleanupMode.REMOVE_LYRICS))
    }

    @Test fun `Twin Peaks marker-only cue is normalized at the cue callback boundary`() {
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        val cues = listOf(Cue.Builder().setText("JJJ").build())
        assertEquals("♪♪♪", SdhCueTransformer.clean(cues).single().text.toString())
    }

    @Test fun `Twin Peaks single legacy wrapper is normalized without a second simultaneous line`() {
        val source = "J Julee Cruise's \"Falling\" playing J"
        assertEquals(
            "♪ Julee Cruise's \"Falling\" playing ♪",
            SdhSubtitleCleaner.clean(source, SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)?.toString()
        )
        assertNull(SdhSubtitleCleaner.clean(source, SdhCleanupMode.KEEP_LYRICS))
    }

    @Test fun `legacy wrappers ignore case and accept double quote variants`() {
        listOf(
            "J\" This is my song j\"",
            "J“ This is my song j”",
            "J\" This is my song j”"
        ).forEach { source ->
            assertEquals(
                source,
                "♪ This is my song ♪",
                SdhSubtitleCleaner.clean(
                    source,
                    SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS
                )?.toString()
            )
        }
    }

    @Test fun `multiline wrapper is one occurrence and next matching cue learns token`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        val first = cue("AB\" word word\nword ab”")
        val second = cue("ab\" word word word AB\"")

        assertEquals("AB\" word word\nword ab”", transform(first))
        assertEquals("♪ word word word ♪", transform(second))
    }

    @Test fun `third total occurrence learns token despite intervening subtitle cues`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)

        assertEquals("xy First line XY", transform(cue("xy First line XY")))
        transform(cue("Ordinary dialogue."))
        assertEquals("Xy Second line xY", transform(cue("Xy Second line xY")))
        transform(cue("Another dialogue line."))
        assertEquals("♪ Third line ♪", transform(cue("xY Third line Xy")))
    }

    @Test fun `different token combinations do not form a consecutive pair`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)

        assertEquals("ab\" First AB\"", transform(cue("ab\" First AB\"")))
        assertEquals("ab' Second AB'", transform(cue("ab' Second AB'")))
        assertEquals("AB\" Third ab\"", transform(cue("AB\" Third ab\"")))
        assertEquals("♪ Fourth ♪", transform(cue("ab\" Fourth AB\"")))
    }

    @Test fun `repeated delivery of the same cue does not manufacture evidence`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        val source = cue("xy Repeated line XY")

        assertEquals("xy Repeated line XY", transform(source))
        assertEquals("xy Repeated line XY", transform(source))
        assertEquals("xy Repeated line XY", transform(source))
    }

    @Test fun `retained active cue is not counted again when another cue is introduced`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        val retained = Cue.Builder().setText("xy First line XY").build()
        val dialogue = Cue.Builder().setText("Ordinary overlapping dialogue.").build()

        assertEquals("xy First line XY", transform(listOf(retained)))
        val overlap = SdhCueTransformer.clean(listOf(retained, dialogue))
        assertEquals("xy First line XY", overlap[0].text.toString())
        assertEquals("Ordinary overlapping dialogue.", overlap[1].text.toString())
        assertEquals("XY Second line xy", transform(cue("XY Second line xy")))
        assertEquals("♪ Third line ♪", transform(cue("xY Third line Xy")))
    }

    @Test fun `learned tokens are isolated between playback callback sessions`() {
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        startRecognitionSession()
        transform(cue("xy First XY"))
        assertEquals("♪ Second ♪", transform(cue("XY Second xy")))

        startRecognitionSession()
        assertEquals("xy First in another video XY", transform(cue("xy First in another video XY")))
    }

    @Test fun `recognized multiline token follows all four mode semantics`() {
        val source = cue("AB\" These are my words\nI sing them ab”")
        val recognized = setOf("ab\"")

        assertEquals(
            "AB\" These are my words\nI sing them ab”",
            transform(source, SdhCleanupMode.OFF, recognized)
        )
        assertEquals(
            "♪ These are my words\nI sing them ♪",
            transform(source, SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS, recognized)
        )
        assertEquals(
            "♪ These are my words\nI sing them ♪",
            transform(source, SdhCleanupMode.KEEP_LYRICS, recognized)
        )
        assertNull(transformOrNull(source, SdhCleanupMode.REMOVE_LYRICS, recognized))
    }

    @Test fun `structural boundary characters are not learned as note tokens`() {
        startRecognitionSession()
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        listOf("\" quoted \"", "- dialogue -", "[ bracketed ]", "( parenthetical )")
            .forEach { source ->
                repeat(3) { index ->
                    val variation = source.replace(" ", " ".repeat(index + 1))
                    assertEquals(variation, transform(cue(variation)))
                }
            }
    }

    @Test fun `full cleanup removes note bounded lyrics and inline paired music`() {
        assertNull(
            SdhSubtitleCleaner.clean(
                "♪ when the music's over, turn on the light ♪",
                SdhCleanupMode.REMOVE_LYRICS
            )
        )
        assertEquals(
            "Wait here. Do not move.",
            SdhSubtitleCleaner.clean(
                "Wait here. ♪ wordless singing ♪ Do not move.",
                SdhCleanupMode.REMOVE_LYRICS
            )?.toString()
        )
        assertEquals(
            "♪ This marker was never closed",
            SdhSubtitleCleaner.clean(
                "♪ This marker was never closed",
                SdhCleanupMode.REMOVE_LYRICS
            )?.toString()
        )
    }

    @Test fun `mojibake music markers and multiline song descriptions are handled`() {
        val corruptedNote = "\u00E2\u2122\u00AA"
        assertNull(SdhSubtitleCleaner.clean("$corruptedNote atmospheric music $corruptedNote"))
        assertNull(SdhSubtitleCleaner.clean("$corruptedNote$corruptedNote$corruptedNote"))
        assertEquals(
            "♪ Hello darkness, my old friend ♪",
            cleaned("$corruptedNote Hello darkness, my old friend $corruptedNote")
        )
        assertNull(SdhSubtitleCleaner.clean("$corruptedNote Julee Cruise's\n\"Falling\" playing $corruptedNote"))
    }

    @Test fun `Twin Peaks music description is removed at the cue callback boundary`() {
        setMode(SdhCleanupMode.REMOVE_LYRICS)
        val corruptedNote = "\u00E2\u2122\u00AA"
        val cues = listOf(
            Cue.Builder().setText("$corruptedNote atmospheric music $corruptedNote").build()
        )
        assertTrue(SdhCueTransformer.clean(cues).isEmpty())
    }

    @Test fun `normalize-only preference transforms the next cue list`() {
        setMode(SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        val cues = listOf(
            Cue.Builder().setText(
                "j This is my song j\nj You can sing along j"
            ).build()
        )
        assertEquals(
            "♪ This is my song ♪\n♪ You can sing along ♪",
            SdhCueTransformer.clean(cues).single().text.toString()
        )
    }

    @Test fun `times urls ratios punctuation and dialogue markers survive`() {
        listOf(
            "The rule is: never look back.",
            "At 10:30, leave the house.",
            "Visit https://example.com now.",
            "Use 16:9.",
            "- Ordinary dialogue."
        ).forEach { assertEquals(it, cleaned(it)) }
    }

    @Test fun `blank malformed and mutable inputs are safe`() {
        assertNull(SdhSubtitleCleaner.clean("  \t "))
        assertEquals("[door closes", cleaned("[door closes"))
        assertEquals("(whispering", cleaned("(whispering"))
        assertEquals("[door\ncloses", cleaned("[door\ncloses"))
        val source = StringBuilder("[door closes] Hello.")
        assertEquals("Hello.", cleaned(source))
        assertEquals("[door closes] Hello.", source.toString())
    }

    @Test fun `surviving Android spans are preserved`() {
        val source = SpannableString("[door\ncloses] Hello.")
        val span = ForegroundColorSpan(Color.RED)
        source.setSpan(span, 14, 20, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        val result = SdhSubtitleCleaner.clean(source)
        assertTrue(result is Spanned)
        assertEquals("Hello.", result.toString())
        assertEquals(1, (result as Spanned).getSpans(0, result.length, ForegroundColorSpan::class.java).size)
    }

    @Test fun `surviving spans remain after inferred marker replacement`() {
        val source = SpannableString("j This is my song j\nj You can sing along j")
        val span = ForegroundColorSpan(Color.RED)
        source.setSpan(span, 2, 17, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        val result = SdhSubtitleCleaner.clean(source, SdhCleanupMode.NORMALIZE_MUSIC_SYMBOLS)
        assertTrue(result is Spanned)
        assertEquals("♪ This is my song ♪\n♪ You can sing along ♪", result.toString())
        assertEquals(
            1,
            (result as Spanned).getSpans(0, result.length, ForegroundColorSpan::class.java).size
        )
    }

    @Test fun `cue positioning and non-text cues survive`() {
        setMode(SdhCleanupMode.KEEP_LYRICS)
        val dialogue = Cue.Builder().setText("[whispers] Hello.").setPosition(0.25f).build()
        val annotation = Cue.Builder().setText("[door closes]").build()
        val nonText = Cue.Builder().setBitmap(Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888)).build()
        val result = SdhCueTransformer.clean(listOf(dialogue, annotation, nonText))
        assertEquals(2, result.size)
        assertEquals("Hello.", result[0].text.toString())
        assertEquals(0.25f, result[0].position)
        assertSame(nonText, result[1])
    }

    @Test fun `preference changes apply to the next cue list and persist`() {
        val source = listOf(Cue.Builder().setText("[door closes]").build())
        assertEquals(1, SdhCueTransformer.clean(source).size)
        setMode(SdhCleanupMode.KEEP_LYRICS)
        assertEquals(0, SdhCueTransformer.clean(source).size)
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())
    }

    @Test fun `production transformer never links to CueGroup or Guava`() {
        val forbidden = setOf(
            "androidx.media3.common.text.CueGroup",
            "com.google.common.collect.ImmutableList"
        )
        val referencedTypes = SdhCueTransformer::class.java.declaredMethods
            .flatMap { method -> method.parameterTypes.asList() + method.returnType }
            .map { it.name }
        assertTrue(referencedTypes.none(forbidden::contains))
    }

    private fun setMode(mode: SdhCleanupMode) {
        MorpheSettingsRuntime.setSdhCleanupMode(
            ApplicationProvider.getApplicationContext(),
            mode.ordinal
        )
    }

    private fun startRecognitionSession() {
        sessionOwner = Any()
        SdhCueTransformer.beginSession(sessionOwner!!)
    }

    private fun cue(text: String): List<Cue> = listOf(Cue.Builder().setText(text).build())

    private fun transform(cues: List<Cue>): String =
        SdhCueTransformer.clean(cues).single().text.toString()

    private fun transform(
        cues: List<Cue>,
        mode: SdhCleanupMode,
        inferredTokens: Set<String>
    ): String = transformOrNull(cues, mode, inferredTokens)!!

    private fun transformOrNull(
        cues: List<Cue>,
        mode: SdhCleanupMode,
        inferredTokens: Set<String>
    ): String? = SdhCueTransformer.cleanCues(cues, mode, inferredTokens)
        .singleOrNull()
        ?.text
        ?.toString()

    private fun cleaned(text: CharSequence): String? = SdhSubtitleCleaner.clean(text)?.toString()
}
