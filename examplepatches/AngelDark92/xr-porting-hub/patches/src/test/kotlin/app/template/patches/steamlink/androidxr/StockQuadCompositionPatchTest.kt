package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.assertPatchDescriptionContract
import java.io.File
import java.nio.file.Files
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class StockQuadCompositionPatchTest {
    private val exactBases = listOf(
        "2.0.20" to "5001712",
        "2.0.20" to "5001812",
        "2.0.21" to "5001968",
        "2.0.22" to "5002244",
        "2.0.23" to "5002363",
        "2.0.24" to "5002395",
    )
    private val steamLink = "com.valvesoftware.steamlinkvr"

    @Test
    fun `patch is exact six base experimental and default off`() {
        assertEquals("Stock quad composition (experimental)", stockQuadCompositionPatch.name)
        assertFalse(stockQuadCompositionPatch.default)
        assertEquals(PatchCategories.IMAGE_QUALITY, stockQuadCompositionPatch.category)
        assertEquals(1, stockQuadCompositionPatch.dependencies.size)
        assertTrue(stockQuadCompositionPatch.options.isEmpty())
        val targets = stockQuadCompositionPatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals(steamLink, compatibility.packageName)
            assertEquals(EXPERIMENTAL_COMPATIBILITY_NAME, compatibility.name)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it.toString() }
            }
        }.toSet()
        assertEquals(exactBases.toSet(), targets)
        assertPatchDescriptionContract(stockQuadCompositionPatch)
        assertTrue(stockQuadCompositionPatch.description.orEmpty().contains(
            "Needs: deselect Alpha-0 high-resolution trigger.",
        ))
        assertFalse(alpha0HighResolutionTriggerPatch.dependencies.contains(stockQuadCompositionPatch))
        assertTrue(alpha0HighResolutionTriggerPatch.default)
    }

    @Test
    fun `bundled payload validates and rejects tampering`() {
        val helper = projectionModeResource(STOCK_QUAD_LIBRARY)
        val manifest = projectionModeResource(STOCK_QUAD_MANIFEST)
        validateStockQuadPayload(helper, manifest)
        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), helper.copyOfRange(0, 4))
        assertTrue(helper.toString(Charsets.ISO_8859_1).contains(STOCK_QUAD_BUILD_ID))
        assertFalse(manifest.contains('\r'.code.toByte()))
        assertTrue(manifest.toString(Charsets.UTF_8).contains(
            "\"name\": \"XR_APILAYER_local_GalaxyXR_stock_quad_v1\"",
        ))
        assertFailsWith<PatchException> {
            validateStockQuadPayload(
                helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() },
                manifest,
            )
        }
        assertFailsWith<PatchException> {
            validateStockQuadPayload(
                helper,
                manifest.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() },
            )
        }
    }

    @Test
    fun `excluded pairs and packages return unchanged before file access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001713", "2.0.24" to "5002527", "2.0.22" to "20022")
            .forEach { (version, code) ->
                assertFalse(installStockQuadResources(missing, steamLink, version, code))
            }
        assertFalse(installStockQuadResources(missing, "cn.vr4p.oculus4xvrplayerov", "2.0.22", "20022"))
        assertFalse(installStockQuadResources(missing, "cn.vr4p.oculus4xvrplayerov", "2.0.24", "5002395"))
        assertFalse(missing.exists())
    }

    @Test
    fun `all six exact bases install and reapply idempotently preserving neighbours`() {
        val helper = projectionModeResource(STOCK_QUAD_LIBRARY)
        val manifest = projectionModeResource(STOCK_QUAD_MANIFEST)
        exactBases.forEach { (version, code) ->
            withSyntheticBase { root ->
                val neighbour = File(layerDirectory(root), NEIGHBOUR_LAYER_MANIFEST)
                    .apply { parentFile.mkdirs(); writeText("existing neighbour layer manifest") }
                val neighbourBytes = neighbour.readBytes()
                val sceneBytes = sceneFile(root).readBytes()

                assertTrue(installStockQuadResources(root, steamLink, version, code, helper, manifest), code)
                val installedHelper = File(libDirectory(root), STOCK_QUAD_LIBRARY)
                val installedManifest = File(layerDirectory(root), STOCK_QUAD_MANIFEST)
                assertContentEquals(helper, installedHelper.readBytes())
                assertContentEquals(manifest, installedManifest.readBytes())
                val helperTime = installedHelper.lastModified()
                val manifestTime = installedManifest.lastModified()
                assertTrue(installStockQuadResources(root, steamLink, version, code, helper, manifest))
                assertEquals(helperTime, installedHelper.lastModified())
                assertEquals(manifestTime, installedManifest.lastModified())
                assertContentEquals(sceneBytes, sceneFile(root).readBytes())
                assertContentEquals(neighbourBytes, neighbour.readBytes())
                assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
            }
        }
    }

    @Test
    fun `missing scene fails before creating resources and scene bytes are not pinned`() = withTemporaryRoot { root ->
        assertFailsWith<PatchException> { installStockQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertFalse(File(root, "assets/openxr").exists())
        // Other recommended binary patches change the scene; any size is accepted.
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(12345)) }
        assertTrue(installStockQuadResources(root, steamLink, "2.0.24", "5002395"))
    }

    @Test
    fun `retired renderer hook fails closed`() = withSyntheticBase { root ->
        val scene = sceneFile(root)
        val bytes = scene.readBytes()
        "libgxr_nsp.so".toByteArray(Charsets.US_ASCII).copyInto(bytes, 0x1000)
        scene.writeBytes(bytes)
        assertFailsWith<PatchException> { installStockQuadResources(root, steamLink, "2.0.20", "5001712") }
        assertFalse(File(libDirectory(root), STOCK_QUAD_LIBRARY).exists())
        assertFalse(File(layerDirectory(root), STOCK_QUAD_MANIFEST).exists())
    }

    @Test
    fun `alpha-0 conflicts in both patch orders`() = withSyntheticBase { root ->
        // Alpha-0 first.
        val alpha0 = File(libDirectory(root), ANDROID_SURFACE_TRIGGER_LIBRARY)
        alpha0.writeBytes(byteArrayOf(1, 2, 3))
        assertFailsWith<PatchException> { installStockQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertContentEquals(byteArrayOf(1, 2, 3), alpha0.readBytes())
        assertFalse(File(libDirectory(root), STOCK_QUAD_LIBRARY).exists())
        assertFalse(File(layerDirectory(root), STOCK_QUAD_MANIFEST).exists())
        alpha0.delete()

        // Stock quad first.
        assertTrue(installStockQuadResources(root, steamLink, "2.0.24", "5002395"))
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
        assertFalse(alpha0.exists())
        assertFalse(File(layerDirectory(root), ANDROID_SURFACE_TRIGGER_MANIFEST).exists())
        assertTrue(File(libDirectory(root), STOCK_QUAD_LIBRARY).isFile)
    }

    @Test
    fun `stock quad removes retired swapchain atlas and hybrid leftovers`() = withSyntheticBase { root ->
        val lib = libDirectory(root)
        val layers = layerDirectory(root).apply { mkdirs() }
        val retiredFiles = listOf(
            File(lib, "libgxr_swapchain_enlarge.so"),
            File(lib, "libgxr_atlas_surface.so"),
            File(lib, "libgxr_hybrid_codec.so"),
            File(layers, "XR_APILAYER_local_GalaxyXR_swapchain_enlarge_v1.json"),
            File(layers, "XR_APILAYER_local_GalaxyXR_atlas_surface_v1.json"),
        ).onEach { it.writeText("retired") }
        assertTrue(installStockQuadResources(root, steamLink, "2.0.24", "5002395"))
        retiredFiles.forEach { assertFalse(it.exists(), it.name) }
        assertTrue(File(lib, STOCK_QUAD_LIBRARY).isFile)
        assertTrue(File(layers, STOCK_QUAD_MANIFEST).isFile)
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `stock quad removes retired surface video resources and preserves neighbours`() = withSyntheticBase { root ->
        val helper = projectionModeResource(STOCK_QUAD_LIBRARY)
        val manifest = projectionModeResource(STOCK_QUAD_MANIFEST)
        val lib = libDirectory(root)
        val layers = layerDirectory(root)

        // Stale retired files from the removed surface-video experiment, both old generic names
        // and the actual trigger-payload names shipped to users.
        val oldLibrary = File(lib, "libgxr_surface_video.so").apply { writeText("retired") }
        val oldManifest = File(layers, "XR_APILAYER_local_GalaxyXR_surface_video_v1.json")
            .apply { parentFile.mkdirs(); writeText("retired") }
        val actualLibrary = File(lib, "libgxr_surface_video_trigger.so").apply { writeText("retired") }
        val actualManifest = File(layers, "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json")
            .apply { writeText("retired") }

        // An unrelated layer manifest must survive cleanup.
        val neighbour = File(layers, NEIGHBOUR_LAYER_MANIFEST)
            .apply { writeText("existing neighbour layer manifest") }
        val neighbourBytes = neighbour.readBytes()

        assertTrue(installStockQuadResources(root, steamLink, "2.0.24", "5002395", helper, manifest))

        assertFalse(oldLibrary.exists())
        assertFalse(oldManifest.exists())
        assertFalse(actualLibrary.exists())
        assertFalse(actualManifest.exists())
        assertContentEquals(neighbourBytes, neighbour.readBytes())
        assertContentEquals(helper, File(lib, STOCK_QUAD_LIBRARY).readBytes())
        assertContentEquals(manifest, File(layers, STOCK_QUAD_MANIFEST).readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `manifest mode metadata conflicts with alpha-0 in both orders and is stable`() {
        assertTrue(projectionModesConflict(ANDROID_SURFACE_TRIGGER_MODE, STOCK_QUAD_MODE))
        assertTrue(projectionModesConflict(STOCK_QUAD_MODE, ANDROID_SURFACE_TRIGGER_MODE))
        assertTrue(projectionModesConflict(NATIVE_QUAD_MODE, STOCK_QUAD_MODE))
        assertTrue(projectionModesConflict(STOCK_QUAD_MODE, NATIVE_QUAD_MODE))
        assertTrue(projectionModesConflict(ANDROID_SURFACE_TRIGGER_MODE, NATIVE_QUAD_MODE))
        assertFalse(projectionModesConflict(STOCK_QUAD_MODE, STOCK_QUAD_MODE))

        val stockFirst = manifestDocument()
        configurePermissionFreeProjectionMode(stockFirst, STOCK_QUAD_MODE)
        configurePermissionFreeProjectionMode(stockFirst, STOCK_QUAD_MODE)
        assertEquals(listOf(STOCK_QUAD_MODE), resolutionModes(stockFirst))
        assertFailsWith<PatchException> {
            configurePermissionFreeProjectionMode(stockFirst, ANDROID_SURFACE_TRIGGER_MODE)
        }
        assertEquals(listOf(STOCK_QUAD_MODE), resolutionModes(stockFirst))

        val alpha0First = manifestDocument()
        configurePermissionFreeProjectionMode(alpha0First, ANDROID_SURFACE_TRIGGER_MODE)
        assertFailsWith<PatchException> {
            configurePermissionFreeProjectionMode(alpha0First, STOCK_QUAD_MODE)
        }
        assertEquals(listOf(ANDROID_SURFACE_TRIGGER_MODE), resolutionModes(alpha0First))

        val farFirst = manifestDocument()
        configurePermissionFreeProjectionMode(farFirst, NATIVE_QUAD_MODE)
        assertFailsWith<PatchException> {
            configurePermissionFreeProjectionMode(farFirst, STOCK_QUAD_MODE)
        }
        assertEquals(listOf(NATIVE_QUAD_MODE), resolutionModes(farFirst))
    }


    @Test
    fun `far plane helper conflicts in both patch orders`() = withSyntheticBase { root ->
        val farHelper = File(libDirectory(root), NATIVE_QUAD_LIBRARY)
        farHelper.writeBytes(byteArrayOf(1, 2, 3))
        val failure = assertFailsWith<PatchException> {
            installStockQuadResources(root, steamLink, "2.0.20", "5001712")
        }
        assertTrue(failure.message.orEmpty().contains("Choose only one"))
        assertContentEquals(byteArrayOf(1, 2, 3), farHelper.readBytes())
        assertFalse(File(libDirectory(root), STOCK_QUAD_LIBRARY).exists())
        assertFalse(File(layerDirectory(root), STOCK_QUAD_MANIFEST).exists())
        farHelper.delete()

        assertTrue(installStockQuadResources(root, steamLink, "2.0.20", "5001712"))
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(
                root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = { bytes, _, _ -> bytes },
            )
        }
        assertTrue(File(libDirectory(root), STOCK_QUAD_LIBRARY).isFile)
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
    }

    @Test
    fun `far plane scene marker conflicts even when its helper is missing`() = withSyntheticBase { root ->
        val bytes = sceneFile(root).readBytes()
        NATIVE_QUAD_LIBRARY.toByteArray(Charsets.US_ASCII).copyInto(bytes, 0x100)
        sceneFile(root).writeBytes(bytes)
        val failure = assertFailsWith<PatchException> {
            installStockQuadResources(root, steamLink, "2.0.20", "5001712")
        }
        assertTrue(failure.message.orEmpty().contains("Choose only one"))
        assertContentEquals(bytes, sceneFile(root).readBytes())
        assertFalse(File(layerDirectory(root), STOCK_QUAD_MANIFEST).exists())
    }

    @Test
    fun `stale and tampered resources fail before partial writes`() = withSyntheticBase { root ->
        val helperFile = File(libDirectory(root), STOCK_QUAD_LIBRARY)
        val manifestFile = File(layerDirectory(root), STOCK_QUAD_MANIFEST)
        manifestFile.parentFile.mkdirs()
        manifestFile.writeText("stale manifest")
        assertFailsWith<PatchException> { installStockQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertFalse(helperFile.exists())
        assertEquals("stale manifest", manifestFile.readText())
        manifestFile.delete()

        val helper = projectionModeResource(STOCK_QUAD_LIBRARY)
        assertFailsWith<PatchException> {
            installStockQuadResources(
                root, steamLink, "2.0.24", "5002395",
                helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() },
                projectionModeResource(STOCK_QUAD_MANIFEST),
            )
        }
        assertFalse(helperFile.exists())
        assertFalse(manifestFile.exists())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    private fun manifestDocument() = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument().apply {
        val manifest = createElement("manifest")
        appendChild(manifest)
        manifest.appendChild(createElement("application"))
    }

    private fun resolutionModes(document: org.w3c.dom.Document): List<String> {
        val nodes = document.getElementsByTagName("meta-data")
        return (0 until nodes.length).map { nodes.item(it) as org.w3c.dom.Element }
            .filter { it.getAttribute("android:name") == "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE" }
            .map { it.getAttribute("android:value") }
    }

    private fun libDirectory(root: File) = File(root, "lib/arm64-v8a")
    private fun sceneFile(root: File) = File(libDirectory(root), "libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withSyntheticBase(block: (File) -> Unit) = withTemporaryRoot { root ->
        // Installer-only fixture; not evidence about any decoded Valve layout.
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(SYNTHETIC_SCENE_SIZE)) }
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("stock-quad-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }

    private companion object {
        const val SYNTHETIC_SCENE_SIZE = 65_536
        const val NEIGHBOUR_LAYER_MANIFEST =
            "XR_APILAYER_local_GalaxyXR_controller_extrapolation.json"
    }
}
