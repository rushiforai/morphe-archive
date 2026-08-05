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
    @Before fun resetPreference() = setMode(SdhCleanupMode.OFF)
    @After fun cleanUpPreference() = setMode(SdhCleanupMode.OFF)

    @Test fun `default and off mode preserve source identity`() {
        val source: CharSequence = "[door closes] JOHN: Hello."
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
            "$corruptedNote Hello darkness, my old friend $corruptedNote",
            cleaned("$corruptedNote Hello darkness, my old friend $corruptedNote")
        )
        assertNull(SdhSubtitleCleaner.clean("$corruptedNote Julee Cruise's\n\"Falling\" playing $corruptedNote"))
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
        val source = StringBuilder("[door closes] Hello.")
        assertEquals("Hello.", cleaned(source))
        assertEquals("[door closes] Hello.", source.toString())
    }

    @Test fun `surviving Android spans are preserved`() {
        val source = SpannableString("[door closes] Hello.")
        val span = ForegroundColorSpan(Color.RED)
        source.setSpan(span, 14, 20, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        val result = SdhSubtitleCleaner.clean(source)
        assertTrue(result is Spanned)
        assertEquals("Hello.", result.toString())
        assertEquals(1, (result as Spanned).getSpans(0, result.length, ForegroundColorSpan::class.java).size)
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

    private fun cleaned(text: CharSequence): String? = SdhSubtitleCleaner.clean(text)?.toString()
}
