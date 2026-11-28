package app.morphe.extension.sabp.read

import org.junit.Assert.assertEquals
import org.junit.Test

/** Xhtml: an image's long description (the narrator never reads it) is left out of the text. */
class XhtmlTest {
    @Test
    fun skipsImageDescriptions() {
        val html = """<body><section>
            <figure><img src="a.jpg" alt="Illustration of Balthazar" aria-details="d1"/></figure>
            <details id="d1"><summary>Expand / collapse Extended Description</summary>
            <p>A tall, thin male figure holding a skull.</p></details>
            <h2>PART I</h2><p>Worst Princess Ever</p></section></body>"""
        val t = BookText()
        Xhtml.toParagraphs(html, t, "part.xhtml", HashMap())
        assertEquals(listOf("PART I", "Worst Princess Ever"), t.paras.map { it.text })
    }
}
