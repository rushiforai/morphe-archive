package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.assertPatchDescriptionContract
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/** Exact recommendation scope and decoded-byte audits for all seven exact implementations. */
class NetworkOptimizationsPatchTest {
    private data class Base(val version: String, val code: String, val sceneSize: Int, val mainSize: Int)

    private val bases = listOf(
        Base("2.0.20", "5001712", 2_221_072, 14_296_520),
        Base("2.0.20", "5001812", 2_220_872, 14_243_496),
        Base("2.0.21", "5001968", 2_234_048, 15_533_936),
        Base("2.0.22", "5002244", 2_251_920, 15_737_032),
        Base("2.0.23", "5002363", 2_292_008, 15_826_584),
        Base("2.0.24", "5002395", 2_301_432, 15_929_432),
        Base("2.0.24", "5002527", 2_333_472, 16_211_704),
    )

    @Test
    fun `one recommended patch dispatches to every verified loaded build`() {
        val patch = networkOptimizationsPatch
        assertEquals("Network Optimizations", patch.name)
        assertTrue(patch.default)
        assertEquals(PatchCategories.STREAMING_AND_NETWORK, patch.category)
        assertTrue(patch.dependencies.isEmpty(), "No dependency may bypass the exact execution guard")
        assertPatchDescriptionContract(patch)
        assertEquals(bases.map { it.version to it.code }, networkOptimizationsBuilds())
        bases.forEach { base ->
            assertTrue(patch.supports(base.version, base.code.toInt()), base.code)
            assertTrue(isNetworkOptimizationsTarget(
                "com.valvesoftware.steamlinkvr", base.version, base.code), base.code)
        }
        // Includes 5002395 (mandatory) and the newest 5002527 base.
        assertTrue(patch.supports("2.0.24", 5002395))
        assertTrue(patch.supports("2.0.24", 5002527))
        listOf("2.0.22" to 5002322, "2.0.23" to 5002364, "2.0.20" to 5001740,
            "2.0.24" to 5002526, "2.0.24" to 5002528, "2.0.25" to 5002527, "2.0.20" to 5002395)
            .forEach { (version, code) ->
                assertFalse(patch.supports(version, code))
                assertFalse(isNetworkOptimizationsTarget(
                    "com.valvesoftware.steamlinkvr", version, code.toString()))
            }
        bases.forEach { base ->
            listOf("cn.vr4p.oculus4xvrplayerov", "other.package").forEach { packageName ->
                assertFalse(isNetworkOptimizationsTarget(packageName, base.version, base.code))
            }
        }
    }

    @Test
    fun `optional duplicate patch is retired`() {
        val source = listOf(
            File("src/main/kotlin/app/template/patches/steamlink/binary/NetworkOptimizationsPatch.kt"),
            File("patches/src/main/kotlin/app/template/patches/steamlink/binary/NetworkOptimizationsPatch.kt"),
        ).first(File::isFile).readText()
        assertFalse(source.contains("optionalNetworkOptimizationsPatch"))
        assertFalse(source.contains("Network Optimizations (optional)"))
    }

    @Test
    fun `every build rejects another build's scene and main layout`() {
        bases.forEach { base ->
            bases.filter { it.code != base.code }.forEach { other ->
                // Right size for `other`, wrong build selector: fails closed before any read of offsets.
                assertFailsWith<PatchException>("${base.code} vs ${other.code}") {
                    applyNetworkOptimizationsScene(ByteArray(other.sceneSize), base.version, base.code)
                }
                assertFailsWith<PatchException>("${base.code} vs ${other.code}") {
                    applyNetworkOptimizationsMain(ByteArray(other.mainSize), base.version, base.code)
                }
            }
        }
        assertFailsWith<PatchException> { applyNetworkOptimizationsScene(ByteArray(2_333_472), "2.0.24", "5002528") }
        assertFailsWith<PatchException> { applyNetworkOptimizationsMain(ByteArray(16_211_704), "2.0.24", "5002526") }
        // Right size and right selector but unpinned bytes: rejected by window and hash checks.
        assertFailsWith<PatchException> { applyNetworkOptimizationsScene(ByteArray(2_333_472), "2.0.24", "5002527") }
        assertFailsWith<PatchException> { applyNetworkOptimizationsMain(ByteArray(16_211_704), "2.0.24", "5002527") }
    }

