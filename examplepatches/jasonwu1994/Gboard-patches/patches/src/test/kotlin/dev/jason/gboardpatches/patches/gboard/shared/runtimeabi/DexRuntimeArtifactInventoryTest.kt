package dev.jason.gboardpatches.patches.gboard.shared.runtimeabi

import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Test

class DexRuntimeArtifactInventoryTest {
    @Test
    fun `verifies the authoritative contract against the freshly built extension artifact`() {
        val outputDirectory = File(
            requireNotNull(System.getProperty("gboard.runtimeAbiOutputDirectory"))
        )
        require(outputDirectory.isDirectory) {
            "Extension output directory not found: $outputDirectory"
        }
        val artifacts = outputDirectory.walkTopDown()
            .filter { file -> file.isFile && file.extension == "rve" }
            .toList()
        require(artifacts.size == 1) {
            "Expected exactly one .rve under $outputDirectory, found: " +
                artifacts.joinToString { artifact -> artifact.relativeTo(outputDirectory).path }
        }
        val artifact = artifacts.single()

        val mismatches = RuntimeAbiVerifier.verify(
            calls = RuntimeCallId.entries,
            inventory = DexRuntimeArtifactInventory.read(artifact),
        )

        assertEquals(emptyList<RuntimeAbiMismatch>(), mismatches)
    }
}
