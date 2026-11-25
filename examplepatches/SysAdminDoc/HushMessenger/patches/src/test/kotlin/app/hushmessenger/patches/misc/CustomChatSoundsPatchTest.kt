package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.patch.FilePathOption
import app.morphe.patcher.patch.PatchException
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.security.MessageDigest
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import kotlin.test.*

class CustomChatSoundsPatchTest {
    @TempDir lateinit var dir: File

    private val send = "OggS".toByteArray() + ByteArray(48) { it.toByte() }
    private val sent = "OggS".toByteArray() + ByteArray(48) { (it * 5).toByte() }
    private val inApp = ByteArray(4) + "ftypM4A ".toByteArray() + ByteArray(32) { (it * 7).toByte() }
    private val mine = "OggS".toByteArray() + ByteArray(40) { (it * 11).toByte() }
    private fun sha(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private val sendStock get() = StockSound("send", sha(send), patch = CHAT_SOUNDS_PATCH)
    private val sentStock get() = StockSound("sent", sha(sent), patch = CHAT_SOUNDS_PATCH)
    private val inAppStock get() = StockSound("in-app message", sha(inApp), "m4a", CHAT_SOUNDS_PATCH)

    /** A decoded APK with the three stock sounds at obfuscated paths and a file that isn't one of them. */
    private fun apk(): Pair<File, List<String>> {
        val root = dir.resolve("apk")
        val files = linkedMapOf("res/ft8.ogg" to send, "res/ft9.ogg" to sent, "res/frw.m4a" to inApp, "res/fsx.ogg" to mine.reversedArray())
        for ((path, bytes) in files) root.resolve(path).apply { parentFile.mkdirs() }.writeBytes(bytes)
        return root to files.keys.toList()
    }

    private fun chosen(name: String, bytes: ByteArray) = dir.resolve(name).apply { writeBytes(bytes) }.path

    @Test fun replacesOnlyTheChosenSoundsAndKeepsTheirPaths() {
        val (root, entries) = apk()
        val written = replaceChatSounds(mapOf(sendStock to chosen("pop.ogg", mine), sentStock to null, inAppStock to " "), entries) { root.resolve(it) }
        assertEquals(listOf("res/ft8.ogg"), written)
        assertContentEquals(mine, root.resolve("res/ft8.ogg").readBytes())
        assertContentEquals(sent, root.resolve("res/ft9.ogg").readBytes())
        assertContentEquals(inApp, root.resolve("res/frw.m4a").readBytes())
    }

    /** The in-app sound is an .m4a in Messenger, and an .ogg chosen for it still goes in at that path. */
    @Test fun anyFormatGoesInAtTheStockPath() {
        val (root, entries) = apk()
        replaceChatSounds(mapOf(inAppStock to chosen("ding.ogg", mine), sentStock to chosen("done.ogg", mine)), entries) { root.resolve(it) }
        assertContentEquals(mine, root.resolve("res/frw.m4a").readBytes())
        assertContentEquals(mine, root.resolve("res/ft9.ogg").readBytes())
        assertContentEquals(send, root.resolve("res/ft8.ogg").readBytes())
    }

    @Test fun oneUnusableChoiceChangesNothing() {
        val (root, entries) = apk()
        val bad = assertFailsWith<PatchException> {
            replaceChatSounds(mapOf(sendStock to chosen("pop.ogg", mine), sentStock to chosen("done.ogg", "nope".toByteArray())), entries) { root.resolve(it) }
        }
        assertContains(bad.message.orEmpty(), CHAT_SOUNDS_PATCH)
        assertContentEquals(send, root.resolve("res/ft8.ogg").readBytes())
        assertContentEquals(sent, root.resolve("res/ft9.ogg").readBytes())
    }

    @Test fun refusesAnApkWithoutTheStockSound() {
        val (root, entries) = apk()
        root.resolve("res/ft9.ogg").writeBytes(mine)
        val missing = assertFailsWith<PatchException> {
            replaceChatSounds(mapOf(sendStock to chosen("pop.ogg", mine), sentStock to chosen("done.ogg", mine)), entries) { root.resolve(it) }
        }
        assertContains(missing.message.orEmpty(), "doesn't have Messenger's original sent sound")
        assertContentEquals(send, root.resolve("res/ft8.ogg").readBytes())
    }

    @Test fun startsUnselectedWithThreeOptionalFileChoices() {
        assertEquals(CHAT_SOUNDS_PATCH, customChatSoundsPatch.name)
        assertFalse(customChatSoundsPatch.default)
        assertEquals(setOf(SEND_SOUND_KEY, SENT_SOUND_KEY, IN_APP_SOUND_KEY), customChatSoundsPatch.options.keys)
        for (key in customChatSoundsPatch.options.keys) {
            val option = customChatSoundsPatch.options.getValue(key)
            assertIs<FilePathOption>(option)
            assertFalse(option.required)
            assertNull(option.default)
            try {
                assertFails { customChatSoundsPatch.options.set(key, "C:/sounds/tone.flac") }
                customChatSoundsPatch.options.set(key, "C:/sounds/tone.M4A")
            } finally {
                option.reset()
            }
        }
        val description = customChatSoundsPatch.description.orEmpty()
        assertContains(description, "1 MB")
        assertContains(description, "Expert mode")
        assertFalse(description.contains('\u2014') || description.contains('\u2013'))
    }

    /** Every supported stock APK carries each sound once, stored uncompressed so Android can play it from the APK. */
    @Test fun everyStockBuildHasExactlyOneStoredCopyOfEachSound() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        val sizes = mapOf(SEND_SOUND to 7_563L, SENT_SOUND to 6_977L, IN_APP_SOUND to 10_567L)
        for (apk in apks) ZipFile(apk.toFile()).use { zip ->
            val entries = zip.entries().asSequence().map { it.name }.toList()
            for ((stock, size) in sizes) {
                val path = findMessageSound(entries, stock) { name -> zip.getInputStream(zip.getEntry(name)).use { it.readBytes() } }
                assertEquals(ZipEntry.STORED, zip.getEntry(path).method, "$apk $path")
                assertEquals(size, zip.getEntry(path).size, "$apk $path")
            }
        }
    }
}
