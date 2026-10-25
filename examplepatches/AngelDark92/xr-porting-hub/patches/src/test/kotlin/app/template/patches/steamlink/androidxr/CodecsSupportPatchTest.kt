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

class CodecsSupportPatchTest {
    @Test
    fun `merged codec patch is recommended on both exact experimental targets`() {
        assertTrue(xrCodecsSupportPatch.default)
        assertEquals("Codecs Support", xrCodecsSupportPatch.name)
        assertEquals(false, xrCodecsSupportPatch.options["enableTelemetry"].default)
        assertTrue(xrCodecsSupportPatch.dependencies.isEmpty())
        assertTrue(xrCodecsSupportPatch.compatibility.orEmpty()
            .all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        val targets = xrCodecsSupportPatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals("com.valvesoftware.steamlinkvr", compatibility.packageName)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it }
            }
        }.toSet()
        assertEquals(
            setOf(
                "2.0.20" to 5001712, "2.0.20" to 5001812,
                "2.0.21" to 5001968, "2.0.22" to 5002244, "2.0.23" to 5002363,
                "2.0.24" to 5002395,
            ),
            targets,
        )
        listOf(
            "2.0.20" to "5001712", "2.0.20" to "5001812",
            "2.0.21" to "5001968", "2.0.22" to "5002244", "2.0.23" to "5002363",
            "2.0.24" to "5002395",
        ).forEach { (version, code) -> assertTrue(isCodecsSupportSteamLinkBuild(version, code)) }
        listOf("2.0.20" to "5002363", "2.0.23" to "5002322",
            "2.0.24" to "5002363",
            "2.0.23" to "5002296", "2.0.23" to "5002313",
            "2.0.23" to "5002318", "2.0.23" to "5002364").forEach { (version, code) ->
            assertFalse(isCodecsSupportSteamLinkBuild(version, code))
        }
    }

    @Test
    fun `excluded exact pairs return unchanged before file or payload access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001713")
            .forEach { (version, code) ->
                assertFalse(installCodecsSupportResources(missing, version, code,
                    byteArrayOf(1), byteArrayOf(2)))
                assertFalse(missing.exists())
            }
    }

    @Test
    fun `actual decoded renderers accept pinned regions and reject altered contracts`() {
        listOf(
            "2.0.20" to "5001712", "2.0.20" to "5001812",
            "2.0.21" to "5001968", "2.0.22" to "5002244", "2.0.23" to "5002363",
            "2.0.24" to "5002395",
        ).forEach { (version, code) ->
            val original = originalScene(version, code)
            validateCodecsSupportScene(original, version, code)
            assertFailsWith<PatchException> {
                validateCodecsSupportScene(
                    original.copyOf(pinnedOffsets(version, code).first() + 0x20), version, code)
            }
            pinnedOffsets(version, code).forEach { offset ->
                val tampered = original.copyOf()
                tampered[offset] = (tampered[offset].toInt() xor 1).toByte()
                assertFailsWith<PatchException> {
                    validateCodecsSupportScene(tampered, version, code)
                }
            }
        }
    }

    @Test
    fun `unknown renderer fails before creating resource directories`() = withTemporaryRoot { root ->
        // Deliberately invalid bytes exercise rejection without Valve's local-only input.
        // This fixture is not evidence of compatibility with a real renderer.
        val bytes = ByteArray(0x10000)
        val scene = sceneFile(root).apply { parentFile.mkdirs(); writeBytes(bytes) }
        assertFailsWith<PatchException> {
            installCodecsSupportResources(root, "2.0.20", "5001712", byteArrayOf(1), byteArrayOf(2))
        }
        assertFalse(File(scene.parentFile, CODECS_SUPPORT_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
        assertContentEquals(bytes, scene.readBytes())
    }

    @Test
    fun `production install and reapplication preserve native manifest and neighbour layer`() =
        withFixtureRoot("2.0.20", "5001712") { root ->
            val (helper, layerManifest) = payload()
            val androidManifest = File(root, "AndroidManifest.xml").readBytes()
            val scene = sceneFile(root).readBytes()
            val neighbour = File(layerDirectory(root), NEIGHBOUR_LAYER_MANIFEST)
                .apply { parentFile.mkdirs(); writeText("existing neighbour layer manifest") }
            val neighbourBytes = neighbour.readBytes()

            assertTrue(installCodecsSupportResources(root, "2.0.20", "5001712", helper, layerManifest))
            val installed = File(sceneFile(root).parentFile, CODECS_SUPPORT_LIBRARY)
            val installedManifest = File(layerDirectory(root), CODECS_SUPPORT_MANIFEST)
            assertContentEquals(helper, installed.readBytes())
            assertContentEquals(layerManifest, installedManifest.readBytes())
            val fileTime = installed.lastModified()
            assertTrue(installCodecsSupportResources(root, "2.0.20", "5001712", helper, layerManifest))
            assertEquals(fileTime, installed.lastModified())
            assertContentEquals(scene, sceneFile(root).readBytes())
            assertContentEquals(androidManifest, File(root, "AndroidManifest.xml").readBytes())
            assertContentEquals(neighbourBytes, neighbour.readBytes())
            assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
        }

    @Test
    fun `bundled payload validates and rejects tampering without decoded inputs`() {
        val (helper, manifest) = payload()
        validateCodecsSupportPayload(helper, manifest)
        val alteredHelper = helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            validateCodecsSupportPayload(alteredHelper, manifest)
        }
        val alteredManifest = manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            validateCodecsSupportPayload(helper, alteredManifest)
        }
    }

    @Test
    fun `default codec installation contains no telemetry on either exact base`() {
        listOf("2.0.20" to "5001712", "2.0.23" to "5002363").forEach { (version, code) ->
            withFixtureRoot(version, code) { root ->
                assertTrue(installCodecsSupportResources(root, version, code))
                assertFalse(File(sceneFile(root).parentFile, TELEMETRY_LIBRARY).exists())
                assertFalse(File(sceneFile(root).parentFile, "libshadowhook.so").exists())
                assertFalse(File(layerDirectory(root), TELEMETRY_MANIFEST).exists())
                assertFalse(File(root, "assets/gxr-telemetry").exists())
                assertFalse(projectionModeResource(CODECS_SUPPORT_LIBRARY).toString(Charsets.ISO_8859_1).contains("GXRDecoderProbe"))
            }
        }
    }

    @Test
    fun `telemetry toggle installs reapplies and removes only owned optional components`() {
        listOf("2.0.20" to "5001712", "2.0.23" to "5002363").forEach { (version, code) ->
            withFixtureRoot(version, code) { root ->
                val original = sceneFile(root).readBytes()
                val shared = File(sceneFile(root).parentFile, "libshadowhook.so")
                shared.writeBytes(telemetryResource("libshadowhook.so"))
                val neighbour = File(root, "assets/gxr-telemetry/user-note.txt")
                neighbour.parentFile.mkdirs()
                neighbour.writeText("preserve me")
                assertTrue(installCodecsSupportResources(root, version, code, enableTelemetry = true))
                val telemetry = File(sceneFile(root).parentFile, TELEMETRY_LIBRARY)
                val manifest = File(layerDirectory(root), TELEMETRY_MANIFEST)
                assertTrue(telemetry.isFile)
                assertTrue(manifest.isFile)
                val time = telemetry.lastModified()
                assertTrue(installCodecsSupportResources(root, version, code, enableTelemetry = true))
                assertEquals(time, telemetry.lastModified())
                assertTrue(installCodecsSupportResources(root, version, code, enableTelemetry = false))
                assertFalse(telemetry.exists())
                assertFalse(manifest.exists())
                assertFalse(File(sceneFile(root).parentFile, "libshadowhook_nothing.so").exists())
                assertFalse(File(root, "assets/gxr-telemetry/codec-option-ownership.tsv").exists())
                assertTrue(shared.isFile)
                assertEquals("preserve me", neighbour.readText())
                assertContentEquals(original, sceneFile(root).readBytes())
                assertTrue(File(sceneFile(root).parentFile, CODECS_SUPPORT_LIBRARY).isFile)
            }
        }
    }

    @Test
    fun `changed optional component blocks off transition without partial deletion`() =
        withFixtureRoot("2.0.20", "5001712") { root ->
            installCodecsSupportResources(root, "2.0.20", "5001712", enableTelemetry = true)
            val helper = File(sceneFile(root).parentFile, TELEMETRY_LIBRARY)
            val original = helper.readBytes()
            helper.writeBytes(original.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() })
            assertFailsWith<PatchException> { installCodecsSupportResources(root, "2.0.20", "5001712") }
            assertTrue(File(layerDirectory(root), TELEMETRY_MANIFEST).isFile)
            assertTrue(File(root, "assets/gxr-telemetry/codec-option-ownership.tsv").isFile)
        }

    @Test
    fun `tampered payload fails atomically before any installation`() = withFixtureRoot("2.0.20", "5001712") { root ->
        val (helper, manifest) = payload()
        val alteredHelper = helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installCodecsSupportResources(root, "2.0.20", "5001712", alteredHelper, manifest)
        }
        val alteredManifest = manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
        assertFailsWith<PatchException> {
            installCodecsSupportResources(root, "2.0.20", "5001712", helper, alteredManifest)
        }
        assertFalse(File(sceneFile(root).parentFile, CODECS_SUPPORT_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
    }

    @Test
    fun `stale installed resource fails before installing its missing counterpart`() =
        withFixtureRoot("2.0.20", "5001712") { root ->
            val (helper, manifest) = payload()
            val helperFile = File(sceneFile(root).parentFile, CODECS_SUPPORT_LIBRARY)
            val manifestFile = File(layerDirectory(root), CODECS_SUPPORT_MANIFEST)
            manifestFile.parentFile.mkdirs()
            manifestFile.writeText("stale manifest")
            assertFailsWith<PatchException> {
                installCodecsSupportResources(root, "2.0.20", "5001712", helper, manifest)
            }
            assertFalse(helperFile.exists())
            assertEquals("stale manifest", manifestFile.readText())
            manifestFile.delete()
            helperFile.writeText("stale helper")
            assertFailsWith<PatchException> {
                installCodecsSupportResources(root, "2.0.20", "5001712", helper, manifest)
            }
            assertFalse(manifestFile.exists())
            assertEquals("stale helper", helperFile.readText())
        }

    @Test
    fun `telemetry option fails closed on a build without an admission profile`() =
        withFixtureRoot("2.0.24", "5002395") { root ->
            val scene = sceneFile(root).readBytes()
            assertFailsWith<PatchException> {
                installCodecsSupportResources(root, "2.0.24", "5002395", enableTelemetry = true)
            }
            assertContentEquals(scene, sceneFile(root).readBytes())
            assertFalse(File(sceneFile(root).parentFile, CODECS_SUPPORT_LIBRARY).exists())
            assertFalse(File(root, "assets/gxr-telemetry").exists())
        }

    private fun payload(): Pair<ByteArray, ByteArray> {
        // Canonical payloads are tracked build inputs, so absence/tampering must fail CI.
        return projectionModeResource(CODECS_SUPPORT_LIBRARY) to
            projectionModeResource(CODECS_SUPPORT_MANIFEST)
    }

    private fun pinnedOffsets(version: String, code: String): List<Int> = when ("$version/$code") {
        "2.0.20/5001712" -> listOf(0xfd304, 0xfdca8, 0xfd2f8)
        "2.0.20/5001812" -> listOf(0xfd1c0, 0xfdb64, 0xfd1b4)
        "2.0.21/5001968" -> listOf(0xf9168, 0xf9b0c, 0xf915c)
        "2.0.22/5002244" -> listOf(0xfa4a8, 0xfae4c, 0xfa49c)
        "2.0.24/5002395" -> listOf(0xfe954, 0xff2f8, 0xfe948)
        else -> listOf(0xfd6fc, 0xfe0a0, 0xfd6f0)
    }

    private fun originalScene(version: String, code: String): ByteArray {
        val relative =
            "android-steamlinkvr-release-base-$version-$code/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        // Fresh GitHub checkouts do not contain the ignored proprietary decoded APK.
        // Skip only missing-input audits; a present but invalid input still fails validation.
        assumeTrue(
            "Real decoded-input audit BLOCKED: missing exact $version/$code scene; no synthetic replacement",
            scene != null)
        return requireNotNull(scene).readBytes()
    }

    private fun sceneFile(root: File) = File(root, "lib/arm64-v8a/libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withFixtureRoot(version: String, code: String, block: (File) -> Unit) =
        withTemporaryRoot { root ->
            sceneFile(root).apply { parentFile.mkdirs(); writeBytes(originalScene(version, code)) }
            File(root, "AndroidManifest.xml")
                .writeText("<manifest><!-- preserved verbatim --></manifest>")
            block(root)
        }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("codecs-support-patch-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }

    private companion object {
        const val NEIGHBOUR_LAYER_MANIFEST =
            "XR_APILAYER_local_GalaxyXR_controller_extrapolation.json"
    }
}
