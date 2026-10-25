package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.PatchCategories
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/** Real decoded-byte audit for the restored five-build Network Optimizations port. */
class NetworkOptimizationsPatchTest {
    private data class Base(val version: String, val code: String, val sceneSize: Int, val mainSize: Int)

    private val bases = listOf(
        Base("2.0.20", "5001712", 2_221_072, 14_296_520),
        Base("2.0.20", "5001812", 2_220_872, 14_243_496),
        Base("2.0.21", "5001968", 2_234_048, 15_533_936),
        Base("2.0.22", "5002244", 2_251_920, 15_737_032),
        Base("2.0.23", "5002363", 2_292_008, 15_826_584),
        Base("2.0.24", "5002395", 2_301_432, 15_929_432),
    )

    @Test
    fun `metadata covers every supported Steam Link build`() {
        assertEquals("Network Optimizations", networkOptimizationsPatch.name)
        assertTrue(networkOptimizationsPatch.default)
        assertEquals(PatchCategories.STREAMING_AND_NETWORK, networkOptimizationsPatch.category)
        bases.forEach { assertTrue(networkOptimizationsPatch.supports(it.version, it.code.toInt()), it.code) }
        listOf("2.0.22" to 5002322, "2.0.23" to 5002364, "2.0.20" to 5001740)
            .forEach { (version, code) -> assertFalse(networkOptimizationsPatch.supports(version, code)) }
    }

    @Test
    fun `every decoded base patches and reapplies idempotently`() {
        bases.forEach { base ->
            val scene = decoded(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize)
            val main = decoded(base, "lib/arm64-v8a/libmain.so", base.mainSize)
            val sceneSnapshot = scene.copyOf()
            val mainSnapshot = main.copyOf()

            val patchedScene = applyNetworkOptimizationsScene(scene, base.version, base.code)
            val patchedMain = applyNetworkOptimizationsMain(main, base.version, base.code)

            assertTrue(scene.contentEquals(sceneSnapshot), "${base.code} scene input mutated")
            assertTrue(main.contentEquals(mainSnapshot), "${base.code} main input mutated")
            assertEquals(base.sceneSize, patchedScene.size)
            assertEquals(base.mainSize, patchedMain.size)
            assertFalse(scene.contentEquals(patchedScene), "${base.code} scene unchanged")
            assertFalse(main.contentEquals(patchedMain), "${base.code} main unchanged")
            assertTrue(patchedScene.contentEquals(
                applyNetworkOptimizationsScene(patchedScene, base.version, base.code)), "${base.code} scene reapply")
            assertTrue(patchedMain.contentEquals(
                applyNetworkOptimizationsMain(patchedMain, base.version, base.code)), "${base.code} main reapply")
        }
    }

    @Test
    fun `frozen 5002363 output hashes are preserved`() {
        val base = bases.single { it.code == "5002363" }
        val scene = applyNetworkOptimizationsScene(
            decoded(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize), base.version, base.code)
        val main = applyNetworkOptimizationsMain(
            decoded(base, "lib/arm64-v8a/libmain.so", base.mainSize), base.version, base.code)
        assertEquals("4d5ff6937d07747495b82a412592ce017d6bdadd54c8264e1e49ebb24b5aa72c", scene.sha256())
        assertEquals("17c1a4d91351190fcf2a996c1cb7673faac3bdde8aee70716cb07e295b950ade", main.sha256())
    }

    @Test
    fun `frozen 5002395 output hashes are preserved`() {
        val base = bases.single { it.code == "5002395" }
        val scene = applyNetworkOptimizationsScene(
            decoded(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize), base.version, base.code)
        val main = applyNetworkOptimizationsMain(
            decoded(base, "lib/arm64-v8a/libmain.so", base.mainSize), base.version, base.code)
        assertEquals("8b71e6a72533935d7a5f4e1649c181fc627d1993809957ed8c1ee4232c3323fc", scene.sha256())
        assertEquals("69f2c7789735e96322f8402fa44b1b118a0210df6c1477fa23bb6447dcc06075", main.sha256())
    }

    @Test
    fun `unknown or corrupted inputs fail closed without mutation`() {
        val base = bases.first()
        val scene = decoded(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize)
        val corrupted = scene.copyOf().also { it[0x15f2e0] = (it[0x15f2e0].toInt() xor 1).toByte() }
        val snapshot = corrupted.copyOf()
        assertFailsWith<PatchException> {
            applyNetworkOptimizationsScene(corrupted, base.version, base.code)
        }
        assertTrue(corrupted.contentEquals(snapshot))
        assertFailsWith<PatchException> {
            applyNetworkOptimizationsScene(ByteArray(64), base.version, base.code)
        }
        assertFailsWith<PatchException> {
            applyNetworkOptimizationsMain(ByteArray(64), base.version, base.code)
        }
    }

    private fun decoded(base: Base, relative: String, size: Int): ByteArray {
        val file = File("android-steamlinkvr-release-base-${base.version}-${base.code}", relative)
        assumeTrue("BLOCKED: decoded ${base.code} ${file.name} is absent", file.isFile)
        val bytes = file.readBytes()
        assertEquals(size, bytes.size, "${base.code} ${file.name}")
        return bytes
    }

    private fun ByteArray.sha256(): String =
        MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }

    private fun app.morphe.patcher.patch.Patch<*>.supports(version: String, versionCode: Int): Boolean =
        compatibility.orEmpty().any { compatibility ->
            compatibility.targets.any { target ->
                target.version == version && target.versionCodes?.values?.contains(versionCode) == true
            }
        }
}
