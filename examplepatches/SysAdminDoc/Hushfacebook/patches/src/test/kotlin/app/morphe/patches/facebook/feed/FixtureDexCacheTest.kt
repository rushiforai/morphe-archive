/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import org.junit.Assert.*
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import java.io.File
import java.nio.file.Files
import java.util.concurrent.CountDownLatch
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

class FixtureDexCacheTest {
    @get:Rule val temporary = TemporaryFolder()

    private fun bundle(file: File, dex: Map<String, ByteArray>, base: Boolean = true): File {
        val apk = temporary.newFile()
        ZipOutputStream(apk.outputStream()).use { zip ->
            for ((name, bytes) in dex) {
                zip.putNextEntry(ZipEntry(name).also { it.time = 0 })
                zip.write(bytes)
                zip.closeEntry()
            }
        }
        ZipOutputStream(file.outputStream()).use { zip ->
            zip.putNextEntry(ZipEntry(if (base) "base.apk" else "split.apk").also { it.time = 0 })
            apk.inputStream().use { it.copyTo(zip) }
            zip.closeEntry()
        }
        return file
    }

    private fun read(cache: FixtureDexCache, file: File): List<ByteArray> = buildList {
        cache.forEach(file) { add(it.copyOf()) }
    }

    private fun refused(cache: FixtureDexCache, file: File) {
        try {
            read(cache, file)
            fail("Changed or invalid bytes must not be returned as a valid fixture")
        } catch (_: IllegalStateException) {
            // The cache explicitly refuses changed bytes.
        }
    }

