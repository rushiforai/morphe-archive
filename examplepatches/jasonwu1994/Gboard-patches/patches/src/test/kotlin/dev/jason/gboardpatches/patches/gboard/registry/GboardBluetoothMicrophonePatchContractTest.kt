package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.BLUETOOTH_MICROPHONE_FEATURE_MARKER
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardFeatureFlagsBytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardBluetoothMicrophonePatchContractTest {
    @Test
    fun implementationRemainsIndependentWhilePublicPatchIsStaged() {
        assertTrue(gboardBluetoothMicrophoneFlagValuePatch.dependencies.any {
            it === gboardPatchesExtensionCarrierPatch
        })
        assertFalse(gboardBluetoothMicrophoneFlagValuePatch.dependencies.any {
            it === gboardFeatureFlagsBytecodePatch
        })
        assertEquals(
            "dev.jason.gboardpatches.feature.bluetooth_microphone",
            BLUETOOTH_MICROPHONE_FEATURE_MARKER,
        )
    }

    @Test
    fun releaseTwoPointZeroDoesNotPublishBluetoothMicrophone() {
        val inventory = JsonParser.parseString(
            Files.readString(repositoryRoot().resolve("patches-list.json"), StandardCharsets.UTF_8),
        ).asJsonObject
        val rows = inventory.getAsJsonArray("patches")
            .map { it.asJsonObject }
            .filter { it.get("name").asString == "Use Bluetooth Microphone" }

        assertEquals(0, rows.size)
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("patches-list.json")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }
}
