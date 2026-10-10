/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe

import java.io.File
import java.nio.file.Files
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The fixture cache reads a build once per test JVM and again only when the file changes. These run
 * in `:patches:test` on files made here, so they need no vendor APK.
 */
class FixtureCacheTest {
    private fun <T> inScratch(use: (File) -> T): T {
        val folder = Files.createTempDirectory("hushpinterest-fixture-cache").toFile()
        try {
            return use(folder)
        } finally {
            folder.deleteRecursively()
        }
    }

    @Test
    fun `an unchanged file is read once and a changed one again`() = inScratch { folder ->
        val file = File(folder, "pinterest-1.0.0-1.apk").apply { writeText("first") }
        val other = File(folder, "pinterest-2.0.0-2.apk").apply { writeText("other") }
        val cache = FixtureCache { it.readText() }
        assertEquals("first", cache[file])
        assertEquals("the same file by another path", "first", cache[File(folder, "./pinterest-1.0.0-1.apk")])
        assertEquals(1, cache.reads(file))
        assertEquals("other", cache[other])
        assertEquals("each file has an entry of its own", 1, cache.reads(file))
        assertEquals(1, cache.reads(other))

        file.writeText("second, and longer")
        assertEquals("second, and longer", cache[file])
        assertEquals(2, cache.reads(file))

        // The same size with a later date: a replaced or re-signed build can keep its length.
        file.writeText("second, and LONGER")
        assertTrue(file.setLastModified(file.lastModified() + 2_000))
        assertEquals("second, and LONGER", cache[file])
        assertEquals(3, cache.reads(file))
    }

    @Test
    fun `fixture dex unzips a build once however many readers ask`() = inScratch { folder ->
        val payload = javaClass.classLoader.getResourceAsStream("extensions/pinterest.mpe")?.use { it.readBytes() }
            ?: throw AssertionError("extensions/pinterest.mpe is not on the test classpath. :patches:processResources copies it there.")
        val apk = File(folder, "pinterest-1.0.0-1.apk")
        ZipOutputStream(apk.outputStream()).use { zip ->
            for (name in listOf("classes.dex", "classes2.dex", "resources.arsc")) {
                zip.putNextEntry(ZipEntry(name))
                zip.write(if (name.endsWith(".dex")) payload else byteArrayOf(0))
                zip.closeEntry()
            }
        }
        var dexFiles = 0
        FixtureDex.forEach(apk) { dexFiles++ }
        assertEquals("every classes*.dex and nothing else", 2, dexFiles)
        val type = ExtensionDex.classes().first().type
        assertEquals(setOf(type), FixtureDex.classes(apk, setOf(type)).keys)
        FixtureDex.forEach(apk) { }
        assertEquals("three readers, one unzip", 1, FixtureDex.reads(apk))
    }
}
