package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories
import java.io.File
import java.nio.file.Files
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class SurfaceVideoTriggerPatchTest {
    @Test
    fun `patch is exact 5001712 experimental and default off`() {
        assertEquals("Surface video + trigger (experimental)", surfaceVideoTriggerPatch.name)
        assertFalse(surfaceVideoTriggerPatch.default)
        assertEquals(PatchCategories.IMAGE_QUALITY, surfaceVideoTriggerPatch.category)
        assertTrue(surfaceVideoTriggerPatch.dependencies.isEmpty())
        assertTrue(surfaceVideoTriggerPatch.options.isEmpty())
        val targets = surfaceVideoTriggerPatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals("com.valvesoftware.steamlinkvr", compatibility.packageName)
            assertEquals(EXPERIMENTAL_COMPATIBILITY_NAME, compatibility.name)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it }
            }
        }.toSet()
        assertEquals(setOf("2.0.20" to 5001712), targets)
        assertTrue(surfaceVideoTriggerPatch.description.orEmpty().contains(
            "Needs: deselect Alpha-0 high-resolution trigger.",
        ))
        assertTrue(isSurfaceVideoTriggerSteamLinkBuild("2.0.20", "5001712"))
        listOf(
            "2.0.20" to "5001812",
            "2.0.21" to "5001968",
            "2.0.23" to "5002363",
            "2.0.24" to "5002395",
            "2.0.20" to "5001713",
        ).forEach { (version, code) ->
            assertFalse(isSurfaceVideoTriggerSteamLinkBuild(version, code), "$version/$code")
        }
    }

    @Test
    fun `bundled payload validates and rejects tampering without decoded inputs`() {
        val helper = projectionModeResource(SURFACE_VIDEO_TRIGGER_LIBRARY)
        val manifest = projectionModeResource(SURFACE_VIDEO_TRIGGER_MANIFEST)
        validateSurfaceVideoTriggerPayload(helper, manifest)
        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), helper.copyOfRange(0, 4))
        assertTrue(helper.toString(Charsets.ISO_8859_1).contains(SURFACE_VIDEO_TRIGGER_BUILD_ID))
        assertTrue(manifest.toString(Charsets.UTF_8).contains(
            "\"library_path\": \"$SURFACE_VIDEO_TRIGGER_LIBRARY\"",
        ))
        assertFailsWith<PatchException> {
            validateSurfaceVideoTriggerPayload(
                helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() },
                manifest,
            )
        }
        assertFailsWith<PatchException> {
            validateSurfaceVideoTriggerPayload(
                helper,
                manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() },
            )
        }
    }

    @Test
    fun `excluded exact pairs return unchanged before file access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001812", "2.0.23" to "5002363", "2.0.20" to "5001713")
            .forEach { (version, code) ->
                assertFalse(installSurfaceVideoTriggerResources(missing, version, code))
                assertFalse(missing.exists())
            }
    }

    @Test
    fun `install and reapplication preserve neighbours and timestamps`() = withSyntheticBase { root ->
        val helper = projectionModeResource(SURFACE_VIDEO_TRIGGER_LIBRARY)
        val manifest = projectionModeResource(SURFACE_VIDEO_TRIGGER_MANIFEST)
        val neighbour = File(layerDirectory(root), NEIGHBOUR_LAYER_MANIFEST)
            .apply { parentFile.mkdirs(); writeText("existing neighbour layer manifest") }
        val neighbourBytes = neighbour.readBytes()
        val sceneBytes = sceneFile(root).readBytes()

        assertTrue(installSurfaceVideoTriggerResources(
            root, "2.0.20", "5001712", helper, manifest,
        ))
        val installedHelper = File(libDirectory(root), SURFACE_VIDEO_TRIGGER_LIBRARY)
        val installedManifest = File(layerDirectory(root), SURFACE_VIDEO_TRIGGER_MANIFEST)
        assertContentEquals(helper, installedHelper.readBytes())
        assertContentEquals(manifest, installedManifest.readBytes())
        val helperTime = installedHelper.lastModified()
        val manifestTime = installedManifest.lastModified()
        assertTrue(installSurfaceVideoTriggerResources(
            root, "2.0.20", "5001712", helper, manifest,
        ))
        assertEquals(helperTime, installedHelper.lastModified())
        assertEquals(manifestTime, installedManifest.lastModified())
        assertContentEquals(sceneBytes, sceneFile(root).readBytes())
        assertContentEquals(neighbourBytes, neighbour.readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `wrong scene size and missing scene fail before creating resources`() = withTemporaryRoot { root ->
        val scene = sceneFile(root)
        scene.parentFile.mkdirs()
        scene.writeBytes(ByteArray(EXACT_SCENE_SIZE - 1))
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(root, "2.0.20", "5001712")
        }
        scene.delete()
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(root, "2.0.20", "5001712")
        }
        assertFalse(File(root, "assets/openxr").exists())
    }

    @Test
    fun `retired renderer hook and alpha-0 trigger fail closed`() = withSyntheticBase { root ->
        val scene = sceneFile(root)
        val bytes = scene.readBytes()
        RETIRED_LIBRARY.toByteArray(Charsets.US_ASCII).copyInto(bytes, 0x1000)
        scene.writeBytes(bytes)
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(root, "2.0.20", "5001712")
        }
        assertFalse(File(libDirectory(root), SURFACE_VIDEO_TRIGGER_LIBRARY).exists())

        scene.writeBytes(ByteArray(EXACT_SCENE_SIZE))
        val alpha0 = File(libDirectory(root), ANDROID_SURFACE_TRIGGER_LIBRARY)
        alpha0.writeBytes(byteArrayOf(1, 2, 3))
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(root, "2.0.20", "5001712")
        }
        assertContentEquals(byteArrayOf(1, 2, 3), alpha0.readBytes())
        assertFalse(File(libDirectory(root), SURFACE_VIDEO_TRIGGER_LIBRARY).exists())
        assertFalse(File(layerDirectory(root), SURFACE_VIDEO_TRIGGER_MANIFEST).exists())

        alpha0.delete()
        assertTrue(installSurfaceVideoTriggerResources(root, "2.0.20", "5001712"))
        val requested = ProjectionModeResources(
            ANDROID_SURFACE_TRIGGER_MODE,
            ANDROID_SURFACE_TRIGGER_LIBRARY,
            ANDROID_SURFACE_TRIGGER_MANIFEST,
        )
        assertFailsWith<PatchException> {
            installProjectionModeResources(
                libDirectory(root), layerDirectory(root), requested, byteArrayOf(1, 2, 3),
            )
        }
        assertTrue(File(libDirectory(root), SURFACE_VIDEO_TRIGGER_LIBRARY).isFile)
        assertTrue(File(layerDirectory(root), SURFACE_VIDEO_TRIGGER_MANIFEST).isFile)
        assertFalse(alpha0.exists())
        assertFalse(File(layerDirectory(root), ANDROID_SURFACE_TRIGGER_MANIFEST).exists())
    }

    @Test
    fun `stale and tampered resources fail before partial writes`() = withSyntheticBase { root ->
        val helperFile = File(libDirectory(root), SURFACE_VIDEO_TRIGGER_LIBRARY)
        val manifestFile = File(layerDirectory(root), SURFACE_VIDEO_TRIGGER_MANIFEST)
        manifestFile.parentFile.mkdirs()
        manifestFile.writeText("stale manifest")
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(root, "2.0.20", "5001712")
        }
        assertFalse(helperFile.exists())
        assertEquals("stale manifest", manifestFile.readText())
        manifestFile.delete()

        val helper = projectionModeResource(SURFACE_VIDEO_TRIGGER_LIBRARY)
        assertFailsWith<PatchException> {
            installSurfaceVideoTriggerResources(
                root,
                "2.0.20",
                "5001712",
                helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() },
                projectionModeResource(SURFACE_VIDEO_TRIGGER_MANIFEST),
            )
        }
        assertFalse(helperFile.exists())
        assertFalse(manifestFile.exists())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    private fun libDirectory(root: File) = File(root, "lib/arm64-v8a")
    private fun sceneFile(root: File) = File(libDirectory(root), "libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withSyntheticBase(block: (File) -> Unit) = withTemporaryRoot { root ->
        // Installer-only fixture. Exact size exercises the build pin; it is not
        // evidence that a rendered base matches Valve's decoded layout.
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(EXACT_SCENE_SIZE)) }
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("surface-video-trigger-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }

    private companion object {
        const val EXACT_SCENE_SIZE = 2_221_072
        const val RETIRED_LIBRARY = "libgxr_nsp.so"
        const val NEIGHBOUR_LAYER_MANIFEST =
            "XR_APILAYER_local_GalaxyXR_controller_extrapolation.json"
    }
}
