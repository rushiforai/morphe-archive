package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.io.File
import java.nio.file.Files
import org.junit.Assume.assumeTrue
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class FovealCanvasPatchTest {
    private data class Base(
        val version: String,
        val code: String,
        val sceneSize: Int,
        val functionOffsets: List<Int>,
    )

    private val bases = listOf(
        Base("2.0.20", "5001712", 2_221_072, listOf(0x10a410, 0x10ad18)),
        Base("2.0.20", "5001812", 2_220_872, listOf(0x10a570, 0x10ae78)),
        Base("2.0.21", "5001968", 2_234_048, listOf(0x1064e0, 0x106de8)),
        Base("2.0.22", "5002244", 2_251_920, listOf(0x107bf0, 0x10872c)),
        Base("2.0.23", "5002363", 2_292_008, listOf(0x10c1c4, 0x10cd00)),
        Base("2.0.24", "5002395", 2_301_432, listOf(0x10d41c, 0x10df58)),
    )

    @Test
    fun `exact compatibility remains optional and experimental-only`() {
        assertFalse(xrFovealCanvasPatch.default)
        assertTrue(xrFovealCanvasPatch.dependencies.isEmpty())
        assertTrue(xrFovealCanvasPatch.compatibility.orEmpty()
            .all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        val targets = xrFovealCanvasPatch.compatibility.orEmpty().flatMap { it.targets }
        assertEquals(
            setOf(
                "2.0.20" to 5001712, "2.0.20" to 5001812,
                "2.0.21" to 5001968, "2.0.22" to 5002244, "2.0.23" to 5002363,
                "2.0.24" to 5002395,
            ),
            targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it }
            }.toSet(),
        )
        bases.forEach { base ->
            assertTrue(isFovealCanvasSteamLinkBuild(base.version, base.code), "${base.version}/${base.code}")
        }
        listOf("2.0.20" to "5001813", "2.0.20" to "5002363",
            "2.0.23" to "5001712", "2.0.23" to "5002364",
            "2.0.24" to "5002363").forEach { (version, code) ->
            assertFalse(isFovealCanvasSteamLinkBuild(version, code), "$version/$code")
        }
    }

    @Test
    fun `excluded exact pairs return unchanged before file or payload access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001813", "2.0.21" to "5001969", "2.0.20" to "5001713")
            .forEach { (version, code) ->
                assertFalse(installFovealCanvasResources(missing, version, code,
                    byteArrayOf(1), byteArrayOf(2)))
                assertFalse(missing.exists())
            }
    }

    @Test
    fun `actual decoded renderers accept original functions and reject altered contracts`() {
        bases.forEach { base ->
            val original = decodedScene(base)
            validateFovealCanvasScene(original, base.version, base.code)
            assertFailsWith<PatchException>("${base.version}/${base.code}") {
                validateFovealCanvasScene(original.copyOf(original.size - 1), base.version, base.code)
            }
            base.functionOffsets.forEach { offset ->
                val tampered = original.copyOf()
                tampered[offset] = (tampered[offset].toInt() xor 1).toByte()
                assertFailsWith<PatchException>("${base.version}/${base.code} @ 0x${offset.toString(16)}") {
                    validateFovealCanvasScene(tampered, base.version, base.code)
                }
            }
        }
    }

    @Test
    fun `unknown renderer fails before creating resource directories`() = withTemporaryRoot { root ->
        // Deliberately invalid bytes exercise rejection without Valve's local-only input.
        // This fixture is not evidence of compatibility with a real renderer.
        val bytes = ByteArray(bases.first().sceneSize)
        val scene = sceneFile(root).apply { parentFile.mkdirs(); writeBytes(bytes) }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001712", byteArrayOf(1), byteArrayOf(2))
        }
        assertFalse(File(scene.parentFile, FOVEAL_CANVAS_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
        assertContentEquals(bytes, scene.readBytes())
    }

    @Test
    fun `production install and reapplication preserve native manifest and existing trigger`() {
        bases.forEach { base ->
            withFixtureRoot(base) { root ->
                val (helper, layerManifest) = payload()
                val androidManifest = File(root, "AndroidManifest.xml").readBytes()
                val scene = sceneFile(root).readBytes()
                val trigger = File(sceneFile(root).parentFile, ANDROID_SURFACE_TRIGGER_LIBRARY)
                    .apply { writeBytes(byteArrayOf(9, 8, 7)) }
                val oldLayer = File(layerDirectory(root), ANDROID_SURFACE_TRIGGER_MANIFEST)
                    .apply { parentFile.mkdirs(); writeText("existing Surface trigger manifest") }
                val oldLayerBytes = oldLayer.readBytes()

                assertTrue(installFovealCanvasResources(root, base.version, base.code, helper, layerManifest))
                val installed = File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY)
                val installedManifest = File(layerDirectory(root), FOVEAL_CANVAS_MANIFEST)
                assertContentEquals(helper, installed.readBytes())
                assertContentEquals(layerManifest, installedManifest.readBytes())
                val fileTime = installed.lastModified()
                assertTrue(installFovealCanvasResources(root, base.version, base.code, helper, layerManifest))
                assertEquals(fileTime, installed.lastModified())
                assertContentEquals(scene, sceneFile(root).readBytes())
                assertContentEquals(androidManifest, File(root, "AndroidManifest.xml").readBytes())
                assertContentEquals(byteArrayOf(9, 8, 7), trigger.readBytes())
                assertContentEquals(oldLayerBytes, oldLayer.readBytes())
                assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
            }
        }
    }

    @Test
    fun `bundled payload validates and rejects tampering without decoded inputs`() {
        val (helper, manifest) = payload()
        validateFovealCanvasPayload(helper, manifest)
        val alteredHelper = helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            validateFovealCanvasPayload(alteredHelper, manifest)
        }
        val alteredManifest = manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            validateFovealCanvasPayload(helper, alteredManifest)
        }
    }

    @Test
    fun `tampered payload fails atomically before any installation`() = withFixtureRoot(bases.first()) { root ->
        val (helper, manifest) = payload()
        val alteredHelper = helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001712", alteredHelper, manifest)
        }
        val alteredManifest = manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001712", helper, alteredManifest)
        }
        assertFalse(File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
    }

    @Test
    fun `stale installed resource fails before installing its missing counterpart`() =
        withFixtureRoot(bases.last()) { root ->
            val (helper, manifest) = payload()
            val helperFile = File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY)
            val manifestFile = File(layerDirectory(root), FOVEAL_CANVAS_MANIFEST)
            manifestFile.parentFile.mkdirs()
            manifestFile.writeText("stale manifest")
            assertFailsWith<PatchException> {
                installFovealCanvasResources(root, "2.0.23", "5002363", helper, manifest)
            }
            assertFalse(helperFile.exists())
            assertEquals("stale manifest", manifestFile.readText())
            manifestFile.delete()
            helperFile.writeText("stale helper")
            assertFailsWith<PatchException> {
                installFovealCanvasResources(root, "2.0.23", "5002363", helper, manifest)
            }
            assertFalse(manifestFile.exists())
            assertEquals("stale helper", helperFile.readText())
        }

    private fun payload(): Pair<ByteArray, ByteArray> {
        // Canonical payloads are tracked build inputs, so absence/tampering must fail CI.
        return projectionModeResource(FOVEAL_CANVAS_LIBRARY) to projectionModeResource(FOVEAL_CANVAS_MANIFEST)
    }

    private fun decodedScene(base: Base): ByteArray {
        val relative = "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        // Fresh GitHub checkouts do not contain the ignored proprietary decoded APK.
        // Skip only missing-input audits; a present but invalid input still fails validation.
        assumeTrue(
            "Real decoded-input audit BLOCKED: missing exact ${base.version}/${base.code} scene; no synthetic replacement",
            scene != null,
        )
        return requireNotNull(scene).readBytes()
    }

    private fun sceneFile(root: File) = File(root, "lib/arm64-v8a/libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withFixtureRoot(base: Base, block: (File) -> Unit) = withTemporaryRoot { root ->
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(decodedScene(base)) }
        File(root, "AndroidManifest.xml").writeText("<manifest><!-- preserved verbatim --></manifest>")
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("foveal-canvas-patch-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }
}
