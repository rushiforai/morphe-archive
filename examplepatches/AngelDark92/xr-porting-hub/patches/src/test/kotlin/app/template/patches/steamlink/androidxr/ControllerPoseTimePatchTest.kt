package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import org.junit.Assume.assumeTrue
import java.io.File
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class ControllerPoseTimePatchTest {
    private fun sha256(bytes: ByteArray) =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerPoseTimeResource(CONTROLLER_POSE_TIME_LIBRARY)

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-pose-time-layer, NDK 27.2.12479018, arm64-v8a, Release.
        assertEquals("116b27b6b9b36483887b368e12f3fdcb5d8c6ff57520a329844a02ebd0214b2b", sha256(library))
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        assertTrue("/system/lib64/libopenxr_android.so" in text)
        assertTrue("debug.gxr.pose_time" in text)
        assertTrue("debug.gxr.pose_time.lead_us" in text)
        // The scene and runtime pins the patch checks are the ones the layer checks at runtime.
        CONTROLLER_POSE_TIME_SCENES.forEach { scene ->
            listOf(scene.state, scene.send, scene.clock).forEach { region -> assertTrue(region.sha256 in text) }
        }
        // The bundled library carries the 5 ms default until the patch writes the option.
        assertEquals(CONTROLLER_POSE_TIME_DEFAULT_MS * 1000, library.poseTimeCompensationUs())
    }

    @Test
    fun `the option writes only the compensation field`() {
        val bundled = controllerPoseTimeResource(CONTROLLER_POSE_TIME_LIBRARY)
        assertContentEquals(bundled, controllerPoseTimeLibrary(CONTROLLER_POSE_TIME_DEFAULT_MS))
        listOf(0, 1, 15, 29, CONTROLLER_POSE_TIME_MAX_MS).forEach { ms ->
            val written = controllerPoseTimeLibrary(ms)
            assertEquals(ms * 1000, written.poseTimeCompensationUs(), "$ms ms")
            assertEquals(bundled.size, written.size)
            assertTrue(bundled.indices.count { bundled[it] != written[it] } <= 4, "$ms ms")
        }
        listOf(-1, CONTROLLER_POSE_TIME_MAX_MS + 1).forEach { ms ->
            assertFailsWith<PatchException> { controllerPoseTimeLibrary(ms) }
        }
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(controllerPoseTimeResource(CONTROLLER_POSE_TIME_MANIFEST))
        val library = String(controllerPoseTimeResource(CONTROLLER_POSE_TIME_LIBRARY), Charsets.ISO_8859_1)

        assertTrue("\"library_path\": \"$CONTROLLER_POSE_TIME_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_controller_pose_time\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_CONTROLLER_POSE_TIME\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_controller_pose_time" in library)
    }

    @Test
    fun `layer does not share files with the other controller layers`() {
        listOf(CONTROLLER_VELOCITY_FRAME_LIBRARY, CONTROLLER_EXTRAPOLATION_LIBRARY, CONTROLLER_HAL_POSE_LIBRARY)
            .forEach { assertFalse(CONTROLLER_POSE_TIME_LIBRARY == it) }
        listOf(CONTROLLER_VELOCITY_FRAME_MANIFEST, CONTROLLER_EXTRAPOLATION_MANIFEST, CONTROLLER_HAL_POSE_MANIFEST)
            .forEach { assertFalse(CONTROLLER_POSE_TIME_MANIFEST == it) }
        assertEquals(listOf("controller_hal_pose", "controller_extrapolation"), controllerPoseTimeConflicts)
        assertTrue(CONTROLLER_HAL_POSE_LIBRARY == "libgxr_controller_hal_pose.so")
        assertTrue(CONTROLLER_EXTRAPOLATION_LIBRARY == "libgxr_controller_extrapolation.so")
    }

    @Test
    fun `patch is experimental, off by default, with a 0 to 30 ms option defaulting to 5`() {
        assertEquals("Controller pose time (experimental)", controllerPoseTimePatch.name)
        assertFalse(controllerPoseTimePatch.default)
        assertTrue(controllerPoseTimePatch.dependencies.isEmpty())
        val compatibilities = controllerPoseTimePatch.compatibility.orEmpty()
        assertTrue(compatibilities.isNotEmpty() && compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        assertEquals(
            setOf(
                "2.0.20" to 5001712, "2.0.20" to 5001812,
                "2.0.21" to 5001968, "2.0.22" to 5002244, "2.0.23" to 5002363,
                "2.0.24" to 5002395,
            ),
            compatibilities.flatMap { it.targets }.map { it.version to it.versionCodes!!.values.toSet().single() }.toSet(),
        )
        val option = controllerPoseTimePatch.options["compensationMs"]
        assertEquals(CONTROLLER_POSE_TIME_DEFAULT_MS, option.default)
        assertEquals(5, CONTROLLER_POSE_TIME_DEFAULT_MS)
        assertEquals(30, CONTROLLER_POSE_TIME_MAX_MS)
        assertTrue("Allowed range: 0 to 30 ms" in option.description.orEmpty())
        assertTrue("28.82 ms" in controllerPoseTimePatch.description.orEmpty())

        assertNotNull(controllerPoseTimeScene("2.0.20", "5001712"))
        assertNotNull(controllerPoseTimeScene("2.0.20", "5001812"))
        assertNotNull(controllerPoseTimeScene("2.0.21", "5001968"))
        assertNotNull(controllerPoseTimeScene("2.0.22", "5002244"))
        assertNotNull(controllerPoseTimeScene("2.0.23", "5002363"))
        assertNotNull(controllerPoseTimeScene("2.0.24", "5002395"))
        listOf("2.0.20" to "5002363", "2.0.23" to "5001712", "2.0.23" to "5002364",
            "2.0.24" to "5002363", "2.0.24" to "5002394")
            .forEach { (version, code) -> assertNull(controllerPoseTimeScene(version, code), "$version/$code") }
    }

    @Test
    fun `scene validation rejects foreign or edited code`() {
        val scene = controllerPoseTimeScene("2.0.23", "5002363")!!
        assertFailsWith<PatchException> { validateControllerPoseTimeScene(scene, ByteArray(0x200000)) }
        val elf = ByteArray(scene.state.offset + scene.state.length).apply {
            this[0] = 0x7f; this[1] = 'E'.code.toByte(); this[2] = 'L'.code.toByte(); this[3] = 'F'.code.toByte()
            this[4] = 2; this[5] = 1; this[18] = 0xb7.toByte()
        }
        assertFailsWith<PatchException> { validateControllerPoseTimeScene(scene, elf) }
    }

    // Real-input audit: set GXR_POSE_TIME_SCENE_5001712 / GXR_POSE_TIME_SCENE_5002363 to a
    // libvrlink_scene.so of that base (original or with the recommended patches applied).
    @Test
    fun `real scene libraries carry the pinned code`() {
        val inputs = CONTROLLER_POSE_TIME_SCENES.mapNotNull { scene ->
            System.getenv("GXR_POSE_TIME_SCENE_${scene.versionCode}")?.let { scene to File(it) }
        }
        assumeTrue("Real scene audit requires GXR_POSE_TIME_SCENE_<versionCode>", inputs.isNotEmpty())
        inputs.forEach { (scene, file) ->
            assertTrue(file.isFile, "${file.path} is not a file")
            validateControllerPoseTimeScene(scene, file.readBytes())
        }
    }
}
