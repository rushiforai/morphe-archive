package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue
import org.junit.Assume.assumeTrue

class MicrophoneInputRecoveryPatchTest {
    private fun hex(value: String): ByteArray =
        ByteArray(value.length / 2) { value.substring(it * 2, it * 2 + 2).toInt(16).toByte() }

    private val libraryName = "lib/arm64-v8a/libvrlink_scene.so"
    private val libraryBytes = 2_221_072

    private val originalCave = hex(
        "5f0c0e31e1010054fd7bbea9f30b00f9fd030091f30300aa80fdff9000ac20915651049408b48352" +
            "290080526802088b09fd9f08f30b40f9fd7bc2a8c0035fd660fdfff0e103022a00403c914b510414",
    )
    private val patchedCave = hex(
        "fd7bbea9fd030091e00701a9210900b021d047f9e20314aad8510494e00741a9fd7bc2a8d9510414" +
            "00013fd64003003508b483526802088b1ffd9f0816000014",
    ) + originalCave.copyOfRange(64, 0x50)

    private fun syntheticLibrary(presetWord: String = "c1008052"): ByteArray {
        val bytes = ByteArray(libraryBytes) { 0x5a }
        hex("7f454c460201010000000000").copyInto(bytes, 0)
        hex("e00b40f9").copyInto(bytes, 0xF4580)
        hex(presetWord).copyInto(bytes, 0xF4584)
        hex("9a520494").copyInto(bytes, 0xF4588)
        hex("08b38352").copyInto(bytes, 0xF458C)
        hex("e00b40f9").copyInto(bytes, 0xF4590)
        hex("9502088b").copyInto(bytes, 0xF4594)
        hex("e10315aa").copyInto(bytes, 0xF4598)
        hex("7d520494").copyInto(bytes, 0xF459C)
        originalCave.copyInto(bytes, 0xF4808)
        hex("680240f9").copyInto(bytes, 0xF4884)
        hex("e00313aa").copyInto(bytes, 0xF4888)
        hex("21008052").copyInto(bytes, 0xF488C)
        hex("02709752").copyInto(bytes, 0xF4890)
        hex("080940f9").copyInto(bytes, 0xF4894)
        hex("00013fd6").copyInto(bytes, 0xF4898)
        hex("f30b40f9").copyInto(bytes, 0xF489C)
        RECOVERY_LINKAGE_GUARDS.forEach { (offset, expected) -> expected.copyInto(bytes, offset) }
        return bytes
    }

    private fun patch(bytes: ByteArray) = patchMicrophoneInputRecovery(bytes, "2.0.20", "5001712")

    @Test
    fun `patches exactly the three verified regions`() {
        val input = syntheticLibrary()
        val output = patch(input)

        assertEquals(input.size, output.size)
        assertContentEquals(hex("9b000094"), output.copyOfRange(0xF459C, 0xF45A0))
        assertContentEquals(patchedCave, output.copyOfRange(0xF4808, 0xF4858))
        assertContentEquals(hex("e6ffff17"), output.copyOfRange(0xF4898, 0xF489C))

        val changed = input.indices.filter { input[it] != output[it] }
        assertTrue(changed.all {
            it in 0xF459C until 0xF45A0 || it in 0xF4808 until 0xF4848 || it in 0xF4898 until 0xF489C
        })
        assertEquals(66, changed.size)
    }

    @Test
    fun `is idempotent and does not mutate its input`() {
        val input = syntheticLibrary()
        val snapshot = input.copyOf()
        val once = patch(input)
        assertContentEquals(snapshot, input)
        assertContentEquals(once, patch(once))
    }

    @Test
    fun `every supported preset instruction is accepted`() {
        listOf("c1008052", "e1008052", "21018052", "41018052").forEach {
            patch(syntheticLibrary(it))
        }
    }

    @Test
    fun `an unsupported preset instruction is rejected`() {
        assertFailsWith<PatchException> { patch(syntheticLibrary("21008052")) }
    }

    @Test
    fun `other builds are left unchanged`() {
        val input = ByteArray(64) { it.toByte() }
        assertContentEquals(input, patchMicrophoneInputRecovery(input, "2.0.20", "5001812"))
        assertContentEquals(input, patchMicrophoneInputRecovery(input, "2.0.22", "5002244"))
        assertContentEquals(input, patchMicrophoneInputRecovery(input, "2.0.23", "5002363"))
        assertContentEquals(input, patchMicrophoneInputRecovery(input, "2.0.21", "5001712"))
    }

