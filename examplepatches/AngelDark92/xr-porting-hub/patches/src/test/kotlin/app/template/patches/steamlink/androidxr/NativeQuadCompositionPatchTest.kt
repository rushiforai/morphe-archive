package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.assertPatchDescriptionContract
import app.template.patches.steamlink.binary.NATIVE_QUAD_BUILD_ID
import java.io.File
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class NativeQuadCompositionPatchTest {
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
    fun `patch is exact six base experimental image quality and off by default`() {
        assertEquals("Native quad composition (experimental)", nativeQuadCompositionPatch.name)
        assertTrue(nativeQuadCompositionPatch.name.orEmpty().contains("experimental", ignoreCase = true))
        assertFalse(nativeQuadCompositionPatch.default)
        assertEquals(PatchCategories.IMAGE_QUALITY, nativeQuadCompositionPatch.category)
        assertEquals(1, nativeQuadCompositionPatch.dependencies.size)
        assertTrue(nativeQuadCompositionPatch.options.isEmpty())
        val targets = nativeQuadCompositionPatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals(steamLink, compatibility.packageName)
            assertFalse(compatibility.name == EXPERIMENTAL_COMPATIBILITY_NAME)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it.toString() }
            }
        }.toSet()
        assertEquals(exactBases.toSet(), targets)
        assertPatchDescriptionContract(nativeQuadCompositionPatch)
        assertTrue(
            nativeQuadCompositionPatch.description.orEmpty().contains("Needs: disable Stock quad composition"),
        )
        assertFalse(nativeQuadCompositionPatch.description.orEmpty().contains("Alpha-0"))
    }

    @Test
    fun `bundled payload validates and rejects tampering`() {
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        validateNativeQuadPayload(helper)
        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), helper.copyOfRange(0, 4))
        assertTrue(helper.toString(Charsets.ISO_8859_1).contains(NATIVE_QUAD_BUILD_ID))
        assertFailsWith<PatchException> {
            validateNativeQuadPayload(
                helper.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() },
            )
        }
    }

    @Test
    fun `excluded pairs and packages return unchanged before file access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001713", "2.0.24" to "5002527", "2.0.22" to "20022")
            .forEach { (version, code) ->
                assertFalse(installNativeQuadResources(missing, steamLink, version, code))
            }
        assertFalse(installNativeQuadResources(missing, "cn.vr4p.oculus4xvrplayerov", "2.0.22", "20022"))
        assertFalse(installNativeQuadResources(missing, "cn.vr4p.oculus4xvrplayerov", "2.0.24", "5002395"))
        assertFalse(missing.exists())
    }

    @Test
    fun `all six exact bases install and reapply idempotently preserving neighbours`() {
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        exactBases.forEach { (version, code) ->
            withSyntheticBase { root ->
                val neighbour = File(layerDirectory(root), NEIGHBOUR_LAYER_MANIFEST)
                    .apply { parentFile.mkdirs(); writeText("existing neighbour layer manifest") }
                val neighbourBytes = neighbour.readBytes()
                val sceneBytes = sceneFile(root).readBytes()

                assertTrue(
                    installNativeQuadResources(
                        root, steamLink, version, code, helper,
                        applyNativeQuad = ::idempotentFakeApply,
                    ),
                    code,
                )
                val installedHelper = File(libDirectory(root), NATIVE_QUAD_LIBRARY)
                val installedScene = sceneFile(root)
                assertContentEquals(helper, installedHelper.readBytes())
                assertFalse(installedScene.readBytes().contentEquals(sceneBytes), code)
                val helperTime = installedHelper.lastModified()
                val sceneTime = installedScene.lastModified()
                assertTrue(
                    installNativeQuadResources(
                        root, steamLink, version, code, helper,
                        applyNativeQuad = ::idempotentFakeApply,
                    ),
                )
                assertEquals(helperTime, installedHelper.lastModified())
                assertEquals(sceneTime, installedScene.lastModified())
                assertContentEquals(neighbourBytes, neighbour.readBytes())
                assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
            }
        }
    }

    @Test
    fun `missing scene fails before creating resources and scene bytes are not pinned`() = withTemporaryRoot { root ->
        assertFailsWith<PatchException> { installNativeQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertFalse(File(root, "lib/arm64-v8a").exists())
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(12345)) }
        assertTrue(
            installNativeQuadResources(
                root, steamLink, "2.0.24", "5002395", helper,
                applyNativeQuad = ::idempotentFakeApply,
            ),
        )
    }

    @Test
    fun `new quad rejects stock quad helper before any mutation`() = withSyntheticBase { root ->
        val helper = projectionModeResource(STOCK_QUAD_LIBRARY)
        File(libDirectory(root), STOCK_QUAD_LIBRARY).apply { parentFile.mkdirs(); writeBytes(helper) }
        assertFailsWith<PatchException> { installNativeQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `new quad rejects stock quad manifest before any mutation`() = withSyntheticBase { root ->
        val manifest = projectionModeResource(STOCK_QUAD_MANIFEST)
        File(layerDirectory(root), STOCK_QUAD_MANIFEST).apply { parentFile.mkdirs(); writeBytes(manifest) }
        assertFailsWith<PatchException> { installNativeQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
    }

    @Test
    fun `stale or foreign helper fails before partial writes`() = withSyntheticBase { root ->
        File(libDirectory(root), NATIVE_QUAD_LIBRARY).apply { parentFile.mkdirs(); writeText("foreign helper") }
        assertFailsWith<PatchException> { installNativeQuadResources(root, steamLink, "2.0.24", "5002395") }
        assertEquals("foreign helper", File(libDirectory(root), NATIVE_QUAD_LIBRARY).readText())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `apply failure rejects unsupported layout before any write`() = withSyntheticBase { root ->
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        assertFailsWith<PatchException> {
            installNativeQuadResources(
                root, steamLink, "2.0.24", "5002395",
                helperBytes = helper,
                applyNativeQuad = { _, _, _ -> throw PatchException("unsupported native layout") },
            )
        }
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `retired renderer hook fails closed before applier or writes`() = withSyntheticBase { root ->
        val scene = sceneFile(root)
        val bytes = scene.readBytes()
        "libgxr_nsp.so".toByteArray(Charsets.US_ASCII).copyInto(bytes, 0x1000)
        scene.writeBytes(bytes)
        assertFailsWith<PatchException> { installNativeQuadResources(root, steamLink, "2.0.20", "5001712") }
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
        assertContentEquals(bytes, scene.readBytes())
    }

    @Test
    fun `move failure rolls back staged helper and restores original scene`() = withSyntheticBase { root ->
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        val neighbour = File(layerDirectory(root), NEIGHBOUR_LAYER_MANIFEST)
            .apply { parentFile.mkdirs(); writeText("existing neighbour layer manifest") }
        val neighbourBytes = neighbour.readBytes()
        val originalScene = sceneFile(root).readBytes()

        var moves = 0
        assertFailsWith<PatchException> {
            installNativeQuadResources(
                root, steamLink, "2.0.24", "5002395",
                helperBytes = helper,
                applyNativeQuad = ::idempotentFakeApply,
                moveFile = { source, target ->
                    moves++
                    if (moves == 2) throw PatchException("scene commit failed")
                    Files.move(source, target, StandardCopyOption.REPLACE_EXISTING)
                },
            )
        }
        assertFalse(File(libDirectory(root), NATIVE_QUAD_LIBRARY).exists())
        assertContentEquals(originalScene, sceneFile(root).readBytes())
        assertContentEquals(neighbourBytes, neighbour.readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `rollback preserves a preexisting helper when scene commit fails`() = withSyntheticBase { root ->
        val helper = nativeQuadResource(NATIVE_QUAD_LIBRARY)
        val helperTarget = File(libDirectory(root), NATIVE_QUAD_LIBRARY)
            .apply { parentFile.mkdirs(); writeBytes(helper) }
        val originalScene = sceneFile(root).readBytes()

        assertFailsWith<PatchException> {
            installNativeQuadResources(
                root, steamLink, "2.0.24", "5002395",
                helperBytes = helper,
                applyNativeQuad = ::idempotentFakeApply,
                moveFile = { _, _ -> throw PatchException("scene commit failed") },
            )
        }
        assertContentEquals(helper, helperTarget.readBytes())
        assertContentEquals(originalScene, sceneFile(root).readBytes())
    }

    @Test
    fun `manifest mode metadata is stable and replaces a retired alpha-0 mode`() {
        val native = manifestDocument()
        configurePermissionFreeProjectionMode(native, NATIVE_QUAD_MODE)
        configurePermissionFreeProjectionMode(native, NATIVE_QUAD_MODE)
        assertEquals(listOf(NATIVE_QUAD_MODE), resolutionModes(native))

        val retiredAlpha0Mode = "android_surface_trigger_passthrough_v1"
        val migrated = manifestDocument()
        configurePermissionFreeProjectionMode(migrated, retiredAlpha0Mode)
        assertEquals(listOf(retiredAlpha0Mode), resolutionModes(migrated))
        configurePermissionFreeProjectionMode(migrated, NATIVE_QUAD_MODE)
        assertEquals(listOf(NATIVE_QUAD_MODE), resolutionModes(migrated))
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

    private fun idempotentFakeApply(bytes: ByteArray, versionName: String, versionCode: String): ByteArray {
        require(bytes.size > 0x1000 + 1) { "synthetic scene too small" }
        return bytes.copyOf().apply { this[0x1000] = 0x42 }
    }

    private fun libDirectory(root: File) = File(root, "lib/arm64-v8a")
    private fun sceneFile(root: File) = File(libDirectory(root), "libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withSyntheticBase(block: (File) -> Unit) = withTemporaryRoot { root ->
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(SYNTHETIC_SCENE_SIZE)) }
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("native-quad-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }

    private companion object {
        const val SYNTHETIC_SCENE_SIZE = 65_536
        const val NEIGHBOUR_LAYER_MANIFEST =
            "XR_APILAYER_local_GalaxyXR_controller_extrapolation.json"
    }
}
