package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardStagedReleasePatchContractTest {
    @Test
    fun unreleasedPatchesRemainCommentedAndOutOfInventory() {
        val root = repositoryRoot()
        val registry = Files.readString(root.resolve(REGISTRY_PATH), StandardCharsets.UTF_8)
        val activeRegistry = registry.replace(Regex("(?s)/\\*.*?\\*/"), "")
        val inventory = JsonParser.parseString(
            Files.readString(root.resolve("patches-list.json"), StandardCharsets.UTF_8),
        ).asJsonObject
        val names = inventory.getAsJsonArray("patches")
            .map { it.asJsonObject.get("name").asString }

        assertEquals(19, names.size)
        STAGED_PATCHES.forEach { staged ->
            assertTrue(registry.contains("val ${staged.declaration} = resourcePatch("))
            assertFalse(activeRegistry.contains("val ${staged.declaration} = resourcePatch("))
            assertFalse(names.contains(staged.name))
        }
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { candidate ->
                Files.isRegularFile(candidate.resolve("patches-list.json")) &&
                    Files.isRegularFile(candidate.resolve(REGISTRY_PATH))
            }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private data class StagedPatch(
        val name: String,
        val declaration: String,
    )

    private companion object {
        const val REGISTRY_PATH =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt"

        val STAGED_PATCHES = listOf(
            StagedPatch("Use Bluetooth Microphone", "gboardBluetoothMicrophonePatch"),
            StagedPatch(
                "Long-Press Editing Shortcuts",
                "gboardLongPressQuickActionsPatch",
            ),
            StagedPatch("Advanced Voice Typing", "gboardAdvancedVoiceTypingPatch"),
        )
    }
}
