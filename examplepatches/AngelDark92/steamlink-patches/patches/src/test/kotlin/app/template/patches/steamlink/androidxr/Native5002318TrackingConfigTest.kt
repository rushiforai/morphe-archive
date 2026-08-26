package app.template.patches.steamlink.androidxr

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class NativeXrTrackingConfigTest {
    @Test
    fun `native helper extension contains no SDL or controller class fragments`() {
        assertEquals(
            setOf(
                "Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;",
                "Lcom/valvesoftware/steamlink/GxrOverlayBridge;",
                "Lcom/valvesoftware/steamlink/GxrResolutionProbe;",
            ),
            extensionClassTypes("/extensions/minimal-extension.mpe"),
        )
    }

    @Test
    fun `legacy extension also contains helpers only so transitive merge is inert on native builds`() {
        assertEquals(
            setOf("Lorg/libsdl/app/GxrSdlBridge;"),
            extensionClassTypes("/extensions/extension.mpe"),
        )
    }

    @Test
    fun `native stock controller config carries hand routing absent from legacy baseline`() {
        // Minimal fixture shared by byte-identical 5002318/5002322 controller configs. Keep markers
        // together: the runtime needs the extension, hand profile/type, and both exported poses.
        val stock =
            """
            {
              "requestedExtensions": ["XR_EXT_hand_interaction"],
              "staticProps": {
                "/interaction_profiles/ext/hand_interaction_ext": {
                  "sControllerType": "svl_hand_interaction_augmented"
                }
              },
              "additionalPoses": ["/input/grip/pose", "/input/aim/pose"]
            }
            """.trimIndent()
        val legacy = requireNotNull(
            javaClass.getResource("/steamlink/androidxr/controller_config.json"),
        ).readText()
        val requiredNativeRouting = listOf(
            "XR_EXT_hand_interaction",
            "/interaction_profiles/ext/hand_interaction_ext",
            "svl_hand_interaction_augmented",
            "/input/aim/pose",
        )

        requiredNativeRouting.forEach { marker ->
            assertTrue(stock.contains(marker), "native stock is missing $marker")
            assertFalse(legacy.contains(marker), "legacy baseline unexpectedly contains $marker")
        }
        assertTrue(stock.contains("/input/grip/pose"))
    }

    private fun extensionClassTypes(resource: String): Set<String> =
        requireNotNull(javaClass.getResourceAsStream(resource)).use { input ->
            DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input)
                .classes
                .map { it.type }
                .toSet()
        }
}
