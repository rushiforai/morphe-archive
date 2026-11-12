package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.assertPatchDescriptionContract
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_BUILD_ID
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DEFAULT_DISTANCE
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DEFAULT_SETTINGS
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DEFAULT_SLOT
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DISTANCE_OFFSET
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DISTANCES
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_HELPER_SHA256
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_HELPER_SIZE
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_MARKER
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_SETTINGS_KEEP
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_SETTINGS_NONE
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_SETTINGS_OFFSET
import app.template.patches.steamlink.binary.applyNativeQuadFarSlot
import app.template.patches.steamlink.binary.isNativeQuadFarPayload
import app.template.patches.steamlink.binary.readNativeQuadFarDistance
import app.template.patches.steamlink.binary.readNativeQuadFarSettings
import app.template.patches.steamlink.binary.validateNativeQuadFarPayload
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

class NativeQuadFarPlanePatchTest {
    private val exactBases = setOf("2.0.20" to "5001712")
    private val steamLink = "com.valvesoftware.steamlinkvr"

    @Test
    fun `patch is exact 2_0_20 only experimental image quality and off by default`() {
        assertEquals("Native quad far plane (experimental)", nativeQuadFarPlanePatch.name)
        assertTrue(nativeQuadFarPlanePatch.name.orEmpty().contains("experimental", ignoreCase = true))
        assertFalse(nativeQuadFarPlanePatch.default)
        assertEquals(PatchCategories.IMAGE_QUALITY, nativeQuadFarPlanePatch.category)
        assertTrue(nativeQuadFarPlanePatch.dependencies.isEmpty(), "standalone patch has no dependency")
        val targets = nativeQuadFarPlanePatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals(steamLink, compatibility.packageName)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it.toString() }
            }
        }.toSet()
        assertEquals(exactBases, targets)
        assertPatchDescriptionContract(nativeQuadFarPlanePatch)
    }

    @Suppress("DEPRECATION")
    @Test
    fun `quad distance option maps labels to stored values one to one`() {
        val option = nativeQuadFarPlanePatch.options["distance"]
        assertEquals("Quad distance", option.title)
        assertEquals("64", option.default)
        assertEquals(
            mapOf("16 m" to "16", "64 m" to "64", "250 m" to "250"),
            option.values,
        )
        assertEquals(
            NATIVE_QUAD_FAR_DISTANCES.map { it.toString() }.toSet(),
            option.values.orEmpty().values.toSet(),
        )
        assertEquals(NATIVE_QUAD_FAR_DEFAULT_DISTANCE, 64)
    }

    @Suppress("DEPRECATION")
    @Test
    fun `layer settings option keeps the chain by default and offers none`() {
        val option = nativeQuadFarPlanePatch.options["layerSettings"]
        assertEquals("Layer settings", option.title)
        assertEquals("keep", option.default)
        assertEquals(
            mapOf("Keep" to "keep", "Remove FB settings" to "none"),
            option.values,
        )
        assertEquals(NATIVE_QUAD_FAR_SETTINGS_KEEP, 0)
        assertEquals(NATIVE_QUAD_FAR_SETTINGS_NONE, 1)
        assertEquals(NATIVE_QUAD_FAR_DEFAULT_SETTINGS, NATIVE_QUAD_FAR_SETTINGS_KEEP)
    }

    @Test
    fun `mode is distinct from the removed native quad marker and the marker is rejected`() {
        assertEquals("native_quad_far_plane_v1", NATIVE_QUAD_MODE)
        assertEquals("native_quad_v1", LEGACY_NATIVE_QUAD_MODE)
        assertNotEquals(NATIVE_QUAD_MODE, LEGACY_NATIVE_QUAD_MODE)
        val failure = assertFailsWith<PatchException> {
            rejectLegacyNativeQuadMode(installedResolutionMode(manifestDocument(LEGACY_NATIVE_QUAD_MODE)))
        }
        assertTrue(failure.message.orEmpty().contains("clean source APK"))
        rejectLegacyNativeQuadMode(installedResolutionMode(manifestDocument(NATIVE_QUAD_MODE)))
        rejectLegacyNativeQuadMode("")
    }

    @Test
    fun `bundled payload matches its pin and slot layout`() {
        val payload = nativeQuadFarResource()
        validateNativeQuadFarPayload(payload)
        assertEquals(NATIVE_QUAD_FAR_HELPER_SIZE, payload.size)
        assertEquals(NATIVE_QUAD_FAR_HELPER_SHA256, sha256(payload))
        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), payload.copyOfRange(0, 4))
        assertTrue(payload.toString(Charsets.ISO_8859_1).contains(NATIVE_QUAD_FAR_BUILD_ID))
        assertFalse(payload.toString(Charsets.ISO_8859_1).contains("GXR-NATIVE-QUAD-1.2-ABI1"))
        assertFalse(payload.toString(Charsets.ISO_8859_1).contains("GXR-NATIVE-QUAD-1.2-FAR-ABI1"))
        val marker = NATIVE_QUAD_FAR_MARKER.toByteArray(Charsets.ISO_8859_1)
        val markerOffset = NATIVE_QUAD_FAR_DISTANCE_OFFSET - marker.size - 1
        assertContentEquals(marker, payload.copyOfRange(markerOffset, markerOffset + marker.size))
        assertEquals(0, payload[NATIVE_QUAD_FAR_DISTANCE_OFFSET - 1].toInt())
        assertContentEquals(
            NATIVE_QUAD_FAR_DEFAULT_SLOT,
            payload.copyOfRange(NATIVE_QUAD_FAR_DISTANCE_OFFSET, NATIVE_QUAD_FAR_DISTANCE_OFFSET + 4),
        )
        assertEquals(NATIVE_QUAD_FAR_DEFAULT_SETTINGS, payload[NATIVE_QUAD_FAR_SETTINGS_OFFSET].toInt())
        // The bundled slot holds the stock distance, which is not an offered option: it is only the pin.
        assertEquals(null, readNativeQuadFarDistance(payload))
        assertFalse(isNativeQuadFarPayload(payload))
    }

    @Test
    fun `every option value writes exactly the distance and settings bytes`() {
        val payload = nativeQuadFarResource()
        NATIVE_QUAD_FAR_DISTANCES.forEach { meters ->
            listOf(NATIVE_QUAD_FAR_SETTINGS_KEEP, NATIVE_QUAD_FAR_SETTINGS_NONE).forEach { settings ->
                val result = applyNativeQuadFarSlot(null, meters, settings, payload)
                assertEquals(payload.size, result.size)
                val expected = (0 until 4).map { NATIVE_QUAD_FAR_DISTANCE_OFFSET + it } +
                    if (settings == NATIVE_QUAD_FAR_SETTINGS_KEEP) emptyList() else listOf(NATIVE_QUAD_FAR_SETTINGS_OFFSET)
                assertEquals(expected, result.indices.filter { result[it] != payload[it] })
                assertEquals(meters, readNativeQuadFarDistance(result))
                assertEquals(settings, readNativeQuadFarSettings(result))
                assertTrue(isNativeQuadFarPayload(result))
            }
        }
    }

    @Test
    fun `reapply is idempotent and distance and settings transitions converge`() {
        val payload = nativeQuadFarResource()
        NATIVE_QUAD_FAR_DISTANCES.forEach { meters ->
            listOf(NATIVE_QUAD_FAR_SETTINGS_KEEP, NATIVE_QUAD_FAR_SETTINGS_NONE).forEach { settings ->
                val once = applyNativeQuadFarSlot(null, meters, settings, payload)
                assertContentEquals(once, applyNativeQuadFarSlot(once, meters, settings, payload))
                assertContentEquals(once, applyNativeQuadFarSlot(null, meters, settings, payload))
            }
        }
        val sixteen = applyNativeQuadFarSlot(null, 16, NATIVE_QUAD_FAR_SETTINGS_NONE, payload)
        val twoFifty = applyNativeQuadFarSlot(sixteen, 250, NATIVE_QUAD_FAR_SETTINGS_KEEP, payload)
        val sixtyFour = applyNativeQuadFarSlot(twoFifty, 64, NATIVE_QUAD_FAR_SETTINGS_NONE, payload)
        assertContentEquals(
            applyNativeQuadFarSlot(null, 64, NATIVE_QUAD_FAR_SETTINGS_NONE, payload),
            sixtyFour,
        )
        assertEquals(64, readNativeQuadFarDistance(sixtyFour))
        assertEquals(NATIVE_QUAD_FAR_SETTINGS_NONE, readNativeQuadFarSettings(sixtyFour))
    }

    @Test
    fun `unknown layer settings fail closed before any write`() = withSyntheticBase { root ->
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(root, steamLink, "2.0.20", "5001712", 64, 7, applyScene = ::fakeScene)
        }
        assertFalse(helperFile(root).exists())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFailsWith<PatchException> { applyNativeQuadFarSlot(null, 64, 2, nativeQuadFarResource()) }
    }

    @Test
    fun `installer writes the chosen distance and settings with the scene mutation`() = withSyntheticBase { root ->
        assertTrue(installNativeQuadFarPlane(
            root, steamLink, "2.0.20", "5001712", 250, NATIVE_QUAD_FAR_SETTINGS_NONE,
            applyScene = ::fakeScene,
        ))
        val installed = helperFile(root)
        assertEquals(250, readNativeQuadFarDistance(installed.readBytes()))
        assertEquals(NATIVE_QUAD_FAR_SETTINGS_NONE, readNativeQuadFarSettings(installed.readBytes()))
        assertTrue(isNativeQuadFarPayload(installed.readBytes()))
        assertEquals(0x42, sceneFile(root).readBytes()[0x1000].toInt())
        val installedTime = installed.lastModified()
        assertTrue(installNativeQuadFarPlane(
            root, steamLink, "2.0.20", "5001712", 250, NATIVE_QUAD_FAR_SETTINGS_NONE,
            applyScene = ::fakeScene,
        ))
        assertEquals(installedTime, installed.lastModified())
        assertTrue(installNativeQuadFarPlane(
            root, steamLink, "2.0.20", "5001712", 16, NATIVE_QUAD_FAR_SETTINGS_KEEP,
            applyScene = ::fakeScene,
        ))
        assertEquals(16, readNativeQuadFarDistance(helperFile(root).readBytes()))
        assertEquals(NATIVE_QUAD_FAR_SETTINGS_KEEP, readNativeQuadFarSettings(helperFile(root).readBytes()))
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `alpha0 and stock quad modes stay mutually exclusive in both orders`() = withSyntheticBase { root ->
        File(root, "lib/arm64-v8a/$STOCK_QUAD_LIBRARY").writeBytes(ByteArray(8))
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = ::fakeScene)
        }
        assertFalse(helperFile(root).exists())
        File(root, "lib/arm64-v8a/$STOCK_QUAD_LIBRARY").delete()

        File(root, "assets/openxr/1/api_layers/implicit.d").mkdirs()
        File(root, "assets/openxr/1/api_layers/implicit.d/$ANDROID_SURFACE_TRIGGER_MANIFEST")
            .writeText("{}")
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = ::fakeScene)
        }
        assertFalse(helperFile(root).exists())
    }

    @Test
    fun `old 1_2 native quad helper is rejected instead of converted`() = withSyntheticBase { root ->
        val oldHelper = ByteArray(8640).also {
            "GXR-NATIVE-QUAD-1.2-ABI1".toByteArray(Charsets.ISO_8859_1).copyInto(it, 0x40)
        }
        helperFile(root).writeBytes(oldHelper)
        val failure = assertFailsWith<PatchException> {
            installNativeQuadFarPlane(root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = ::fakeScene)
        }
        assertTrue(failure.message.orEmpty().contains("clean source APK"))
        assertContentEquals(oldHelper, helperFile(root).readBytes())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFailsWith<PatchException> { applyNativeQuadFarSlot(oldHelper, 64, 0, nativeQuadFarResource()) }
    }

    @Test
    fun `foreign truncated and wrong-hash helpers fail closed with zero writes`() = withSyntheticBase { root ->
        val payload = nativeQuadFarResource()
        helperFile(root).writeBytes("foreign helper".toByteArray())
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = ::fakeScene)
        }
        assertEquals("foreign helper", helperFile(root).readText())

        helperFile(root).delete()
        val truncated = payload.copyOf(payload.size - 1)
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(
                root, steamLink, "2.0.20", "5001712", 64, 0,
                farPayload = truncated, applyScene = ::fakeScene,
            )
        }
        assertFalse(helperFile(root).exists())

        val wrongHash = payload.copyOf().apply {
            this[NATIVE_QUAD_FAR_DISTANCE_OFFSET + 64] = (this[NATIVE_QUAD_FAR_DISTANCE_OFFSET + 64].toInt() xor 1).toByte()
        }
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(
                root, steamLink, "2.0.20", "5001712", 64, 0,
                farPayload = wrongHash, applyScene = ::fakeScene,
            )
        }
        assertFalse(helperFile(root).exists())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `excluded builds packages and distances return unchanged before file access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5001812", "2.0.20" to "5001713", "2.0.21" to "5001968",
            "2.0.22" to "5002244", "2.0.23" to "5002363", "2.0.24" to "5002395").forEach { (version, code) ->
            assertFalse(installNativeQuadFarPlane(missing, steamLink, version, code, 64, 0))
        }
        assertFalse(installNativeQuadFarPlane(missing, "cn.vr4p.oculus4xvrplayerov", "2.0.20", "5001712", 64, 0))
        assertFalse(missing.exists())
        listOf(0, 1, 32, 65, 1000, -16).forEach { meters ->
            assertFailsWith<PatchException> {
                installNativeQuadFarPlane(missing, steamLink, "2.0.20", "5001712", meters, 0)
            }
        }
        assertFalse(missing.exists())
    }

    @Test
    fun `move failure rolls the helper and scene back`() = withSyntheticBase { root ->
        assertFailsWith<PatchException> {
            installNativeQuadFarPlane(
                root, steamLink, "2.0.20", "5001712", 16, 0,
                applyScene = ::fakeScene,
                moveFile = { _, _ -> throw PatchException("commit failed") },
            )
        }
        assertFalse(helperFile(root).exists())
        assertContentEquals(ByteArray(SYNTHETIC_SCENE_SIZE), sceneFile(root).readBytes())
        assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
    }

    @Test
    fun `patch is a resource patch with read-only preflight and finalize metadata`() {
        val source = source(
            "patches/src/main/kotlin/app/template/patches/steamlink/androidxr/NativeQuadFarPlanePatch.kt",
        )
        // Morphe RAW_ONLY cannot decode a binary AndroidManifest.xml or compile ids.xml, so the
        // far plane must stay a resource patch.
        assertTrue(source.contains("val nativeQuadFarPlanePatch = resourcePatch("))
        assertFalse(source.contains("rawResourcePatch"))
        assertTrue(source.contains("readInstalledResolutionModes(get(\"AndroidManifest.xml\"))"))
        assertTrue(source.contains("rejectUnsupportedResolutionModes("))
        assertFalse(source.contains("use { installedResolutionMode(it) }"))
        assertTrue(source.contains("finalize {"))
        assertTrue(source.contains("manifestFile.writeBytes(snapshot)"))
        assertTrue(source.contains("configurePermissionFreeProjectionMode(document, NATIVE_QUAD_MODE)"))
    }

    @Test
    fun `read-only manifest preflight rejects legacy and sibling modes without rewriting bytes`() =
        withTemporaryRoot { root ->
            val manifest = File(root, "AndroidManifest.xml")
            manifest.writeText(manifestXml(LEGACY_NATIVE_QUAD_MODE))
            val legacyBytes = manifest.readBytes()
            assertFailsWith<PatchException> {
                rejectUnsupportedResolutionModes(readInstalledResolutionModes(manifest))
            }
            assertContentEquals(legacyBytes, manifest.readBytes())

            manifest.writeText(manifestXml(ANDROID_SURFACE_TRIGGER_MODE))
            val siblingBytes = manifest.readBytes()
            val failure = assertFailsWith<PatchException> {
                rejectUnsupportedResolutionModes(readInstalledResolutionModes(manifest))
            }
            assertEquals(QUAD_MODE_EXCLUSION_MESSAGE, failure.message)
            assertContentEquals(siblingBytes, manifest.readBytes())

            manifest.writeText(manifestXml(NATIVE_QUAD_MODE))
            rejectUnsupportedResolutionModes(readInstalledResolutionModes(manifest))
            manifest.writeText(manifestXml(""))
            rejectUnsupportedResolutionModes(readInstalledResolutionModes(manifest))
        }

    @Test
    fun `retired helper or layer manifest fails closed with every byte unchanged`() {
        val retiredFiles = listOf(
            "lib/arm64-v8a/libgxr_nqvd.so" to "retired helper",
            "assets/openxr/1/api_layers/implicit.d/" +
                "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json" to """{"retired":true}""",
        )
        retiredFiles.forEach { (relative, content) ->
            withSyntheticBase { root ->
                val retired = File(root, relative)
                retired.parentFile.mkdirs()
                retired.writeText(content)
                val before = treeSnapshot(root)
                val failure = assertFailsWith<PatchException> {
                    installNativeQuadFarPlane(
                        root, steamLink, "2.0.20", "5001712", 64, 0, applyScene = ::fakeScene,
                    )
                }
                assertTrue(
                    failure.message.orEmpty().contains("clean source APK"),
                    failure.message.orEmpty(),
                )
                assertFalse(helperFile(root).exists())
                // Nothing is written, deleted or rewritten, including the retired file itself.
                assertEquals(before, treeSnapshot(root))
            }
        }
    }

    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    private fun manifestDocument(mode: String) = javax.xml.parsers.DocumentBuilderFactory.newInstance()
        .newDocumentBuilder().newDocument().apply {
            val manifest = createElement("manifest")
            appendChild(manifest)
            val application = createElement("application")
            manifest.appendChild(application)
            application.appendChild(createElement("meta-data").apply {
                setAttribute("android:name", "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE")
                setAttribute("android:value", mode)
            })
        }

    private fun manifestXml(mode: String): String {
        val open = "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">"
        return if (mode.isEmpty()) {
            "$open<application /></manifest>"
        } else {
            open + "<application><meta-data " +
                "android:name=\"com.valvesoftware.steamlink.GXR_RESOLUTION_MODE\" " +
                "android:value=\"$mode\" /></application></manifest>"
        }
    }

    private fun treeSnapshot(root: File): Map<String, String> =
        root.walkTopDown()
            .filter(File::isFile)
            .associate { it.relativeTo(root).path.replace('\\', '/') to sha256(it.readBytes()) }

    private fun source(relativePath: String): String = listOf(
        File(relativePath),
        File("../$relativePath"),
    ).firstOrNull(File::isFile)?.readText() ?: error("Missing source: $relativePath")

    private fun fakeScene(bytes: ByteArray, versionName: String, versionCode: String): ByteArray {
        require(bytes.size > 0x1000 + 1) { "synthetic scene too small" }
        return bytes.copyOf().apply { this[0x1000] = 0x42 }
    }

    private fun libDirectory(root: File) = File(root, "lib/arm64-v8a")
    private fun helperFile(root: File) = File(libDirectory(root), NATIVE_QUAD_LIBRARY)
    private fun sceneFile(root: File) = File(libDirectory(root), "libvrlink_scene.so")

    private fun withSyntheticBase(block: (File) -> Unit) = withTemporaryRoot { root ->
        sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(SYNTHETIC_SCENE_SIZE)) }
        block(root)
    }

    private fun withTemporaryRoot(block: (File) -> Unit) {
        val root = Files.createTempDirectory("native-quad-far-test-").toFile()
        try { block(root) } finally { root.deleteRecursively() }
    }

    private companion object {
        const val SYNTHETIC_SCENE_SIZE = 65_536
    }
}
