package app.morphe.extension.sabp.read

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Test

/** Automatic pairing: only a book folder holding exactly one EPUB/PDF gets it paired. */
class AutoPairTest {
    private fun files(vararg names: String) = names.map { arrayOf<Any>(it, 0L, "uri:$it") }

    @Test
    fun pairsTheOnlyDocument() {
        assertEquals("uri:Book.epub", ReadAlong.onlyDocument(files("Book.epub")))
    }

    @Test
    fun noneOrSeveralLeaveItToTheUser() {
        assertNull(ReadAlong.onlyDocument(files()))
        assertNull(ReadAlong.onlyDocument(files("Book.epub", "Maps.pdf")))
    }
}
