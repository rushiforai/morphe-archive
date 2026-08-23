package dev.jason.gboardpatches.patches.gboard.features.rambler

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardRambler1777PatchSourceTest {
    @Test
    fun routePatchPinsFiveValidatedSeamsAndFailFastFingerprints() {
        val root = repositoryRoot()
        val source = Files.readString(
            root.resolve(
                "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/" +
                    "features/rambler/GboardRambler1777RoutePatch.kt",
            ),
            StandardCharsets.UTF_8,
        )
        val fingerprints = Files.readString(
            root.resolve(
                "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/" +
                    "features/rambler/GboardRambler1777Fingerprints.kt",
            ),
            StandardCharsets.UTF_8,
        )

        assertTrue(source.contains("VerifiedTransformationPlan("))
        assertTrue(source.contains("gboardStructuralFingerprint()"))
        assertEquals(5, Regex("findMutableMethodOrThrow\\(").findAll(source).count())
        assertEquals(10, Regex("[a-f0-9]{64}").findAll(fingerprints).count())
        assertTrue(source.contains("ramblerSwitcherLaunch"))
        assertTrue(source.contains("ramblerNgaEligibility"))
        assertTrue(source.contains("ramblerSwitcherFallback"))
        assertTrue(source.contains("ramblerStockVoiceHandler"))
        assertTrue(source.contains("ramblerSessionBuilder"))
        assertFalse(source.contains("jmf"))
        assertFalse(source.contains("hlr"))
        assertFalse(source.contains("jqd"))
    }

    @Test
    fun publicAdvancedVoicePatchCarriesTheRamblerRouteWithoutAddingAnotherPublicPatch() {
        val registry = Files.readString(
            repositoryRoot().resolve(
                "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/" +
                    "registry/GboardPatchRegistry.kt",
            ),
            StandardCharsets.UTF_8,
        )
        val block = registry.substringAfter("val gboardAdvancedVoiceTypingPatch")
            .substringBefore("val gboardBluetoothMicrophonePatch")

        assertTrue(block.contains("gboardRambler1777RoutePatch"))
        assertEquals(1, Regex("name = \\\"Advanced Voice Typing\\\"").findAll(registry).count())
        assertFalse(Regex("name = \\\"Rambler\\\"").containsMatchIn(registry))
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("settings.gradle.kts")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }
}
