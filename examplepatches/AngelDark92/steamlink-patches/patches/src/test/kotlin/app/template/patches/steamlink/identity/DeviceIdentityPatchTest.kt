package app.template.patches.steamlink.identity

import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import app.template.patches.steamlink.androidxr.adaptLegacyHmdConfigForBuild
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class DeviceIdentityPatchTest {
    private fun bundledIdentity(): ByteArray =
        (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/hmd_config.json")
            ?: error("Missing bundled identity"))
            .use { it.readBytes() }

    @Test
    fun `identity patch is legacy-only, recommended and has no headset selector`() {
        assertTrue(deviceIdentityPatch.options.isEmpty())
        assertTrue(deviceIdentityPatch.default)
        val targets = deviceIdentityPatch.compatibility.orEmpty().flatMap { compatibility ->
            assertEquals("Steam Link", compatibility.name)
            compatibility.targets.flatMap { target ->
                target.versionCodes.orEmpty().values.map { target.version to it }
            }
        }.toSet()
        assertEquals(
            setOf("2.0.20" to 5001712, "2.0.20" to 5001812, "2.0.21" to 5001968, "2.0.22" to 5002244),
            targets,
        )
        assertEquals(4, COMPATIBILITIES_STEAM_LINK_LEGACY.size)
        assertFalse(targets.any { it.second == 5002363 })
        assertFalse(targets.any { it.second == 5002395 })
    }

    @Test
    fun `bundled payload reports the Galaxy XR identity and keeps eye tracking`() {
        val text = bundledIdentity().decodeToString()
        assertTrue(text.contains("\"sModelNumber\": \"xrvst2ue\""))
        assertTrue(text.contains("\"sManufacturerName\": \"Samsung\""))
        assertTrue(text.contains("\"sDeviceType\": \"SamsungVST/VRLINKHMDGALAXYXR\""))
        assertTrue(text.contains("\"XR_EXT_eye_gaze_interaction\""))
        assertTrue(text.contains("\"requestedExtensions\": ["))
        assertTrue(text.contains("\"xrvst2\""))
        assertTrue(text.contains("\"xrvst2ue\""))
    }

    @Test
    fun `only 5001712 converts the requestedExtensions array to a keyed object`() {
        val payload = bundledIdentity()
        val text = payload.decodeToString()
        val legacy = adaptLegacyHmdConfigForBuild(payload, "2.0.20", "5001812")
        assertEquals(text, legacy.decodeToString())
        val converted = adaptLegacyHmdConfigForBuild(payload, "2.0.20", "5001712").decodeToString()
        assertTrue(converted.contains("\"requestedExtensions\": {"))
        assertTrue(converted.contains("\"xrvst2\":"))
        assertTrue(converted.contains("\"xrvst2ue\":"))
        assertTrue(converted.contains("\"unknown\":"))
    }
}
