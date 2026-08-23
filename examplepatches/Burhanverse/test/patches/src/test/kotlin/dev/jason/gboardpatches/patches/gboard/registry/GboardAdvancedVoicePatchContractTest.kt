package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardAdvancedVoicePatchContractTest {
    @Test
    fun releasePublishesExactlyOneTargetOnlyAdvancedVoiceTypingPatch() {
        val inventory = JsonParser.parseString(
            Files.readString(repositoryRoot().resolve("patches-list.json"), StandardCharsets.UTF_8),
        ).asJsonObject
        val rows = inventory.getAsJsonArray("patches")
            .map { it.asJsonObject }
            .filter { it.get("name").asString == "Advanced Voice Typing" }

        assertEquals(1, rows.size)
        val row = rows.single()
        assertTrue(row.get("use").asBoolean)
        val compatiblePackages = row.getAsJsonObject("compatiblePackages")
        assertEquals(setOf(GBOARD_PACKAGE), compatiblePackages.keySet())
        assertEquals(
            listOf(GBOARD_VERSION),
            compatiblePackages.getAsJsonArray(GBOARD_PACKAGE).map { it.asString },
        )
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("patches-list.json")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private companion object {
        const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"
        const val GBOARD_VERSION = "17.7.7.932364120-release-arm64-v8a"
    }
}
