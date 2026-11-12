package app.morphe.util

import java.io.File
import java.nio.ByteBuffer
import java.util.jar.JarFile
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

/**
 * verifyBundle's class file version check. Morphe's patcher refuses class files above major 61, so
 * a bundle carrying one has to fail the build rather than reach Manager.
 */
class BundleClassVersionTest {
    @get:Rule val temporary = TemporaryFolder()

    /** A jar of class files with the given majors, each just the 10 byte header the check reads. */
    private fun jar(vararg majors: Int): File = temporary.newFile().also { file ->
        ZipOutputStream(file.outputStream()).use { zip ->
            majors.forEachIndexed { index, major ->
                zip.putNextEntry(ZipEntry("app/morphe/C$index.class"))
                zip.write(ByteBuffer.allocate(10).putInt(0xCAFEBABE.toInt()).putShort(0).putShort(major.toShort()).array())
                zip.closeEntry()
            }
        }
    }

    private fun check(file: File) = runCatching { JarFile(file).use { BundleVerifier.requireClassVersions(it) } }.exceptionOrNull()

    @Test
    fun acceptsClassFilesUpToJava17AndRefusesNewerOnes() {
        val accepted = check(jar(52, 55, 61))
        assertTrue("majors 52, 55 and 61 must pass, got $accepted", accepted == null)

        val refused = check(jar(55, 65))
        assertTrue("a major 65 class must fail, got $refused", refused is IllegalArgumentException)
        assertTrue(refused!!.message!!, refused.message!!.contains("app/morphe/C1.class (65)"))

        // A .class entry that isn't one can't hide a newer class behind a bad header.
        val notClass = temporary.newFile().also { file ->
            ZipOutputStream(file.outputStream()).use { zip ->
                zip.putNextEntry(ZipEntry("app/morphe/D.class"))
                zip.write(byteArrayOf(100, 101, 120, 10, 0, 0, 0, 0))
                zip.closeEntry()
            }
        }
        val bad = check(notClass)
        assertTrue("a .class entry without the class magic must fail, got $bad", bad is IllegalArgumentException)
    }
}
