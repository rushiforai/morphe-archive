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

class ControllerGripHapticsPatchTest {
    private fun sha256(bytes: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

    @Test
    fun `bundled layer is the build from the extension source`() {
        val library = controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY")

        assertContentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46), library.copyOfRange(0, 4))
        // extensions/controller-grip-haptics, NDK 28.2.13676358, arm64-v8a, Release.
        assertEquals("8204dbd693df9f0f46e799352d40fb72adacb6a9a3a307fe7e730aa1773895e3", sha256(library))
        val text = String(library, Charsets.ISO_8859_1)
        assertTrue("xrNegotiateLoaderApiLayerInterface" in text)
        // Called by the bridge class in the extension, and the interface of its user service.
        assertTrue("Java_gxr_haptic_HapticBridge_nativeSetBinder" in text)
        assertTrue("gxr.haptic.IHapticService" in text)
        assertTrue("debug.gxr.haptic" in text)
        assertTrue("debug.gxr.haptic.min" in text)
        assertTrue("debug.gxr.haptic.pcm" in text)
        assertTrue("debug.gxr.haptic.chunkms" in text)
        assertTrue("debug.gxr.haptic.gamma" in text)
        assertTrue("debug.gxr.haptic.max" in text)
        assertTrue("debug.gxr.haptic.freq" in text)
        assertTrue("debug.gxr.haptic.minms" in text)
        assertTrue("debug.gxr.haptic.streamms" in text)
    }

    @Test
    fun `manifest names the bundled library and its layer`() {
        val manifest = String(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_MANIFEST"),
        )
        val library = String(
            controllerGripHapticsResource("steamlink/androidxr/$CONTROLLER_GRIP_HAPTICS_LIBRARY"),
            Charsets.ISO_8859_1,
        )

        assertTrue("\"library_path\": \"$CONTROLLER_GRIP_HAPTICS_LIBRARY\"" in manifest)
        assertTrue("\"name\": \"XR_APILAYER_local_GalaxyXR_haptic_main\"" in manifest)
        assertTrue("\"disable_environment\": \"GXR_DISABLE_HAPTIC_MAIN\"" in manifest)
        // The layer rejects negotiation under any other name.
        assertTrue("XR_APILAYER_local_GalaxyXR_haptic_main" in library)
    }

    @Test
    fun `extension adds only the haptic classes`() {
        val extension = controllerGripHapticsResource(CONTROLLER_GRIP_HAPTICS_EXTENSION)
        // extensions/controller-grip-haptics/java, d8 --min-api 29.
        assertEquals("047fa4c406ceca691bab4e0632cfae7cd7fc7290287be8b2a8c5f883df707373", sha256(extension))

        val types = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), extension.inputStream().buffered())
            .classes
            .map { it.type }
        assertEquals(setOf("Lgxr/haptic/HapticBridge;", "Lgxr/haptic/HapticService;"), types.toSet())
    }

    @Test
    fun `layer does not share files with the other controller layers`() {
        assertFalse(CONTROLLER_GRIP_HAPTICS_LIBRARY == CONTROLLER_EXTRAPOLATION_LIBRARY)
        assertFalse(CONTROLLER_GRIP_HAPTICS_MANIFEST == CONTROLLER_EXTRAPOLATION_MANIFEST)
        assertFalse(CONTROLLER_GRIP_HAPTICS_LIBRARY == CONTROLLER_VELOCITY_FRAME_LIBRARY)
        assertFalse(CONTROLLER_GRIP_HAPTICS_MANIFEST == CONTROLLER_VELOCITY_FRAME_MANIFEST)
        assertFalse(CONTROLLER_GRIP_HAPTICS_LIBRARY == CONTROLLER_HAL_POSE_LIBRARY)
        assertFalse(CONTROLLER_GRIP_HAPTICS_MANIFEST == CONTROLLER_HAL_POSE_MANIFEST)
        assertFalse(CONTROLLER_GRIP_HAPTICS_EXTENSION == CONTROLLER_HAL_POSE_EXTENSION)
        assertFalse(CONTROLLER_GRIP_HAPTICS_EXTENSION == SHIZUKU_BRIDGE_EXTENSION)
    }

    @Test
    fun `patch is opt-in and covers the legacy and native bases`() {
        assertFalse(controllerGripHapticsPatch.default)
        assertEquals("Controller grip haptics through Shizuku (experimental)", controllerGripHapticsPatch.name)

        val compatibilities = controllerGripHapticsPatch.compatibility.orEmpty()
        assertTrue(compatibilities.all { it.name == EXPERIMENTAL_COMPATIBILITY_NAME })
        assertEquals(
            setOf(5001712, 5001812, 5001968, 5002244, 5002363),
            compatibilities.flatMap { it.targets }.flatMap { it.versionCodes!!.values }.toSet(),
        )

        listOf("2.0.20" to "5001712", "2.0.20" to "5001812", "2.0.21" to "5001968", "2.0.22" to "5002244",
            "2.0.23" to "5002363")
            .forEach { (version, versionCode) ->
                assertTrue(isControllerGripHapticsBuild(version, versionCode), "$version/$versionCode")
            }
        listOf("2.0.23" to "5002364", "2.0.19" to "5001712", "2.0.24" to "5002363")
            .forEach { (version, versionCode) ->
                assertFalse(isControllerGripHapticsBuild(version, versionCode), "$version/$versionCode")
            }
    }
}