    @Test fun changedBytesAtTheSamePathSizeAndTimestampAreReadAfresh() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to ByteArray(4096) { 1 }))
        FixtureDexCache().use { cache ->
            assertArrayEquals(ByteArray(4096) { 1 }, read(cache, file).single())
            val timestamp = file.lastModified()
            val size = file.length()
            bundle(file, mapOf("classes.dex" to ByteArray(4096) { 2 }))
            assertEquals(size, file.length())
            assertTrue(file.setLastModified(timestamp))
            assertArrayEquals(ByteArray(4096) { 2 }, read(cache, file).single())
        }
    }

    @Test fun equalNamesInDifferentDirectoriesNeverAliasDifferentContent() {
        val first = bundle(File(temporary.newFolder(), "fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)))
        val second = bundle(File(temporary.newFolder(), "fixture.apkm"), mapOf("classes.dex" to byteArrayOf(2)))
        FixtureDexCache().use { cache ->
            assertArrayEquals(byteArrayOf(1), read(cache, first).single())
            assertArrayEquals(byteArrayOf(2), read(cache, second).single())
            assertArrayEquals(byteArrayOf(1), read(cache, first).single())
        }
    }

    @Test fun repeatedAndRenamedIdenticalInputsKeepTheExpandedFiles() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1, 2, 3)))
        val copy = temporary.newFile("renamed.apkm").also { file.copyTo(it, overwrite = true) }
        FixtureDexCache().use { cache ->
            read(cache, file)
            val expanded = Files.walk(cache.directory).use { paths -> paths.filter { Files.isRegularFile(it) }.toList() }
            assertEquals(1, expanded.size)
            val stamp = Files.getLastModifiedTime(expanded.single())
            assertArrayEquals(byteArrayOf(1, 2, 3), read(cache, file).single())
            assertArrayEquals(byteArrayOf(1, 2, 3), read(cache, copy).single())
            assertEquals(stamp, Files.getLastModifiedTime(expanded.single()))
            assertEquals(1, Files.walk(cache.directory).use { paths -> paths.filter { Files.isRegularFile(it) }.count() }.toInt())
        }
    }

    @Test fun corruptionOfSameSizedExpandedBytesIsRefused() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1, 2, 3)))
        FixtureDexCache().use { cache ->
            read(cache, file)
            val expanded = Files.walk(cache.directory).use { paths -> paths.filter { Files.isRegularFile(it) }.findFirst().get() }
            Files.write(expanded, byteArrayOf(1, 9, 3))
            refused(cache, file)
        }
    }

    @Test fun aMissingExpandedFileIsRefused() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)))
        FixtureDexCache().use { cache ->
            read(cache, file)
            val expanded = Files.walk(cache.directory).use { paths -> paths.filter { Files.isRegularFile(it) }.findFirst().get() }
            Files.delete(expanded)
            refused(cache, file)
        }
    }

    @Test fun failedExpansionDoesNotLeavePartialFilesOrPreventAValidRetry() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)), base = false)
        FixtureDexCache().use { cache ->
            refused(cache, file)
            assertEquals(0, Files.list(cache.directory).use { it.count() }.toInt())
            bundle(file, mapOf("classes.dex" to byteArrayOf(1)))
            assertArrayEquals(byteArrayOf(1), read(cache, file).single())
        }
    }

    @Test fun corruptBundleBytesNeverReuseAnEarlierExpansion() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)))
        FixtureDexCache().use { cache ->
            read(cache, file)
            file.writeBytes(byteArrayOf(1, 2, 3))
            try {
                read(cache, file)
                fail("A corrupt bundle must not return an earlier fixture's bytes")
            } catch (_: java.util.zip.ZipException) {
                // Invalid ZIP data fails before any cached bytes are visited.
            }
        }
    }

    @Test fun aFailureAfterWritingOneDexRemovesTheEntirePartialExpansion() {
        val file = bundle(temporary.newFile("fixture.apkm"), linkedMapOf(
            "classes.dex" to byteArrayOf(1), "classes2.dex" to byteArrayOf(),
        ))
        FixtureDexCache().use { cache ->
            refused(cache, file)
            assertEquals(0, Files.list(cache.directory).use { it.count() }.toInt())
        }
    }

    @Test fun changedInputDuringAReadIsRefused() {
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)))
        FixtureDexCache().use { cache ->
            try {
                cache.forEach(file) { bundle(file, mapOf("classes.dex" to byteArrayOf(2))) }
                fail("A changing input must not finish as a valid read")
            } catch (_: IllegalStateException) {
                assertArrayEquals(byteArrayOf(2), read(cache, file).single())
            }
        }
    }

    @Test fun concurrentFirstReadersSeeAllCompleteDexFilesAndIgnoreOtherEntries() {
        val first = ByteArray(2 * 1024 * 1024) { (it % 251).toByte() }
        val second = ByteArray(2 * 1024 * 1024) { (it % 239).toByte() }
        val file = bundle(temporary.newFile("fixture.apkm"), linkedMapOf(
            "classes.dex" to first, "assets/ignored.dex" to byteArrayOf(9), "classes2.dex" to second,
        ))
        val pool = Executors.newFixedThreadPool(6)
        try {
            FixtureDexCache().use { cache ->
                val ready = CountDownLatch(6)
                val start = CountDownLatch(1)
                val reads = (1..6).map {
                    pool.submit<List<ByteArray>> { ready.countDown(); check(start.await(10, TimeUnit.SECONDS)); read(cache, file) }
                }
                assertTrue(ready.await(10, TimeUnit.SECONDS))
                start.countDown()
                for (result in reads) {
                    val bytes = result.get(30, TimeUnit.SECONDS)
                    assertEquals(2, bytes.size)
                    assertArrayEquals(first, bytes[0])
                    assertArrayEquals(second, bytes[1])
                }
            }
        } finally {
            pool.shutdownNow()
            assertTrue(pool.awaitTermination(10, TimeUnit.SECONDS))
        }
    }

    @Test fun closingDeletesOnlyOwnedTemporaryFilesAndRefusesLaterReads() {
        val sibling = temporary.newFile("keep.txt").also { it.writeText("keep") }
        val file = bundle(temporary.newFile("fixture.apkm"), mapOf("classes.dex" to byteArrayOf(1)))
        val cache = FixtureDexCache()
        read(cache, file)
        cache.close()
        cache.close()
        assertFalse(Files.exists(cache.directory))
        assertEquals("keep", sibling.readText())
        refused(cache, file)
    }
}
