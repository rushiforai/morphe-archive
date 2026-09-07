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
    fun `native spoof upserts exact product entries and preserves unrelated bytes`() {
        val patched = patchHmdModelIdentity(stockNativeXr, "meta-quest-pro", exactProductLookup = true)
        val oldUnknown = identityEntry(stockNativeXr, "unknown")
        val expectedEntry = oldUnknown.replace("oculus_quest_hmd", "Oculus Quest Pro")
        listOf("unknown", "xrvst2ue", "xrvst2").forEach { key ->
            assertEquals(expectedEntry, identityEntry(patched, key))
        }
        assertEquals(
            stockNativeXr.replace(oldUnknown, expectedEntry),
            removeInsertedProducts(patched),
        )
        assertEquals(patched, patchHmdModelIdentity(patched, "meta-quest-pro", exactProductLookup = true))
        val pico = patchHmdModelIdentity(patched, "pico-4-pro", exactProductLookup = true)
        assertEquals(patched.replace("Oculus Quest Pro", "PICO 4 Pro"), pico)
        assertEquals(pico, patchHmdModelIdentity(pico, "pico-4-pro", exactProductLookup = true))
        assertEquals(patched, patchHmdModelIdentity(pico, "meta-quest-pro", exactProductLookup = true))
    }

    private fun identityEntry(json: String, key: String): String {
        val match = Regex("\"$key\"\\s*:\\s*\\{").find(json) ?: error("missing $key")
        val start = match.range.last
        var depth = 0
        var quoted = false
        var escaped = false
        for (index in start until json.length) {
            val character = json[index]
            if (quoted) {
                when {
                    escaped -> escaped = false
                    character == '\\' -> escaped = true
                    character == '"' -> quoted = false
                }
            } else {
                when (character) {
                    '"' -> quoted = true
                    '{' -> depth++
                    '}' -> if (--depth == 0) return json.substring(start, index + 1)
                }
            }
        }
        error("unterminated $key")
    }

    private fun removeInsertedProducts(json: String): String =
        listOf("xrvst2ue", "xrvst2").fold(json) { current, key ->
            val prefix = Regex("\\r?\\n[ \\t]*\"$key\"\\s*:\\s*").find(current) ?: error("missing $key")
            val end = prefix.range.last + 1 + identityEntry(current, key).length
            assertEquals(',', current[end])
            current.removeRange(prefix.range.first, end + 1)
        }

    @Test
    fun `existing exact product keeps its custom fields when other product is absent`() {
        val existing = "\"xrvst2ue\": {\"sModelNumber\": \"Galaxy XR\", \"keep\": 42},"
        val input = stockNativeXr.replace("\"staticProps\": {", "\"staticProps\": {\n    $existing")
        val patched = patchHmdModelIdentity(input, "meta-quest-pro", exactProductLookup = true)
        assertEquals(
            "{\"sModelNumber\": \"Oculus Quest Pro\", \"keep\": 42}",
            identityEntry(patched, "xrvst2ue"),
        )
        assertEquals(identityEntry(patched, "unknown"), identityEntry(patched, "xrvst2"))
        assertEquals(patched, patchHmdModelIdentity(patched, "meta-quest-pro", exactProductLookup = true))
    }

    @Test
    fun `captured native fallback-only spoof gains exact product keys without unrelated edits`() {
        val actual = requireNotNull(javaClass.getResource("/steamlink/identity/installed-5002322-hmd-config.json"))
            .readText()
        val patched = patchHmdModelIdentity(actual, "meta-quest-pro", exactProductLookup = true)
        assertEquals(actual, removeInsertedProducts(patched))
        listOf("xrvst2ue", "xrvst2").forEach { key ->
            assertEquals(identityEntry(actual, "unknown"), identityEntry(patched, key))
        }
        assertEquals(patched, patchHmdModelIdentity(patched, "meta-quest-pro", exactProductLookup = true))
    }

    @Test
    fun `native spoof rejects duplicate and malformed targets before returning output`() {
        listOf(
            "\"xrvst2ue\": {}, \"xrvst2ue\": {}",
            "\"xrvst2ue\": 42",
            "\"xrvst2ue\": {\"sModelNumber\": 42}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\", \"sModelNumber\": \"second\"}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\" garbage}",
            "\"xrvst2ue\": {\"nested\": {\"sModelNumber\": \"first\"}}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\", \"broken\": [}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\", \"broken\": true,}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\", \"broken\": 01}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\", \"broken\": \"\\q\"}",
            "\"\\u0078rvst2ue\": {\"sModelNumber\": \"first\"}",
            "\"xrvst2ue\": {\"sModelNumber\": \"first\"}, \"\\u0078rvst2ue\": {}",
        ).forEach { broken ->
            val input = stockNativeXr.replace("\"staticProps\": {", "\"staticProps\": {$broken,")
            assertFailsWith<PatchException>(broken) { patchHmdModelIdentity(input, "meta-quest-pro", exactProductLookup = true) }
        }
    }

    @Test
    fun `native spoof preserves valid nested template data and CRLF formatting`() {
        val input = stockNativeXr.replace(
            "\"sModelNumber\": \"oculus_quest_hmd\"",
            "\"sModelNumber\": \"oculus_quest_hmd\", \"extra\": [null, true, false, -1.2e+3, {\"keep\": \"\\u0061\"}]",
        ).replace("\n", "\r\n")
        val patched = patchHmdModelIdentity(input, "meta-quest-pro", exactProductLookup = true)
        assertEquals(input.replace("oculus_quest_hmd", "Oculus Quest Pro"), removeInsertedProducts(patched))
        assertEquals(identityEntry(patched, "unknown"), identityEntry(patched, "xrvst2ue"))
        assertEquals(patched, patchHmdModelIdentity(patched, "meta-quest-pro", exactProductLookup = true))
    }

    @Test
    fun `older native builds retain fallback-only spoof output byte for byte`() {
        listOf("meta-quest-pro" to "Oculus Quest Pro", "pico-4-pro" to "PICO 4 Pro").forEach { (profile, model) ->
            val expected = stockNativeXr.replace("oculus_quest_hmd", model)
            assertEquals(expected, patchHmdModelIdentity(stockNativeXr, profile))
            assertEquals(expected, patchHmdModelIdentity(stockNativeXr, profile, exactProductLookup = false))
        }
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
