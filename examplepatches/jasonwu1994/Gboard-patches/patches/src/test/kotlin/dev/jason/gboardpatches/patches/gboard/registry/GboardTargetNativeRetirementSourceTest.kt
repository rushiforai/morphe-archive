package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardTargetNativeRetirementSourceTest {
    private val repositoryRoot = findRepositoryRoot()

    @Test
    fun targetNativePatchesAreRetiredWithoutRemovingSharedFeatureFlagInfrastructure() {
        val registry = readSource(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt",
        )
        val includedPatches = readSource("README.md")
            .substringAfter("## Included Patches")
            .substringBefore("## Install")

        RETIRED_PATCH_NAMES.forEach { patchName ->
            assertFalse(
                "$patchName must not remain registered",
                registry.contains("name = \"$patchName\""),
            )
            assertFalse(
                "$patchName must not remain in the active README inventory",
                includedPatches.contains("<code>$patchName</code>"),
            )
        }
        RETIRED_REGISTRY_SYMBOLS.forEach { symbol ->
            assertFalse("Registry must not import or depend on $symbol", registry.contains(symbol))
        }
        RETIRED_SOURCE_FILES.forEach { relativePath ->
            assertFalse(
                "$relativePath must be deleted",
                Files.exists(repositoryRoot.resolve(relativePath)),
            )
        }

        val runtime = readSource(
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "featureflags/GboardFeatureFlagsRuntime.java",
        )
        val availability = readSource(
            "extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "settings/GboardPatchesFeatureAvailability.java",
        )
        RETIRED_RUNTIME_FLAGS.forEach { flag ->
            assertFalse("Runtime must not retain $flag", runtime.contains(flag))
        }
        RETIRED_AVAILABILITY_FEATURES.forEach { feature ->
            assertFalse("Availability must not retain $feature", availability.contains(feature))
        }

        val sharedFeatureFlagPatch = readSource(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardFeatureFlagsBytecodePatch.kt",
        )
        assertTrue(sharedFeatureFlagPatch.contains("GboardVersionBindings.flagBoolGetter"))
        assertTrue(sharedFeatureFlagPatch.contains("GboardVersionBindings.flagNameField"))

        SURVIVING_FEATURE_FLAGS.forEach { (runtimeFlag, availabilityFeature) ->
            assertTrue("Runtime must retain $runtimeFlag", runtime.contains(runtimeFlag))
            assertTrue(
                "Runtime must retain the $availabilityFeature map entry",
                runtime.contains(availabilityFeature),
            )
            assertTrue(
                "Availability must retain $availabilityFeature",
                availability.contains(availabilityFeature),
            )
        }
        SURVIVING_MARKER_FILES.forEach { relativePath ->
            assertTrue(
                "$relativePath must remain",
                Files.isRegularFile(repositoryRoot.resolve(relativePath)),
            )
        }
    }

    private fun readSource(relativePath: String): String = String(
        Files.readAllBytes(repositoryRoot.resolve(relativePath)),
        StandardCharsets.UTF_8,
    )

    private fun findRepositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { candidate ->
                Files.isRegularFile(candidate.resolve("README.md")) &&
                    Files.isRegularFile(candidate.resolve(REGISTRY_PATH))
            }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private companion object {
        const val REGISTRY_PATH =
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt"

        val RETIRED_PATCH_NAMES = listOf(
            "Clipboard Entity Extraction",
            "Clipboard Item Edit",
            "Chinese Online Voice Input",
            "Enable Undo/Redo feature",
        )
        val RETIRED_REGISTRY_SYMBOLS = listOf(
            "gboardClipboardEntityExtractionFlagPatch",
            "gboardClipboardEntityExtractionFeatureMarkerPatch",
            "gboardClipboardItemEditFlagPatch",
            "gboardClipboardItemEditFeatureMarkerPatch",
            "gboardChineseOnlineVoiceInputPatch",
            "gboardChineseOnlineVoiceResourcePatch",
            "gboardChineseOnlineVoiceBytecodePatch",
            "gboardUndoRedoAccessPointPatch",
            "gboardUndoRedoAccessPointBytecodePatch",
        )
        val RETIRED_SOURCE_FILES = listOf(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "chinesevoice/GboardChineseOnlineVoiceResourcePatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "chinesevoice/GboardChineseOnlineVoiceBytecodePatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "undoredoaccesspoint/GboardUndoRedoAccessPointBytecodePatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardClipboardEntityExtractionFeatureMarkerPatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardClipboardItemEditFeatureMarkerPatch.kt",
        )
        val RETIRED_RUNTIME_FLAGS = listOf(
            "FLAG_CLIPBOARD_ENTITY_EXTRACTION",
            "FLAG_CLIPBOARD_ITEM_EDIT",
        )
        val RETIRED_AVAILABILITY_FEATURES = listOf(
            "FEATURE_CLIPBOARD_ENTITY_EXTRACTION",
            "FEATURE_CLIPBOARD_ITEM_EDIT",
        )
        val SURVIVING_FEATURE_FLAGS = mapOf(
            "FLAG_DEVICE_INTELLIGENCE" to "FEATURE_DEVICE_INTELLIGENCE",
            "FLAG_GRAMMAR_CHECKER" to "FEATURE_GRAMMAR_CHECKER",
            "FLAG_INLINE_SUGGESTIONS" to "FEATURE_INLINE_SUGGESTIONS",
            "FLAG_KEY_SHAPE_SELECTION" to "FEATURE_KEY_SHAPE_SELECTION",
        )
        val SURVIVING_MARKER_FILES = listOf(
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardDeviceIntelligenceFeatureMarkerPatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardGrammarCheckerFeatureMarkerPatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardInlineSuggestionsFeatureMarkerPatch.kt",
            "patches/src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "featureflags/GboardKeyShapeSelectionFeatureMarkerPatch.kt",
        )
    }
}
