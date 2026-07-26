package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Test

class GboardLongPressQuickActionsPatchContractTest {
    @Test
    fun releaseTwoPointZeroDoesNotPublishLongPressShortcuts() {
        val inventory = JsonParser.parseString(
            Files.readString(repositoryRoot().resolve("patches-list.json"), StandardCharsets.UTF_8),
        ).asJsonObject
        val rows = inventory.getAsJsonArray("patches")
            .map { it.asJsonObject }
            .filter { it.get("name").asString == "Long-Press Editing Shortcuts" }

        assertEquals(0, rows.size)
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("patches-list.json")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }
}
