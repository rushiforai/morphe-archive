package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ControllerPoseExtrapolationPatchTest {
    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerExtrapolationResource(CONTROLLER_EXTRAPOLATION_LIBRARY)

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-extrapolation-layer, NDK 28.2.13676358, arm64-v8a, Release.
        assertEquals(
            "ae75434d377afd8056f70ffd5bf28377ae4c3a8d6dbbca5adac2566ab7c9f092",
            MessageDigest.getInstance("SHA-256").digest(library).joinToString("") { "%02x".format(it) },
        )
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        assertTrue("com.android.xr.flags.enable_controller_pose_extrapolation_consumer_side" in text)
        // The pose filter: VRLink's controller pose action, its switch and its tuning.
        assertTrue("pamir-stream-pose" in text)
        assertTrue("debug.gxr.posefilter" in text)
        assertTrue("debug.gxr.posefilter.pos.cutoff" in text)
        assertTrue("debug.gxr.posefilter.pos.beta" in text)
        assertTrue("debug.gxr.posefilter.rot.cutoff" in text)
        assertTrue("debug.gxr.posefilter.rot.beta" in text)
        // Stands down while the controller HAL pose layer supplies the pose.
        assertTrue("gxr_controller_hal_pose_active" in text)
        assertTrue(CONTROLLER_HAL_POSE_LIBRARY in text)
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(controllerExtrapolationResource(CONTROLLER_EXTRAPOLATION_MANIFEST))
        val library = String(
            controllerExtrapolationResource(CONTROLLER_EXTRAPOLATION_LIBRARY),
            Charsets.ISO_8859_1,
        )

        assertTrue("\"library_path\": \"$CONTROLLER_EXTRAPOLATION_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_controller_extrapolation\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_CONTROLLER_EXTRAPOLATION\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_controller_extrapolation" in library)
    }

    @Test
    fun `patch is opt-in and covers the legacy and native bases`() {
        assertFalse(controllerPoseExtrapolationPatch.default)
        assertEquals("Controller pose extrapolation (experimental)", controllerPoseExtrapolationPatch.name)
        assertTrue(controllerPoseExtrapolationPatch.dependencies.isEmpty())

        val compatibilities = controllerPoseExtrapolationPatch.compatibility.orEmpty()
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
                assertTrue(isControllerExtrapolationBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.22" to "5002363", "2.0.23" to "5002322", "2.0.23" to "5002364", "2.0.20" to "5002244")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerExtrapolationBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