    @Test
    fun `every decoded base patches and reapplies idempotently`() {
        var audited = 0
        bases.forEach { base ->
            // Skip only a base whose exact decoded libraries are absent; a present one is mandatory.
            val scene = decodedOrNull(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize)
            val main = decodedOrNull(base, "lib/arm64-v8a/libmain.so", base.mainSize)
            if (scene == null || main == null) return@forEach
            audited++
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
        assumeTrue("BLOCKED: no decoded base with scene and main libraries is present", audited > 0)
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
    fun `frozen 5002527 output hashes and libmain pin are preserved`() {
        val base = bases.single { it.code == "5002527" }
        val stockMain = decoded(base, "lib/arm64-v8a/libmain.so", base.mainSize)
        assertEquals("ceddfaf39c3fba0b760ce5afea53ea9a5743502aa770e7d600f8109d67bf8e58", stockMain.sha256())
        val scene = applyNetworkOptimizationsScene(
            decoded(base, "lib/arm64-v8a/libvrlink_scene.so", base.sceneSize), base.version, base.code)
        val main = applyNetworkOptimizationsMain(stockMain, base.version, base.code)
        assertEquals("8152f7e0f4fecf61aa9c0fdb982dc9dc8fd788917b50da9e28ad594284e318b5", scene.sha256())
        assertEquals("34ff572255a3b4dc28603c937bb5b3d9f5eb65f5d2e28c244e18722e72bdd816", main.sha256())
        // Only the 4-byte flush BL changed in libmain.
        val changed = stockMain.indices.filter { stockMain[it] != main[it] }
        assertEquals(listOf(0x940414, 0x940415, 0x940416, 0x940417), changed)
        // A drifted libmain with the right size is refused by the SHA-256 pin before any edit.
        val drifted = stockMain.copyOf().also { it[0x100] = (it[0x100].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> { applyNetworkOptimizationsMain(drifted, base.version, base.code) }
    }

    @Test
    fun `retained patched 2_0_24 release proves the 5002395 network edits`() {
        // The v2.5.0 release APK is a retained PATCHED 5002395 artifact, not a pristine base: it
        // proves the shipped edits, and libmain.so (written only by this patch) must equal the
        // frozen output hash that was computed from the real stock library.
        val apk = listOf(
            "../steamlink-androidxr-patched/Steam_Link-v2.0.24-XR_Porting_Hub-v2.5.0.apk",
            "../../steamlink-androidxr-patched/Steam_Link-v2.0.24-XR_Porting_Hub-v2.5.0.apk",
        ).map(::File).firstOrNull(File::isFile)
        assumeTrue("BLOCKED: retained patched 5002395 release APK is absent", apk != null)
        java.util.zip.ZipFile(apk!!).use { zip ->
            fun entry(name: String) = zip.getInputStream(zip.getEntry(name)).use { it.readBytes() }
            val base = bases.single { it.code == "5002395" }
            val main = entry("lib/arm64-v8a/libmain.so")
            val scene = entry("lib/arm64-v8a/libvrlink_scene.so")
            assertEquals(base.mainSize, main.size)
            assertEquals(base.sceneSize, scene.size)
            assertEquals("69f2c7789735e96322f8402fa44b1b118a0210df6c1477fa23bb6447dcc06075", main.sha256())
            // Re-applying is a byte-for-byte no-op on both shipped libraries (all windows already patched).
            assertTrue(main.contentEquals(applyNetworkOptimizationsMain(main, base.version, base.code)))
            assertTrue(scene.contentEquals(applyNetworkOptimizationsScene(scene, base.version, base.code)))
        }
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

    private fun decodedOrNull(base: Base, relative: String, size: Int): ByteArray? {
        val name = "android-steamlinkvr-release-base-${base.version}-${base.code}"
        val file = listOf(File(name, relative), File("../$name", relative), File("../../$name", relative))
            .firstOrNull(File::isFile) ?: return null
        val bytes = file.readBytes()
        assertEquals(size, bytes.size, "${base.code} ${file.name}")
        return bytes
    }

    private fun decoded(base: Base, relative: String, size: Int): ByteArray {
        val bytes = decodedOrNull(base, relative, size)
        assumeTrue("BLOCKED: decoded ${base.code} ${relative.substringAfterLast('/')} is absent", bytes != null)
        return bytes!!
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
