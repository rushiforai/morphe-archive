package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.BLUETOOTH_MICROPHONE_FEATURE_MARKER
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardFeatureFlagsBytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardBluetoothMicrophonePatchContractTest {
    @Test
    fun publicPatchIsIndependentAndExact1777Only() {
        val patch = gboardBluetoothMicrophonePatch
        assertEquals("Use Bluetooth Microphone", patch.name)
        assertEquals(BLUETOOTH_MICROPHONE_DESCRIPTION, patch.description)
        assertTrue(patch.default)
        assertEquals(
            listOf(
                gboardPatchesSettingsPatch,
                gboardBluetoothMicrophoneFeatureMarkerPatch,
                gboardBluetoothMicrophoneFlagValuePatch,
            ),
            patch.dependencies.toList(),
        )
        assertFalse(patch.dependencies.any { dependency ->
            dependency.toString().contains("AdvancedVoice", ignoreCase = true) ||
                dependency.toString().contains("LongPressQuickActions", ignoreCase = true)
        })
        assertTrue(gboardBluetoothMicrophoneFlagValuePatch.dependencies.any {
            it === gboardPatchesExtensionCarrierPatch
        })
        assertFalse(gboardBluetoothMicrophoneFlagValuePatch.dependencies.any {
            it === gboardFeatureFlagsBytecodePatch
        })
        assertEquals(
            "17.7.7.932364120-release-arm64-v8a",
            patch.compatibility!!.single().targets.single().version,
        )
        assertEquals(
            "dev.jason.gboardpatches.feature.bluetooth_microphone",
            BLUETOOTH_MICROPHONE_FEATURE_MARKER,
        )
    }

    @Test
    fun generatedInventoryContainsExactlyOneBluetoothMicrophoneRowWithoutOptions() {
        val inventory = JsonParser.parseString(
            Files.readString(repositoryRoot().resolve("patches-list.json"), StandardCharsets.UTF_8),
        ).asJsonObject
        val rows = inventory.getAsJsonArray("patches")
            .map { it.asJsonObject }
            .filter { it.get("name").asString == "Use Bluetooth Microphone" }

        assertEquals(1, rows.size)
        val row = rows.single()
        assertEquals(BLUETOOTH_MICROPHONE_DESCRIPTION, row.get("description").asString)
        assertTrue(row.get("use").asBoolean)
        assertEquals(0, row.getAsJsonArray("options").size())
        assertEquals(
            listOf("17.7.7.932364120-release-arm64-v8a"),
            row.getAsJsonObject("compatiblePackages")
                .getAsJsonArray("com.google.android.inputmethod.latin")
                .map { it.asString },
        )
    }

    @Test
    fun readmeUsesConciseBluetoothMicrophoneDescription() {
        val readme = Files.readString(
            repositoryRoot().resolve("README.md"),
            StandardCharsets.UTF_8,
        )

        assertTrue(readme.contains("<summary><code>Use Bluetooth Microphone</code></summary>"))
        assertEquals(
            "Enables the <code>Voice typing &gt; Use Bluetooth microphone</code> setting " +
                "and its related rollout gate.",
            readme.lineSequence()
                .single { it.contains("Voice typing &gt; Use Bluetooth microphone") }
                .trim(),
        )
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("patches-list.json")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private companion object {
        const val BLUETOOTH_MICROPHONE_DESCRIPTION =
            "啟用 語音輸入 -> 使用藍芽麥克風\n" +
                "Enable Voice typing -> Use Bluetooth microphone."
    }
}
