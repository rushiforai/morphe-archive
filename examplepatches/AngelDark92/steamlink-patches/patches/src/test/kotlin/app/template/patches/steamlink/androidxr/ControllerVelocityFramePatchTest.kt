package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ControllerVelocityFramePatchTest {
    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_LIBRARY)

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-velocity-frame-layer, NDK 28.2.13676358, arm64-v8a, Release.
        assertEquals(
            "dce59f7100d003a04efebece7e9ac156d7f4e408ac949c897c88dfa6f8e0ca89",
            MessageDigest.getInstance("SHA-256").digest(library).joinToString("") { "%02x".format(it) },
        )
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        // The action VRLink streams the controllers from, and the switches read at start.
        assertTrue("pamir-stream-pose" in text)
        assertTrue("debug.gxr.velocity_frame" in text)
        assertTrue("debug.gxr.velocity_pitch_linear" in text)
        assertTrue("debug.gxr.velocity_pitch_angular" in text)
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_MANIFEST))
        val library = String(
            controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_LIBRARY),
            Charsets.ISO_8859_1,
        )

        assertTrue("\"library_path\": \"$CONTROLLER_VELOCITY_FRAME_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_controller_velocity_frame\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_CONTROLLER_VELOCITY_FRAME\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_controller_velocity_frame" in library)
    }

    @Test
    fun `layer does not share files with the other controller layers`() {
        assertFalse(CONTROLLER_VELOCITY_FRAME_LIBRARY == CONTROLLER_EXTRAPOLATION_LIBRARY)
        assertFalse(CONTROLLER_VELOCITY_FRAME_MANIFEST == CONTROLLER_EXTRAPOLATION_MANIFEST)
        // The legacy controller velocity layer keeps its own names.
        assertFalse(CONTROLLER_VELOCITY_FRAME_LIBRARY == "libgxr_controller_velocity.so")
        assertFalse(CONTROLLER_VELOCITY_FRAME_MANIFEST == "XR_APILAYER_local_GalaxyXR_controller_velocity.json")
    }

    @Test
    fun `patch is opt-in and covers the legacy and native bases`() {
        assertFalse(controllerVelocityFramePatch.default)
        assertEquals("Controller velocity frame (experimental)", controllerVelocityFramePatch.name)
        assertTrue(controllerVelocityFramePatch.dependencies.isEmpty())

        val compatibilities = controllerVelocityFramePatch.compatibility.orEmpty()
        assertTrue(compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        assertEquals(
            listOf("2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244,
                "2.0.23" to 5002363),
            compatibilities.map { it.targets.single() }.map { it.version to it.versionCodes!!.values.toSet().single() },
        )
        // Only the base the layer was measured on says so.
        assertEquals(
            listOf("2.0.23"),
            compatibilities.map { it.targets.single() }
                .filter { "not run on this base" !in it.description.orEmpty() }
                .map { it.version },
        )

        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244",
            "2.0.23" to "5002363")
            .forEach { (version, versionCode) ->
                assertTrue(isControllerVelocityFrameBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.22" to "5002363", "2.0.23" to "5002322", "2.0.23" to "5002364", "2.0.20" to "5002244")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerVelocityFrameBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
