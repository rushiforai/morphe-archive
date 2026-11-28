package app.morphe.extension.sabp.read

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

/**
 * A transcript made by the PC tool, imported, then matched to the full text: the one passage left
 * out of the audio (pc-transcribe/omitted.txt) is the one skipped passage.
 */
class PcImportMatchTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    @get:Rule
    val tmp = TemporaryFolder()

    private fun resource(name: String) = javaClass.getResource("/pc-transcribe/$name")!!.readText()

    @Test
    fun theLeftOutPassageIsTheOneSkippedPassage() {
        val tr = PcImportTest.freshTranscriber(paparazzi, tmp.newFolder("files"))
        val folder = tmp.newFolder("Christmas Carol")
        File(folder, "clip.transcript.json").writeText(PcImportTest.fixture())
        val book = PcImportTest.fixtureBook(folder)
        assertEquals(1, tr.importTranscripts(book))

        val text = BookText()
        for (p in resource("text.txt").split(Regex("\\r?\\n\\s*\\r?\\n"))) text.addPara(p, false, -1)
        text.index()

        val skipped = ArrayList<IntArray>()
        val chain = TranscriptSync.run(text, tr.parts(book), HashMap(), { false }, skipped)!!
        assertTrue("matched passages: ${chain.size / 2}", chain.size >= 2 * 10)

        // Where the omitted words are in the document.
        val omitted = BookText().also { it.addPara(resource("omitted.txt"), false, -1); it.index() }.words
        val first = (0..text.words.size - omitted.size).single { i -> omitted.indices.all { text.words[i + it] == omitted[it] } }
        val last = first + omitted.size - 1

        assertEquals("skipped: ${skipped.map { it.toList() }}", 1, skipped.size)
        val (a, z) = skipped[0].let { it[0] to it[1] }
        assertTrue("skipped $a..$z, omitted $first..$last", Math.abs(a - first) <= 3 && Math.abs(z - last) <= 3)
    }
}
