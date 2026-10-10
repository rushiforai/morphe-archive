/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at 5b7bce1f (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe

import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

/**
 * The fixture tests' dex reader parses each Threads build once per test JVM through
 * FixtureParseMemo. Synthetic bundles here, read by the same fixtureDexBytes, so this runs with the
 * quick patch tests and needs no fixture folder.
 */
class FixtureParseMemoTest {
    @get:Rule val temporary = TemporaryFolder()

    /** An .apkm the way the vendor ships one: the dex files in base.apk, inside the bundle. */
    private fun bundle(file: File, dex: Map<String, String>): File {
        val apk = temporary.newFile()
        ZipOutputStream(apk.outputStream()).use { zip ->
            for ((name, text) in dex) {
                zip.putNextEntry(ZipEntry(name).also { it.time = 0 })
                zip.write(text.toByteArray())
                zip.closeEntry()
            }
        }
        ZipOutputStream(file.outputStream()).use { zip ->
            zip.putNextEntry(ZipEntry("base.apk").also { it.time = 0 })
            apk.inputStream().use { it.copyTo(zip) }
            zip.closeEntry()
        }
        return file
    }

    private class Counted {
        var reads = 0
        var parses = 0
        val memo = FixtureParseMemo({ file, visit -> reads++; fixtureDexBytes(file, visit) }) { bytes ->
            parses++
            String(bytes)
        }
    }

    @Test fun aBundleIsReadAndParsedOnceHoweverOftenItIsAskedFor() {
        val file = bundle(temporary.newFile("threads-test.apkm"), mapOf("classes.dex" to "one", "classes2.dex" to "two"))
        val counted = Counted()
        repeat(3) { assertEquals(listOf("one", "two"), counted.memo.get(file)) }
        assertEquals("the bundle's reads", 1, counted.reads)
        assertEquals("the dex files parsed", 2, counted.parses)
    }

    @Test fun onlyTheDexFilesOfTheBaseApkAreRead() {
        val file = bundle(
            temporary.newFile("threads-test.apkm"),
            mapOf("classes.dex" to "one", "assets/classes9.dex" to "asset", "resources.arsc" to "table"),
        )
        assertEquals(listOf("one"), Counted().memo.get(file))
    }

    @Test fun aBundleReplacedUnderTheSamePathIsReadAfresh() {
        val file = bundle(temporary.newFile("threads-test.apkm"), mapOf("classes.dex" to "one"))
        val counted = Counted()
        assertEquals(listOf("one"), counted.memo.get(file))
        val before = file.lastModified()
        bundle(file, mapOf("classes.dex" to "three", "classes2.dex" to "four"))
        assertTrue(file.setLastModified(before + 10_000))
        assertEquals(listOf("three", "four"), counted.memo.get(file))
        assertEquals("the bundle's reads", 2, counted.reads)
    }

    @Test fun twoBundlesKeepTheirOwnParsedSets() {
        val first = bundle(File(temporary.newFolder(), "threads-test.apkm"), mapOf("classes.dex" to "first"))
        val second = bundle(File(temporary.newFolder(), "threads-test.apkm"), mapOf("classes.dex" to "second"))
        val counted = Counted()
        repeat(2) {
            assertEquals(listOf("first"), counted.memo.get(first))
            assertEquals(listOf("second"), counted.memo.get(second))
        }
        assertEquals("the bundles' reads", 2, counted.reads)
    }

    @Test fun aBundleThatChangesWhileItIsReadIsRefusedAndNotKept() {
        val file = bundle(temporary.newFile("threads-test.apkm"), mapOf("classes.dex" to "one"))
        var touch = true
        val memo = FixtureParseMemo({ build: File, visit: (ByteArray) -> Unit ->
            fixtureDexBytes(build, visit)
            if (touch) assertTrue(build.setLastModified(build.lastModified() + 10_000))
        }) { bytes -> String(bytes) }
        val refused = assertThrows(IllegalStateException::class.java) { memo.get(file) }
        assertTrue(refused.message.orEmpty(), refused.message.orEmpty().contains("changed while reading"))
        touch = false
        assertEquals(listOf("one"), memo.get(file))
    }
}