    @Test
    fun `wrong library size is rejected`() {
        assertFailsWith<PatchException> { patch(syntheticLibrary().copyOf(libraryBytes + 4)) }
        assertFailsWith<PatchException> { patch(ByteArray(16)) }
    }

    @Test
    fun `any wrong byte at a gated region is rejected without partial output`() {
        val gated = (0xF4580 until 0xF45A0) + (0xF4808 until 0xF4858) + (0xF4884 until 0xF48A0)
        val baseline = syntheticLibrary()
        for (offset in gated) {
            if (offset in 0xF4584 until 0xF4588) continue // preset immediate has its own test
            val corrupted = baseline.copyOf()
            corrupted[offset] = (corrupted[offset].toInt() xor 0x01).toByte()
            val snapshot = corrupted.copyOf()
            assertFailsWith<PatchException>("offset 0x${offset.toString(16)}") { patch(corrupted) }
            assertContentEquals(snapshot, corrupted)
        }
    }

    @Test
    fun `a partially patched library is rejected`() {
        val partial = syntheticLibrary()
        hex("9b000094").copyInto(partial, 0xF459C)
        assertFailsWith<PatchException> { patch(partial) }

        val partialTick = syntheticLibrary()
        hex("e6ffff17").copyInto(partialTick, 0xF4898)
        assertFailsWith<PatchException> { patch(partialTick) }
    }

    @Test
    fun `callback and linkage corruption is rejected atomically`() {
        for ((offset, _) in RECOVERY_LINKAGE_GUARDS) {
            val bytes = syntheticLibrary()
            bytes[offset] = (bytes[offset].toInt() xor 1).toByte()
            val before = bytes.copyOf()
            assertFailsWith<PatchException> { patch(bytes) }
            assertContentEquals(before, bytes)
        }
    }

    @Test
    fun `non ELF input is rejected`() {
        val bytes = syntheticLibrary()
        bytes[1] = 0
        assertFailsWith<PatchException> { patch(bytes) }
    }

    private fun findRetained(relative: String): File? {
        var dir: File? = File(System.getProperty("user.dir")).absoluteFile
        while (dir != null) {
            val candidate = File(dir, relative)
            if (candidate.isFile) return candidate
            dir = dir.parentFile
        }
        return null
    }

    private fun readLibrary(apk: File): ByteArray =
        ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry(libraryName)).readBytes() }

    private fun assertRealLibrary(apkRelative: String, expectedPresetWord: String, expectedSha256: String) {
        val apk = findRetained(apkRelative)
        assumeTrue("retained APK $apkRelative absent", apk != null)
        val input = readLibrary(apk!!)
        val actualSha256 = MessageDigest.getInstance("SHA-256").digest(input)
            .joinToString("") { "%02x".format(it) }
        assertEquals(expectedSha256, actualSha256, "retained library identity")
        assertEquals(libraryBytes, input.size)
        assertContentEquals(hex(expectedPresetWord), input.copyOfRange(0xF4584, 0xF4588))
        val output = patch(input)
        assertEquals(input.size, output.size)
        assertContentEquals(hex("9b000094"), output.copyOfRange(0xF459C, 0xF45A0))
        assertContentEquals(patchedCave, output.copyOfRange(0xF4808, 0xF4858))
        assertContentEquals(hex("e6ffff17"), output.copyOfRange(0xF4898, 0xF489C))
        assertContentEquals(input.copyOfRange(0xF4584, 0xF4588), output.copyOfRange(0xF4584, 0xF4588))
        val changed = input.indices.count { input[it] != output[it] }
        assertEquals(66, changed)
        assertContentEquals(output, patch(output))
    }

    @Test
    fun `real clean 5001712 library patches as planned`() {
        assertRealLibrary(
            "Ready-to-Install/Morphe-Inputs/2.0.20-5001712-recommended-clean.apk",
            "e1008052",
            "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495",
        )
    }

    @Test
    fun `real rollback 5001712 library patches as planned`() {
        assertRealLibrary(
            "Morphe/incoming-20261019/rollback-installed-2.0.20-5001712-base.apk",
            "c1008052",
            "9a9754a3295748ca03ce0145f07c5ee91b1afea0f360b92ba0c0e740df976828",
        )
    }
}
