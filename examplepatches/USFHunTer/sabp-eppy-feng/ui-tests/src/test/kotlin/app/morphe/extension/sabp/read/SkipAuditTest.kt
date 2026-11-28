package app.morphe.extension.sabp.read

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyBook
import android.net.Uri
import org.json.JSONArray
import org.json.JSONObject
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

/**
 * Skipped-passage audit, not a regular test: runs only with EPPY_AUDIT_DIR set to a book folder holding one
 * audio file's `.transcript.json` (made on the PC) and the book's `.epub`.
 *
 * It runs eppy's own matching (TranscriptSync.run, as the phone does), and for every passage it would mark
 * "Not in the audiobook" checks whether the passage's words are in the transcript between the two matched spots
 * around it. Writes `skip-audit.json` (EPPY_AUDIT_OUT, default ui-tests/build) for a report.
 */
class SkipAuditTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    @get:Rule
    val tmp = TemporaryFolder()

    @Test
    fun audit() {
        val dirName = System.getenv("EPPY_AUDIT_DIR")
        assumeTrue("set EPPY_AUDIT_DIR to run the audit", dirName != null)
        val folder = File(dirName!!)
        val json = folder.listFiles()!!.single { it.name.endsWith(".transcript.json") }
        val epub = folder.listFiles()!!.single { it.name.endsWith(".epub") }

        val tr = PcImportTest.freshTranscriber(paparazzi, tmp.newFolder("files"))
        val ft = FileTranscript.parse(json.readText())
        val book = EppyBook().also { b ->
            b.folderUri = folder.toURI().toString()
            b.files.add(EppyBook.FileItem().also { it.name = ft.name; it.start = 0; it.duration = (ft.durationMs / 1000).toInt() })
        }
        ft.save(tr.dir(book.folderUri))

        val text = DocExtractor.extract(tr.javaClass.getDeclaredField("app").let { it.isAccessible = true; it.get(tr) as android.content.Context },
                Uri.fromFile(epub), epub.name)
        val skipped = ArrayList<IntArray>()
        val t0 = System.nanoTime()
        val anchors = TranscriptSync.run(text, tr.parts(book), HashMap(), { false }, skipped)!!
        val runMs = (System.nanoTime() - t0) / 1_000_000

        val heard = ft.words()
        val out = JSONArray()
        for (sk in skipped) {
            val a = sk[0]
            val z = sk[1]
            // The matched spots around the passage (anchors come in pairs: start and end of a matched chunk).
            val before = anchors.filter { it.word < a }.maxByOrNull { it.word }!!
            val after = anchors.filter { it.word > z }.minByOrNull { it.word }!!
            val fromMs = (before.seconds * 1000).toLong() - 2000
            val toMs = (after.seconds * 1000).toLong() + 2000
            val window = heard.filter { it.t0 in fromMs..toMs }
            val windowWords = window.map { BookText.normalize(it.text) }.filter { it.isNotEmpty() }
            val passage = (a..z).map { text.words[it] }
            val pool = windowWords.groupingBy { it }.eachCount().toMutableMap()
            var found = 0
            for (w in passage) {
                val n = pool[w] ?: 0
                if (n > 0) { found++; pool[w] = n - 1 }
            }
            val share = found.toDouble() / passage.size
            out.put(JSONObject()
                    .put("first", a).put("last", z).put("words", passage.size)
                    .put("at", before.seconds).put("until", after.seconds)
                    .put("found", share)
                    .put("verdict", if (share >= 0.6) "in the audio" else if (share <= 0.25) "skipped" else "unclear")
                    .put("text", passageText(text, a, z))
                    .put("heard", window.joinToString(" ") { it.text }))
        }
        val report = JSONObject()
                .put("book", epub.name).put("audio", ft.name).put("durationMs", ft.durationMs)
                .put("bookWords", text.wordCount()).put("heardWords", heard.size)
                .put("matchedChunks", anchors.size / 2).put("matchMs", runMs)
                .put("passages", out)
        val dest = File(System.getenv("EPPY_AUDIT_OUT") ?: "build", "skip-audit.json")
        dest.parentFile.mkdirs()
        dest.writeText(report.toString(1))
        println("SkipAuditTest: ${skipped.size} passages, ${anchors.size / 2} chunks matched in $runMs ms -> ${dest.absolutePath}")
    }

    /** The passage as the book prints it: from its first word's start to its last word's end, across paragraphs. */
    private fun passageText(t: BookText, a: Int, z: Int): String {
        val sb = StringBuilder()
        for (p in t.wordPara[a]..t.wordPara[z]) {
            val s = t.paras[p].text
            val from = if (p == t.wordPara[a]) t.wordStart[a] else 0
            val to = if (p == t.wordPara[z]) t.wordEnd[z] else s.length
            if (sb.isNotEmpty()) sb.append("\n\n")
            sb.append(s, from, to)
        }
        return sb.toString()
    }
}
