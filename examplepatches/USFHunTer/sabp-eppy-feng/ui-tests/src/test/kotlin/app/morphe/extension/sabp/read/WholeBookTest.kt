package app.morphe.extension.sabp.read

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppyBook
import app.morphe.extension.sabp.shots.TestContext
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Rule
import org.junit.Test

/** Whole-book mode: the remembered book (files, chapters) and the progress label. */
class WholeBookTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    private val folder = "content://com.android.externalstorage.documents/tree/primary%3AAudiobook/document/" +
            "primary%3AAudiobook%2FExample%20Saga%20Volume%209%20The%20Long%20Road/children"

    @Test
    fun savedBookRoundTrips() {
        val tr = Transcriber.get(TestContext(paparazzi.context))
        val b = EppyBook()
        b.folderUri = folder
        b.files.add(EppyBook.FileItem().also { it.name = "Vol 9.m4b"; it.start = 0; it.duration = 204766 })
        b.chapters.add(EppyBook.ChapterItem().also { it.title = "Ep 1331 Evil Minds"; it.fileName = "Vol 9.m4b"; it.positionInFile = 0 })
        b.chapters.add(EppyBook.ChapterItem().also { it.title = "Ep 1332 First Blood"; it.fileName = "Vol 9.m4b"; it.positionInFile = 627 })
        tr.saveBook(b)

        val s = tr.savedBook(folder)!!
        assertEquals("Example Saga Volume 9 The Long Road", s.folderName)
        assertEquals("Vol 9.m4b", s.files[0].name)
        assertEquals(204766, s.files[0].duration)
        assertEquals(2, s.chapters.size)
        assertEquals("Ep 1332 First Blood", TranscribeService.chapterAt(s, "Vol 9.m4b", 700_000))
        assertEquals("Ep 1331 Evil Minds", TranscribeService.chapterAt(s, "Vol 9.m4b", 626_000))
        assertNull(tr.savedBook("content://other"))
    }

    @Test
    fun percentHasOneDecimalAndNeverRoundsUp() {
        assertEquals("1.6%", Transcriber.percentLabel(longArrayOf(169, 10_000)))
        assertEquals("0.3%", Transcriber.percentLabel(longArrayOf(3, 1000)))
        assertEquals("99.9%", Transcriber.percentLabel(longArrayOf(9999, 10_000)))
        assertEquals("100.0%", Transcriber.percentLabel(longArrayOf(1000, 1000)))
    }
}
