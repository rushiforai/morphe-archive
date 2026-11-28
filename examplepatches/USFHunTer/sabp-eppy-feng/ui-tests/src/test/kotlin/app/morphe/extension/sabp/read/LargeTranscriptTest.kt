package app.morphe.extension.sabp.read

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyBook
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import kotlin.random.Random

/**
 * A full-size transcript (500k words, about 57 h, like one PC transcript of a long volume): file size,
 * cold load time and heap, and one TranscriptSync run. Reports numbers; fails only on errors or OOM.
 */
class LargeTranscriptTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    @get:Rule
    val tmp = TemporaryFolder()

    private val words = 500_000
    private val durationMs = 57L * 3_600_000

    @Test
    fun measure() {
        val tr = PcImportTest.freshTranscriber(paparazzi, tmp.newFolder("files"))
        val book = EppyBook().also { b ->
            b.folderUri = "content://test/tree/big"
            b.files.add(EppyBook.FileItem().also { it.name = "Volume.m4b"; it.start = 0; it.duration = (durationMs / 1000).toInt() })
        }

        // Made-up book: 5000 invented words, drawn at random (seeded), so every 14-word chunk is distinctive enough.
        val rnd = Random(9)
        val syl = listOf("ka", "lo", "mi", "ne", "su", "ta", "ri", "vo", "de", "phi", "gor", "an", "el", "us", "ith")
        val vocab = List(5000) { (0 until 2 + rnd.nextInt(2)).joinToString("") { syl[rnd.nextInt(syl.size)] } + it.toString(36).filter(Char::isLetter) }
        val bookWords = List(words) { vocab[rnd.nextInt(vocab.size)] }

        val per = durationMs.toDouble() / words
        val ft = FileTranscript("Volume.m4b")
        ft.durationMs = durationMs
        val segs = ArrayList<FileTranscript.Seg>()
        for (s in 0 until words step 12) {
            val seg = FileTranscript.Seg()
            for (k in s until minOf(words, s + 12)) seg.words.add(FileTranscript.Word((k * per).toLong(), ((k + 1) * per).toLong(), bookWords[k]))
            seg.t0 = seg.words.first().t0
            seg.t1 = seg.words.last().t1
            seg.text = seg.words.joinToString(" ") { it.text }
            segs.add(seg)
        }
        ft.add(segs, 0, durationMs)
        val dir = tr.dir(book.folderUri)
        ft.save(dir)
        val file = FileTranscript.fileFor(dir, "Volume.m4b")
        file.setLastModified(file.lastModified() - 10_000) // the save cached it; a new time makes the next load cold

        val rt = Runtime.getRuntime()
        System.gc()
        val before = rt.totalMemory() - rt.freeMemory()
        val t0 = System.nanoTime()
        val loaded = FileTranscript.load(dir, "Volume.m4b")!!
        val loadMs = (System.nanoTime() - t0) / 1_000_000
        System.gc()
        val heapMb = (rt.totalMemory() - rt.freeMemory() - before) / 1_048_576.0
        assertEquals(words, loaded.words().size)
        assertEquals(-1L, loaded.firstGap(0))

        val text = BookText()
        for (p in 0 until words step 100) text.addPara(bookWords.subList(p, minOf(words, p + 100)).joinToString(" "), false, -1)
        text.index()
        val skipped = ArrayList<IntArray>()
        val t1 = System.nanoTime()
        val chain = TranscriptSync.run(text, tr.parts(book), HashMap(), { false }, skipped)!!
        val syncMs = (System.nanoTime() - t1) / 1_000_000

        println("LargeTranscriptTest: ${words} words, ${segs.size} segments, file %.1f MB".format(file.length() / 1_048_576.0))
        println("LargeTranscriptTest: cold load $loadMs ms, heap +%.0f MB (max heap %d MB)".format(heapMb, rt.maxMemory() / 1_048_576))
        println("LargeTranscriptTest: TranscriptSync.run $syncMs ms, ${chain.size / 2} passages matched, ${skipped.size} skipped")
        assertTrue(chain.isNotEmpty())
    }
}
