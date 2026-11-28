package app.morphe.extension.sabp.read

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyBook
import app.morphe.extension.sabp.shots.TestContext
import org.json.JSONArray
import org.json.JSONObject
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

/** Importing transcript files made on the PC (tools/pc-transcribe) from the book folder. */
class PcImportTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    @get:Rule
    val tmp = TemporaryFolder()

    private lateinit var tr: Transcriber
    private lateinit var folder: File
    private lateinit var book: EppyBook

    @Before
    fun setUp() {
        tr = freshTranscriber(paparazzi, tmp.newFolder("files"))
        folder = tmp.newFolder("Christmas Carol")
        book = fixtureBook(folder)
    }

    private fun write(name: String, edit: (JSONObject) -> Unit = {}): File {
        val o = JSONObject(fixture())
        edit(o)
        return File(folder, name).also { it.writeText(o.toString()) }
    }

    @Test
    fun importingTheFixtureGivesTheWholeFile() {
        write("clip.transcript.json")
        assertEquals(1, tr.importTranscripts(book))
        assertEquals("100.0%", Transcriber.percentLabel(tr.progress(book)))
        assertTrue(tr.enabled(book.folderUri))
        assertTrue(File(folder, "clip.transcript.srt").isFile)
        assertTrue(tr.transcript(book.folderUri, "clip.wav")!!.words().size > 300)
    }

    @Test
    fun wrongFilesAreNotImported() {
        write("a.transcript.json") { it.put("name", "other.wav") }
        write("b.transcript.json") { it.put("dur", 119_845 + 2_500); it.put("covered", JSONArray("[[0, ${119_845 + 2_500}]]")) }
        write("c.transcript.json") { it.put("v", 2) }
        write("d.transcript.json") { it.put("covered", JSONArray("[[0, 60000]]")) }
        File(folder, "e.transcript.json").writeText("{ not json")
        assertEquals(0, tr.importTranscripts(book))
        assertFalse(tr.enabled(book.folderUri))
        assertEquals(null, tr.transcript(book.folderUri, "clip.wav"))
    }

    @Test
    fun aPartialPhoneTranscriptIsReplaced() {
        val phone = FileTranscript("clip.wav")
        phone.durationMs = 119_845
        phone.add(listOf(FileTranscript.Seg().also { it.t0 = 0; it.t1 = 5_000; it.text = "phone words"; it.words.add(FileTranscript.Word(0, 5_000, "phone")) }), 0, 30_000)
        phone.add(listOf(FileTranscript.Seg().also { it.t0 = 116_000; it.t1 = 118_000; it.text = "late phone words" }), 115_000, 119_000)
        phone.save(tr.dir(book.folderUri))
        assertEquals("28.3%", Transcriber.percentLabel(tr.progress(book)))

        write("clip.transcript.json")
        assertEquals(1, tr.importTranscripts(book))
        val t = tr.transcript(book.folderUri, "clip.wav")!!
        assertTrue(t.segs.none { it.text.contains("phone") })
        assertEquals(listOf(0L, 119_845L), t.covered.single().toList())
    }

    @Test
    fun onlyANewerFileIsImportedAgain() {
        val f = write("clip.transcript.json")
        f.setLastModified(1_700_000_000_000)
        assertEquals(1, tr.importTranscripts(book))
        assertEquals(0, tr.importTranscripts(book)) // same file
        f.setLastModified(1_600_000_000_000)
        assertEquals(0, tr.importTranscripts(book)) // older
        f.setLastModified(1_700_000_010_000)
        assertEquals(1, tr.importTranscripts(book)) // newer
    }

    companion object {
        fun fixture(): String = PcImportTest::class.java.getResource("/pc-transcribe/clip.transcript.json")!!.readText()

        /** A book with the fixture's one audio file, in a file: folder (no SAF needed). */
        fun fixtureBook(folder: File) = EppyBook().also { b ->
            b.folderUri = folder.toURI().toString()
            b.files.add(EppyBook.FileItem().also { it.name = "clip.wav"; it.start = 0; it.duration = 120 })
        }

        /** Transcriber is a singleton; give each test its own, with private storage in [files]. */
        fun freshTranscriber(paparazzi: Paparazzi, files: File): Transcriber {
            Transcriber::class.java.getDeclaredField("instance").also { it.isAccessible = true }.set(null, null)
            return Transcriber.get(TestContext(paparazzi.context, files = files))
        }
    }
}
