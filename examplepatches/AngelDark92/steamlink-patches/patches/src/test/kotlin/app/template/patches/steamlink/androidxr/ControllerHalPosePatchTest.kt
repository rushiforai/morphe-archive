package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.security.MessageDigest
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class ControllerHalPosePatchTest {
    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_LIBRARY")

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-hal-pose, NDK 28.2.13676358, arm64-v8a, Release.
        assertEquals("5ab5453536a08a04509e404f5d73afa436c1056404d938198f5562218df00e87", sha256(library))
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        // Called by the bridge class in the extension, and the interface of its user service.
        assertTrue("Java_gxr_pose_PoseBridge_nativeSetBinder" in text)
        assertTrue("gxr.pose.IPoseService" in text)
        assertTrue("pamir-stream-pose" in text)
        // Asked by the pose filter of the extrapolation layer and by the velocity frame layer.
        assertTrue("gxr_controller_hal_pose_active" in text)
        assertTrue("gxr_controller_hal_velocity_active" in text)
        assertTrue("debug.gxr.halpose.velocity" in text)
        assertTrue("debug.gxr.halpose" in text)
        assertTrue("debug.gxr.halpose.ahead" in text)
        assertTrue("debug.gxr.halpose.pitch" in text)
        assertTrue("debug.gxr.halpose.hz" in text)
        assertTrue("debug.gxr.halpose.lead" in text)
        assertTrue("debug.gxr.halpose.velocity_sync" in text)
        assertTrue("debug.gxr.halpose.angular" in text)
        // The smoothing was taken out: no filter properties any more.
        assertFalse("debug.gxr.halpose.filter" in text)
        assertFalse("debug.gxr.halpose.pos.cutoff" in text)
        // The bundled library reports the angular velocity local until a patch says otherwise.
        assertFalse(library.angularVelocityWorld(CONTROLLER_HAL_POSE_CONFIG_MAGIC))
    }

    @Test
    fun `each patch writes its base's angular velocity frame and nothing else`() {
        val bundled = controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_LIBRARY")
        val local = controllerHalPoseLibrary(angularWorld = false)
        val world = controllerHalPoseLibrary(angularWorld = true)

        assertContentEquals(bundled, local)
        assertFalse(local.angularVelocityWorld(CONTROLLER_HAL_POSE_CONFIG_MAGIC))
        assertTrue(world.angularVelocityWorld(CONTROLLER_HAL_POSE_CONFIG_MAGIC))
        assertEquals(bundled.size, world.size)
        assertEquals(1, bundled.indices.count { bundled[it] != world[it] })
        // Setting it again changes nothing.
        assertContentEquals(world, world.withAngularVelocityFrame(CONTROLLER_HAL_POSE_CONFIG_MAGIC, true))
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_MANIFEST"))
        val library = String(
            controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_LIBRARY"),
            Charsets.ISO_8859_1,
        )

        assertTrue("\"library_path\": \"$CONTROLLER_HAL_POSE_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_controller_hal_pose\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_CONTROLLER_HAL_POSE\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_controller_hal_pose" in library)
    }

    @Test
    fun `extension adds only the pose classes`() {
        val extension = controllerHalPoseResource(CONTROLLER_HAL_POSE_EXTENSION)
        // extensions/controller-hal-pose/java, d8 --min-api 29.
        assertEquals("7ebf2aacc5399080157621c7e44ff07503726fac43e0501f7f5c663878e3ca73", sha256(extension))

        val types = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), extension.inputStream().buffered())
            .classes
            .map { it.type }
        assertEquals(setOf("Lgxr/pose/PoseBridge;", "Lgxr/pose/PoseService;"), types.toSet())
    }

    @Test
    fun `layer does not share files with the other controller layers`() {
        assertFalse(CONTROLLER_HAL_POSE_LIBRARY == CONTROLLER_EXTRAPOLATION_LIBRARY)
        assertFalse(CONTROLLER_HAL_POSE_MANIFEST == CONTROLLER_EXTRAPOLATION_MANIFEST)
        assertFalse(CONTROLLER_HAL_POSE_LIBRARY == CONTROLLER_VELOCITY_FRAME_LIBRARY)
        assertFalse(CONTROLLER_HAL_POSE_MANIFEST == CONTROLLER_VELOCITY_FRAME_MANIFEST)
        assertFalse(CONTROLLER_HAL_POSE_EXTENSION == SHIZUKU_BRIDGE_EXTENSION)
    }

    @Test
    fun `patches are opt-in, experimental, name Shizuku and split the bases`() {
        assertEquals(
            "Controller tracking from the controller HAL through Shizuku (experimental)",
            controllerHalPosePatch.name,
        )
        assertEquals(
            "Controller tracking from the controller HAL through Shizuku, 2.0.20 - 2.0.22 (experimental)",
            controllerHalPoseLegacyPatch.name,
        )
        mapOf(
            controllerHalPosePatch to setOf(5002363),
            controllerHalPoseLegacyPatch to setOf(5001712, 5001812, 5001968, 5002244),
        ).forEach { (patch, versionCodes) ->
            assertFalse(patch.default, patch.name)
            assertTrue("needs Shizuku" in patch.description.orEmpty(), patch.name)
            val compatibilities = patch.compatibility.orEmpty()
            assertTrue(compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME }, patch.name)
            assertEquals(
                versionCodes,
                compatibilities.flatMap { it.targets }.flatMap { it.versionCodes!!.values }.toSet(),
                patch.name,
            )
        }
        assertTrue("local to the grip pose" in controllerHalPosePatch.description.orEmpty())
        assertTrue("in the base space" in controllerHalPoseLegacyPatch.description.orEmpty())

        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244",
            "2.0.23" to "5002363")
            .forEach { (version, versionCode) ->
                assertTrue(isControllerHalPoseBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.23" to "5002364", "2.0.19" to "5001712", "2.0.24" to "5002363")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerHalPoseBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
