package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.io.File
import java.nio.file.Files
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue
import org.junit.Assume.assumeTrue

class GxrSpacewarpLayerPatchTest {
    private val zeroSha = "0".repeat(64)

    // Both supported bases (brief 13): the layer payload + manifest are
    // base-agnostic; the gate evidence pairs and scene windows are per base.
    private val supportedBases = listOf(
        Pair("2.0.20", "5001712"),
        Pair("2.0.20", "5001812"),
        Pair("2.0.21", "5001968"),
        Pair("2.0.22", "5002244"),
        Pair("2.0.23", "5002363"),
    )

    @Test
    fun `per-scope default stays exact, experimental-only and off by default`() {
        assertFalse(gxrSpacewarpLayerPatch.default)
        assertTrue(gxrSpacewarpLayerPatch.dependencies.isEmpty())
        assertTrue(gxrSpacewarpLayerPatch.compatibility.orEmpty()
            .all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        val nativeTargets = gxrSpacewarpLayerPatch.compatibility.orEmpty().flatMap { it.targets }
        assertEquals(setOf("2.0.20", "2.0.21", "2.0.22", "2.0.23"), nativeTargets.map { it.version }.toSet())
        assertEquals(setOf(5001712, 5001812, 5001968, 5002244, 5002363),
            nativeTargets.flatMap { it.versionCodes.orEmpty().values }.toSet())
        supportedBases.forEach { (version, code) ->
            assertTrue(isGxrSpacewarpSteamLinkBuild(version, code), "$version/$code")
        }
        listOf("2.0.20" to "5002363", "2.0.23" to "5001712",
            "2.0.23" to "5002322", "2.0.20" to "5001740",
            "2.0.24" to "5002395").forEach { (version, code) ->
            assertFalse(isGxrSpacewarpSteamLinkBuild(version, code))
        }
        assertFalse(
            gxrSpacewarpLayerPatch.compatibility.orEmpty().any { compatibility ->
                compatibility.targets.any { target ->
                    target.versionCodes.orEmpty().values.contains(5002395)
                }
            },
            "2.0.24 has no spacewarp profile yet",
        )
        // Repo voice: the description states the fail-safe stand-down and the
        // experimental status; assert with contains-checks (credits may appended).
        val description = gxrSpacewarpLayerPatch.description.orEmpty()
        assertTrue("5002363" in description, "description names the native base")
        assertTrue("5001712" in description, "description names the legacy base")
        assertTrue("stand" in description, "description states the stand-down discipline")
    }
    @Test
    fun `excluded exact pairs return unchanged before file or payload access`() = withTemporaryRoot { root ->
        val missing = File(root, "must-stay-absent")
        listOf("2.0.20" to "5002363", "2.0.23" to "5001712",
            "2.0.23" to "5002322")
            .forEach { (version, code) ->
                assertFalse(
                    installGxrSpacewarpResources(missing, version, code, byteArrayOf(1),
                        byteArrayOf(2), byteArrayOf(3), byteArrayOf(4)))
                assertFalse(missing.exists())
            }
    }

    @Test
    fun `actual decoded renderer accepts pinned windows and rejects altered contracts`() {
        val scene = originalScene()
        // Fresh checkouts skip; a PRESENT but invalid scene still fails below.
        validateGxrSpacewarpScene(scene, "2.0.23", "5002363")
        assertFailsWith<PatchException> {
            validateGxrSpacewarpScene(scene.copyOf(gxrSpacewarpScenePreconditions["2.0.23/5002363"].orEmpty().first().first + 0x20),
                "2.0.23", "5002363")
        }
        gxrSpacewarpScenePreconditions["2.0.23/5002363"].orEmpty().forEach { (offset, _, _) ->
            val tampered = scene.copyOf()
            tampered[offset] = (tampered[offset].toInt() xor 1).toByte()
            assertFailsWith<PatchException> {
                validateGxrSpacewarpScene(tampered, "2.0.23", "5002363")
            }
        }
    }

    @Test
    fun `second base decoded renderer accepts its pinned windows and rejects tampering`() {
        val scene = originalScene("5001712")
        validateGxrSpacewarpScene(scene, "2.0.20", "5001712")
        assertFailsWith<PatchException> {
            validateGxrSpacewarpScene(scene.copyOf(
                gxrSpacewarpScenePreconditions["2.0.20/5001712"].orEmpty().first().first + 0x20),
                "2.0.20", "5001712")
        }
        gxrSpacewarpScenePreconditions["2.0.20/5001712"].orEmpty().forEach { (offset, _, _) ->
            val tampered = scene.copyOf()
            tampered[offset] = (tampered[offset].toInt() xor 1).toByte()
            assertFailsWith<PatchException> {
                validateGxrSpacewarpScene(tampered, "2.0.20", "5001712")
            }
        }
    }

    @Test
    fun `unknown renderer fails before creating resource directories`() = withTemporaryRoot { root ->
        // Deliberately invalid bytes exercise rejection without Valve's local-only
        // input. This fixture is not evidence of compatibility with a real renderer.
        val bytes = ByteArray(0x10000)
        val scene = sceneFile(root).apply { parentFile.mkdirs(); writeBytes(bytes) }
        assertFailsWith<PatchException> {
            installGxrSpacewarpResources(root, "2.0.23", "5002363",
                ByteArray(24) { i -> (i + 1).toByte() }, validManifest(), validGate0(), validVts())
        }
        assertFalse(File(scene.parentFile, GXR_SPACEWARP_LIBRARY).exists())
        assertFalse(File(root, "assets/openxr").exists())
        assertFalse(File(root, "assets/gxr_spacewarp").exists())
        assertContentEquals(bytes, scene.readBytes())
    }

    @Test
    fun `bundled manifest and gate-0 evidence validate against their pins`() {
        val manifest = projectionModeResource(GXR_SPACEWARP_MANIFEST)
        val manifestText = manifest.decodeToString()
        assertTrue("XR_APILAYER_local_GalaxyXR_gxr_spacewarp" in manifestText,
            "manifest names the layer")
        assertTrue("libgxr_spacewarp.so" in manifestText, "manifest mounts the bundled .so")
        assertTrue("GXR_DISABLE_GXR_SPACEWARP" in manifestText, "manifest carries the disable env")
        // The .so payload cannot exist before the owner build (Build-Native.ps1).
        // These payload tests self-activate once the real library is staged and
        // its pin filled; until then they skip instead of failing CI.
        assumeTrue(
            "Real payload audit BLOCKED: libgxr_spacewarp.so not staged yet " +
                "(run extensions/gxr-spacewarp-layer/Build-Native.ps1, stage into " +
                "patches/src/main/resources/steamlink/androidxr/, update the pin)",
            GXR_SPACEWARP_LIBRARY_SHA256 != zeroSha)
        val library = projectionModeResource(GXR_SPACEWARP_LIBRARY)
        // Per base: the base's own gate pair validates; the OTHER base's pair
        // must be rejected two ways (wrong sha pin + the versionCode content
        // marker), so a mispaired stage can never satisfy a base selector.
        supportedBases.forEach { (version, code) ->
            validateGxrSpacewarpPayload(library, manifest,
                gateResource(code), vtsResource(code), version, code)
        }
        assertFailsWith<PatchException> {
            validateGxrSpacewarpPayload(library, manifest,
                gateResource("5001712"), vtsResource("5001712"), "2.0.23", "5002363")
        }
        assertFailsWith<PatchException> {
            validateGxrSpacewarpPayload(library, manifest,
                gateResource("5002363"), vtsResource("5002363"), "2.0.20", "5001712")
        }
    }

    @Test
    fun `gate-0 evidence matches the Kotlin preconditions and the decoded tree`() {
        // Per base: regex extraction (dependency-free) - offsets + sha windows
        // must equal the Kotlin precondition triples and the slot pin must match
        // the layer's per-base profile.
        supportedBases.forEach { (version, code) ->
            val gate0 = gateResource(code)
            val json = gate0.decodeToString()
            val anchorPattern = Regex("\"offset\": (\\d+),\\s*\"size\": 128,\\s*\"sha256\": \"([0-9a-f]{64})\"")
            val anchors = anchorPattern.findAll(json).map { match ->
                Triple(match.groupValues[1].toInt(), 0x80, match.groupValues[2])
            }.toList()
            val kotlinPreconditions = gxrSpacewarpScenePreconditions["$version/$code"].orEmpty()
            assertEquals(kotlinPreconditions.size, anchors.size, "$version/$code anchor count")
            anchors.zip(kotlinPreconditions).forEach { (jsonPin, kotlinPin) ->
                assertEquals(kotlinPin.first, jsonPin.first, "$version/$code anchor offset parity")
                assertEquals(kotlinPin.second, jsonPin.second, "$version/$code anchor size parity")
                assertEquals(kotlinPin.third, jsonPin.third, "$version/$code anchor sha parity")
            }
            assertTrue("\"occurrences\": 1" in json, "gate-0 records uniqueness for every pin")
            assertTrue("eglCreateImageKHR" in json, "gate-0 pins the arrival-learning import")
            assertTrue("never a full-file gate" in json,
                "full-file sha is diagnostics-only by the frozen gate's own rule")
            val slotPattern = Regex("\"slotOffset\": (\\d+)")
            val slotOffset = requireNotNull(slotPattern.find(json)?.groupValues?.get(1)?.toInt()) {
                "gate-0 slot pin missing"
            }
            val pinnedSlot = perBaseSlotPins.getValue(code)
            assertEquals(pinnedSlot, slotOffset, "slot pin matches the layer's swp_hooks profile")
        }
        // Decoded-tree window cross-checks (both trees present locally; fresh
        // checkouts skip per base).
        supportedBases.forEach { (version, code) ->
            val decodedScene = originalSceneUnchecked(code) ?: return@forEach
            val preconditions = gxrSpacewarpScenePreconditions["$version/$code"].orEmpty()
            val highest = preconditions.maxOf { it.first }
            if (decodedScene.size > highest + 0x80) {
                preconditions.forEach { (offset, size, expected) ->
                    val sha = java.security.MessageDigest.getInstance("SHA-256")
                        .digest(decodedScene.copyOfRange(offset, offset + size))
                        .joinToString("") { "%02x".format(it) }
                    assertEquals(expected, sha, "decoded-tree parity at 0x${offset.toString(16)} ($code)")
                }
            }
        }
    }

    @Test
    fun `production install and reapplication preserve manifest and neighbours`() =
        withTemporaryRootFor(*supportedBases.map { it.second }.toTypedArray()) { root, version, code ->
            assumeTrue(
                "Real payload audit BLOCKED: libgxr_spacewarp.so not staged yet; fill the pin",
                GXR_SPACEWARP_LIBRARY_SHA256 != zeroSha)
            val library = projectionModeResource(GXR_SPACEWARP_LIBRARY)
            val manifest = projectionModeResource(GXR_SPACEWARP_MANIFEST)
            val gate0 = gateResource(code)
            val vts = vtsResource(code)
            val androidManifest = File(root, "AndroidManifest.xml").readBytes()
            val scene = sceneFile(root).readBytes()

            assertTrue(
                installGxrSpacewarpResources(root, version, code, library, manifest, gate0, vts))
            val installedLibrary = File(sceneFile(root).parentFile, GXR_SPACEWARP_LIBRARY)
            val installedManifest = File(layerDirectory(root), GXR_SPACEWARP_MANIFEST)
            val installedGate0 = File(root, "assets/gxr_spacewarp/${gateName(code)}")
            val installedVts = File(root, "assets/gxr_spacewarp/${vtsName(code)}")
            assertContentEquals(library, installedLibrary.readBytes())
            assertContentEquals(manifest, installedManifest.readBytes())
            assertContentEquals(gate0, installedGate0.readBytes())
            assertContentEquals(vts, installedVts.readBytes())
            val fileTime = installedLibrary.lastModified()
            assertTrue(
                installGxrSpacewarpResources(root, version, code, library, manifest, gate0, vts))
            assertEquals(fileTime, installedLibrary.lastModified())
            assertContentEquals(scene, sceneFile(root).readBytes())
            assertContentEquals(androidManifest, File(root, "AndroidManifest.xml").readBytes())
            assertFalse(root.walkTopDown().any { it.name.endsWith(".tmp") })
        }

    @Test
    fun `tampered payload fails atomically before any installation`() =
        withTemporaryRootFor(*supportedBases.map { it.second }.toTypedArray()) { root, version, code ->
            assumeTrue(
                "Real payload audit BLOCKED: libgxr_spacewarp.so not staged yet; fill the pin",
                GXR_SPACEWARP_LIBRARY_SHA256 != zeroSha)
            val library = projectionModeResource(GXR_SPACEWARP_LIBRARY)
            val manifest = projectionModeResource(GXR_SPACEWARP_MANIFEST)
            val gate0 = gateResource(code)
            val vts = vtsResource(code)
            val alteredLibrary = library.copyOf().apply { this[lastIndex] = (last().toInt() xor 1).toByte() }
            assertFailsWith<PatchException> {
                installGxrSpacewarpResources(root, version, code, alteredLibrary, manifest, gate0, vts)
            }
            val alteredGate0 = gate0.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
            assertFailsWith<PatchException> {
                installGxrSpacewarpResources(root, version, code, library, manifest, alteredGate0, vts)
            }
            val alteredVts = vts.copyOf().apply { this[0] = (this[0].toInt() xor 1).toByte() }
            assertFailsWith<PatchException> {
                installGxrSpacewarpResources(root, version, code, library, manifest, gate0, alteredVts)
            }
            assertFalse(File(sceneFile(root).parentFile, GXR_SPACEWARP_LIBRARY).exists())
            assertFalse(File(root, "assets/openxr").exists())
        }

    @Test
    fun `stale installed resource fails before installing its missing counterpart`() =
        withTemporaryRootFor(*supportedBases.map { it.second }.toTypedArray()) { root, version, code ->
            assumeTrue(
                "Real payload audit BLOCKED: libgxr_spacewarp.so not staged yet; fill the pin",
                GXR_SPACEWARP_LIBRARY_SHA256 != zeroSha)
            val library = projectionModeResource(GXR_SPACEWARP_LIBRARY)
            val manifest = projectionModeResource(GXR_SPACEWARP_MANIFEST)
            val gate0 = gateResource(code)
            val libraryFile = File(sceneFile(root).parentFile, GXR_SPACEWARP_LIBRARY)
            val manifestFile = File(layerDirectory(root), GXR_SPACEWARP_MANIFEST)
            manifestFile.parentFile.mkdirs()
            manifestFile.writeText("stale manifest")
            val vts = vtsResource(code)
            assertFailsWith<PatchException> {
                installGxrSpacewarpResources(root, version, code, library, manifest, gate0, vts)
            }
            assertFalse(libraryFile.exists())
            assertEquals("stale manifest", manifestFile.readText())
            manifestFile.delete()
            libraryFile.writeText("stale library")
            assertFailsWith<PatchException> {
                installGxrSpacewarpResources(root, version, code, library, manifest, gate0)
            }
            assertFalse(manifestFile.exists())
            assertEquals("stale library", libraryFile.readText())
        }

    private fun gateName(versionCode: String) =
        gxrSpacewarpGatePairs.getValue(versionCode).gate0Name
    private fun vtsName(versionCode: String) =
        gxrSpacewarpGatePairs.getValue(versionCode).vtsName
    private fun gateResource(versionCode: String) = projectionModeResource(gateName(versionCode))
    private fun vtsResource(versionCode: String) = projectionModeResource(vtsName(versionCode))
    private fun validManifest(): ByteArray = projectionModeResource(GXR_SPACEWARP_MANIFEST)
    private fun validGate0(): ByteArray = projectionModeResource(GXR_SPACEWARP_GATE0)
    private fun validVts(): ByteArray = projectionModeResource(GXR_SPACEWARP_VTS_GATE)

    // The layer's per-base eglCreateImageKHR slot pins (swp_hooks profiles).
    private val perBaseSlotPins = mapOf(
        "5001712" to 0x21bb88,
        "5001812" to 0x21bab8,
        "5001968" to 0x221bc8,
        "5002244" to 0x226150,
        "5002363" to 0x22fcc8,
    )

    private fun originalScene(versionCode: String): ByteArray {
        val scene = originalSceneUnchecked(versionCode)
        assumeTrue(
            "Real decoded-input audit BLOCKED: missing exact $versionCode scene; " +
                "no synthetic replacement",
            scene != null)
        return requireNotNull(scene)
    }

    private fun originalScene(): ByteArray = originalScene("5002363")

    private fun originalSceneUnchecked(versionCode: String): ByteArray? {
        val relative = "${baseTrees.getValue(versionCode)}/lib/arm64-v8a/libvrlink_scene.so"
        val scene = listOf(File(relative), File("../$relative")).firstOrNull(File::isFile)
        // Fresh GitHub checkouts do not contain the ignored proprietary decoded APK.
        return scene?.readBytes()
    }

    // per versionCode: (versionName, decoded tree directory)
    private val baseTrees = mapOf(
        "5001712" to "android-steamlinkvr-release-base-2.0.20-5001712",
        "5001812" to "android-steamlinkvr-release-base-2.0.20-5001812",
        "5001968" to "android-steamlinkvr-release-base-2.0.21-5001968",
        "5002244" to "android-steamlinkvr-release-base-2.0.22-5002244",
        "5002363" to "android-steamlinkvr-release-base-2.0.23-5002363",
    )
    private val baseVersionNames = mapOf(
        "5001712" to "2.0.20",
        "5001812" to "2.0.20",
        "5001968" to "2.0.21",
        "5002244" to "2.0.22",
        "5002363" to "2.0.23",
    )

    private fun sceneFile(root: File) = File(root, "lib/arm64-v8a/libvrlink_scene.so")
    private fun layerDirectory(root: File) = File(root, "assets/openxr/1/api_layers/implicit.d")

    private fun withTemporaryRoot(block: (File) -> Unit) =
        withTemporaryRootFor("5002363") { root, _version, _code -> block(root) }

    private fun withTemporaryRootFor(
        vararg versionCodes: String,
        block: (File, String, String) -> Unit,
    ) {
        versionCodes.forEach { versionCode ->
            val root = Files.createTempDirectory("gxr-spacewarp-patch-test-").toFile()
            try {
                val relative = "${baseTrees.getValue(versionCode)}/lib/arm64-v8a/libvrlink_scene.so"
                val scene = originalSceneUnchecked(versionCode)
                if (scene != null) {
                    sceneFile(root).apply { parentFile.mkdirs(); writeBytes(scene) }
                } else {
                    // Tests that need a real scene skip on its absence; the flow tests
                    // that only need layout rejection use the same byte pattern.
                    sceneFile(root).apply { parentFile.mkdirs(); writeBytes(ByteArray(0x10000)) }
                }
                File(root, "AndroidManifest.xml")
                    .writeText("<manifest><!-- preserved verbatim --></manifest>")
                val version = baseVersionNames.getValue(versionCode)
                block(root, version, versionCode)
            } finally {
                root.deleteRecursively()
            }
        }
    }

    private companion object
}