package app.template.patches.steamlink.identity

import app.morphe.patcher.patch.PatchException
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class GalaxyXrVendorDriverPatchTest {
    private val legacyHmd =
        """
        {
          "requestedExtensions": [],
          "staticProps": {
            "xrvst2": {
              "sTrackingSystem": "SamsungVST",
              "sSerialNumber": "VRLINKHMDGALAXYXR",
              "sManufacturerName": "Samsung",
              "sModelNumber": "Oculus Quest Pro",
              "sRenderModelName": "generic_hmd",
              "sResourceRoot": "vrlink",
              "sInputProfilePath": "{vrlink}/input/galaxy_xr_hmd_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "galaxy_xr_hmd",
              "sDeviceType": "SamsungVST/VRLINKHMDGALAXYXR"
            },
            "unknown": {
              "sTrackingSystem": "SamsungVST",
              "sSerialNumber": "VRLINKHMDGALAXYXR",
              "sManufacturerName": "Samsung",
              "sModelNumber": "Oculus Quest Pro",
              "sRenderModelName": "generic_hmd",
              "sResourceRoot": "vrlink",
              "sInputProfilePath": "{vrlink}/input/galaxy_xr_hmd_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "galaxy_xr_hmd",
              "sDeviceType": "SamsungVST/VRLINKHMDGALAXYXR"
            }
          },
          "input": { "eyeTracking": { "bindings": {} } }
        }
        """.trimIndent().replace("\n", "\r\n")

    private val nativeHmd =
        """
        {
          "requestedExtensions": ["XR_EXT_eye_gaze_interaction"],
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
            "xrvst2ue": {
              "sTrackingSystem": "androidxr",
              "sSerialNumber": "VRLINKHMDGALAXYXR",
              "sManufacturerName": "Samsung",
              "sModelNumber": "Galaxy XR",
              "sRenderModelName": "{galaxyxrresources}/rendermodels/galaxy_xr_hmd",
              "sResourceRoot": "galaxyxrresources",
              "sInputProfilePath": "{galaxyxrresources}/input/galaxy_xr_hmd_profile.json",
              "flLaserMouseHmdAngleDegrees": 0,
              "sControllerType": "galaxy_xr_hmd",
              "sDeviceType": "androidxr/VRLINKHMDGALAXYXR"
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
          "headOffsets": { "PICO 4 Pro": [-0.0517, -0.0002, 0.0495] }
        }
        """.trimIndent()

    private val controllers =
        """
        {
          "requestedExtensions": ["XR_FB_touch_controller_pro"],
          "staticProps": {
            "/interaction_profiles/oculus/touch_controller": {
              "left": {
                "sTrackingSystem": "oculus",
                "sSerialNumber": "VRLINKQ2_Controller_Left",
                "sManufacturerName": "Oculus",
                "sModelNumber": "Oculus Quest2 (Left Controller)",
                "sRenderModelName": "oculus_quest2_controller_left",
                "sResourceRoot": "vrlink",
                "sInputProfilePath": "{oculus}/input/touch_profile.json",
                "flLaserMouseHmdAngleDegrees": 0,
                "sControllerType": "oculus_touch",
                "sDeviceType": "oculus/VRLINKQ2_Controller_Left",
                "ubDriverType": 0
              },
              "right": {
                "sTrackingSystem": "oculus",
                "sSerialNumber": "VRLINKQ2_Controller_Right",
                "sManufacturerName": "Oculus",
                "sModelNumber": "Oculus Quest2 (Right Controller)",
                "sRenderModelName": "oculus_quest2_controller_right",
                "sResourceRoot": "vrlink",
                "sInputProfilePath": "{oculus}/input/touch_profile.json",
                "flLaserMouseHmdAngleDegrees": 0,
                "sControllerType": "oculus_touch",
                "sDeviceType": "oculus/VRLINKQ2_Controller_Right",
                "ubDriverType": 0
              }
            },
            "/interaction_profiles/ext/hand_interaction_ext": {
              "left": { "sModelNumber": "VRLink Hand Tracker (Left Hand)", "sRenderModelName": "shuttlecock" }
            }
          },
          "poseAction": {
            "/interaction_profiles/oculus/touch_controller": {
              "bindings": ["/user/hand/left/input/grip/pose", "/user/hand/right/input/grip/pose"],
              "offset": {
                "position": { "x": -0.007, "y": -0.03416, "z": -0.09607 },
                "rotation": { "x": -20.6, "y": 0.0, "z": 0.0 }
              }
            },
            "/interaction_profiles/bytedance/pico4_controller": {
              "offset": {
                "position": { "x": -0.007, "y": -0.0512, "z": -0.09607 },
                "rotation": { "x": -10.0, "y": 0.0, "z": 0.0 }
              }
            }
          },
          "hapticAction": {}
        }
        """.trimIndent()

    private fun field(json: String, entryKey: String, member: String): String {
        val entry = Regex("(?s)\\\"${Regex.escape(entryKey)}\\\"\\s*:\\s*\\{(.*?)\\n\\s{4,6}\\}").find(json)!!.groups[1]!!.value
        return Regex("\\\"${Regex.escape(member)}\\\"\\s*:\\s*\\\"([^\\\"]*)\\\"").find(entry)!!.groups[1]!!.value
    }

    @Test
    fun `legacy HMD payload gets the galaxyxr identity in every selected entry and keeps CRLF`() {
        val out = patchHmdConfigForVendorDriver(legacyHmd)
        assertTrue(out.contains("\r\n") && !out.replace("\r\n", "").contains("\n"))
        for (key in listOf("xrvst2", "unknown")) {
            assertEquals("Galaxy XR", field(out, key, "sModelNumber"))
            assertEquals("galaxyxr", field(out, key, "sResourceRoot"))
            assertEquals("{galaxyxr}/input/galaxy_xr_hmd_profile.json", field(out, key, "sInputProfilePath"))
            assertEquals("SamsungVST", field(out, key, "sTrackingSystem"))
            assertEquals("SamsungVST/VRLINKHMDGALAXYXR", field(out, key, "sDeviceType"))
        }
        // untouched bytes
        assertTrue(out.contains("\"flLaserMouseHmdAngleDegrees\": 0,"))
        assertTrue(out.contains("\"input\": { \"eyeTracking\""))
        assertEquals(out, patchHmdConfigForVendorDriver(out))
    }

    @Test
    fun `native HMD payload rewrites only Galaxy entries and leaves other products alone`() {
        val out = patchHmdConfigForVendorDriver(nativeHmd)
        assertEquals("generic_hmd", field(out, "xrvst2ue", "sRenderModelName"))
        assertEquals("galaxyxr", field(out, "xrvst2ue", "sResourceRoot"))
        assertEquals("Galaxy XR", field(out, "unknown", "sModelNumber"))
        assertEquals("SamsungVST", field(out, "unknown", "sTrackingSystem"))
        assertEquals("Oculus Quest2", field(out, "hollywood", "sModelNumber"))
        assertEquals("{oculus}/input/rift_profile.json", field(out, "hollywood", "sInputProfilePath"))
        assertTrue(out.contains("\"headOffsets\": { \"PICO 4 Pro\": [-0.0517, -0.0002, 0.0495] }"))
        assertEquals(out, patchHmdConfigForVendorDriver(out))
    }

    @Test
    fun `controller payload gets Samsung identities with vrlink hand suffixes and the offset`() {
        val out = patchControllerConfigForVendorDriver(
            controllers,
            parseTriple(DEFAULT_OFFSET_POSITION_CM, "p"),
            parseTriple(DEFAULT_OFFSET_ROTATION_DEG, "r"),
        )
        assertEquals("Galaxy XR (Left Controller)", field(out, "left", "sModelNumber"))
        assertEquals("Galaxy XR (Right Controller)", field(out, "right", "sModelNumber"))
        assertEquals("{galaxyxr}/rendermodels/vst_controller_left", field(out, "left", "sRenderModelName"))
        assertEquals("{galaxyxr}/rendermodels/vst_controller_right", field(out, "right", "sRenderModelName"))
        assertEquals("{galaxyxr}/input/samsung_input_profile.json", field(out, "left", "sInputProfilePath"))
        assertEquals("oculus_touch", field(out, "left", "sControllerType"))
        assertEquals("SamsungVST-Controller_Right", field(out, "right", "sSerialNumber"))
        assertTrue(out.contains("\"position\": { \"x\": -0.007, \"y\": 0.00279, \"z\": -0.05279 }"), out)
        assertTrue(out.contains("\"rotation\": { \"x\": 1.4, \"y\": 0.0, \"z\": 0.0 }"), out)
        // other profiles untouched
        assertTrue(out.contains("\"position\": { \"x\": -0.007, \"y\": -0.0512, \"z\": -0.09607 }"))
        assertTrue(out.contains("\"sModelNumber\": \"VRLink Hand Tracker (Left Hand)\""))
        assertTrue(out.contains("\"ubDriverType\": 0"))
        assertEquals(out, patchControllerConfigForVendorDriver(out, parseTriple(DEFAULT_OFFSET_POSITION_CM, "p"), parseTriple(DEFAULT_OFFSET_ROTATION_DEG, "r")))
    }

    @Test
    fun `custom offsets are written in metres and degrees`() {
        val out = patchControllerConfigForVendorDriver(controllers, doubleArrayOf(0.5, -1.5, 0.5), doubleArrayOf(2.0, -5.0, -9.0))
        assertTrue(out.contains("\"position\": { \"x\": 0.005, \"y\": -0.015, \"z\": 0.005 }"), out)
        assertTrue(out.contains("\"rotation\": { \"x\": 2.0, \"y\": -5.0, \"z\": -9.0 }"), out)
    }

    @Test
    fun `malformed inputs are rejected`() {
        assertFailsWith<PatchException> { patchHmdConfigForVendorDriver(legacyHmd.replace("\"unknown\"", "\"other\"")) }
        assertFailsWith<PatchException> { patchHmdConfigForVendorDriver(legacyHmd.replace("\"xrvst2\": {", "\"xrvst2\": {\"sModelNumber\": \"dup\", \"xrvst2\": {")) }
        assertFailsWith<PatchException> {
            patchControllerConfigForVendorDriver(controllers.replace("\"poseAction\"", "\"poseActions\""), DoubleArray(3), DoubleArray(3))
        }
        assertFailsWith<PatchException> { parseTriple("1,2", "x") }
        assertFailsWith<PatchException> { parseTriple("1,2,abc", "x") }
        assertFailsWith<PatchException> { formatNumber(Double.NaN) }
    }

    @Test
    fun `patch metadata`() {
        assertEquals("Galaxy XR SteamVR driver (galaxyxr)", galaxyXrVendorDriverPatch.name)
        assertEquals(false, galaxyXrVendorDriverPatch.default)
        assertEquals(DEFAULT_OFFSET_POSITION_CM, galaxyXrVendorDriverPatch.options["offsetPositionCm"].default)
        assertEquals(DEFAULT_OFFSET_ROTATION_DEG, galaxyXrVendorDriverPatch.options["offsetRotationDeg"].default)
        assertTrue(deviceIdentityPatch in galaxyXrVendorDriverPatch.dependencies)
        val targets = galaxyXrVendorDriverPatch.compatibility.orEmpty().flatMap { it.targets }
        assertEquals(
            setOf(
                "2.0.20:5001712", "2.0.20:5001812", "2.0.21:5001968",
                "2.0.22:5002244", "2.0.23:5002363", "2.0.24:5002395",
            ),
            targets.flatMap { t -> t.versionCodes!!.values.map { "${t.version}:$it" } }.toSet(),
        )
    }
}
