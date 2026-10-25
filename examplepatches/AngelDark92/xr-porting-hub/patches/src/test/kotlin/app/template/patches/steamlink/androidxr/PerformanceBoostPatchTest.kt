package app.template.patches.steamlink.androidxr

import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import com.google.gson.JsonParser
import org.junit.Assert.*
import org.junit.Test

class PerformanceBoostPatchTest {
    @Test fun experimentalScopeCoversEverySupportedBase() {
        val experimental = setOf(
            "2.0.20" to 5001712, "2.0.20" to 5001812,
            "2.0.21" to 5001968, "2.0.22" to 5002244, "2.0.23" to 5002363,
            "2.0.24" to 5002395,
        )
        assertEquals("OpenXR CPU and GPU BOOST (experimental)", performanceBoostPatch.name)
        assertFalse(performanceBoostPatch.default)
        assertEquals("App & device identity", performanceBoostPatch.category)
        assertTrue(performanceBoostPatch.dependencies.isEmpty())
        val actual = performanceBoostPatch.compatibility!!.flatMap { compatibility ->
            assertEquals("com.valvesoftware.steamlinkvr", compatibility.packageName)
            assertEquals(EXPERIMENTAL_COMPATIBILITY_NAME, compatibility.name)
            compatibility.targets.flatMap { target ->
                target.versionCodes!!.values.map { target.version to it }
            }
        }.toSet()
        assertEquals(experimental, actual)
        experimental.forEach { (version, code) ->
            assertTrue(isPerformanceBoostTarget("com.valvesoftware.steamlinkvr", version, code.toString()))
            assertFalse(isPerformanceBoostTarget("cn.vr4p.oculus4xvrplayerov", version, code.toString()))
        }
        listOf(
            "2.0.22" to "5002322",
            "2.0.23" to "5002322",
            "2.0.23" to "5002364",
            "2.0.20" to "5001740",
            "2.0.22" to "5002363",
            "2.0.20" to "5002363",
        ).forEach { (version, code) ->
            assertFalse(isPerformanceBoostTarget("com.valvesoftware.steamlinkvr", version, code))
        }
    }

    @Test fun packagedLayerHasArm64EntryPointAndMatchingManifest() {
        val bytes = performanceBoostResource(PERFORMANCE_BOOST_LIBRARY)
        assertTrue(bytes.size > 1000)
        assertArrayEquals(byteArrayOf(0x7f, 69, 76, 70, 2, 1), bytes.copyOfRange(0, 6))
        assertEquals(0xb7, bytes[18].toInt() and 255)
        val strings = bytes.toString(Charsets.ISO_8859_1)
        listOf("xrNegotiateLoaderApiLayerInterface", "XR_EXT_performance_settings",
            "xrPerfSettingsSetPerformanceLevelEXT", "GxrPerformanceBoost").forEach {
            assertTrue("Missing native contract: $it", strings.contains(it))
        }
        val manifest = JsonParser.parseString(performanceBoostResource(PERFORMANCE_BOOST_MANIFEST).decodeToString())
            .asJsonObject.getAsJsonObject("api_layer")
        assertEquals(PERFORMANCE_BOOST_LIBRARY, manifest.get("library_path").asString)
        assertEquals("XR_APILAYER_local_GalaxyXR_performance_boost", manifest.get("name").asString)
        assertEquals("GXR_DISABLE_PERFORMANCE_BOOST", manifest.get("disable_environment").asString)
    }
}
