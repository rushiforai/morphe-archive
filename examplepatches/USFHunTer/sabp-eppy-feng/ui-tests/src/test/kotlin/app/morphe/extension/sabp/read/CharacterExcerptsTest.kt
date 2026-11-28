package app.morphe.extension.sabp.read

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** CharacterExcerpts: only what the listener has heard, first and latest mentions, capped. */
class CharacterExcerptsTest {
    private fun book(vararg paras: String) = BookText().apply {
        paras.forEach { addPara(it, false, -1) }
        index()
    }

    private fun wordOf(t: BookText, para: Int, word: String) =
        (t.paras[para].firstWord until t.paras[para].firstWord + t.paras[para].wordCount).first { t.words[it] == word }

    @Test
    fun onlyMentionsBeforeThePosition() {
        val t = book("Tobin woke up.", "Mara watched him.", "Tobin ran away from Mara.", "Later Tobin became a king.")
        val pos = t.paras[3].firstWord
        assertEquals(listOf("Tobin woke up.", "Tobin ran away from Mara."), CharacterExcerpts.pick(t, "Tobin", pos))
    }

    @Test
    fun theParagraphBeingHeardIsCutAtThePosition() {
        val t = book("Tobin woke up. Then Tobin became a king.")
        assertEquals(listOf("Tobin woke up."), CharacterExcerpts.pick(t, "Tobin", wordOf(t, 0, "then")))
    }

    @Test
    fun possessivesAndMultiWordNames() {
        val t = book("Mara's sword shone.", "They called her Rising Dawn.", "A dawn rising.", "End.")
        val end = t.paras[3].firstWord
        assertEquals(listOf("Mara's sword shone."), CharacterExcerpts.pick(t, "Mara", end))
        assertEquals(listOf("They called her Rising Dawn."), CharacterExcerpts.pick(t, "Rising Dawn", end))
    }

    @Test
    fun noMentionYet() {
        val t = book("Tobin woke up.", "Gorran of Iron arrived.")
        assertTrue(CharacterExcerpts.pick(t, "Gorran", t.paras[1].firstWord).isEmpty())
        assertTrue(CharacterExcerpts.pick(t, "Gorran", 0).isEmpty())
    }

    @Test
    fun firstAndLatestMentionsWithinTheCap() {
        val paras = (0 until 30).map { "Mention $it of Tobin." } + "The end."
        val t = book(*paras.toTypedArray())
        val got = CharacterExcerpts.pick(t, "Tobin", t.paras[30].firstWord)
        assertEquals((0 until 4).map { "Mention $it of Tobin." } + (22 until 30).map { "Mention $it of Tobin." }, got)

        val long = "Tobin " + "word ".repeat(1499)
        val t2 = book(long, long, long, "The end.")
        val got2 = CharacterExcerpts.pick(t2, "Tobin", t2.paras[3].firstWord)
        assertEquals(2, got2.size) // 3 × 1500 words is over the 3,000-word cap: the latest two are kept
    }
}
