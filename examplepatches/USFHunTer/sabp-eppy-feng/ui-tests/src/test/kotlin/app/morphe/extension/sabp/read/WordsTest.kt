package app.morphe.extension.sabp.read

import org.junit.Assert.assertEquals
import org.junit.Test

/** Words: the word under a finger, character names, sentences, bookmark descriptions. */
class WordsTest {
    private val text = BookText().apply {
        addPara("Chapter One", true, -1)
        addPara("Then Mara Rising Dawn smiled. Tobin's shadow moved, and Ilsa looked at Tobin.", false, -1)
        addPara("The Spell whispered: \"Wren!\" The students' hall was quiet.", false, -1)
        index()
    }
    private val p = text.paras[1].text

    private fun wordAt(para: Int, needle: String) = Words.at(text, para, text.paras[para].text.indexOf(needle))

    @Test
    fun offsetToWord() {
        val w = wordAt(1, "Rising")
        assertEquals("rising", text.words[w])
        assertEquals("rising", text.words[Words.at(text, 1, p.indexOf("Rising") + 3)]) // inside the word
        assertEquals("mara", text.words[Words.at(text, 1, p.indexOf("Mara") - 1)])    // the space before: next word
        assertEquals("tobin", text.words[Words.at(text, 1, p.length + 10)])              // past the end: last word
    }

    @Test
    fun displayDropsPossessives() {
        assertEquals("Tobin", Words.display(text, wordAt(1, "Tobin's")))
        assertEquals("students", Words.display(text, wordAt(2, "students'")))
    }

    @Test
    fun namesGrowOverNeighbouringCapitals() {
        assertEquals("Mara Rising Dawn", Words.name(text, wordAt(1, "Rising")))
        assertEquals("Mara Rising Dawn", Words.name(text, wordAt(1, "Mara")))   // not over "Then"
        assertEquals("Tobin", Words.name(text, wordAt(1, "Tobin's")))                 // a possessive ends the name
        assertEquals("Ilsa", Words.name(text, wordAt(1, "Ilsa")))
        assertEquals("shadow", Words.name(text, wordAt(1, "shadow")))
        assertEquals("Spell", Words.name(text, wordAt(2, "Spell")))                    // not over "The", stops at ":"
        assertEquals("Wren", Words.name(text, wordAt(2, "Wren")))
    }

    @Test
    fun sentenceWithItsPunctuation() {
        assertEquals("Then Mara Rising Dawn smiled.", Words.sentence(text, wordAt(1, "Dawn")))
        assertEquals("Tobin's shadow moved, and Ilsa looked at Tobin.", Words.sentence(text, wordAt(1, "Ilsa")))
    }

    @Test
    fun openingWords() {
        assertEquals("a b c", Words.opening("a b c", 20))
        assertEquals("a b…", Words.opening("a  b c", 2))
    }
}
