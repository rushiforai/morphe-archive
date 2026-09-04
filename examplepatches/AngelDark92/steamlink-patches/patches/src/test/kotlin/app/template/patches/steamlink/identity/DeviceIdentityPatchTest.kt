package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class DeviceIdentityPatchTest {
    @Test
    fun `recommended identity uses Quest Pro only on exact legacy bundle targets`() {
        assertEquals("recommended", deviceIdentityPatch.options["profile"].default)
        listOf(
            "2.0.20" to "5001712",
            "2.0.20" to "5001740",
            "2.0.22" to "5002172",
            "2.0.22" to "5002206",
            "2.0.22" to "5002244",
        ).forEach { (version, code) ->
            assertEquals("meta-quest-pro", resolveDeviceIdentityProfile("recommended", version, code))
        }
        listOf(
            "2.0.22" to "5002318",
            "2.0.22" to "5002322",
            "2.0.22" to "5002313",
            "2.0.22" to "5002296",
            "2.0.22" to "5001712",
            "2.0.20" to "5002244",
            "2.0.22" to "5002243",
        ).forEach { (version, code) ->
            assertEquals("samsung-galaxy-xr", resolveDeviceIdentityProfile("recommended", version, code))
        }
        // Resolving a legacy default cannot leak option state into the next native APK.
        assertEquals("recommended", deviceIdentityPatch.options["profile"].default)
    }

    @Test
    fun `explicit identity choices override automatic defaults without mutation`() {
        listOf("samsung-galaxy-xr", "meta-quest-pro", "pico-4-pro", "stock-no-change").forEach { profile ->
            listOf("2.0.20" to "5001712", "2.0.22" to "5002244", "2.0.22" to "5002318")
                .forEach { (version, code) ->
                    assertEquals(profile, resolveDeviceIdentityProfile(profile, version, code))
                }
        }
    }

    private val stockNativeXr =
        """
        {
          "requestedExtensions": ["XR_EXT_eye_gaze_interaction", "XR_PICO_eye_tracking"],
          "staticProps": {
            "hollywood": {
              "sTrackingSystem": "oculus",
              "sSerialNumber": "VRLINKHMDQUEST2",
              "sManufacturerName": "Oculus",
              "sModelNumber": "Oculus Quest2",
              "sRenderModelName": "generic_hmd",
              "sResourceRoot": "vrlink",
              "sInputProfilePath": "{oculus}/input/rift_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "rift",
              "sDeviceType": "oculus/VRLINKHMDQUEST2"
            },
            "Project Swan": {
              "sTrackingSystem": "pico",
              "sSerialNumber": "VRLINKHMDPICO4ULTRA",
              "sManufacturerName": "Pico",
              "sModelNumber": "PICO 4 Ultra",
              "sRenderModelName": "generic_hmd",
              "sResourceRoot": "vrlink",
              "sInputProfilePath": "{oculus}/input/rift_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "pico",
              "sDeviceType": "pico/VRLINKHMDPICO4ULTRA"
            },
            "unknown": {
              "sTrackingSystem": "oculus",
              "sSerialNumber": "VRLINKHMDUNKNOWN",
              "sManufacturerName": "Oculus",
              "sModelNumber": "oculus_quest_hmd",
              "sRenderModelName": "generic_hmd",
              "sResourceRoot": "vrlink",
              "sInputProfilePath": "{oculus}/input/rift_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "rift",
              "sDeviceType": "oculus/VRLINKHMDUNKNOWN"
            }
          },
          "headOffsets": {
            "PICO 4 Ultra": [-0.050711045, -0.018201836, 0.051669556]
          },
          "input": {
            "eyeTracking": {
              "bindings": {
                "/interaction_profiles/ext/eye_gaze_interaction": [
                  "/user/eyes_ext/input/gaze_ext/pose"
                ]
              }
            }
          }
        }
        """.trimIndent()

    private val galaxyFields = listOf(
        "\"sTrackingSystem\": \"androidxr\"",
        "\"sSerialNumber\": \"VRLINKHMDGALAXYXR\"",
        "\"sManufacturerName\": \"Samsung\"",
        "\"sModelNumber\": \"Galaxy XR\"",
        "\"sRenderModelName\": \"{galaxyxrresources}/rendermodels/galaxy_xr_hmd\"",
        "\"sResourceRoot\": \"galaxyxrresources\"",
        "\"sInputProfilePath\": \"{galaxyxrresources}/input/galaxy_xr_hmd_profile.json\"",
        "\"flLaserMouseHmdAngleDegrees\": 0",
        "\"sControllerType\": \"galaxy_xr_hmd\"",
        "\"sDeviceType\": \"androidxr/VRLINKHMDGALAXYXR\"",
    )

    @Test
    fun `native Galaxy identity upserts all transport entries and preserves unrelated config`() {
        val patched = patchHmdModelIdentity(stockNativeXr, "samsung-galaxy-xr")

        listOf("xrvst2", "xrvst2ue", "unknown").forEach { key ->
            val entry = Regex(
                "(?s)\\\"${Regex.escape(key)}\\\"\\s*:\\s*\\{(.*?)\\n    \\}",
            ).find(patched)?.value ?: error("missing $key")
            galaxyFields.forEach { field -> assertTrue(entry.contains(field), "$key missing $field") }
        }
        assertEquals(3, Regex("\"sSerialNumber\": \"VRLINKHMDGALAXYXR\"").findAll(patched).count())
        assertTrue(patched.contains("\"XR_PICO_eye_tracking\""))
        assertTrue(patched.contains("\"Project Swan\""))
        assertTrue(patched.contains("-0.050711045"))
        assertTrue(patched.contains("/user/eyes_ext/input/gaze_ext/pose"))
        assertEquals(patched, patchHmdModelIdentity(patched, "samsung-galaxy-xr"))
    }

    @Test
    fun `native identity changes only fallback model and preserves native profiles`() {
        val patched = patchHmdModelIdentity(stockNativeXr, "meta-quest-pro")
        val expected = stockNativeXr.replaceFirst(
            "\"sModelNumber\": \"oculus_quest_hmd\"",
            "\"sModelNumber\": \"Oculus Quest Pro\"",
        )

        assertEquals(expected, patched)
        assertTrue(patched.contains("\"XR_PICO_eye_tracking\""))
        assertEquals(
            stockNativeXr.substringBefore("\"unknown\""),
            patched.substringBefore("\"unknown\""),
        )
    }

    @Test
    fun `legacy identity keeps routing fields while updating all Galaxy XR models`() {
        val legacy = requireNotNull(
            javaClass.getResource("/steamlink/androidxr/hmd_config.json"),
        ).readText()
        val patched = patchHmdModelIdentity(legacy, "meta-quest-pro")

        assertEquals(3, Regex("\"sModelNumber\": \"Oculus Quest Pro\"").findAll(patched).count())
        assertEquals(3, Regex("\"sTrackingSystem\": \"SamsungVST\"").findAll(patched).count())
        assertEquals(3, Regex("\"sControllerType\": \"galaxy_xr_hmd\"").findAll(patched).count())
    }

    @Test
    fun `stock identity is byte identical and malformed layouts fail atomically`() {
        assertEquals(stockNativeXr, patchHmdModelIdentity(stockNativeXr, "stock-no-change"))
        assertFailsWith<PatchException> { patchHmdModelIdentity(stockNativeXr, "invalid") }
        assertFailsWith<PatchException> {
            patchHmdModelIdentity(
                stockNativeXr.replace(
                    "\"unknown\": {",
                    "\"unknown\": {},\n    \"unknown\": {",
                ),
                "samsung-galaxy-xr",
            )
        }
    }
}
