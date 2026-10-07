package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.patch.FilePathOption
import app.morphe.patcher.patch.PatchException
import java.io.File
import java.io.RandomAccessFile
import java.nio.file.Files
import java.nio.file.Path
import java.security.MessageDigest
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import kotlin.test.*

class CustomMessageSoundPatchTest {
    @TempDir lateinit var dir: File

    private val stock = "OggS".toByteArray() + ByteArray(64) { it.toByte() }
    private val other = "OggS".toByteArray() + ByteArray(64) { (it * 3).toByte() }
    private fun sha(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    /** A decoded APK with the stock sound at an obfuscated path, another sound and a non-audio file. */
    private fun apk(vararg extra: Pair<String, ByteArray>): Pair<File, List<String>> {
        val root = dir.resolve("apk")
        val files = linkedMapOf("res/lns.ogg" to stock, "res/lnt.ogg" to other, "res/xyz.xml" to "<x/>".toByteArray()) + extra
        for ((path, bytes) in files) root.resolve(path).apply { parentFile.mkdirs() }.writeBytes(bytes)
        return root to files.keys.toList()
    }

    private fun chosen(name: String, bytes: ByteArray) = dir.resolve(name).apply { writeBytes(bytes) }.path

    private fun replace(path: String?, root: File, entries: List<String>) =
        replaceMessageSound(path, entries, { root.resolve(it) }, sha(stock))

    @Test fun replacesOnlyTheStockSoundAndKeepsItsPath() {
        for ((name, bytes) in listOf(
            "tone.ogg" to "OggS".toByteArray() + ByteArray(10) { 7 },
            "tone.MP3" to "ID3".toByteArray() + ByteArray(10) { 1 },
            "frames.mp3" to byteArrayOf(0xFF.toByte(), 0xFB.toByte(), 0x90.toByte(), 0x64),
            "tone.m4a" to byteArrayOf(0, 0, 0, 0x20) + "ftypM4A ".toByteArray(),
            "tone.wav" to "RIFF".toByteArray() + ByteArray(4) + "WAVEfmt ".toByteArray(),
        )) {
            dir.resolve("apk").deleteRecursively()
            val (root, entries) = apk()
            assertEquals("res/lns.ogg", replace(chosen(name, bytes), root, entries), name)
            assertContentEquals(bytes, root.resolve("res/lns.ogg").readBytes(), name)
            assertContentEquals(other, root.resolve("res/lnt.ogg").readBytes(), name)
            assertEquals(listOf("lns.ogg", "lnt.ogg", "xyz.xml"), root.resolve("res").list()!!.sorted(), name)
        }
    }

    @Test fun anEmptyChoiceChangesNothingAndReadsNothing() {
        for (blank in listOf(null, "", "   ")) {
            assertNull(replaceMessageSound(blank, listOf("res/lns.ogg"), { fail("read $it") }))
        }
        assertTrue(customMessageSoundPatch.options.getValue(MESSAGE_SOUND_KEY).value == null)
    }

    @Test fun acceptsExactlyOneMegabyteAndRefusesOneByteMore() {
        val (root, entries) = apk()
        val limit = dir.resolve("limit.ogg")
        RandomAccessFile(limit, "rw").use { it.setLength(MESSAGE_SOUND_LIMIT); it.write("OggS".toByteArray()) }
        assertEquals(1_048_576L, limit.length())
        assertEquals("res/lns.ogg", replace(limit.path, root, entries))
        assertEquals(MESSAGE_SOUND_LIMIT, root.resolve("res/lns.ogg").length())

        val (fresh, freshEntries) = apk().also { root.resolve("res/lns.ogg").writeBytes(stock) }
        val over = dir.resolve("over.ogg")
        RandomAccessFile(over, "rw").use { it.setLength(MESSAGE_SOUND_LIMIT + 1); it.write("OggS".toByteArray()) }
        val failure = assertFailsWith<PatchException> { replace(over.path, fresh, freshEntries) }
        assertContains(failure.message.orEmpty(), "1,048,576-byte (1 MB) limit")
        assertContentEquals(stock, fresh.resolve("res/lns.ogg").readBytes())
    }

    @Test fun refusesUnusableFilesBeforeChangingAnything() {
        val cases = mapOf(
            chosen("tone.flac", "fLaC".toByteArray()) to "isn't an .ogg, .mp3, .m4a or .wav file",
            chosen("tone", "OggS".toByteArray()) to "isn't an .ogg, .mp3, .m4a or .wav file",
            dir.resolve("missing.ogg").path to "doesn't exist or isn't a file",
            dir.resolve("folder.ogg").apply { mkdirs() }.path to "doesn't exist or isn't a file",
            chosen("empty.ogg", ByteArray(0)) to "is empty",
            chosen("page.mp3", "<html>".toByteArray()) to "doesn't start like a .mp3 file",
            chosen("renamed.wav", "OggS".toByteArray() + ByteArray(12)) to "doesn't start like a .wav file",
            chosen("short.m4a", "ftyp".toByteArray()) to "doesn't start like a .m4a file",
        )
        for ((path, reason) in cases) {
            val (root, entries) = apk()
            val failure = assertFailsWith<PatchException>(path) { replace(path, root, entries) }
            assertContains(failure.message.orEmpty(), reason, message = path)
            assertTrue(failure.message.orEmpty().startsWith("$MESSAGE_SOUND_PATCH: "), path)
            assertContentEquals(stock, root.resolve("res/lns.ogg").readBytes(), path)
        }
    }

    @Test fun refusesAnApkWithoutExactlyOneStockSound() {
        val good = chosen("tone.ogg", "OggS".toByteArray() + ByteArray(8))
        // Copies outside res/ or under another extension don't count.
        val (root, entries) = apk("assets/lns.ogg" to stock, "res/lnu.m4a" to stock)
        assertEquals("res/lns.ogg", replace(good, root, entries))

        val (missing, missingEntries) = apk()
        missing.resolve("res/lns.ogg").writeBytes(other)
        val none = assertFailsWith<PatchException> { replace(good, missing, missingEntries) }
        assertContains(none.message.orEmpty(), "doesn't have Messenger's original new-message sound")
        assertContains(none.message.orEmpty(), MessengerTarget.supportedApks())

        dir.resolve("apk").deleteRecursively()
        val (twice, twiceEntries) = apk("res/lnv.ogg" to stock)
        val two = assertFailsWith<PatchException> { replace(good, twice, twiceEntries) }
        assertContains(two.message.orEmpty(), "2 copies")
        assertContentEquals(stock, twice.resolve("res/lns.ogg").readBytes())
        assertContentEquals(stock, twice.resolve("res/lnv.ogg").readBytes())
    }

    @Test fun startsUnselectedWithAnOptionalFileChoice() {
        assertEquals(MESSAGE_SOUND_PATCH, customMessageSoundPatch.name)
        assertFalse(customMessageSoundPatch.default)
        assertEquals(setOf(MESSAGE_SOUND_KEY), customMessageSoundPatch.options.keys)
        val option = customMessageSoundPatch.options.getValue(MESSAGE_SOUND_KEY)
        assertIs<FilePathOption>(option)
        assertFalse(option.required)
        assertNull(option.default)
        try {
            assertFails { customMessageSoundPatch.options.set(MESSAGE_SOUND_KEY, "C:/sounds/tone.flac") }
            customMessageSoundPatch.options.set(MESSAGE_SOUND_KEY, "C:/sounds/tone.OGG")
            customMessageSoundPatch.options.set(MESSAGE_SOUND_KEY, "")
        } finally {
            option.reset()
        }
        val description = customMessageSoundPatch.description.orEmpty()
        assertContains(description, "1 MB")
        assertContains(description, "Leave the file empty")
        assertFalse(description.contains('\u2014') || description.contains('\u2013'))
    }

    /** All supported stock APKs carry the sound once, stored uncompressed so Android can play it from the APK. */
    @Test fun everyStockBuildHasExactlyOneStoredNewMessageSound() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        val paths = mutableSetOf<String>()
        for (apk in apks) ZipFile(apk.toFile()).use { zip ->
            val entries = zip.entries().asSequence().toList()
            val path = findMessageSound(entries.map { it.name }) { name -> zip.getInputStream(zip.getEntry(name)).use { it.readBytes() } }
            assertEquals(ZipEntry.STORED, zip.getEntry(path).method, "$apk $path")
            assertEquals(11_615L, zip.getEntry(path).size, "$apk $path")
            paths += path
        }
        assertTrue(paths.size > 1, "The obfuscated path differs between builds, so it can't be pinned: $paths")
    }
}
