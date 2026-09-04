package app.template.patches.steamlink.androidxr

import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class LegacyHmdConfigTest {
    private val galaxyPayload by lazy {
        requireNotNull(javaClass.getResource("/steamlink/androidxr/hmd_config.json")).readBytes()
    }

    @Test
    fun `5001712 uses headset keyed requested extensions`() {
        val patched = adaptLegacyHmdConfigForBuild(galaxyPayload, "2.0.20", "5001712").decodeToString()

        assertTrue(Regex("\"requestedExtensions\"\\s*:\\s*\\{").containsMatchIn(patched))
        assertFalse(Regex("\"requestedExtensions\"\\s*:\\s*\\[").containsMatchIn(patched))
        listOf("xrvst2", "xrvst2ue", "unknown").forEach { key ->
            assertTrue(
                Regex("\"$key\"\\s*:\\s*\\[\\s*\"XR_EXT_eye_gaze_interaction\"").containsMatchIn(patched),
                key,
            )
        }
        assertEquals(1, Regex("\"requestedExtensions\"").findAll(patched).count())
    }

    @Test
    fun `all 2022 builds retain the array payload byte for byte`() {
        listOf(5002172, 5002206, 5002244, 5002296, 5002313, 5002318, 5002322).forEach { versionCode ->
            assertContentEquals(
                galaxyPayload,
                adaptLegacyHmdConfigForBuild(galaxyPayload, "2.0.22", versionCode.toString()),
                versionCode.toString(),
            )
        }
    }

    @Test
    fun `5001712 identity payloads use the same keyed schema`() {
        listOf("hmd_config_meta_quest_pro.json", "hmd_config_pico_4_pro.json").forEach { name ->
            val payload = requireNotNull(javaClass.getResource("/steamlink/identity/$name")).readBytes()
            val patched = adaptLegacyHmdConfigForBuild(payload, "2.0.20", "5001712").decodeToString()
            assertTrue(Regex("\"requestedExtensions\"\\s*:\\s*\\{").containsMatchIn(patched), name)
            assertTrue(patched.contains("\"xrvst2ue\""), name)
        }
    }
}
