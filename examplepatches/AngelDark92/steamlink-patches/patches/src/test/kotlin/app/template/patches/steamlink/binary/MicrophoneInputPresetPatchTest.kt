package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest
import org.junit.Assume.assumeTrue
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class MicrophoneInputPresetPatchTest {
    private val presets = mapOf(
        "voice-communication" to 7,
        "voice-recognition" to 6,
        "unprocessed" to 9,
        "voice-performance" to 10,
    )

    private fun mov(value: Int): ByteArray {
        val word = 0x52800001 or (value shl 5)
        return byteArrayOf(word.toByte(), (word ushr 8).toByte(), (word ushr 16).toByte(), (word ushr 24).toByte())
    }

    private val prefix = byteArrayOf(0xe0.toByte(), 0x0b, 0x40, 0xf9.toByte())

    private fun synthetic(size: Int, site: Int, preset: Int = 7) = ByteArray(size).apply {
        prefix.copyInto(this, site - 4)
        mov(preset).copyInto(this, site)
    }

    @Test
    fun `unsupported pairs stay byte identical without reading layout`() {
        val bytes = ByteArray(64) { it.toByte() }
        listOf(
            "2.0.24" to "5002526", "2.0.24" to "5002528", "2.0.23" to "5002527",
            "2.0.22" to "5002244", "2.0.20" to "5001712",
        ).forEach { (version, code) ->
            assertContentEquals(bytes, patchNativeMicrophonePreset(bytes, "voice-recognition", version, code))
        }
    }

    @Test
    fun `5002527 rejects wrong size and unknown presets without mutation`() {
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(ByteArray(64), "voice-recognition", "2.0.24", "5002527")
        }
        val wrongSize = synthetic(2_333_473, 0xF903C)
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(wrongSize, "voice-recognition", "2.0.24", "5002527")
        }
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(synthetic(2_333_472, 0xF903C), "bogus", "2.0.24", "5002527")
        }
    }

    @Test
    fun `5002527 rejects same size foreign code that merely carries the signature`() {
        // The whole OpenStreams function is hashed: prefix + MOV alone is not enough here.
        val foreign = synthetic(2_333_472, 0xF903C)
        val before = foreign.copyOf()
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(foreign, "voice-recognition", "2.0.24", "5002527")
        }
        assertContentEquals(before, foreign)
    }

    @Test
    fun `5002395 synthetic signature layout still applies all four presets`() {
        val stock = synthetic(2_301_432, 0xF5710)
        presets.forEach { (name, value) ->
            val patched = patchNativeMicrophonePreset(stock, name, "2.0.24", "5002395")
            assertContentEquals(mov(value), patched.copyOfRange(0xF5710, 0xF5714))
            assertContentEquals(
                stock.copyOfRange(0, 0xF5710), patched.copyOfRange(0, 0xF5710))
            assertContentEquals(
                stock.copyOfRange(0xF5714, stock.size), patched.copyOfRange(0xF5714, patched.size))
        }
        // A 5002395 layout must not apply to the 5002527 pair.
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(stock, "voice-recognition", "2.0.24", "5002527")
        }
    }

    @Test
    fun `decoded 5002527 scene applies every preset transition idempotently`() {
        val stock = decodedScene("2.0.24", "5002527")
        assertEquals(2_333_472, stock.size)
        assertEquals(
            "cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03", sha256(stock))
        val site = 0xF903C
        assertContentEquals(mov(7), stock.copyOfRange(site, site + 4))
        presets.forEach { (from, fromValue) ->
            val first = patchNativeMicrophonePreset(stock, from, "2.0.24", "5002527")
            assertContentEquals(mov(fromValue), first.copyOfRange(site, site + 4))
            assertContentEquals(first, patchNativeMicrophonePreset(first, from, "2.0.24", "5002527"))
            presets.forEach { (to, toValue) ->
                val next = patchNativeMicrophonePreset(first, to, "2.0.24", "5002527")
                assertContentEquals(patchNativeMicrophonePreset(stock, to, "2.0.24", "5002527"), next)
                assertContentEquals(mov(toValue), next.copyOfRange(site, site + 4))
                val changed = stock.indices.filter { stock[it] != next[it] }
                assertTrue(changed.all { it in site until site + 4 }, "unrelated bytes changed: $changed")
            }
        }
        // A tampered byte elsewhere in the same function, or a foreign pair, is refused.
        val tampered = stock.copyOf().apply { this[0xF8E30] = (this[0xF8E30].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            patchNativeMicrophonePreset(tampered, "voice-recognition", "2.0.24", "5002527")
        }
        assertContentEquals(stock, patchNativeMicrophonePreset(stock, "voice-recognition", "2.0.23", "5002527"))
    }

    @Test
    fun `decoded 5002395 scene keeps its verified preset transitions`() {
        val stock = decodedScene("2.0.24", "5002395")
        val site = 0xF5710
        presets.forEach { (name, value) ->
            val patched = patchNativeMicrophonePreset(stock, name, "2.0.24", "5002395")
            assertContentEquals(mov(value), patched.copyOfRange(site, site + 4))
            assertTrue(stock.indices.filter { stock[it] != patched[it] }.all { it in site until site + 4 })
        }
    }

    private fun decodedScene(version: String, code: String): ByteArray {
        val relative = "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        // Fresh checkouts lack the ignored proprietary decoded APK; skip only when it is absent.
        assumeTrue("Real decoded-input audit BLOCKED: missing exact $version/$code scene", scene != null)
        return requireNotNull(scene).readBytes()
    }

    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
}
