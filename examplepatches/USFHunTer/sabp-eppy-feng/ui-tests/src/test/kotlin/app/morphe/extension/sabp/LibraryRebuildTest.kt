package app.morphe.extension.sabp

import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File

/** Rebuild library: only SABP's book list (and its backup copy) is deleted; SABP's other files stay. */
class LibraryRebuildTest {
    @get:Rule
    val tmp = TemporaryFolder()

    @Test
    fun deletesTheBookListAndItsCopyOnly() {
        val files = tmp.root
        for (name in listOf("BooksDatabase_v6", "BooksDatabase_copy_v6", "eppy_readalong", "statistics.xml")) {
            File(files, name).writeText("x")
        }
        assertEquals(2, LibraryRebuild.clearDatabase(files))
        assertFalse(File(files, "BooksDatabase_v6").exists())
        assertFalse(File(files, "BooksDatabase_copy_v6").exists())
        assertTrue(File(files, "eppy_readalong").exists())
        assertTrue(File(files, "statistics.xml").exists())
    }

    @Test
    fun hiddenFoldersAreNotScanned() {
        assertTrue(LibraryRebuild.isHiddenFolder(".stversions"))
        assertTrue(LibraryRebuild.isHiddenFolder(".stfolder"))
        assertFalse(LibraryRebuild.isHiddenFolder("Volume 09 - Throne of War"))
        assertFalse(LibraryRebuild.isHiddenFolder("Shadow Slave Vol. 1"))
        assertFalse(LibraryRebuild.isHiddenFolder(null))
    }

    @Test
    fun anEmptyLibraryIsFine() {
        assertEquals(0, LibraryRebuild.clearDatabase(tmp.root))
    }
}
