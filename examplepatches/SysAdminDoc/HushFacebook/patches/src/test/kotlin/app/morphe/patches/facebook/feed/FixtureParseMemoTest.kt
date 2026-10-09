/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

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
 * FixtureDex parses each bundle once per test JVM through FixtureParseMemo. Synthetic bundles
 * here, so this runs with the quick patch tests and needs no fixture folder.
 */
class FixtureParseMemoTest {
    @get:Rule val temporary = TemporaryFolder()

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

    private class Counted(cache: FixtureDexCache) {
        var reads = 0
        var parses = 0
        val memo = FixtureParseMemo({ file, visit -> reads++; cache.forEach(file, visit) }) { bytes ->
            parses++
            String(bytes)
        }
    }

    @Test fun aBundleIsReadAndParsedOnceHoweverOftenItIsAskedFor() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to "one", "classes2.dex" to "two"))
        FixtureDexCache().use { cache ->
            val counted = Counted(cache)
            repeat(3) { assertEquals(listOf("one", "two"), counted.memo.get(file)) }
            assertEquals("the bundle's reads", 1, counted.reads)
            assertEquals("the dex files parsed", 2, counted.parses)
        }
    }

    @Test fun aBundleReplacedUnderTheSamePathIsReadAfresh() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to "one"))
        FixtureDexCache().use { cache ->
            val counted = Counted(cache)
            assertEquals(listOf("one"), counted.memo.get(file))
            val before = file.lastModified()
            bundle(file, mapOf("classes.dex" to "three", "classes2.dex" to "four"))
            assertTrue(file.setLastModified(before + 10_000))
            assertEquals(listOf("three", "four"), counted.memo.get(file))
            assertEquals("the bundle's reads", 2, counted.reads)
        }
    }

    @Test fun twoBundlesKeepTheirOwnParsedSets() {
        val first = bundle(File(temporary.newFolder(), "fixture.apkm"), mapOf("classes.dex" to "first"))
        val second = bundle(File(temporary.newFolder(), "fixture.apkm"), mapOf("classes.dex" to "second"))
        FixtureDexCache().use { cache ->
            val counted = Counted(cache)
            repeat(2) {
                assertEquals(listOf("first"), counted.memo.get(first))
                assertEquals(listOf("second"), counted.memo.get(second))
            }
            assertEquals("the bundles' reads", 2, counted.reads)
        }
    }

    @Test fun aBundleThatChangesWhileItIsReadIsRefusedAndNotKept() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to "one"))
        FixtureDexCache().use { cache ->
            var touch = true
            val memo = FixtureParseMemo({ bundle: File, visit: (ByteArray) -> Unit ->
                cache.forEach(bundle, visit)
                if (touch) assertTrue(bundle.setLastModified(bundle.lastModified() + 10_000))
            }) { bytes -> String(bytes) }
            val refused = assertThrows(IllegalStateException::class.java) { memo.get(file) }
            assertTrue(refused.message.orEmpty(), refused.message.orEmpty().contains("changed while reading"))
            touch = false
            assertEquals(listOf("one"), memo.get(file))
        }
    }
}
