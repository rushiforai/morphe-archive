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
            "52f36e28109d54468767afd979da11cc55696ee7b1adc784b67e7b08f221a69c",
            MessageDigest.getInstance("SHA-256").digest(library).joinToString("") { "%02x".format(it) },
        )
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        // The action VRLink streams the controllers from, and the switches read at start.
        assertTrue("pamir-stream-pose" in text)
        assertTrue("debug.gxr.velocity_frame" in text)
        assertTrue("debug.gxr.velocity_pitch_linear" in text)
        assertTrue("debug.gxr.velocity_pitch_angular" in text)
        assertTrue("debug.gxr.velocity_frame.angular" in text)
        // The bundled library reports the angular velocity local until a patch says otherwise.
        assertFalse(library.angularVelocityWorld(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC))
    }

    @Test
    fun `each patch writes its base's angular velocity frame and nothing else`() {
        val bundled = controllerVelocityFrameResource(CONTROLLER_VELOCITY_FRAME_LIBRARY)
        val local = controllerVelocityFrameLibrary(angularWorld = false)
        val world = controllerVelocityFrameLibrary(angularWorld = true)

        assertContentEquals(bundled, local)
        assertFalse(local.angularVelocityWorld(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC))
        assertTrue(world.angularVelocityWorld(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC))
        assertEquals(bundled.size, world.size)
        assertEquals(1, bundled.indices.count { bundled[it] != world[it] })
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
    fun `patches are opt-in and split the legacy and native bases`() {
        assertEquals("Controller velocity frame (experimental)", controllerVelocityFramePatch.name)
        assertEquals("Controller velocity frame, 2.0.20 - 2.0.22 (experimental)", controllerVelocityFrameLegacyPatch.name)
        mapOf(
            controllerVelocityFramePatch to listOf("2.0.23" to 5002363),
            controllerVelocityFrameLegacyPatch to listOf(
                "2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244,
            ),
        ).forEach { (patch, builds) ->
            assertFalse(patch.default, patch.name)
            assertTrue(patch.dependencies.isEmpty(), patch.name)
            val compatibilities = patch.compatibility.orEmpty()
            assertTrue(compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME }, patch.name)
            assertEquals(
                builds,
                compatibilities.map { it.targets.single() }.map { it.version to it.versionCodes!!.values.toSet().single() },
                patch.name,
            )
        }
        assertTrue("local to the streamed pose" in controllerVelocityFramePatch.description.orEmpty())
        assertTrue("in the base space" in controllerVelocityFrameLegacyPatch.description.orEmpty())
        // Only the base the layer was measured on says so.
        assertEquals(
            listOf("2.0.23"),
            (controllerVelocityFramePatch.compatibility.orEmpty() + controllerVelocityFrameLegacyPatch.compatibility.orEmpty())
                .map { it.targets.single() }
                .filter { "not run on this base" !in it.description.orEmpty() }
                .map { it.version },
        )

        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244")
            .forEach { (version, versionCode) ->
                assertTrue(isControllerVelocityFrameLegacyBuild(version, versionCode), "$version/$versionCode")
                assertFalse(isControllerVelocityFrameNativeBuild(version, versionCode), "$version/$versionCode")
            }
        assertTrue(isControllerVelocityFrameNativeBuild("2.0.23", "5002363"))
        assertFalse(isControllerVelocityFrameLegacyBuild("2.0.23", "5002363"))
        listOf("2.0.22" to "5002363", "2.0.23" to "5002322", "2.0.23" to "5002364", "2.0.20" to "5002244")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerVelocityFrameBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
