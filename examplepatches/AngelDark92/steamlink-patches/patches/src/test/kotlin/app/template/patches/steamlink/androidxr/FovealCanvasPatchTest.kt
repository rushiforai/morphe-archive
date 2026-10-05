package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.steamlink.galaxyXrRecommended5001812Patch
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
    @Test
    fun `exact compatibility remains optional and outside the recommended dependency closure`() {
        assertFalse(xrFovealCanvasPatch.default)
        assertTrue(xrFovealCanvasPatch.dependencies.isEmpty())
        assertFalse(xrFovealCanvasPatch in galaxyXrRecommended5001812Patch.dependencies)
        assertTrue(xrFovealCanvasPatch.compatibility.orEmpty()
            .all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        val targets = xrFovealCanvasPatch.compatibility.orEmpty().flatMap { it.targets }
        assertEquals(setOf("2.0.20"), targets.map { it.version }.toSet())
        assertEquals(setOf(5001812), targets.flatMap { it.versionCodes.orEmpty().values }.toSet())
        assertTrue(isFovealCanvasSteamLinkBuild("2.0.20", "5001812"))
        listOf("2.0.20" to "5001712", "2.0.21" to "5001812", "2.0.22" to "5002244",
            "2.0.23" to "5002363").forEach { (version, code) ->
            assertFalse(isFovealCanvasSteamLinkBuild(version, code))
        }
    }

    @Test
    fun `excluded exact pairs return unchanged before file or payload access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001712", "2.0.21" to "5001812", "2.0.20" to "5001813")
            .forEach { (version, code) ->
                assertFalse(installFovealCanvasResources(missing, version, code,
                    byteArrayOf(1), byteArrayOf(2)))
                assertFalse(missing.exists())
            }
    }

    @Test
    fun `actual decoded renderer accepts original functions and rejects altered contracts`() {
        val original = originalScene()
        validateFovealCanvasScene(original)
        assertFailsWith<PatchException> { validateFovealCanvasScene(original.copyOf(original.size - 1)) }
        listOf(0x10a570, 0x10ae78).forEach { offset ->
            val tampered = original.copyOf()
            tampered[offset] = (tampered[offset].toInt() xor 1).toByte()
            assertFailsWith<PatchException> { validateFovealCanvasScene(tampered) }
        }
    }

    @Test
    fun `unknown renderer fails before creating resource directories`() = withTemporaryRoot { root ->
        // Deliberately invalid bytes exercise rejection without Valve's local-only input.
        // This fixture is not evidence of compatibility with a real renderer.
        val bytes = ByteArray(FOVEAL_CANVAS_SCENE_SIZE)
        val scene = sceneFile(root).apply { parentFile.mkdirs(); writeBytes(bytes) }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001812", byteArrayOf(1), byteArrayOf(2))
        }
        assertFalse(File(scene.parentFile, FOVEAL_CANVAS_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
        assertContentEquals(bytes, scene.readBytes())
    }

    @Test
    fun `production install and reapplication preserve native manifest and existing trigger`() =
        withFixtureRoot { root ->
            val (helper, layerManifest) = payload()
            val androidManifest = File(root, "AndroidManifest.xml").readBytes()
            val scene = sceneFile(root).readBytes()
            val trigger = File(sceneFile(root).parentFile, ANDROID_SURFACE_TRIGGER_LIBRARY)
                .apply { writeBytes(byteArrayOf(9, 8, 7)) }
            val oldLayer = File(layerDirectory(root), ANDROID_SURFACE_TRIGGER_MANIFEST)
                .apply { parentFile.mkdirs(); writeText("existing Surface trigger manifest") }
            val oldLayerBytes = oldLayer.readBytes()

            assertTrue(installFovealCanvasResources(root, "2.0.20", "5001812", helper, layerManifest))
            val installed = File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY)
            val installedManifest = File(layerDirectory(root), FOVEAL_CANVAS_MANIFEST)
            assertContentEquals(helper, installed.readBytes())
            assertContentEquals(layerManifest, installedManifest.readBytes())
            val fileTime = installed.lastModified()
            assertTrue(installFovealCanvasResources(root, "2.0.20", "5001812", helper, layerManifest))
            assertEquals(fileTime, installed.lastModified())
            assertContentEquals(scene, sceneFile(root).readBytes())
            assertContentEquals(androidManifest, File(root, "AndroidManifest.xml").readBytes())
            assertContentEquals(byteArrayOf(9, 8, 7), trigger.readBytes())
            assertContentEquals(oldLayerBytes, oldLayer.readBytes())
            assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
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
    fun `tampered payload fails atomically before any installation`() = withFixtureRoot { root ->
        val (helper, manifest) = payload()
        val alteredHelper = helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001812", alteredHelper, manifest)
        }
        val alteredManifest = manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installFovealCanvasResources(root, "2.0.20", "5001812", helper, alteredManifest)
        }
        assertFalse(File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
    }

    @Test
    fun `stale installed resource fails before installing its missing counterpart`() =
        withFixtureRoot { root ->
            val (helper, manifest) = payload()
            val helperFile = File(sceneFile(root).parentFile, FOVEAL_CANVAS_LIBRARY)
            val manifestFile = File(layerDirectory(root), FOVEAL_CANVAS_MANIFEST)
            manifestFile.parentFile.mkdirs()
            manifestFile.writeText("stale manifest")
            assertFailsWith<PatchException> {
                installFovealCanvasResources(root, "2.0.20", "5001812", helper, manifest)
            }
            assertFalse(helperFile.exists())
            assertEquals("stale manifest", manifestFile.readText())
            manifestFile.delete()
            helperFile.writeText("stale helper")
            assertFailsWith<PatchException> {
                installFovealCanvasResources(root, "2.0.20", "5001812", helper, manifest)
            }
            assertFalse(manifestFile.exists())
            assertEquals("stale helper", helperFile.readText())
        }

    private fun payload(): Pair<ByteArray, ByteArray> {
        // Canonical payloads are tracked build inputs, so absence/tampering must fail CI.
        return projectionModeResource(FOVEAL_CANVAS_LIBRARY) to projectionModeResource(FOVEAL_CANVAS_MANIFEST)
    }

    private fun originalScene(): ByteArray {
        val relative = "decoded-apk-android-steamlinkvr-release-base-2.0.20-5001812/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        // Fresh GitHub checkouts do not contain the ignored proprietary decoded APK.
        // Skip only missing-input audits; a present but invalid input still fails validation.
        assumeTrue("Real decoded-input audit BLOCKED: missing exact 2.0.20/5001812 scene; no synthetic replacement",
            scene != null)
        return requireNotNull(scene).readBytes()
    }

    private fun sceneFile(root: File) = File(root, "lib/arm64-v8a/libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withFixtureRoot(block: (File) -> Unit) = withTemporaryRoot { root ->
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(originalScene()) }
        File(root, "AndroidManifest.xml").writeText("<manifest><!-- preserved verbatim --></manifest>")
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("foveal-canvas-patch-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }
}
